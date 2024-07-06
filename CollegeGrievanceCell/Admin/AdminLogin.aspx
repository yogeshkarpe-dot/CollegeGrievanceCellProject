﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="CollegeGrievanceCell.Admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:lightpink">
    <form id="form1" runat="server">
        <div style="position:absolute ; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 30px; background-color: aquamarine; border: 1px solid black;">
            

            <h1 style="color: mediumpurple; text-align: center">
                Admin Login
            </h1>

            <div margin-bottom: 10px">
                <asp:HyperLink ID="LinkBack" NavigateUrl="~/Default.aspx" Width="200px" Font-Size="Larger" runat="server">< Back</asp:HyperLink>
            </div>

            <div>
                <asp:Label ID="lblMessage" runat="server" visible="false" ForeColor="Red"></asp:Label>
            </div>
            <table>
                <tr style="padding:20px 0">
                    <td style="padding: 0 10px">
                        <h3>Admin Id</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAdminId" runat="server" Width="200px" Height="20px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0 10px">
                        <h3>Password</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="200px" Height="20px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div style="text-align:center; padding: 20px 0">
                <asp:Button ID="btnLogin" runat="server" Text="Login" ForeColor="darkred" BorderColor="Black" BackColor="White" width="100px" height="40px" OnClick="btnLogin_Click"/>
            </div>
        </div>
    </form>
</body>
</html>
