using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace CollegeGrievanceCell.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        string AdminId = string.Empty;
        string Password = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            AdminId = ConfigurationManager.AppSettings["AdminId"];
            Password = ConfigurationManager.AppSettings["Password"];

            if(txtAdminId.Text.Trim() == AdminId && txtPassword.Text.Trim() == Password)
            {
                Session["admin"] = AdminId;
                Response.Redirect("AdminHome.aspx", false);
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Invalid Admin Credentials";
               
            }
        }
    }
}