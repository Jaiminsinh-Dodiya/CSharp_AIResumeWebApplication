using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace AI_Resume_WebApplication
{
    public class ResumeData
    {
        public string FullName { get; set; }
        public string JobTitle { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Summary { get; set; }
        public string ExperienceRoleTitle { get; set; }
        public string ExperienceAchievements { get; set; }
        public List<string> Skills { get; set; } = new List<string>();
    }

    public static class ResumeTemplateBase
    {
        // SVG Icons (Upgraded to FontAwesome style geometry)
        private const string SvgPhone = "<svg class=\"icon-svg-resume\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z\"></path></svg>";
        private const string SvgEmail = "<svg class=\"icon-svg-resume\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z\"></path><polyline points=\"22,6 12,13 2,6\"></polyline></svg>";
        private const string SvgUser = "<svg class=\"icon-svg-resume\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2\"></path><circle cx=\"12\" cy=\"7\" r=\"4\"></circle></svg>";
        private const string SvgBriefcase = "<svg class=\"icon-svg-resume\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><rect x=\"2\" y=\"7\" width=\"20\" height=\"14\" rx=\"2\" ry=\"2\"></rect><path d=\"M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16\"></path></svg>";
        private const string SvgCode = "<svg class=\"icon-svg-resume\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><polyline points=\"16 18 22 12 16 6\"></polyline><polyline points=\"8 6 2 12 8 18\"></polyline></svg>";

        public static string RenderTemplate(string templateId, string primaryColor, ResumeData data)
        {
            var sb = new StringBuilder();
            string cssClass = "template-" + templateId.ToLower();
            
            // Build the dynamic URL for the Digital Card Hub
            string host = HttpContext.Current != null ? HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) : "https://yourdomain.com";
            string hubUrl = $"{host}/Card.aspx?name={System.Uri.EscapeDataString(data.FullName ?? "")}&title={System.Uri.EscapeDataString(data.JobTitle ?? "")}&email={System.Uri.EscapeDataString(data.Email ?? "")}&phone={System.Uri.EscapeDataString(data.Phone ?? "")}";
            
            // Generate QR Code URL via external API pointing to the Digital Hub
            string qrData = System.Uri.EscapeDataString(hubUrl);
            string qrUrl = $"https://api.qrserver.com/v1/create-qr-code/?size=150x150&data={qrData}&color=111827";

            // Random generator for skill proficiency visualization
            Random rand = new Random(data.FullName?.GetHashCode() ?? 0);

            sb.AppendLine($"<style>:root {{ --resume-primary-color: {primaryColor}; }}</style>");
            sb.AppendLine($"<div class=\"resume-document {cssClass}\" style=\"position:relative;\">");

            if (templateId.Equals("modern", StringComparison.OrdinalIgnoreCase))
            {
                // NOVA (MODERN TECH)
                sb.AppendLine("  <div class=\"nova-sidebar\">");
                sb.AppendLine($"    <h1>{data.FullName}</h1>");
                sb.AppendLine($"    <div class=\"job-title\">{data.JobTitle}</div>");
                
                sb.AppendLine($"    <div class=\"section-title-side\">{SvgUser} Contact</div>");
                sb.AppendLine("    <div class=\"contact-info\">");
                sb.AppendLine($"      <div class=\"contact-item\">{SvgEmail} <span>{data.Email}</span></div>");
                sb.AppendLine($"      <div class=\"contact-item\">{SvgPhone} <span>{data.Phone}</span></div>");
                sb.AppendLine("    </div>");

                if (data.Skills != null && data.Skills.Count > 0)
                {
                    sb.AppendLine($"    <div class=\"section-title-side\">{SvgCode} Tech Stack</div>");
                    sb.AppendLine("    <div class=\"skill-pills\">");
                    foreach(var skill in data.Skills)
                    {
                        int proficiency = rand.Next(70, 98);
                        sb.AppendLine("      <div class=\"skill-bar-container\">");
                        sb.AppendLine($"        <div class=\"skill-name\"><span>{skill}</span><span>{proficiency}%</span></div>");
                        sb.AppendLine("        <div class=\"skill-track\">");
                        sb.AppendLine($"          <div class=\"skill-fill\" style=\"width:{proficiency}%;\"></div>");
                        sb.AppendLine("        </div>");
                        sb.AppendLine("      </div>");
                    }
                    sb.AppendLine("    </div>");
                }

                // API QR Code
                sb.AppendLine("    <div class=\"qr-wrapper\">");
                sb.AppendLine($"      <img src=\"{qrUrl}\" alt=\"QR Code\" />");
                sb.AppendLine("      <div class=\"qr-text\">Scan to connect</div>");
                sb.AppendLine("    </div>");

                sb.AppendLine("  </div>");

                sb.AppendLine("  <div class=\"nova-main\">");
                sb.AppendLine($"    <div class=\"section-title-main\">{SvgUser} Executive Summary</div>");
                sb.AppendLine($"    <div class=\"summary-text\">{data.Summary}</div>");
                
                sb.AppendLine($"    <div class=\"section-title-main\">{SvgBriefcase} Professional Experience</div>");
                sb.AppendLine("    <div class=\"timeline\">");
                sb.AppendLine("      <div class=\"timeline-item\">");
                sb.AppendLine("        <div class=\"timeline-header\">");
                sb.AppendLine($"          <div class=\"timeline-title\">{data.ExperienceRoleTitle}</div>");
                sb.AppendLine("          <div class=\"timeline-date\">Present</div>");
                sb.AppendLine("        </div>");
                sb.AppendLine("        <ul class=\"timeline-bullets\">");
                foreach (var bullet in data.ExperienceAchievements.Split(new[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries))
                {
                    sb.AppendLine($"          <li>{bullet.TrimStart('-').Trim()}</li>");
                }
                sb.AppendLine("        </ul>");
                sb.AppendLine("      </div>");
                sb.AppendLine("    </div>");
                sb.AppendLine("  </div>");
            }
            else if (templateId.Equals("executive", StringComparison.OrdinalIgnoreCase))
            {
                // PRESTIGE (EXECUTIVE)
                sb.AppendLine("  <div style=\"width:100%; position:relative;\">");
                
                // Absolute positioned QR Code for executive feel
                sb.AppendLine("    <div class=\"qr-header-container\">");
                sb.AppendLine($"      <img src=\"{qrUrl}\" alt=\"Digital Profile\" />");
                sb.AppendLine("    </div>");

                sb.AppendLine("    <div class=\"header-top\">");
                sb.AppendLine($"      <h1>{data.FullName}</h1>");
                sb.AppendLine($"      <div class=\"job-title\">{data.JobTitle}</div>");
                sb.AppendLine("      <div class=\"contact-bar\">");
                sb.AppendLine($"        <div class=\"contact-item\">{SvgEmail} {data.Email}</div>");
                sb.AppendLine($"        <div class=\"contact-item\">{SvgPhone} {data.Phone}</div>");
                sb.AppendLine("      </div>");
                sb.AppendLine("    </div>");
                
                sb.AppendLine("    <div class=\"section-title\">Executive Profile</div>");
                sb.AppendLine($"    <div class=\"summary-text\">{data.Summary}</div>");
                
                sb.AppendLine("    <div class=\"section-title\">Professional Experience</div>");
                sb.AppendLine("    <div class=\"exp-grid\">");
                sb.AppendLine("      <div class=\"exp-date\">Present</div>");
                sb.AppendLine("      <div class=\"exp-content\">");
                sb.AppendLine($"        <h3>{data.ExperienceRoleTitle}</h3>");
                sb.AppendLine("        <ul>");
                foreach (var bullet in data.ExperienceAchievements.Split(new[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries))
                {
                    sb.AppendLine($"          <li>{bullet.TrimStart('-').Trim()}</li>");
                }
                sb.AppendLine("        </ul>");
                sb.AppendLine("      </div>");
                sb.AppendLine("    </div>");

                if (data.Skills != null && data.Skills.Count > 0)
                {
                    sb.AppendLine("    <div class=\"section-title\">Areas of Expertise</div>");
                    sb.AppendLine("    <div class=\"skills-list\">");
                    sb.AppendLine("      <strong>Core Competencies:</strong> " + string.Join(", ", data.Skills));
                    sb.AppendLine("    </div>");
                }
                sb.AppendLine("  </div>");
            }
            else // minimalist
            {
                // AURA (MINIMALIST)
                sb.AppendLine("  <div class=\"aura-container\">");
                sb.AppendLine("    <div class=\"header-area\">");
                sb.AppendLine("      <div class=\"header-left\">");
                sb.AppendLine($"        <h1>{data.FullName}</h1>");
                sb.AppendLine($"        <div class=\"job-title\">{data.JobTitle}</div>");
                sb.AppendLine("      </div>");
                sb.AppendLine("      <div class=\"header-right\">");
                sb.AppendLine($"        <div class=\"contact-item\">{data.Email} {SvgEmail}</div>");
                sb.AppendLine($"        <div class=\"contact-item\">{data.Phone} {SvgPhone}</div>");
                sb.AppendLine("      </div>");
                sb.AppendLine("    </div>");
                
                sb.AppendLine("    <div class=\"section-block\">");
                sb.AppendLine("      <div class=\"section-title\">About</div>");
                sb.AppendLine($"      <div class=\"summary-text\">{data.Summary}</div>");
                sb.AppendLine("    </div>");
                
                if (data.Skills != null && data.Skills.Count > 0)
                {
                    sb.AppendLine("    <div class=\"section-block\">");
                    sb.AppendLine("      <div class=\"section-title\">Capabilities</div>");
                    sb.AppendLine("      <div class=\"skill-tags\">");
                    foreach(var skill in data.Skills)
                    {
                        sb.AppendLine($"        <span class=\"skill-tag\">{skill}</span>");
                    }
                    sb.AppendLine("      </div>");
                    sb.AppendLine("    </div>");
                }

                sb.AppendLine("    <div class=\"section-block\">");
                sb.AppendLine("      <div class=\"section-title\">Experience</div>");
                sb.AppendLine("      <div class=\"exp-item\">");
                sb.AppendLine("        <div class=\"exp-header\">");
                sb.AppendLine($"          <div class=\"exp-title\">{data.ExperienceRoleTitle}</div>");
                sb.AppendLine("          <div class=\"exp-date\">Present</div>");
                sb.AppendLine("        </div>");
                sb.AppendLine("        <ul class=\"exp-bullets\">");
                foreach (var bullet in data.ExperienceAchievements.Split(new[] { '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries))
                {
                    sb.AppendLine($"          <li>{bullet.TrimStart('-').Trim()}</li>");
                }
                sb.AppendLine("        </ul>");
                sb.AppendLine("      </div>");
                sb.AppendLine("    </div>");
                sb.AppendLine("  </div>");
            }

            sb.AppendLine("</div>");

            return sb.ToString();
        }
    }
}
