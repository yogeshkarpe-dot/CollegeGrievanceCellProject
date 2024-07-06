using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeGrievanceCell.Admin
{
    public partial class PendingComplaints : System.Web.UI.Page
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
                    txtInput.Visible = true;
                    btnSolve.Visible = true;
                    LinkBack.NavigateUrl = "~/Admin/AdminHome.aspx";
                }
                if(UserType == "HOD")
                {
                    txtInput.Visible = true;
                    btnSolve.Visible = true;
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

      

        protected void btnSolve_Click(object sender, EventArgs e)
        {
            
                using (SqlConnection Con = new SqlConnection(CS))
                {
                    string query = "update Complaints set Status='Solved' where ComplaintId=@complaintId";
                    SqlCommand cmd = new SqlCommand(query, Con);
                    cmd.Parameters.AddWithValue("@complaintId", txtInput.Text.Trim());

                    Con.Open();
                    int r = cmd.ExecuteNonQuery();

                    if (r > 0)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Complaint Solved successfully";
                        lblMsg.ForeColor = Color.Green;
                        txtInput.Text = string.Empty;
                    }
                    else
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Invalid ComplaintId..!";
                        lblMsg.ForeColor = Color.Red;

                    }
                    GridView1.EditIndex = -1;
                    GridView1.DataBind();
                }

            
        }
    }
}