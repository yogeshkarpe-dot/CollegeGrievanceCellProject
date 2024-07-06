using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;


namespace CollegeGrievanceCell.Admin
{
    public partial class AddStudent : System.Web.UI.Page
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
                    string query = "select * from Student where RollNo = " + Request.QueryString["id"];
                    SqlCommand cmd = new SqlCommand(query, Con);
                    Con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        while (sdr.Read())
                        {
                            txtRollNo.Text = sdr["RollNo"].ToString();
                            if (txtPassword.TextMode == TextBoxMode.Password)
                            {
                                txtPassword.TextMode = TextBoxMode.SingleLine;
                            }
                            txtPassword.Text = sdr["Password"].ToString();
                            txtName.Text = sdr["Name"].ToString();
                            txtMobile.Text = sdr["Mobile"].ToString();
                            txtEmail.Text = sdr["Email"].ToString();
                            txtAddress.Text = sdr["Address"].ToString();
                            ddlYear.SelectedValue = sdr["Year"].ToString();
                            ddlDepartment.SelectedValue = sdr["Department"].ToString();
                            btnAdd.Text = "Update";
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Student not Found..!";
                        lblMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
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
                        string query = "insert Student Values (@RollNo, @Password, @Name, @Year, @Department, @Mobile, @Email, @Address)";
                        SqlCommand cmd = new SqlCommand(query, Con);

                        ExecuteQuery(cmd, Con, "Added");
                    }
                    else
                    {
                        string query = "update Student set RollNo=@RollNo, Password=@Password, Name=@Name, Year=@Year, Department=@Department, Mobile=@Mobile, Email=@Email, Address=@Address where RollNo=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand(query, Con);

                        ExecuteQuery(cmd, Con, "Updated");
                    }
                    
                }

                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of PRIMARY KEY constraint"))
                    {
                        lblMessage.Visible = true;
                        lblMessage.Text = "<b>" + txtRollNo.Text.Trim() + "</b>" + " RollNo already exist, try new one..!";
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
            cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Year", ddlYear.SelectedValue);
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
                lblMessage.Text = "Cannot " + v + " Student rigth now, plz try after sometime..!";
                lblMessage.ForeColor = Color.Red;
            }
        }

        private void Clear()
        {
            txtRollNo.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtName.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            ddlYear.ClearSelection();
            ddlDepartment.ClearSelection();
        }
    }
}