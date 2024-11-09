using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using MoviesWebApp.Custom;
using MoviesWebApp.Data;
using MoviesWebApp.Services;
using System.Security.Claims;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages(options =>
{
    options.Conventions.AuthorizeFolder("/Movies");
    options.Conventions.AuthorizeAreaFolder("Admin", "/Roles", "Admin");
    options.Conventions.AuthorizeAreaFolder("Admin", "/Users", "Admin");
    options.Conventions.AddPageRoute("/Movies/Index", "");
});

builder.Services.AddAutoMapper(typeof(Program).Assembly);
builder.Services.AddDbContext<MoviesWebAppContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("MoviesWebAppContext") ?? throw new InvalidOperationException("Connection string 'MoviesWebAppContext' not found.")));

builder.Services.AddDefaultIdentity<ApplicationUser>(option=>option.SignIn.RequireConfirmedAccount=true).AddRoles<IdentityRole<int>>().AddEntityFrameworkStores<MoviesWebAppContext>().AddUserManager<ApplicationUserManager>().AddSignInManager<ApplicationSignInManager>();

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("Admin", policy => policy.RequireRole("Admin"));
});

builder.Services.AddSingleton<IEmailSender, EmailSender>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
