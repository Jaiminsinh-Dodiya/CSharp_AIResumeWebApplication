using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AI_Resume_WebApplication
{
    public partial class Website : System.Web.UI.MasterPage
    {
        /// <summary>
        /// Set to true (in a content page's Page_Load) to render the app-style
        /// left sidebar + topbar shell instead of the public marketing navbar/footer.
        /// Example: ((Website)Master).ShowSidebar = true;
        /// </summary>
        public bool ShowSidebar { get; set; }

        /// <summary>
        /// Set to true (in a content page's Page_Load) once real authentication
        /// exists, to swap the navbar's Sign In/Register buttons for Dashboard/Sign Out.
        /// </summary>
        public bool IsLoggedIn { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected override void OnPreRender(EventArgs e)
        {
            // Applied here (not Page_Load) so content pages have already had a
            // chance to set ShowSidebar / IsLoggedIn during their own Page_Load.
            ApplyLayout();
            base.OnPreRender(e);
        }

        private void ApplyLayout()
        {
            pnlSidebar.Visible = ShowSidebar;
            pnlPublicNavbar.Visible = !ShowSidebar;
            pnlDashboardTopbar.Visible = ShowSidebar;
            pnlFooter.Visible = !ShowSidebar;

            pnlGuestActions.Visible = !IsLoggedIn;
            pnlUserActions.Visible = IsLoggedIn;

            if (ShowSidebar)
            {
                mainWrap.Attributes["class"] = "dashboard-main";
                contentInner.Attributes["class"] = "dashboard-content";
            }
            else
            {
                mainWrap.Attributes["class"] = "";
                mainWrap.Attributes["style"] = "padding-top:90px; min-height:82vh;";
                contentInner.Attributes.Remove("class");
            }
        }

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
