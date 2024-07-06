using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace CollegeGrievanceCell.Student
{
    public partial class StudentLogin : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                string query = "select Count(RollNo) from Student where RollNo=@rollNo and Password=@password";
                SqlCommand cmd = new SqlCommand(query, Con);
                cmd.Parameters.AddWithValue("rollNo", txtRollNo.Text.Trim());
                cmd.Parameters.AddWithValue("password", txtPassword.Text.Trim());

                Con.Open();
                int r = Convert.ToInt32(cmd.ExecuteScalar());

                if(r > 0)
                {
                    Session["Student"] = txtRollNo.Text;
                    Response.Redirect("StudentHome.aspx", false);
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Invalid Student Credentials";
                }
            }
        }
    }
}