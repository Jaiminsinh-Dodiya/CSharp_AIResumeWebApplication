using System;
using System.Text;
using System.Web;

namespace AI_Resume_WebApplication
{
    public partial class Card : System.Web.UI.Page
    {
        public string FullName { get; set; } = "Candidate Profile";
        public string JobTitle { get; set; } = "Software Professional";
        public string Email { get; set; } = "";
        public string Phone { get; set; } = "";
        public string Initial { get; set; } = "P";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["name"] != null)
            {
                FullName = HttpUtility.UrlDecode(Request.QueryString["name"]);
                if (!string.IsNullOrEmpty(FullName))
                {
                    Initial = FullName.Substring(0, 1).ToUpper();
                }
            }
            if (Request.QueryString["title"] != null)
            {
                JobTitle = HttpUtility.UrlDecode(Request.QueryString["title"]);
            }
            if (Request.QueryString["email"] != null)
            {
                Email = HttpUtility.UrlDecode(Request.QueryString["email"]);
            }
            if (Request.QueryString["phone"] != null)
            {
                Phone = HttpUtility.UrlDecode(Request.QueryString["phone"]);
            }
        }

        protected void btnSaveContact_Click(object sender, EventArgs e)
        {
            // Generate a .vcf (vCard) on the fly
            StringBuilder vcard = new StringBuilder();
            vcard.AppendLine("BEGIN:VCARD");
            vcard.AppendLine("VERSION:3.0");
            vcard.AppendLine($"N:{FullName};;;");
            vcard.AppendLine($"FN:{FullName}");
            vcard.AppendLine($"TITLE:{JobTitle}");
            if (!string.IsNullOrEmpty(Phone))
            {
                vcard.AppendLine($"TEL;TYPE=CELL:{Phone}");
            }
            if (!string.IsNullOrEmpty(Email))
            {
                vcard.AppendLine($"EMAIL;TYPE=WORK:{Email}");
            }
            // Add a URL pointing back to this card
            string cardUrl = Request.Url.AbsoluteUri;
            vcard.AppendLine($"URL:{cardUrl}");
            vcard.AppendLine("END:VCARD");

            Response.Clear();
            Response.ContentType = "text/vcard";
            Response.AddHeader("Content-Disposition", $"attachment; filename=\"{FullName.Replace(" ", "_")}_Contact.vcf\"");
            Response.Write(vcard.ToString());
            Response.End();
        }
    }
}
