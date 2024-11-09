namespace MovieWebApp.Models.Admin;

public class UserModel
{
    public int Id { get; set; }

    public virtual string UserName { get; set; }

    public virtual string Email { get; set; }

    public virtual string PhoneNumber { get; set; }
}