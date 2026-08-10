using System;
using System.Web.UI;
using System.Web;   

namespace AI_Resume_WebApplication
{
    /// <summary>
    /// Base class for all "logged-in app" pages (Dashboard, Resume Builder, Preview,
    /// Career Profile, Analyzer, Settings, Templates, MockInterview).
    /// 
    /// Pages that inherit from this automatically get the sidebar + topbar shell
    /// on the shared Website.Master by calling EnableAppLayout(), which shows the
    /// shared sidebar/topbar divs and applies dashboard CSS classes.
    /// 
    /// Content pages that inherit from AppPageBase must also provide empty
    /// asp:Content blocks for NavigationContent and FooterContent to override
    /// the default public navbar and footer with nothing.
    /// </summary>
    public class AppPageBase : Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            MasterPageFile = "~/Website.Master";
        }

        protected override void OnPreRender(EventArgs e)
        {
            var site = Master as Website;
            if (site != null)
            {
                site.EnableAppLayout();
            }
            base.OnPreRender(e);
        }
    }
}
