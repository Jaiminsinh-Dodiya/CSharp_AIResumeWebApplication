using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class Preview : AppPageBase
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

            // Using mock data for the preview page
            var data = new ResumeData
            {
                FullName = "Alexander Wright",
                JobTitle = "Senior Principal Software Engineer",
                Email = "alexander.wright@tech.io",
                Phone = "+1 (555) 234-5678",
                Summary = "Results-driven Senior Engineer with 8+ years experience scaling high-concurrency cloud systems, Kubernetes microservices, and leading distributed infrastructure engineering teams across Silicon Valley SaaS platforms.",
                ExperienceRoleTitle = "Lead Systems Architect - CloudScale Inc.",
                ExperienceAchievements = "- Scaled Kubernetes microservices architecture to process 4.2B daily API requests with 99.99% uptime.\n- Architected automated CI/CD pipeline reducing deployment latency by 64% across 80+ microservices.\n- Mentored a team of 14 senior infrastructure engineers across San Francisco and London offices.",
                Skills = new System.Collections.Generic.List<string> { "Go (Golang)", "TypeScript", "Python", "Kubernetes", "AWS", "Terraform", "Docker", "Kafka", "Redis", "Microservices", "CI/CD" }
            };

            litResumeContent.Text = ResumeTemplateBase.RenderTemplate(templateId, primaryColor, data);
        }


    }
}
