<%@ Page Title="Manage Roles" Language="C#" MasterPageFile="~/master/MasterPage.master"
    AutoEventWireup="true" CodeFile="manageRoles.aspx.cs" Inherits="aspx.manage.ManageRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/webadminfile.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="text-align: center;">
        <table cellspacing="0" cellpadding="5" class="lrbBorders">
            <tr>
                <td class="callOutStyle">
                    Search for Roles
                </td>
            </tr>
            <tr>
                <td class="bodyTextLowTopPadding" valign="middle">
                    <asp:Label ID="Category_DDLLabel" runat="server" Text="Category:"></asp:Label>
                    <asp:DropDownList ID="Category_DDL" runat="server" DataSourceID="CategorySqlDS" 
                        DataTextField="ROLE_CATEGORY_DESC" DataValueField="ROLE_CATEGORY_KEY">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="CategorySqlDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
                        SelectCommand="P_GetAllRoleCategory" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="SearchByDropDownLabel" runat="server" Text="Search by:"></asp:Label>
                    <asp:DropDownList ID="SearchByDropDown" runat="server">
                        <asp:ListItem>ROLE DESC</asp:ListItem>
                        <asp:ListItem>ROLE VALUE</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;
                    <asp:Label ID="ForLabel" runat="server" Text="for:"></asp:Label>
                    <asp:TextBox ID="FilterTextBox" runat="server"></asp:TextBox>
                    <asp:Button ID="FindButton" runat="server" Text="Find User" OnClick="FindButton_Click" />
                    <br />
                    Wildcard characters * and ? are permitted.
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:LinkButton ID="All_LinkButt" runat="server" OnClick="All_LinkButt_Click">All</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="Roles_GV" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ROLE_KEY" 
                        DataSourceID="RoleSqlDS" ForeColor="#333333">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="ROLE_KEY" HeaderText="ROLE_KEY" 
                                InsertVisible="False" ReadOnly="True" SortExpression="ROLE_KEY" />
                            <asp:BoundField DataField="ROLE_DESC" HeaderText="ROLE_DESC" 
                                SortExpression="ROLE_DESC" />
                            <asp:BoundField DataField="ROLE_VALUE" HeaderText="ROLE_VALUE" 
                                SortExpression="ROLE_VALUE" />
                            <asp:BoundField DataField="ROLE_CATEGORY_KEY" HeaderText="ROLE_CATEGORY_KEY" 
                                SortExpression="ROLE_CATEGORY_KEY" />
                            <asp:BoundField DataField="PRIORITY" HeaderText="PRIORITY" 
                                SortExpression="PRIORITY" />
                            <asp:CheckBoxField DataField="DEL_FLAG" HeaderText="DEL_FLAG" 
                                SortExpression="DEL_FLAG" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="RoleSqlDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
                        onselecting="RoleSqlDS_Selecting" SelectCommand="P_GetRolesByCategoryAndRoleValue" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Category_DDL" Name="categoryKey" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="FilterTextBox" Name="filterValue" 
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="AllRolesSqlDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
                        SelectCommand="P_GetAllRolesByCategory" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Category_DDL" Name="categoryKey" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
