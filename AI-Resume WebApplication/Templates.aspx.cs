using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class Templates : AppPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var isLoggedIn = Session["IsLoggedIn"] as bool? ?? false;
            if (!isLoggedIn)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }
    }
}
