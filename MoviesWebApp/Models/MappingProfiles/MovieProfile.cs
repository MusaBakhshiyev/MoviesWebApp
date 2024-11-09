using AutoMapper;
using MoviesWebApp.Models.Dtos;

namespace MoviesWebApp.Models.MappingProfiles
{
	public class MovieProfile : Profile
	{
		public MovieProfile()
		{
			CreateMap<Movie, MovieModel>()
				.ForMember(dest => dest.Image, opt => opt.Ignore());

			CreateMap<MovieModel, Movie>()
				.ForMember(dest => dest.ImageUrl, opt => opt.Ignore());


			CreateMap<MovieModel, Movie>()
				.ForMember(dest => dest.Genre, opt => opt.Ignore());

			CreateMap<Movie, MovieModel>()
				.ForMember(dest => dest.SelectedGenres, opt => opt.Ignore());

			CreateMap<MovieModel, Movie>()
				.ForMember(dest => dest.Country, opt => opt.Ignore());

			CreateMap<Movie, MovieModel>()
				.ForMember(dest => dest.SelectedCountries, opt => opt.Ignore());


			CreateMap<Movie, MovieModel>()
				.ForMember(dest => dest.AverageRating, opt => opt.Ignore());


			CreateMap<MovieModel, Movie>()
				.ForMember(dest => dest.UsersRatings, opt => opt.Ignore());


			CreateMap<Movie, MovieModel>()
				.ForMember(dest => dest.ViewCount, opt => opt.Ignore());


			CreateMap<MovieModel, Movie>()
				.ForMember(dest => dest.ViewCount, opt => opt.Ignore());
		}
	}
}
