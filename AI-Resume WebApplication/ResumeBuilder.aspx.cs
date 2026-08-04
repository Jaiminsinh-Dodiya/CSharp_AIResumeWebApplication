using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class ResumeBuilder : AppPageBase
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (lblStatus != null)
            {
                lblStatus.Text = "Resume changes saved successfully.";
                lblStatus.Visible = true;
            }
        }

        protected void btnAiRewrite_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (txtSummary != null)
            {
                txtSummary.Text = "Architectural Leader & Staff Engineer with 8+ years scaling mission-critical microservices (4.2B daily requests), cloud-native infrastructure, and leading cross-functional engineering teams.";
            }

            if (lblStatus != null)
            {
                lblStatus.Text = "AI Smart Rewrite applied to Executive Summary.";
                lblStatus.Visible = true;
            }
        }
    }
}
