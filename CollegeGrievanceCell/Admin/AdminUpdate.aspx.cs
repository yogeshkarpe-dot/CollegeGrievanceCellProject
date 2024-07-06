using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace CollegeGrievanceCell.Admin
{
    public partial class AdminUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                txtAdminId.Text = ConfigurationManager.AppSettings["AdminId"];
                txtPassword.Text = ConfigurationManager.AppSettings["Password"];
                txtName.Text = ConfigurationManager.AppSettings["Name"];
                txtMobile.Text = ConfigurationManager.AppSettings["Mobile"];
                txtEmail.Text = ConfigurationManager.AppSettings["Email"];
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["AdminId"] = txtAdminId.Text;
            ConfigurationManager.AppSettings["Password"] = txtPassword.Text;
            ConfigurationManager.AppSettings["Name"] = txtName.Text;
            ConfigurationManager.AppSettings["Mobile"] = txtMobile.Text;
            ConfigurationManager.AppSettings["Email"] = txtEmail.Text;

            lblMessage.Text = "Admin Profile Updated Successfully";
            lblMessage.Visible = true;
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}