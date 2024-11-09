﻿using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;

namespace MoviesWebApp.Custom
{
    public class ApplicationUserManager : UserManager<ApplicationUser>
    {
        public ApplicationUserManager(IUserStore<ApplicationUser> store,
           IOptions<IdentityOptions> optionsAccessor,
           IPasswordHasher<ApplicationUser> passwordHasher,
           IEnumerable<IUserValidator<ApplicationUser>> userValidators,
           IEnumerable<IPasswordValidator<ApplicationUser>> passwordValidators,
           ILookupNormalizer keyNormalizer,
           IdentityErrorDescriber errors,
           IServiceProvider services,
           ILogger<ApplicationUserManager> logger): base (store, optionsAccessor, passwordHasher,userValidators,passwordValidators,keyNormalizer,errors,services,logger)
        {
            
        }

        public Task<ApplicationUser> FindByIdAsync(int userId)
        {
            return base.FindByIdAsync(userId.ToString());
        }


    }
}
