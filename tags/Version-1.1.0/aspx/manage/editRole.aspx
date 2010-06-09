<%@ Page Title="Edit Role" Language="C#" MasterPageFile="~/master/MasterPage.master"
    AutoEventWireup="true" CodeFile="editRole.aspx.cs" Inherits="aspx.manage.EditRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/webadminfile.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="text-align: center;">
        <table cellspacing="0" cellpadding="0" border="0" width="90%">
            <tbody>
                <tr align="left" valign="top">
                    <td align="left" height="100%">
                        <table cellspacing="0" cellpadding="0" width="100%">
                            <tbody>
                                <tr class="callOutStyleLowLeftPadding">
                                    <td>
                                        Role
                                    </td>
                                </tr>
                                <tr>
                                    <td class="divDetailsWithFontSize" align="center">
                                        <div style="vertical-align: top; text-align: left;" id="RoleDiv">
                                            <asp:FormView ID="Role_FV" runat="server" DataKeyNames="ROLE_KEY" 
                                                DataSourceID="Role_LinqDS">
                                                <EditItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                ROLE_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ROLE_KEYTextBox" runat="server" Text='<%# Eval("ROLE_DESC") %>'
                                                                    onfocus="this.blur();" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ROLE_DESC:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ROLE_DESCTextBox" runat="server" Text='<%# Bind("ROLE_DESC") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ROLE_VALUE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ROLE_VALUETextBox" runat="server" Text='<%# Bind("ROLE_VALUE") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ROLE_CATEGORY_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="Category_DDL" runat="server" DataSourceID="CategorySqlDS" 
                                                                    DataTextField="ROLE_CATEGORY_DESC" DataValueField="ROLE_CATEGORY_KEY" 
                                                                    SelectedValue='<%# Bind("ROLE_CATEGORY_KEY") %>'>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                PRIORITY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="PRIORITYTextBox" runat="server" Text='<%# Bind("PRIORITY") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" Checked='<%# Bind("DEL_FLAG") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                                    Text="Update" />
                                                                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                                                    CommandName="Cancel" Text="Cancel" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                ROLE_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ROLE_KEYTextBox" runat="server" Text='<%# Bind("ROLE_DESC") %>'
                                                                    onfocus="this.blur();" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ROLE_DESC:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ROLE_DESCTextBox" runat="server" Text='<%# Bind("ROLE_DESC") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ROLE_VALUE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ROLE_VALUETextBox" runat="server" Text='<%# Bind("ROLE_VALUE") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ROLE_CATEGORY_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="Category_DDL" runat="server" DataSourceID="CategorySqlDS" 
                                                                    DataTextField="ROLE_CATEGORY_DESC" DataValueField="ROLE_CATEGORY_KEY" 
                                                                    SelectedValue='<%# Bind("ROLE_CATEGORY_KEY") %>'>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                PRIORITY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="PRIORITYTextBox" runat="server" Text='<%# Bind("PRIORITY") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" Checked='<%# Bind("DEL_FLAG") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                                    Text="Insert" />
                                                                <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                                    CommandName="Cancel" Text="Cancel" onclick="InsertCancelButton_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                ROLE_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ROLE_KEYTextBox" runat="server" Text='<%# Eval("ROLE_DESC") %>'
                                                                    onfocus="this.blur();" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ROLE_DESC:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ROLE_DESCTextBox" runat="server" Text='<%# Bind("ROLE_DESC") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ROLE_VALUE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="ROLE_VALUETextBox" runat="server" Text='<%# Bind("ROLE_VALUE") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                ROLE_CATEGORY_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="Category_DDL" runat="server" DataSourceID="CategorySqlDS" 
                                                                    DataTextField="ROLE_CATEGORY_DESC" DataValueField="ROLE_CATEGORY_KEY" 
                                                                    SelectedValue='<%# Bind("ROLE_CATEGORY_KEY") %>'
                                                                    Enabled="false" >
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                PRIORITY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="PRIORITYTextBox" runat="server" Text='<%# Bind("PRIORITY") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" Checked='<%# Bind("DEL_FLAG") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="EditButton" runat="server" CausesValidation="false" CommandName="Edit"
                                                                    Text="Edit" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:LinqDataSource ID="Role_LinqDS" runat="server" 
                                                ContextTypeName="UserSystemDataClasses.UserSystemDataClassesDataContext" 
                                                EnableInsert="True" EnableUpdate="True" TableName="TB_AUTHO_ROLEs" 
                                                Where="ROLE_KEY == @ROLE_KEY" OnInserted="Role_LinqDS_Inserted">
                                                <WhereParameters>
                                                    <asp:QueryStringParameter Name="ROLE_KEY" QueryStringField="roleKey" 
                                                        Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>
                                            <asp:SqlDataSource ID="CategorySqlDS" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
                                                SelectCommand="P_GetAllRoleCategory" SelectCommandType="StoredProcedure">
                                            </asp:SqlDataSource>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div style="float:right">
        <asp:Button ID="Back_Butt" runat="server" Text="Back" PostBackUrl="~/aspx/manage/manageRoles.aspx" />
    </div>
</asp:Content>
