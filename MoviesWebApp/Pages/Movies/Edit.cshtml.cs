using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MoviesWebApp.Data;
using MoviesWebApp.Models;
using MoviesWebApp.Models.Dtos;

namespace MoviesWebApp.Pages.Movies
{
	public class EditModel : PageModel
	{
		private readonly MoviesWebAppContext _context;
		private readonly IWebHostEnvironment _webHostEnvironment;
		private readonly IMapper _mapper;

		public EditModel(MoviesWebAppContext context, IMapper mapper, IWebHostEnvironment webHostEnvironment)
		{
			_context = context;
			_mapper = mapper;
			_webHostEnvironment = webHostEnvironment;
		}

		public List<SelectListItem> GenreList { get; set; } = new();

		public List<SelectListItem> CountryList { get; set; } = new();

		[BindProperty]
		public MovieModel Movie { get; set; } = default!;

		public async Task<IActionResult> OnGetAsync(int? id)
		{
			if (id == null)
			{
				return NotFound();
			}

			var movie = await _context.Movie.Include(m => m.Genre).Include(m => m.Country).FirstOrDefaultAsync(m => m.Id == id);
			if (movie == null)
			{
				return NotFound();
			}

			Movie = _mapper.Map<MovieModel>(movie);

			GenreList = await _context.Genre.Select(g => new SelectListItem
			{
				Text = g.Name,
				Value = g.Id.ToString()
			}).ToListAsync();

			CountryList = await _context.Country.Select(c => new SelectListItem
			{
				Text = c.Name,
				Value = c.Id.ToString()
			}).ToListAsync();

			Movie.SelectedGenres = movie.Genre.Select(g => g.Id).ToList();
			Movie.SelectedCountries = movie.Country.Select(c => c.Id).ToList();
			return Page();
		}


		public async Task<IActionResult> OnPostAsync()
		{
			if (!ModelState.IsValid)
			{
				return Page();
			}

			// Fetch the existing movie from the database (including related entities)
			var existingMovie = await _context.Movie
				.Include(m => m.Genre)  // Include genres
				.Include(m => m.Country) // Include countries
				.FirstOrDefaultAsync(m => m.Id == Movie.Id);

			if (existingMovie == null)
			{
				return NotFound();
			}
			var existingImageUrl = existingMovie.ImageUrl;
			// Update the properties of the existing movie from the form
			_mapper.Map(Movie, existingMovie); // Map the form values to the existing entity

			// Update the Genre and Country collections
			existingMovie.Genre = await _context.Genre
				.Where(g => Movie.SelectedGenres.Contains(g.Id))
				.ToListAsync();

			existingMovie.Country = await _context.Country
				.Where(c => Movie.SelectedCountries.Contains(c.Id))
				.ToListAsync();

			// Handle the image upload
			if (Movie.Image != null)
			{
				var folderName = Path.Combine(_webHostEnvironment.WebRootPath, "uploads", "images");
				if (!Directory.Exists(folderName))
				{
					Directory.CreateDirectory(folderName);
				}

				var fileName = Guid.NewGuid() + Path.GetExtension(Movie.Image.FileName);
				var fileFullPath = Path.Combine(folderName, fileName);

				using (var fileStream = new FileStream(fileFullPath, FileMode.Create))
				{
					await Movie.Image.CopyToAsync(fileStream);
				}

				existingMovie.ImageUrl = fileName;
			}
			else
			{
				existingMovie.ImageUrl = existingImageUrl;
			}

			// Attach the existing movie and mark it as modified
			_context.Attach(existingMovie).State = EntityState.Modified;

			try
			{
				// Save the changes to the database
				await _context.SaveChangesAsync();
			}
			catch (DbUpdateConcurrencyException)
			{
				if (!MovieExists(Movie.Id))
				{
					return NotFound();
				}
				else
				{
					throw;
				}
			}

			return RedirectToPage("./Index");
		}

		public async Task<IActionResult> OnPostImageDeleteAsync(int movieId)
		{
			var movie = await _context.Movie.FindAsync(movieId);
			if (movie == null)
			{
				return RedirectToPage("./Index");
			}

			var fileFullUrl = Path.Combine(_webHostEnvironment.WebRootPath, "uploads", "images", movie.ImageUrl);
			if (System.IO.File.Exists(fileFullUrl))
			{
				System.IO.File.Delete(fileFullUrl);
			}
			movie.ImageUrl = null;
			_context.Movie.Update(movie);
			await _context.SaveChangesAsync();

			return RedirectToPage("./Index");

		}

		private bool MovieExists(int id)
		{
			return (_context.Movie?.Any(e => e.Id == id)).GetValueOrDefault();
		}
	}
}
