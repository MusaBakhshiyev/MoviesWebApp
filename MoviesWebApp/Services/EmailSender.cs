using Microsoft.AspNetCore.Identity.UI.Services;
using System.Net;
using System.Net.Mail;

namespace MoviesWebApp.Services
{
    public class EmailSender : IEmailSender
    {
        private IConfiguration _configuration;
        public EmailSender(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {

            var smtpSettings = _configuration.GetSection("SmtpSettings");

            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            message.From = new MailAddress(smtpSettings["From"]);
            message.To.Add(email);
            message.Subject = subject;
            message.IsBodyHtml = true;
            message.Body = htmlMessage;

            smtpClient.Port = int.Parse(smtpSettings["Port"]);
            smtpClient.Host = smtpSettings["Host"];

            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(smtpSettings["Username"], smtpSettings["Password"]);
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            await smtpClient.SendMailAsync(message);

           


        }
    }
}
