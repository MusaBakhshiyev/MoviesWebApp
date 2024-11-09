﻿using MoviesWebApp.Custom;

namespace MoviesWebApp.Models
{
	public class ViewCount
	{
		public int Id { get; set; }
		public int MovieId { get; set; }
		public Movie Movie { get; set; }
		public int UserId { get; set; }
		public ApplicationUser User { get; set; }
	}
}