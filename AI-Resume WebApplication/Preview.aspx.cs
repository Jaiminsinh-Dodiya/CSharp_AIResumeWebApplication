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

        protected void btnDownloadPdf_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string templateId = Session["SelectedTemplate"] as string ?? "modern";
            string primaryColor = Session["ThemeColor"] as string ?? "#3b82f6";

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

            string html = ResumeTemplateBase.RenderTemplate(templateId, primaryColor, data);

            // Add basic CSS reset and advanced Google Fonts for the PDF parser
            string fullHtml = $@"
                <html>
                <head>
                    <style>
                        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&family=Inter:wght@300;400;500;600;700&display=swap');
                        body {{ margin: 0; padding: 0; -webkit-print-color-adjust: exact; }}
                    </style>
                    <link href=""{Request.Url.Scheme}://{Request.Url.Authority}/assets/css/templates.css"" rel=""stylesheet"" />
                </head>
                <body>
                    {html}
                </body>
                </html>";

            // Use SelectPdf to generate the PDF
            var converter = new SelectPdf.HtmlToPdf();
            
            // Set basic options
            converter.Options.PdfPageSize = SelectPdf.PdfPageSize.A4;
            converter.Options.MarginLeft = 0;
            converter.Options.MarginRight = 0;
            converter.Options.MarginTop = 0;
            converter.Options.MarginBottom = 0;
            converter.Options.WebPageWidth = 800; // standard width for resume

            SelectPdf.PdfDocument doc = converter.ConvertHtmlString(fullHtml, Request.Url.AbsoluteUri);

            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment; filename=\"Resume.pdf\"");
            
            doc.Save(Response.OutputStream);
            doc.Close();

            Response.End();
        }
    }
}
