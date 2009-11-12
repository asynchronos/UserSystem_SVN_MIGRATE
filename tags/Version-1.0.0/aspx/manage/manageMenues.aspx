<%@ Page Title="Manage Menues" Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true" CodeFile="manageMenues.aspx.cs" Inherits="aspx.manage.ManageMenues" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../css/webadminfile.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="text-align: center;">
        <table cellspacing="0" cellpadding="5" class="lrbBorders">
            <tr>
                <td class="callOutStyle">
                    Search for Menues
                </td>
            </tr>
            <tr>
                <td class="bodyTextLowTopPadding" valign="middle">
                    <asp:Label ID="Application_DDL_Label" runat="server" Text="Application:"></asp:Label>
                    <asp:DropDownList ID="Application_DDL" runat="server" 
                        DataSourceID="Application_SqlDS" DataTextField="APP_DESC"
                        DataValueField="APP_KEY" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Application_SqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                        SelectCommand="P_GetAllApplication" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="bodyTextLowTopPadding" valign="middle">
                    <asp:Label ID="Category_DDL_Label" runat="server" Text="Category:"></asp:Label>
                    <asp:DropDownList ID="Category_DDL" runat="server" DataSourceID="CategorySqlDS" DataTextField="ROLE_CATEGORY_DESC"
                        DataValueField="ROLE_CATEGORY_KEY" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="CategorySqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                        SelectCommand="P_GetRoleCategoryByAppKey" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Application_DDL" Name="appKey" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="bodyTextLowTopPadding" valign="middle">
                    <asp:Label ID="Role_DDL_Label" runat="server" Text="Role:"></asp:Label>
                    <asp:DropDownList ID="Role_DDL" runat="server" DataSourceID="RoleSqlDS" DataTextField="ROLE_DESC"
                        DataValueField="ROLE_KEY" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="RoleSqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                        SelectCommand="P_GetRoleByAppKeyAndCategory" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Application_DDL" Name="appKey" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="Category_DDL" Name="categoryKey" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="center">
                    
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="Roles_GV" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" DataKeyNames="MENU_KEY" DataSourceID="MenuSqlDS" 
                        ForeColor="#333333" AllowSorting="True">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="MENU_KEY" HeaderText="MENU_KEY"
                                ReadOnly="True" SortExpression="MENU_KEY" />
                            <asp:BoundField DataField="MENU_TITLE" HeaderText="MENU_TITLE" 
                                SortExpression="MENU_TITLE" />
                            <asp:BoundField DataField="MENU_PRIORITY" HeaderText="MENU_PRIORITY" 
                                SortExpression="MENU_PRIORITY" />
                            <asp:CheckBoxField DataField="MENU_DEL_FLAG" HeaderText="MENU_DEL_FLAG" 
                                SortExpression="MENU_DEL_FLAG" />
                            <asp:BoundField DataField="MENU_PARENT_KEY" HeaderText="MENU_PARENT_KEY" 
                                SortExpression="MENU_PARENT_KEY" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditMenu_LinkButt" runat="server" 
                                        PostBackUrl='<%# Page.ResolveUrl("~/aspx/manage/editMenu.aspx")+"?menuKey="+Eval("MENU_KEY")+"&mode=edit" %>'>Edit Menu</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="MenuSqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                        SelectCommand="P_GetMenuByRoleAndApp"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Role_DDL" Name="roleKey" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:ControlParameter ControlID="Application_DDL" Name="appKey" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:LinkButton ID="CreateNewMenu_LinkButt" runat="server" PostBackUrl="~/aspx/manage/editMenu.aspx?mode=create">Create new menu</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

