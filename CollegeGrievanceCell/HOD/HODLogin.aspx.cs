using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeGrievanceCell.HOD
{
    public partial class HODLogin : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                string query = "select Count(HODId) from HOD where HODId=@hodId and Password=@password";
                SqlCommand cmd = new SqlCommand(query, Con);
                cmd.Parameters.AddWithValue("@hodId", txtHODId.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

                Con.Open();
                int r = Convert.ToInt32(cmd.ExecuteScalar());

                if (r > 0)
                {
                    Session["HOD"] = txtHODId.Text;
                    Response.Redirect("HODHome.aspx", false);
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Invalid HOD Credentials";
                }
            }
        }
    }
}