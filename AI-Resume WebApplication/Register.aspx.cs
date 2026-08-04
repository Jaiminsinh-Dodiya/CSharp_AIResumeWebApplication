using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class Register : Page
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

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Server-side validation check
            if (!Page.IsValid)
            {
                return;
            }

            if (chkTerms != null && !chkTerms.Checked)
            {
                if (lblError != null)
                {
                    lblError.Text = "Please accept the Terms of Service to create an account.";
                    lblError.Visible = true;
                }
                return;
            }

            string name = txtFullName != null ? txtFullName.Text.Trim() : string.Empty;
            string email = txtEmail != null ? txtEmail.Text.Trim() : string.Empty;
            string password = txtPassword != null ? txtPassword.Text : string.Empty;

            // Registration logic placeholder (Service Layer Intention)
            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                if (lblError != null)
                {
                    lblError.Text = "Unable to process registration. Please verify your details.";
                    lblError.Visible = true;
                }
            }
        }
    }
}
