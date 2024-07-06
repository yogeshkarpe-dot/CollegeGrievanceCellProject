<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HODs.aspx.cs" Inherits="CollegeGrievanceCell.Admin.HODs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: lightpink; display: flex; justify-content: center; align-items: center; margin: 40px">
    <form id="form1" runat="server">
        <div style="background-color: aquamarine; width: 1300px; height: 635px; border: 1px solid black ; padding: 0 50px">
           <h1 style="text-align: center">HOD List</h1>

            <div style="float: right; margin-bottom: 20px">
                <asp:Button ID="btnAddHOD" runat="server" Text="Add HOD" Width="200px" Height="40px" OnClick="btnAddHOD_Click" />
            </div>
            <div style="float: left; margin-bottom: 20px">
                <asp:HyperLink ID="LinkBack" NavigateUrl="~/Admin/AdminHome.aspx" Font-Size="Larger" Width="200px" runat="server">< Back</asp:HyperLink>
            </div>

            <div style="margin-top:20px; text-align: center">
                <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="HODId" DataSourceID="SqlDataSource1" GridLines="None" Width="1298px">
                    <Columns>
                        <asp:BoundField DataField="HODId" HeaderText="HODId" ReadOnly="True" SortExpression="HODId" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />

                        <asp:TemplateField HeaderText="Edit" ControlStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditHOD" runat="server" CommandName="EditHOD" CommandArgument='<%# Eval("HODId") %>'>
                                        <asp:Image ID="imgEdit" runat="server" ImageUrl="~/Images/EditPencil.png" Height="25px"/>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px"/>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" ControlStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDeleteHOD" runat="server" CommandName="DeleteHOD" CommandArgument='<%# Eval("HODId") %>'>
                                        <asp:Image ID="imgDelete" runat="server" ImageUrl="~/Images/trashIcon.png" Height="25px"/>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px"/>
                            </asp:TemplateField>

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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="SELECT [HODId], [Name], [Department], [Mobile], [Email] FROM [HOD]"></asp:SqlDataSource>
            </div>

            <div style="margin-top: 20px">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
