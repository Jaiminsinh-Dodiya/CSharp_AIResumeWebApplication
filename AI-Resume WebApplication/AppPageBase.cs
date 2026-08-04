using System;
using System.Web.UI;

namespace AI_Resume_WebApplication
{
    /// <summary>
    /// Base class for all "logged-in app" pages (Dashboard, Resume Builder, Preview,
    /// Career Profile, Analyzer, Settings). Pages that inherit from this automatically
    /// get the sidebar + topbar shell on the shared Website.Master instead of the
    /// public marketing navbar/footer.
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
                site.ShowSidebar = true;

                // Front-end only for now — no database/auth is wired up yet,
                // so we simply pretend a user is signed in for UI purposes.
                site.IsLoggedIn = true;
            }
            base.OnPreRender(e);
        }
    }
}
