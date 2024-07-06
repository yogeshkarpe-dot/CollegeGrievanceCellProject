<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="CollegeGrievanceCell.Admin.AddStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:lightpink">
    <form id="form1" runat="server">
        <div style="position:absolute ; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: aquamarine; border: 1px solid black;">
            <h1 style="color: mediumpurple; text-align: center">
                <%Response.Write(Session["title"]);%> Student
            </h1>

            <div style="float: left; margin-bottom: 10px">
                <asp:HyperLink ID="LinkBack" NavigateUrl="~/Admin/Students.aspx" Width="200px" Font-Size="Larger" runat="server">< Back</asp:HyperLink>
            </div>
            
            <div style="padding-bottom:10px">
                <asp:Label ID="lblMessage" runat="server" visible="false" Font-Size="Large" Font-Bold="true"></asp:Label>
            </div>

            <table>
                <tr style="padding:20px 0">
                    <td style="padding: 0 10px">
                        <h3>Student Roll No</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRollNo" runat="server" Width="400px" Height="20px" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Password</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="400px" Height="20px" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Student Name</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Width="400px" Height="20px" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Year</h3>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlYear" runat="server" Width="400px" Height="30px">
                            <asp:ListItem Value="0">Select Year</asp:ListItem>
                            <asp:ListItem Value="1st Year">1st Year</asp:ListItem>
                            <asp:ListItem Value="2nd Year">2nd Year</asp:ListItem>
                            <asp:ListItem Value="3rd Year">3rd Year</asp:ListItem>
                            <asp:ListItem Value="4th Year">4th Year</asp:ListItem>
                        </asp:DropDownList>
                        <div>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Year is required" ControlToValidate="ddlYear" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Department</h3>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" runat="server" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" DataTextField="DepartmentName" DataValueField="DepartmentName" Width="400px" Height="30px">
                            <asp:ListItem Value="0">Select Department</asp:ListItem>
                        </asp:DropDownList>
                        <div>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Department is required" ControlToValidate="ddlDepartment" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="SELECT [DepartmentName] FROM [Department]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Mobile No</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMobile"  runat="server" Width="400px" Height="20px" required ></asp:TextBox>
                        <div>
                            <asp:RegularExpressionValidator runat="server" ErrorMessage="Mobile Number must have 10 digits" ForeColor="Red" Display="Dynamic" 
                            SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Email</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" Width="400px" Height="20px" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Address</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" Width="400px" Height="50px" required></asp:TextBox>
                    </td>
                </tr>

            </table>
            <div style="text-align:center; padding: 20px 0">
                <asp:Button ID="btnAdd" runat="server" Text="Add" ForeColor="darkred" BorderColor="Black" BackColor="White" width="100px" height="40px" OnClick="btnAdd_Click"/>
            </div>
        </div>
    </form>
</body>
</html>
