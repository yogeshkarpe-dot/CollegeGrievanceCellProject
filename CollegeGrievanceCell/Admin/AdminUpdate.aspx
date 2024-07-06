<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUpdate.aspx.cs" Inherits="CollegeGrievanceCell.Admin.AdminUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:lightpink">
    <form id="form1" runat="server">
        <div style="position:absolute ; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: aquamarine; border: 1px solid black;">
            <h1 style="color: mediumpurple; text-align: center">
                Update Admin
            </h1>

            <div style="float: left; margin-bottom: 10px">
                <asp:HyperLink ID="LinkBack" NavigateUrl="~/Admin/AdminHome.aspx" Width="200px" Font-Size="Larger" runat="server">< Back</asp:HyperLink>
            </div>
            
            <div style="padding-bottom:10px">
                <asp:Label ID="lblMessage" runat="server" visible="false" Font-Size="Large" Font-Bold="true"></asp:Label>
            </div>

            <table>
                <tr style="padding:20px 0">
                    <td style="padding: 0 10px">
                        <h3>Admin Id</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAdminId" runat="server" Width="400px" Height="20px" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Password</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" Width="400px" Height="20px" required></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Admin Name</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Width="400px" Height="20px" required></asp:TextBox>
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

            </table>
            <div style="text-align:center; padding: 20px 0">
                <asp:Button ID="btnAdd" runat="server" Text="Add" ForeColor="darkred" BorderColor="Black" BackColor="White" width="100px" height="40px" OnClick="btnAdd_Click"/>
            </div>
        </div>
    </form>
</body>
</html>
