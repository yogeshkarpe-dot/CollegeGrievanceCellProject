using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeGrievanceCell.HOD
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HOD"] == null)
            {
                Response.Redirect("HODLogin.aspx");
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
                string query = "select * from HOD where HODId=" + Session["HOD"];
                SqlCommand cmd = new SqlCommand(query, Con);

                Con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();

                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtHODId.Text = sdr["HODId"].ToString();
                        txtPassword.Text = sdr["Password"].ToString();
                        txtName.Text = sdr["Name"].ToString();
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
                string query = "update HOD set Password=@password, Mobile=@mobile, Email=@email, Address=@address where HODId=" + Session["HOD"];
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