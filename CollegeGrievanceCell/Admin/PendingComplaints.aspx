<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PendingComplaints.aspx.cs" Inherits="CollegeGrievanceCell.Admin.PendingComplaints" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: lightpink; display: flex; justify-content: center; align-items: center; margin: 40px">
    <form id="form1" runat="server">
        <div style="background-color: aquamarine; width: 1300px; height: 635px; border: 1px solid black ; padding: 0 50px">
           <h1 style="text-align: center">Pending Complaints</h1>

            <div style="float: left; margin-bottom: 20px">
                <asp:HyperLink ID="LinkBack" Font-Size="Larger" Width="200px" runat="server">< Back</asp:HyperLink>
            </div>

            <div style="margin-top:20px">
                <asp:GridView ID="GridView1" runat="server" Width="1293px" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="ComplaintId" DataSourceID="SqlDataSource1" GridLines="None" PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="ComplaintId" HeaderText="ComplaintId" InsertVisible="False" ReadOnly="true" SortExpression="ComplaintId" />
                        <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="ComplaintDate" DataFormatString="{0:d}" HeaderText="ComplaintDate" SortExpression="ComplaintDate" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>      
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="SELECT * FROM [Complaints] WHERE Status='Pending' ORDER BY ComplaintDate DESC"></asp:SqlDataSource>
            </div>
            <div style="margin-top: 20px; float: right; padding:10px">
                <asp:TextBox ID="txtInput" Width="100px" Height="30px" ToolTip="Enter ComplaintId" Visible="false" runat="server"></asp:TextBox>
                <asp:Button ID="btnSolve" runat="server" Width="200px" Height="40px" Text="Solve Complaint" OnClick="btnSolve_Click" Visible="false"/>
            </div>

            <div style="margin-top: 20px">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
