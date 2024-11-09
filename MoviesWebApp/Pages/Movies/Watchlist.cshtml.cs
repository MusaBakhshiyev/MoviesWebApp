using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using MoviesWebApp.Custom;
using MoviesWebApp.Data;
using MoviesWebApp.Models;

namespace MoviesWebApp.Pages.Movies
{
	public class WatchlistModel : PageModel
	{

		private readonly MoviesWebAppContext _context;
		private readonly ApplicationUserManager _userManager;

		public IList<WatchList> watchList { get; set; }
		public IList<Movie> Movie { get; set; } = new List<Movie>();
		public WatchlistModel(MoviesWebAppContext context, ApplicationUserManager userManager)
		{
			_context = context;
			_userManager = userManager;
		}
		public async Task OnGetAsync()
		{
			var user = await _userManager.GetUserAsync(User);

			watchList = await _context.WatchList
									  .Where(wt => wt.UserId == user.Id)
									  .ToListAsync();

			var movieIds = watchList.Select(wt => wt.MovieId).ToList();
			Movie = await _context.Movie
								  .Where(m => movieIds.Contains(m.Id))
								  .Include(m => m.Genre)     
								  .Include(m => m.Country)   
								  .ToListAsync();
		}

		public async Task<IActionResult> OnPostRemoveWatchlistAsync(int id)
		{
			var user = await _userManager.GetUserAsync(User);
			var watchList = await _context.WatchList.FirstOrDefaultAsync(wt=>wt.UserId==user.Id && wt.MovieId==id);
			

			 _context.WatchList.Remove(watchList);
			await _context.SaveChangesAsync();


			return RedirectToPage();
		}
	}
}
