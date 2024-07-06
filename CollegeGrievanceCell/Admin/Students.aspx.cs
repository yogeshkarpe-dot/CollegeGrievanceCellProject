using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace CollegeGrievanceCell.Admin
{
    public partial class Students : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddStudent.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditStudent")
            {
                Response.Redirect("AddStudent.aspx?id=" + e.CommandArgument.ToString());
            }
            if (e.CommandName == "DeleteStudent")
            {
                DeleteStudent(e.CommandArgument.ToString());
            }
        }

        private void DeleteStudent(string v)
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                try
                {
                    int RollNo = Convert.ToInt32(v);
                    SqlCommand cmd = new SqlCommand("delete from Student where RollNo = @id", Con);
                    cmd.Parameters.AddWithValue("@id", RollNo);
                    Con.Open();
                    int r = cmd.ExecuteNonQuery();

                    if (r > 0)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Student deletd successfully";

                    }
                    else
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Cannot delete this record..!";

                    }
                    GridView1.EditIndex = -1;
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
        }
    }
}