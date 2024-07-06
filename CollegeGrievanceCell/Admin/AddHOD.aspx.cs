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
    public partial class AddHOD : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        string Type = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (Request.QueryString["id"] != null)
            {
                Type = "Update";
                Session["Title"] = "Update";
                if (!IsPostBack)
                {
                    FillData();
                }
            }
            else
            {
                Type = "Add";
                Session["Title"] = "Add";
            }

        }

        private void FillData()
        {
            if (Request.QueryString["id"] != null)
            {
                using (SqlConnection Con = new SqlConnection(CS))
                {
                    string query = "select * from HOD where HODId = " + Request.QueryString["id"];
                    SqlCommand cmd = new SqlCommand(query, Con);
                    Con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        while (sdr.Read())
                        {
                            txtHODId.Text = sdr["HODId"].ToString();
                            if (txtPassword.TextMode == TextBoxMode.Password)
                            {
                                txtPassword.TextMode = TextBoxMode.SingleLine;
                            }
                            txtPassword.Text = sdr["Password"].ToString();
                            txtName.Text = sdr["Name"].ToString();
                            txtMobile.Text = sdr["Mobile"].ToString();
                            txtEmail.Text = sdr["Email"].ToString();
                            txtAddress.Text = sdr["Address"].ToString();
                            ddlDepartment.SelectedValue = sdr["Department"].ToString();
                            btnAdd.Text = "Update";
                        }
                    }
                    else
                    {
                        lblMessage.Text = "HOD not Found..!";
                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                try
                {
                    if (Type == "Add")
                    {
                        string query = "insert HOD Values (@HODId, @Password, @Name, @Department, @Mobile, @Email, @Address)";
                        SqlCommand cmd = new SqlCommand(query, Con);

                        ExecuteQuery(cmd, Con, "Added");
                    }
                    else
                    {
                        string query = "update HOD set HODId=@HODId, Password=@Password, Name=@Name, Department=@Department, Mobile=@Mobile, Email=@Email, Address=@Address where HODId=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand(query, Con);

                        ExecuteQuery(cmd, Con, "Updated");
                    }

                }

                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of PRIMARY KEY constraint"))
                    {
                        lblMessage.Visible = true;
                        lblMessage.Text = "<b>" + txtHODId.Text.Trim() + "</b>" + " RollNo already exist, try new one..!";
                        lblMessage.ForeColor = Color.Red;
                    }
                    else
                    {
                        Response.Write("<script>alert('" + ex.Message + "')</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                }
            }
        }

        private void ExecuteQuery(SqlCommand cmd, SqlConnection con, string v)
        {
            cmd.Parameters.AddWithValue("@HODId", txtHODId.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Department", ddlDepartment.SelectedValue);
            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());

            con.Open();
            int r = cmd.ExecuteNonQuery();
            if (r > 0)
            {
                lblMessage.Visible = true;
                lblMessage.Text = v + " Successfully.";
                lblMessage.ForeColor = Color.Green;
                Clear();
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Cannot " + v + " HOD rigth now, plz try after sometime..!";
                lblMessage.ForeColor = Color.Red;
            }
        }

        private void Clear()
        {
            txtHODId.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtName.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            ddlDepartment.ClearSelection();
        }
    }
}