<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="CollegeGrievanceCell.Admin.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:lightpink">
    <form id="form1" runat="server" >
        <div style="position:absolute ; top: 50%; left: 50%; transform: translate(-50%, -50%); padding: 10px; background-color: aquamarine; border: 1px solid black;">
            <div style="margin-bottom: 10px">
                <asp:HyperLink ID="LinkBack" NavigateUrl="~/Admin/AdminLogin.aspx" Width="200px" Font-Size="Larger" runat="server">< Back</asp:HyperLink>
            </div>
            <div  style="padding: 20px 0">
                <span style="padding: 0 20px">
                    <img src="../Images/Arrow.png" style="height: 25px; width: 60px;"/>
                </span>
                <span>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/PendingComplaints.aspx" Font-Size="XX-Large" ForeColor="DarkRed"> View Pending Complaints</asp:HyperLink>
                </span>
            </div>

            <div style="padding: 20px 0">
                <span style="padding: 0 20px">
                     <img src="../Images/Arrow.png" style="height: 25px; width: 60px;"/>
                </span>
                <span>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/SolvedComplaints.aspx" Font-Size="XX-Large" ForeColor="DarkRed"> View Solved Complaints</asp:HyperLink>
                </span>
            </div>

            <div style="padding: 20px 0">
                <span style="padding: 0 20px">
                    <img src="../Images/Arrow.png" style="height: 25px; width: 60px;"/>
                </span>
                <span>
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Admin/Students.aspx" Font-Size="XX-Large" ForeColor="DarkRed"> Students</asp:HyperLink>
                </span>
            </div>
            <div style="padding: 20px 0">
                <span style="padding: 0 20px">
                     <img src="../Images/Arrow.png" style="height: 25px; width: 60px;"/>
                </span>
                <span>
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Admin/HODs.aspx" Font-Size="XX-Large" ForeColor="DarkRed"> HODs</asp:HyperLink>
                </span>
            </div>

            <div style="text-align: center; margin: 20px 10px">
                <asp:Button ID="btnUpdateProfile" OnClick="btnUpdateProfile_Click" runat="server" Text="Update Profile" Width="200px" Height="40px" />
            </div>

            <div style="text-align: center; margin: 20px 10px">
                <asp:Button ID="btnLogout" OnClick="btnLogout_Click" runat="server" Text="Logout" Width="200px" Height="40px" />
            </div>
            
        </div>

    </form>
</body>
</html>
