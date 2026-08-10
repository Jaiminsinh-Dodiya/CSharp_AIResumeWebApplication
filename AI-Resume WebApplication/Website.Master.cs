using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AI_Resume_WebApplication
{
    public partial class Website : System.Web.UI.MasterPage
    {
        /// <summary>
        /// Called by AppPageBase.OnPreRender() to switch the master page
        /// from the public marketing layout (navbar + footer via default
        /// ContentPlaceHolder content) to the app dashboard layout
        /// (sidebar + topbar via shared server-side divs).
        /// </summary>
        public void EnableAppLayout()
        {
            // Show the shared sidebar and topbar sections
            appSidebar.Visible = true;
            appTopbar.Visible = true;

            // Switch mainWrap to dashboard CSS layout
            mainWrap.Attributes["class"] = "dashboard-main";
            mainWrap.Attributes["style"] = "";
            contentInner.Attributes["class"] = "dashboard-content";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        /// <summary>
        /// Returns "active" CSS class if the current URL matches the given page name.
        /// Used in sidebar nav items and public navbar links to highlight the active page.
        /// </summary>
        public string GetActiveClass(string pageName)
        {
            string currentPath = Request.Url.AbsolutePath;
            if (currentPath.EndsWith(pageName, StringComparison.OrdinalIgnoreCase))
            {
                return "active";
            }
            if (pageName.Equals("Default.aspx", StringComparison.OrdinalIgnoreCase) && (currentPath.EndsWith("/") || string.IsNullOrEmpty(System.IO.Path.GetFileName(currentPath))))
            {
                return "active";
            }
            return string.Empty;
        }
    }
}
