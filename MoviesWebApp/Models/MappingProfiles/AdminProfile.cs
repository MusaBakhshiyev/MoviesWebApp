using AutoMapper;
using Microsoft.AspNetCore.Identity;
using MoviesWebApp.Custom;
using MovieWebApp.Models.Admin;

namespace MovieWebApp.Models.MappingProfiles;

public class AdminProfile : Profile
{
	public AdminProfile()
	{
		CreateMap<ApplicationUser, UserModel>();

		CreateMap<IdentityRole<int>, RoleModel>();
	}
}