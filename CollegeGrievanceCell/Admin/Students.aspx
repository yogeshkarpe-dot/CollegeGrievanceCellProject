<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="CollegeGrievanceCell.Admin.Students" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: lightpink; display: flex; justify-content: center; align-items: center; margin: 40px">
    <form id="form1" runat="server">
        <div style="background-color: aquamarine; width: 1300px; height: 635px; border: 1px solid black ; padding: 0 50px">
           <h1 style="text-align: center">Students List</h1>

            <div style="float: right; margin-bottom: 20px">
                <asp:Button ID="btnAddStudent" runat="server" Text="Add Student" Width="200px" Height="40px" OnClick="btnAddStudent_Click" />
            </div>
            <div style="float: left; margin-bottom: 20px">
                <asp:HyperLink ID="LinkBack" NavigateUrl="~/Admin/AdminHome.aspx" Font-Size="Larger" Width="200px" runat="server">< Back</asp:HyperLink>
            </div>

            <div style="margin-top:20px; text-align: center">
                <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" AllowPaging="True" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="RollNo" DataSourceID="SqlDataSource1" GridLines="None" PageSize="10" Width="1292px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                    <Columns>
                        <asp:BoundField DataField="RollNo" HeaderText="RollNo" ReadOnly="True" SortExpression="RollNo" />
                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                        <asp:BoundField DataField="Year" HeaderText="Year" ReadOnly="True" SortExpression="Year" />
                        <asp:BoundField DataField="Department" HeaderText="Department" ReadOnly="True" SortExpression="Department" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" ReadOnly="True" SortExpression="Mobile" />
                        <asp:TemplateField HeaderText="Edit" ControlStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEditStudent" runat="server" CommandName="EditStudent" CommandArgument='<%# Eval("RollNo") %>'>
                                        <asp:Image ID="imgEdit" runat="server" ImageUrl="~/Images/EditPencil.png" Height="25px"/>
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px"/>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" ControlStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDeleteStudent" runat="server" CommandName="DeleteStudent" CommandArgument='<%# Eval("RollNo") %>'>
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
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>" SelectCommand="SELECT [RollNo], [Name], [Year], [Department], [Mobile] FROM [Student]"></asp:SqlDataSource>
      
            </div>

            <div style="margin-top: 20px">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
