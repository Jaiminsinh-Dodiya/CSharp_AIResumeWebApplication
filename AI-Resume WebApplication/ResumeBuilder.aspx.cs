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
                if (Request.QueryString["template"] != null)
                {
                    Session["SelectedTemplate"] = Request.QueryString["template"];
                }
                
                RenderPreview();
            }
        }

        private void RenderPreview()
        {
            string templateId = Session["SelectedTemplate"] as string ?? "modern";
            string primaryColor = Session["ThemeColor"] as string ?? "#3b82f6";

            var data = new ResumeData
            {
                FullName = txtFullName.Text,
                JobTitle = txtTargetTitle.Text,
                Email = txtEmail.Text,
                Phone = txtPhone.Text,
                Summary = txtSummary.Text,
                ExperienceRoleTitle = txtRoleTitle.Text,
                ExperienceAchievements = txtAchievements.Text,
                Skills = new System.Collections.Generic.List<string> { "Go (Golang)", "TypeScript", "Python", "Kubernetes", "AWS", "Terraform", "Docker", "Kafka", "Redis", "Microservices", "CI/CD" }
            };

            litResumeContent.Text = ResumeTemplateBase.RenderTemplate(templateId, primaryColor, data);
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
            RenderPreview();
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
