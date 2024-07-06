using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeGrievanceCell.Admin
{
    public partial class SolvedComplaints : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null && Session["HOD"] == null && Session["Student"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            if (Session["User"] != null)
            {
                string UserType = Session["User"].ToString();
                if (UserType == "Admin")
                {
                    LinkBack.NavigateUrl = "~/Admin/AdminHome.aspx";
                }
                if (UserType == "HOD")
                {
                    LinkBack.NavigateUrl = "~/HOD/HODHome.aspx";
                }
                if (UserType == "Student")
                {
                    LinkBack.NavigateUrl = "~/Student/StudentHome.aspx";
                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}