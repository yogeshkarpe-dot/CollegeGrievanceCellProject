using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeGrievanceCell.Student
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Student"] == null)
            {
                Response.Redirect("StudentLogin.aspx");
            }

            if (!IsPostBack)
            {
                FillData();
            }
        }

        private void FillData()
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                string query = "select * from Student where RollNo=" + Session["Student"];
                SqlCommand cmd = new SqlCommand(query, Con);

                Con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();

                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtRollNo.Text = sdr["RollNo"].ToString();
                        txtPassword.Text = sdr["Password"].ToString();
                        txtName.Text = sdr["Name"].ToString();
                        txtYear.Text = sdr["Year"].ToString();
                        txtDepartment.Text = sdr["Department"].ToString();
                        txtMobile.Text = sdr["Mobile"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        txtAddress.Text = sdr["Address"].ToString();
                    }
                }
                else
                {
                    lblMessage.Text = "Record not found..!";
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                }

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                string query = "update Student set Password=@password, Mobile=@mobile, Email=@email, Address=@address where RollNo=" + Session["Student"];
                SqlCommand cmd = new SqlCommand(query, Con);

                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);

                Con.Open();

                int r = cmd.ExecuteNonQuery();

                if (r > 0)
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Updated Successfully.";
                    lblMessage.ForeColor = Color.Green;

                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Cannot Update rigth now, plz try after sometime..!";
                    lblMessage.ForeColor = Color.Red;
                }
            }
        }

        
    }
}
