using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MovieWebApp.Models.Admin;

namespace MovieWebApp.Areas.Admin.Pages.Roles;


public class CreateRoleModel : PageModel
{
    private readonly RoleManager<IdentityRole<int>> _roleManager;

    public CreateRoleModel(RoleManager<IdentityRole<int>> roleManager)
    {
        _roleManager = roleManager;
    }

    [BindProperty]
    public RoleCreateModel RoleCreate { get; set; }

    public void OnGet()
    {

    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
        {
            return Page();
        }

        var role = new IdentityRole<int>
        {
            Name = RoleCreate.Name,
        };
        var createResult = await _roleManager.CreateAsync(role);
        if (createResult.Succeeded)
        {
            return RedirectToPage("./Index");
        }

        foreach (var identityError in createResult.Errors)
        {
            ModelState.AddModelError("", identityError.Code + ": " + identityError.Description);
        }

        return Page();
    }
}