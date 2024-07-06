<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="CollegeGrievanceCell.Student.UpdateProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:lightpink">
    <form id="form1" runat="server">
        <div style="position:absolute ; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: aquamarine; border: 1px solid black;">
            <h1 style="color: mediumpurple; text-align: center">
               Update Profile
            </h1>

            <div style="float: left; margin-bottom: 10px">
                <asp:HyperLink ID="LinkBack" NavigateUrl="~/Student/StudentHome.aspx" Width="200px" Font-Size="Larger" runat="server">< Back</asp:HyperLink>
            </div>
            
            <div style="padding-bottom:10px">
                <asp:Label ID="lblMessage" runat="server" visible="false" Font-Size="Large" Font-Bold="true"></asp:Label>
            </div>

            <table>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Roll No</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRollNo" ReadOnly="true" runat="server" Width="400px" Height="20px" required></asp:TextBox>
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
                        <h3>Name</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" ReadOnly="true" runat="server" Width="400px" Height="20px" required></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 0 10px">
                        <h3>Year</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtYear" ReadOnly="true" runat="server" Width="400px" Height="20px" required></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 0 10px">
                        <h3>Department</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDepartment" ReadOnly="true" runat="server" Width="400px" Height="20px" required></asp:TextBox>
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
                <asp:Button ID="btnUpdate" runat="server" Text="Update" ForeColor="darkred" BorderColor="Black" BackColor="White" width="100px" height="40px" OnClick="btnUpdate_Click"/>
            </div>
        </div>
    </form>
</body>
</html>
