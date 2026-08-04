using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (lblError != null)
                {
                    lblError.Visible = false;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail != null ? txtEmail.Text.Trim() : string.Empty;
            string password = txtPassword != null ? txtPassword.Text : string.Empty;

            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                if (lblError != null)
                {
                    lblError.Text = "Invalid email or password combination.";
                    lblError.Visible = true;
                }
            }
        }
    }
}
