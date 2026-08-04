using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class Analyzer : AppPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAnalyze_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            // Trigger ATS scanning logic
        }

        protected void btnAutoFix_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            // Trigger auto-fix logic
        }
    }
}
