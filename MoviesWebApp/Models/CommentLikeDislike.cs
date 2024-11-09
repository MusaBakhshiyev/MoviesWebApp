using MoviesWebApp.Custom;

namespace MoviesWebApp.Models
{
	public class CommentLikeDislike
	{
		public int Id { get; set; }
		public int CommentId { get; set; }
		public Comment Comment { get; set; }

		public int UserId { get; set; }
		public ApplicationUser User { get; set; }
		
		public string Type { get; set; }
	}
}
