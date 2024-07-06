using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeGrievanceCell
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void lbStudent_Click(object sender, EventArgs e)
        {
            Session["User"] = "Student";
            Response.Redirect("~/Student/StudentLogin.aspx");
            
        }

        protected void lbHOD_Click(object sender, EventArgs e)
        {
            Session["User"] = "HOD";
            Response.Redirect("~/HOD/HODLogin.aspx");
            
        }

        protected void lbAdmin_Click(object sender, EventArgs e)
        {
            Session["User"] = "Admin";
            Response.Redirect("~/Admin/AdminLogin.aspx");
            
        }
    }
}