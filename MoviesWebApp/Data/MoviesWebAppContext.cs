using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using MoviesWebApp.Custom;
using MoviesWebApp.Models;

namespace MoviesWebApp.Data
{
    public class MoviesWebAppContext : IdentityDbContext<ApplicationUser, IdentityRole<int>, int>
	{
		public MoviesWebAppContext(DbContextOptions<MoviesWebAppContext> options)
			: base(options)
		{
		}

		public DbSet<Movie> Movie { get; set; } = default!;
		public DbSet<Genre> Genre { get; set; } = default!;
		public DbSet<Country> Country { get; set; } = default!;
		public DbSet<Rating> Rating { get; set; } = default!;
		public DbSet<Comment> Comment { get; set; } = default!;
		public DbSet<CommentLikeDislike> CommentLikeDislike { get; set; } = default!;
		public DbSet<WatchList> WatchList { get; set; } = default!;
		public DbSet<ViewCount> ViewCount { get; set; } = default!;

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			base.OnModelCreating(modelBuilder);

			modelBuilder.Entity<Movie>().HasMany(m => m.Genre).WithMany(g => g.Movies);
			modelBuilder.Entity<Movie>().HasMany(m => m.Country).WithMany(c => c.Movies);

			modelBuilder.Entity<Movie>().HasMany(m => m.UsersRatings).WithOne(r => r.Movie).HasForeignKey(r => r.MovieId);
			modelBuilder.Entity<ApplicationUser>().HasMany(u => u.MoviesRatings).WithOne(r => r.User).HasForeignKey(r => r.UserId);

            modelBuilder.Entity<Movie>().HasMany(m => m.UsersComments).WithOne(c => c.Movie).HasForeignKey(c => c.MovieId);
            modelBuilder.Entity<ApplicationUser>().HasMany(u => u.MoviesComments).WithOne(c => c.User).HasForeignKey(c => c.UserId);

			modelBuilder.Entity<Comment>().HasMany(c => c.LikesDislikes).WithOne(cld => cld.Comment).HasForeignKey(cld=>cld.CommentId).OnDelete(DeleteBehavior.Cascade);
			modelBuilder.Entity<ApplicationUser>().HasMany(u => u.CommentLikeDislike).WithOne(cld => cld.User).HasForeignKey(cld=>cld.UserId).OnDelete(DeleteBehavior.Cascade);


			modelBuilder.Entity<Movie>().HasMany(m => m.ViewCount).WithOne(vc => vc.Movie).HasForeignKey(vc => vc.MovieId);
			modelBuilder.Entity<ApplicationUser>().HasMany(u => u.ViewCount).WithOne(vc => vc.User).HasForeignKey(vc => vc.UserId);
		}
	}
}
