<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RaiseComplaint.aspx.cs" Inherits="CollegeGrievanceCell.Student.RaiseComplaint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:lightpink">
    <form id="form1" runat="server">
        <div style="position:absolute ; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: aquamarine; border: 1px solid black;">
            <h1 style="color: mediumpurple; text-align: center">
               Raise a Complaint
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
                        <h3>Department</h3>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepParent" OnSelectedIndexChanged="ddlDepParent_SelectedIndexChanged" Width="200px" Height="30px" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="1">Department wise</asp:ListItem>
                            <asp:ListItem Value="2">Generic</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlDepChild" Width="200px" Height="30px" runat="server" >
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td style="padding: 0 10px">
                        <h3>Description</h3>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDescription" TextMode="MultiLine"  runat="server" Width="400px" Height="100px" required ></asp:TextBox>          
                    </td>
                </tr>
            </table>
            <div style="text-align:center; padding: 20px 0">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" ForeColor="darkred" BorderColor="Black" BackColor="White" width="100px" height="40px" OnClick="btnSubmit_Click"/>
            </div>
        </div>
    </form>
</body>
</html>
