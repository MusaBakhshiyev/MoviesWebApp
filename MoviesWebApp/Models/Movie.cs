using MoviesWebApp.Custom;
using System.ComponentModel.DataAnnotations;

namespace MoviesWebApp.Models
{
	public class Movie
	{
		public int Id { get; set; }
		[MaxLength(50)]
		public string Title { get; set; }
		[StringLength(5000, MinimumLength = 20)]
		public string? Description { get; set; }
		[DataType(DataType.Date)]
		public DateTime ReleaseDate { get; set; }
		public ICollection<Genre> Genre { get; set; }
		[Range(5,100)]
		public double Price { get; set; }
		[MaxLength(30)]
		public ICollection<Country> Country { get; set; } 
		[MaxLength(2000)]
		public string? ImageUrl { get; set; } 
		public TimeSpan DurationMinutes { get; set; }
		public decimal? Budget { get; set; }
		public CurrencyType PriceCurrency { get; set; }

		public CurrencyType BudgetCurrency { get; set; }

		public DateTime CreationTime {  get; set; }
		public string MovieUrl { get; set; }
		public ICollection<Rating> UsersRatings { get; set; }
		public ICollection<Comment>UsersComments { get; set; }
		public ICollection<ViewCount> ViewCount { get; set; }
	}

	public enum CurrencyType : byte
	{
		Manat,
		Dollar,
		Ruble
	}
}
