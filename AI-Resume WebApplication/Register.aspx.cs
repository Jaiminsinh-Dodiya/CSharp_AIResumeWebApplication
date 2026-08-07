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
                    lblError.Text = "Please accept the Terms of Service & Privacy Policy to create an account.";
                    lblError.Visible = true;
                }
                return;
            }

            // Extract Personal & Contact Information
            string name = txtFullName != null ? txtFullName.Text.Trim() : string.Empty;
            string email = txtEmail != null ? txtEmail.Text.Trim() : string.Empty;
            string gender = ddlGender != null ? ddlGender.SelectedValue : string.Empty;
            string country = ddlCountry != null ? ddlCountry.SelectedValue : string.Empty;
            string dob = txtDob != null ? txtDob.Text.Trim() : string.Empty;
            string phone = txtPhone != null ? txtPhone.Text.Trim() : string.Empty;
            string cityState = txtCityState != null ? txtCityState.Text.Trim() : string.Empty;
            string languages = txtLanguages != null ? txtLanguages.Text.Trim() : string.Empty;

            // Extract AI Resume Personalization Profile
            string targetJobTitle = txtTargetJobTitle != null ? txtTargetJobTitle.Text.Trim() : string.Empty;
            string careerDomain = ddlRole != null ? ddlRole.SelectedValue : string.Empty;
            string experienceLevel = ddlExperienceLevel != null ? ddlExperienceLevel.SelectedValue : string.Empty;
            string targetIndustry = ddlIndustry != null ? ddlIndustry.SelectedValue : string.Empty;
            string primarySkills = txtPrimarySkills != null ? txtPrimarySkills.Text.Trim() : string.Empty;
            string jobSearchStatus = ddlJobSearchStatus != null ? ddlJobSearchStatus.SelectedValue : string.Empty;
            string linkedInUrl = txtLinkedInUrl != null ? txtLinkedInUrl.Text.Trim() : string.Empty;
            string portfolioUrl = txtPortfolioUrl != null ? txtPortfolioUrl.Text.Trim() : string.Empty;

            // Extract Password
            string password = txtPassword != null ? txtPassword.Text : string.Empty;

            // Registration logic (Service Layer Intention)
            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password) && !string.IsNullOrEmpty(targetJobTitle))
            {
                // Store user personal details in session context
                Session["UserFullName"] = name;
                Session["UserEmail"] = email;
                Session["UserGender"] = gender;
                Session["UserCountry"] = country;
                Session["UserPhone"] = phone;
                Session["TargetJobTitle"] = targetJobTitle;
                Session["PrimarySkills"] = primarySkills;

                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                if (lblError != null)
                {
                    lblError.Text = "Unable to process registration. Please verify all mandatory fields.";
                    lblError.Visible = true;
                }
            }
        }
    }
}


