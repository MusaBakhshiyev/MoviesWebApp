using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using MoviesWebApp.Data;
using MoviesWebApp.Models;
using MoviesWebApp.Models.Dtos;
using Microsoft.AspNetCore.Identity;
using AutoMapper;
using MoviesWebApp.Custom;

namespace MoviesWebApp.Pages.Movies
{
	public class DetailsModel : PageModel
	{
		private readonly MoviesWebAppContext _context;
		private readonly IMapper _mapper;
		private readonly ApplicationUserManager _userManager;
		public DetailsModel(MoviesWebAppContext context, IMapper mapper, ApplicationUserManager userManager)
		{
			_context = context;
			_mapper = mapper;
			_userManager = userManager;
		}

		public MovieModel Movie { get; set; } = default!;

		[BindProperty]
		public int UserRating{get; set;}

		[BindProperty]
		public string UserComment { get; set; }

		public CommentLikeDislike CommentLikeDislike;


		public IList<WatchList> watchList { get; set; }

		public async Task<IActionResult> OnGetAsync(int? id)
		{
			if (id == null || _context.Movie == null)
			{
				return NotFound();
			}
			
			var movie = await _context.Movie
				.Include(m => m.Genre)
				.Include(m => m.Country)
				.Include(m => m.UsersRatings)
				.Include(m=>m.UsersComments)
                .ThenInclude(c => c.User)
                .Include(m => m.UsersComments)
                .ThenInclude(c=>c.LikesDislikes)
				.ThenInclude(cld => cld.User).FirstOrDefaultAsync(m => m.Id == id);


			if (movie == null)
			{
				return NotFound();
			}
			var user = await _userManager.GetUserAsync(User);
			var existingView = await _context.ViewCount
			.FirstOrDefaultAsync(vc => vc.UserId == user.Id && vc.MovieId == movie.Id);

			if (existingView == null)
			{
				// User hasn't viewed the movie, so we add the view count
				var viewCount = new ViewCount
				{
					UserId = user.Id,
					MovieId = movie.Id
				};
				await _context.ViewCount.AddAsync(viewCount);
				await _context.SaveChangesAsync();
			}

			Movie = _mapper.Map<MovieModel>(movie);
				Movie.ViewCount = await _context.ViewCount.CountAsync(vc => vc.MovieId == movie.Id);

			
			Movie.SelectedGenres = movie.Genre.Select(g => g.Id).ToList();
			Movie.SelectedCountries = movie.Country.Select(c => c.Id).ToList();
			if (movie.UsersRatings.Any())
			{
				Movie.AverageRating = Math.Round(movie.UsersRatings.Average(r => r.UserRating),1);
			}
			else
			{
				Movie.AverageRating = 0;
			}

			ViewData["CurrentUserId"] = user.Id;
			if (user != null)
			{
				var userRating = movie.UsersRatings.FirstOrDefault(r => r.UserId == user.Id && r.MovieId == Movie.Id);
				if (userRating != null)
				{
					UserRating = userRating.UserRating;
				}
			}

			watchList = await (_context.WatchList.Where(wt => wt.UserId == user.Id)).ToListAsync();

			return Page();

			
		}
		public async Task<IActionResult> OnPostDeleteAsync(int id)
		{
			var movie = await _context.Movie.FindAsync(id);

			if (movie != null)
			{
				_context.Movie.Remove(movie);
				await _context.SaveChangesAsync();
			}

			return RedirectToPage("./Index");
		}

		public async Task<IActionResult> OnPostRatingAsync(int id)
		{
			
			var user = await _userManager.GetUserAsync(User);
			if (user == null)
			{
				return Challenge(); 
			}


			var movie = await _context.Movie
			.FirstOrDefaultAsync(m => m.Id == id);

			if (movie == null)
			{
				return NotFound();
			}

			
			var existingRating = await _context.Rating
				.FirstOrDefaultAsync(r => r.MovieId == id && r.UserId == user.Id);

			if (existingRating != null)
			{
				
				existingRating.UserRating = UserRating;
			}
			else
			{
				
				var rating = new Rating
				{
					MovieId = movie.Id,
					UserId = user.Id,
					UserRating = UserRating
					
				};

				_context.Rating.Add(rating);
			}


			await _context.SaveChangesAsync();



			return RedirectToPage(new { id });
		}
		public async Task<IActionResult> OnPostCommentAsync(int id,int toCommentId)
		{
			if (string.IsNullOrWhiteSpace(UserComment))
			{
				return RedirectToPage(new { id });
			}

			var user = await _userManager.GetUserAsync(User);
			if (user == null)
			{
				return Challenge();
			}


			var movie = await _context.Movie
			.FirstOrDefaultAsync(m => m.Id == id);

			if (movie == null)
			{
				return NotFound();
			}

			var comment = new Comment
			{
				UserId = user.Id,
				MovieId = movie.Id,
				UserComment = UserComment,
				DateOfComment = DateTime.Now,
				ToCommentId=toCommentId
				
			};
			_context.Comment.Add(comment);

			await _context.SaveChangesAsync();



			return RedirectToPage(new { id });
		}


		public async Task<IActionResult> OnPostDeleteCommentAsync(int commentId)
		{
			var comment = await _context.Comment.FindAsync(commentId);

			if (comment == null)
			{
				return NotFound();
			}

			_context.Comment.Remove(comment);

			

			await _context.SaveChangesAsync();



			return RedirectToPage(new { id = comment.MovieId });
		}

		public async Task<IActionResult> OnPostEditCommentAsync(int commentId)
		{
			var comment = await _context.Comment.FindAsync(commentId);

			if (comment == null)
			{
				return NotFound();
			}

			comment.UserComment = UserComment;
			comment.DateOfEdit = DateTime.Now;



			await _context.SaveChangesAsync();



			return RedirectToPage(new { id = comment.MovieId });
		}

		public async Task<IActionResult> OnPostLikeDislikeCommentAsync(int commentId,string type)
		{
			var comment = await _context.Comment.FindAsync(commentId);
			var user = await _userManager.GetUserAsync(User);

			if (comment == null)
			{
				return NotFound();
			}


			var existingLikeDislike = await _context.CommentLikeDislike.FirstOrDefaultAsync(cld => cld.CommentId == commentId && cld.UserId == user.Id);

			if (existingLikeDislike != null)
			{
				if (existingLikeDislike.Type != type)
				{
					existingLikeDislike.Type = type;
				}
				else
				{
					_context.CommentLikeDislike.Remove(existingLikeDislike);
				}
				
			}
			else
			{
				var commentLikeDislike = new CommentLikeDislike
				{
					CommentId = commentId,
					UserId = user.Id,
					Type = type
				};
				await _context.CommentLikeDislike.AddAsync(commentLikeDislike);
			}

			await _context.SaveChangesAsync();
			return RedirectToPage(new { id = comment.MovieId });
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


			return RedirectToPage(new { id });
		}
		public async Task<IActionResult> OnPostRemoveWatchlistAsync(int id)
		{
			var user = await _userManager.GetUserAsync(User);
			var watchList = await _context.WatchList.FirstOrDefaultAsync(wt => wt.UserId == user.Id && wt.MovieId == id);


			_context.WatchList.Remove(watchList);
			await _context.SaveChangesAsync();


			return RedirectToPage(new { id });
		}

	}


}
