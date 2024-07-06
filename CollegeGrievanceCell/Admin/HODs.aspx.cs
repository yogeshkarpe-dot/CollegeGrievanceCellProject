using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeGrievanceCell.Admin
{
    public partial class HODs : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditHOD")
            {
                Response.Redirect("AddHOD.aspx?id=" + e.CommandArgument.ToString());
            }
            if (e.CommandName == "DeleteHOD")
            {
                DeleteHOD(e.CommandArgument.ToString());
            }
        }

        private void DeleteHOD(string v)
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                try
                {
                    int HODId = Convert.ToInt32(v);
                    SqlCommand cmd = new SqlCommand("delete from HOD where HODId = @id", Con);
                    cmd.Parameters.AddWithValue("@id", HODId);
                    Con.Open();
                    int r = cmd.ExecuteNonQuery();

                    if (r > 0)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "HOD deletd successfully";

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

        protected void btnAddHOD_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddHOD.aspx");
        }
    }
}