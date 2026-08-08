using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace AI_Resume_WebApplication
{
    public partial class Register : Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getCon();
            da = new SqlDataAdapter("Select * from Users", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        public void clear()
        {
            txtFullName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtCityState.Text = string.Empty;
            txtLanguages.Text = string.Empty;
            txtTargetJobTitle.Text = string.Empty;
            txtPrimarySkills.Text = string.Empty;
            txtLinkedInUrl.Text = string.Empty;
            txtPortfolioUrl.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            txtDob.Text = string.Empty;

            ddlGender.SelectedIndex = -1;
            ddlCountry.SelectedIndex = -1;
            ddlRole.SelectedIndex = -1;
            ddlExperienceLevel.SelectedIndex = -1;
            ddlIndustry.SelectedIndex = -1;
            ddlJobSearchStatus.SelectedIndex = -1;
            chkTerms.Checked = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getCon();
            fillgrid();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            getCon();
            string command = "insert into Users(FullName,Email,Gender,Country,Dob,Phone,CityState,Languages,TargetJobTitle,Role,ExperienceLevel,Industry,PrimarySkills,JobSearchStatus,LinkedInUrl,PortfolioUrl,Password) " +
                "values('" + txtFullName.Text + "','" + txtEmail.Text + "','" + ddlGender.SelectedValue + "','" + ddlCountry.SelectedValue + "','" + txtDob.Text + "','" + txtPhone.Text + "','" + txtCityState.Text + "','" +
                txtLanguages.Text + "','" + txtTargetJobTitle.Text + "','" + ddlRole.SelectedValue + "','" + ddlExperienceLevel.SelectedValue + "','" + ddlIndustry.SelectedValue + "','" + txtPrimarySkills.Text + "','" + 
                ddlJobSearchStatus.SelectedValue + "','" + txtLinkedInUrl.Text + "','" + txtPortfolioUrl.Text + "','" + txtPassword.Text + "')";
            cmd = new SqlCommand(command, con);
            cmd.ExecuteNonQuery();

            clear();
            fillgrid();
        }
    }
}