using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MoviesWebApp.Data;
using MoviesWebApp.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using Microsoft.AspNetCore.Identity;
using MoviesWebApp.Custom;
using MoviesWebApp.Models.Dtos;
using AutoMapper;

namespace MoviesWebApp.Pages.Movies
{
	public class IndexModel : PageModel
	{
		private readonly MoviesWebAppContext _context;
		private readonly ApplicationUserManager _userManager;
		private readonly IMapper _mapper;
		public IndexModel(MoviesWebAppContext context, IMapper mapper, ApplicationUserManager userManager)
		{
			_context = context;
			_userManager = userManager;
			_mapper = mapper;
		}

		public IList<MovieModel> Movie { get; set; } = default!;

		public IList<WatchList> watchList { get; set; }

		public List<SelectListItem> GenreList { get; set; } = new();
		public List<SelectListItem> CountryList { get; set; } = new();

		public bool IsFilterOpen { get; set; }


		[BindProperty(SupportsGet = true)]
		public int? SelectedGenre { get; set; }

		[BindProperty(SupportsGet = true)]
		public int? ReleaseYear { get; set; }

		[BindProperty(SupportsGet = true)]
		public int? SelectedCountry { get; set; }

		public IList<MovieModel> LastThreeMovies { get; set; } = new List<MovieModel>();

		public async Task OnGetAsync()
		{

			var user = await _userManager.GetUserAsync(User);
			var lastThreeMovies = await _context.Movie
							 .OrderByDescending(m => m.CreationTime)
							 .Take(3)
							 .ToListAsync();
			foreach (var movie in lastThreeMovies)
			{
				var movieModel = _mapper.Map<MovieModel>(movie);
				movieModel.ViewCount = await _context.ViewCount.CountAsync(vc => vc.MovieId == movie.Id);
				LastThreeMovies.Add(movieModel);
			}


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
			if (_context.Movie != null)
			{
				IQueryable<Movie> query = _context.Movie
			.Include(m => m.Genre)
			.Include(m => m.Country);

				if (SelectedGenre.HasValue)
				{
					query = query.Where(m => m.Genre.Any(g => g.Id == SelectedGenre.Value));
					IsFilterOpen = true;
				}

				if (SelectedCountry.HasValue)
				{
					query = query.Where(m => m.Country.Any(c => c.Id == SelectedCountry.Value));
					IsFilterOpen = true;
				}

				if (ReleaseYear.HasValue)
				{
					query = query.Where(m => m.ReleaseDate.Year == ReleaseYear.Value);
					IsFilterOpen = true;
				}


				Movie = await query
					   .Select(m => new MovieModel
					   {
						   Id = m.Id,
						   Title = m.Title,
						   Description = m.Description,
						   ReleaseDate = m.ReleaseDate,
						   ImageUrl = m.ImageUrl,
						   CreationTime = m.CreationTime,
						   SelectedGenres = m.Genre.Select(g => g.Id).ToList(),
						   SelectedCountries = m.Country.Select(c => c.Id).ToList(),
						   ViewCount =  _context.ViewCount.Count(vc => vc.MovieId == m.Id)
					   }).ToListAsync();

			}
			watchList = await (_context.WatchList.Where(wt => wt.UserId == user.Id)).ToListAsync();

		}




		public async Task<IActionResult> OnPostAddWatchlistAsync(int id)
		{
			var user = await _userManager.GetUserAsync(User);
			var watchList = new WatchList
			{
				UserId = user.Id,
				MovieId = id
			};

			await _context.WatchList.AddAsync(watchList);
			await _context.SaveChangesAsync();


			return RedirectToPage();
		}

	}
}
