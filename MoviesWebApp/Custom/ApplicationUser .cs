using Microsoft.AspNetCore.Identity;
using MoviesWebApp.Models;

namespace MoviesWebApp.Custom
{
    public class ApplicationUser : IdentityUser<int>
    {
        public ICollection<Rating> MoviesRatings { get; set; }
        public ICollection<Comment> MoviesComments { get; set; }
        public ICollection<CommentLikeDislike> CommentLikeDislike { get; set; }
        public ICollection<ViewCount> ViewCount { get; set; }

    }
}
