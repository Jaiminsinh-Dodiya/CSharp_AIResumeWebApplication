using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    public partial class Preview : AppPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDownloadPdf_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            // Trigger backend PDF generation stream
        }
    }
}
