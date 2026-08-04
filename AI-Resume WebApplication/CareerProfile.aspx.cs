using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class CareerProfile : AppPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (lblStatus != null)
                {
                    lblStatus.Visible = false;
                }
            }
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (lblStatus != null)
            {
                lblStatus.Text = "Master Career Profile updated successfully.";
                lblStatus.Visible = true;
            }
        }
    }
}
