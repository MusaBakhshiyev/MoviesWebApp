using MoviesWebApp.Custom;
using System.ComponentModel.DataAnnotations;

namespace MoviesWebApp.Models
{
    public class Comment
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public Movie Movie { get; set; }
        public int UserId { get; set; }
        public ApplicationUser User { get; set; }
        [MaxLength(3000)]
        public string UserComment { get; set; }
        public DateTime DateOfComment { get; set; }
        public DateTime DateOfEdit { get; set; }

		public ICollection<CommentLikeDislike> LikesDislikes { get; set; }

        public int ToCommentId { get; set; } = 0;
	}

}

