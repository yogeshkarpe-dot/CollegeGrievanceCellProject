using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CollegeGrievanceCell.Student
{
    public partial class RaiseComplaint : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Student"] == null)
            {
                Response.Redirect("StudentLogin.aspx");
            }
            if (!IsPostBack)
            {
                ddlDepChild.Enabled = false;
            }
        }

        private DataSet GetData(string query)
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                SqlDataAdapter sda = new SqlDataAdapter(query, Con);
                DataSet ds = new DataSet();
                sda.Fill(ds);

                return ds;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                string query = "insert Complaints values (@department, @description, @date, @status)";
                SqlCommand cmd = new SqlCommand(query, Con);
                cmd.Parameters.AddWithValue("@department", ddlDepChild.SelectedValue);
                cmd.Parameters.AddWithValue("@description", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("dd/MM/yyyy"));
                cmd.Parameters.AddWithValue("@status", "Pending");

                Con.Open();

                int r = cmd.ExecuteNonQuery();

                if (r > 0)
                {
                    lblMessage.Text = "Complaint submitted successfully!";
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Cannot Submit Complaint right now, try after some time..!";
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void ddlDepParent_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = string.Empty;
            if (ddlDepParent.SelectedValue == "1")
            {
                ddlDepChild.Enabled = true;
                ddlDepChild.DataTextField = "DepartmentName";
                ddlDepChild.DataValueField = "DepartmentName";
                query = "select DepartmentName from Department";
                ddlDepChild.DataSource = GetData(query);
                ddlDepChild.DataBind();

                ListItem liselect = new ListItem("Select", "-1");
                ddlDepChild.Items.Insert(0, liselect);
            }
            else if (ddlDepParent.SelectedValue == "2")
            {
                ddlDepChild.Enabled = true;
                ddlDepChild.DataTextField = "GenericName";
                ddlDepChild.DataValueField = "GenericName";
                query = "select GenericName from Generic";
                ddlDepChild.DataSource = GetData(query);
                ddlDepChild.DataBind();

                ListItem liselect = new ListItem("Select", "-1");
                ddlDepChild.Items.Insert(0, liselect);
            }
            else
            {
                ddlDepChild.ClearSelection();
                ddlDepChild.Enabled = false;
            }
        }
    }
}