<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CollegeGrievanceCell.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:lightpink">
    <form id="form1" runat="server">
        <div style="position:absolute ; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 20px; background-color: aquamarine; border: 1px solid black;">
            <div style="padding: 20px 0">
                <span style="padding: 0 20px">
                    <img src="Images/Arrow.png" style="height: 20px; width: 60px; "/>
                </span>
                <span>
                    <asp:LinkButton ID="lbStudent" OnClick="lbStudent_Click" runat="server" Font-Size="XX-Large" ForeColor="DarkRed"> Login as Student</asp:LinkButton>
                </span>
            </div>

            <div  style="padding: 20px 0">
                <span style="padding: 0 20px">
                    <img src="Images/Arrow.png" style="height: 20px; width: 60px; "/>
                </span>
                <span>
                    <asp:LinkButton ID="lbHOD" runat="server" OnClick="lbHOD_Click" Font-Size="XX-Large" ForeColor="DarkRed"> Login as HOD</asp:LinkButton>
                </span>
            </div>

            <div style="padding: 20px 0">
                <span style="padding: 0 20px">
                    <img src="Images/Arrow.png" style="height: 20px; width: 60px; "/>
                </span>
                <span>
                    <asp:LinkButton ID="lbAdmin" runat="server" OnClick="lbAdmin_Click" Font-Size="XX-Large" ForeColor="DarkRed"> Login as Admin</asp:LinkButton>
                </span>
            </div>
        </div>
    </form>
</body>
</html>
