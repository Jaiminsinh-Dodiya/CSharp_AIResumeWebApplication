using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace AI_Resume_WebApplication
{
    public partial class Login : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            getCon();
            string command = "select * from Users where Email='" + txtEmail.Text + "' and Password='" + txtPassword.Text + "'";
            da = new SqlDataAdapter(command, con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                if (lblError != null)
                {
                    lblError.Text = "Invalid email or password combination.";
                    lblError.Visible = true;
                }
            }
        }
    }
}
