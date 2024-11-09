using MoviesWebApp.Custom;
using System.ComponentModel.DataAnnotations;

namespace MoviesWebApp.Models
{
	public class Rating
	{
		public int Id { get; set; }

		public int MovieId { get; set; }
		public Movie Movie { get; set; }

		public int UserId { get; set; }
		public ApplicationUser User { get; set; }

		[Range(1, 10)]
		public int UserRating { get; set; } 
	}
}
