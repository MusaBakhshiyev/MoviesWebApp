using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using MoviesWebApp.Custom;
using MoviesWebApp.Data;
using MovieWebApp.Models.Admin;

namespace MovieWebApp.Areas.Admin.Pages.Users;

public class IndexModel : PageModel
{
    private readonly ApplicationUserManager _userManager;
    private readonly IMapper _mapper;
    private MoviesWebAppContext _context;

    public IndexModel(ApplicationUserManager userManager, IMapper mapper, MoviesWebAppContext context)
    {
        _userManager = userManager;
        _mapper = mapper;
        _context = context;
    }


    [BindProperty]
    public IList<UserModel> Users { get; set; }

    public async Task OnGetAsync()
    {
        var allUsers = await _userManager.Users.ToListAsync();
        Users = _mapper.Map<List<UserModel>>(allUsers);
    }

    public async Task<IActionResult> OnPostDeleteAsync(string id)
    {
        var user = await _userManager.FindByIdAsync(id);

        if (user == null) return RedirectToPage();

		var relatedRecords = _context.CommentLikeDislike.Where(c => c.UserId == int.Parse(id));
		_context.CommentLikeDislike.RemoveRange(relatedRecords);

		await _userManager.DeleteAsync(user);

        return RedirectToPage();
    }
}