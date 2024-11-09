using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MoviesWebApp.Models.Dtos
{
	public class MovieModel
	{
		public int Id { get; set; }
		[MaxLength(50)]
		public string Title { get; set; }
		[StringLength(5000, MinimumLength = 20)]
		public string? Description { get; set; }
		[DataType(DataType.Date)]
		public DateTime ReleaseDate { get; set; }
		[Required]
		[DisplayName("Genres")]
		public ICollection<int> SelectedGenres { get; set; } = new List<int>();

		[Required]
		public ICollection<int> SelectedCountries { get; set; } = new List<int>();
		[Range(5, 100)]
		public double Price { get; set; }

		[MaxLength(2000)]
		public string? ImageUrl { get; set; }
		public TimeSpan DurationMinutes { get; set; }
		public decimal? Budget { get; set; }

		public IFormFile? Image { get; set; }

		public CurrencyType PriceCurrency { get; set; }

		public CurrencyType BudgetCurrency { get; set; }

		public DateTime CreationTime { get; set; }
		public string MovieUrl { get; set; }

		public double? AverageRating { get; set; }
        public ICollection<Comment>? UsersComments { get; set; }
		public int ViewCount { get; set; }
	}
}
