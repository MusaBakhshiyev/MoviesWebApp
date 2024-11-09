using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MoviesWebApp.Data;
using MoviesWebApp.Models;
using MoviesWebApp.Models.Dtos;

namespace MoviesWebApp.Pages.Movies
{
	[Authorize("Admin")]
	public class CreateModel : PageModel
	{
		private readonly MoviesWebAppContext _context;
		private readonly IWebHostEnvironment _webHostEnvironment;
		private readonly IMapper _mapper;

		public CreateModel(MoviesWebAppContext context, IMapper mapper, IWebHostEnvironment webHostEnvironment)
		{
			_context = context;
			_mapper = mapper;
			_webHostEnvironment = webHostEnvironment;
		}

		public List<SelectListItem> GenreList { get; set; } = new();
		public List<SelectListItem> CountryList { get; set; } = new();

		public async Task<IActionResult> OnGet()
		{
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
			return Page();
		}

		[BindProperty]
		public MovieModel Movie { get; set; } = default!;


		public async Task<IActionResult> OnPostAsync()
		{
			if (!ModelState.IsValid)
			{
				return Page();
			}
			Movie.CreationTime = DateTime.UtcNow;
			var movie = _mapper.Map<Movie>(Movie);

			movie.Genre = await _context.Genre.Where(g => Movie.SelectedGenres.Contains(g.Id)).ToListAsync();
			movie.Country = await _context.Country.Where(c => Movie.SelectedCountries.Contains(c.Id)).ToListAsync();

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

				movie.ImageUrl = fileName;

				_context.Movie.Add(movie);
				await _context.SaveChangesAsync();

			}
			else
			{
				_context.Movie.Add(movie);
				await _context.SaveChangesAsync();

			}

			return RedirectToPage("./Index");
		}
	}
}
