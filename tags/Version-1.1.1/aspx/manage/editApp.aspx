<%@ Page Title="Edit Application" Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true" CodeFile="editApp.aspx.cs" Inherits="aspx.manage.EditApp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../css/webadminfile.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="text-align: center;">
        <table cellspacing="0" cellpadding="0" border="0" width="90%">
            <tbody>
                <tr align="left" valign="top">
                    <td align="left" height="100%">
                        <table cellspacing="0" cellpadding="0" width="100%">
                            <tbody>
                                <tr class="callOutStyleLowLeftPadding">
                                    <td>
                                        Application
                                    </td>
                                </tr>
                                <tr>
                                    <td class="divDetailsWithFontSize" align="center">
                                        <div style="vertical-align: top; text-align: left;" id="AppDiv">
                                            <asp:FormView ID="App_FV" runat="server" DataKeyNames="APP_KEY" 
                                                DataSourceID="App_LinqDS">
                                                <EditItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                APP_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="APP_KEYTextBox" runat="server"
                                                                    Text='<%# Eval("APP_KEY") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                APP_DESC:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="APP_DESCTextBox" runat="server" 
                                                                    Text='<%# Bind("APP_DESC") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                PRIORITY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="PRIORITYTextBox" runat="server" 
                                                                    Text='<%# Bind("PRIORITY") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" 
                                                                    Checked='<%# Bind("DEL_FLAG") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                                                                    CommandName="Update" Text="Update" />
                                                                <asp:Button ID="UpdateCancelButton" runat="server" 
                                                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                APP_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="APP_KEYTextBox" runat="server"
                                                                    Text='<%# Eval("APP_KEY") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                APP_DESC:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="APP_DESCTextBox" runat="server" 
                                                                    Text='<%# Bind("APP_DESC") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                PRIORITY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="PRIORITYTextBox" runat="server" 
                                                                    Text='<%# Bind("PRIORITY") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" 
                                                                    Checked='<%# Bind("DEL_FLAG") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                                                                    CommandName="Insert" Text="Insert" />
                                                                <asp:Button ID="InsertCancelButton" runat="server" 
                                                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                APP_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="APP_KEYTextBox" runat="server"
                                                                    Text='<%# Eval("APP_KEY") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                APP_DESC:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="APP_DESCTextBox" runat="server" 
                                                                    Text='<%# Bind("APP_DESC") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                PRIORITY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="PRIORITYTextBox" runat="server" 
                                                                    Text='<%# Bind("PRIORITY") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" 
                                                                    Checked='<%# Bind("DEL_FLAG") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="EditButton" runat="server" CausesValidation="False" 
                                                                    CommandName="Edit" Text="Edit" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:LinqDataSource ID="App_LinqDS" runat="server" 
                                                ContextTypeName="UserSystemDataClasses.UserSystemDataClassesDataContext" 
                                                EnableUpdate="True" TableName="TB_APPLICATIONs" Where="APP_KEY == @APP_KEY">
                                                <WhereParameters>
                                                    <asp:QueryStringParameter Name="APP_KEY" QueryStringField="appKey" 
                                                        Type="Int32" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr align="left" valign="top">
                    <td align="left" height="100%">
                        <table cellspacing="0" cellpadding="0" width="100%">
                            <tbody>
                                <tr class="callOutStyleLowLeftPadding">
                                    <td valign="top">
                                        Roles
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td height="100%" class="divDetailsWithFontSize">
                                        <div style="vertical-align: top;" id="RoleDiv">
                                            <asp:FormView ID="Role_FV" runat="server" DataSourceID="AppSqlDS" DataKeyNames="APP_KEY"
                                                Width="100%">
                                                <EditItemTemplate>
                                                    <table id="Table_Roles" runat="server" align="center">
                                                        <tr id="Table_Roles_R1">
                                                            <td id="Table_Roles_R1_C1" colspan="3" align="center">
                                                                <asp:HiddenField ID="APP_KEY_HF" runat="server" Value='<%# Eval("APP_KEY") %>' />
                                                                <asp:Button ID="Butt_SaveRole" runat="server" Text="Save" OnClick="Butt_SaveRole_Click"
                                                                    Visible="false" />
                                                                <asp:Button ID="Butt_CancelRole" runat="server" Text="Cancel" OnClick="Butt_CancelRole_Click"
                                                                    Visible="false" />
                                                                <asp:Button ID="Butt_CancelEdit" runat="server" Text="Cancel Manage Role" CommandName="Cancel" />
                                                            </td>
                                                        </tr>
                                                        <tr id="Table_Roles_R2">
                                                            <td id="Table_Roles_R2_C1" colspan="3" align="center">
                                                                <asp:Label ID="Label_RoleCategory" runat="server" Text="Role Category : "></asp:Label>
                                                                <asp:DropDownList ID="DDL_RoleCategory" runat="server" AutoPostBack="True" DataSourceID="DS_RoleCategory"
                                                                    DataTextField="ROLE_CATEGORY_DESC" DataValueField="ROLE_CATEGORY_KEY">
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="DS_RoleCategory" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                                                                    SelectCommand="P_GetAllRoleCategoryWithoutKey1" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                        <tr id="Table_Roles_R3">
                                                            <td id="Table_Roles_R3_C1">
                                                                Not Selected Role<br />
                                                                <asp:ListBox ID="ListBox_NotSelectedRole" runat="server" DataSourceID="DS_NotSelectedRole"
                                                                    DataTextField="ROLE_DESC" DataValueField="ROLE_KEY" SelectionMode="Multiple"
                                                                    Height="350px" ToolTip="Not Selected Role"></asp:ListBox>
                                                                <asp:SqlDataSource ID="DS_NotSelectedRole" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                                                                    SelectCommand="P_GetNotSelectedRolesByAppAndCategory" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="appKey" QueryStringField="appKey" Type="Int32" />
                                                                        <asp:ControlParameter ControlID="DDL_RoleCategory" Name="categoryKey" PropertyName="SelectedValue"
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                            <td id="Table_Roles_R3_C2">
                                                                <asp:Button ID="Butt_ToRight" runat="server" Text="&gt;" OnClick="Butt_ToRight_Click" />
                                                                <br />
                                                                <asp:Button ID="Butt_ToLeft" runat="server" Text="&lt;" OnClick="Butt_ToLeft_Click" />
                                                            </td>
                                                            <td id="Table_Roles_R3_C3">
                                                                Selected Role<br />
                                                                <asp:ListBox ID="ListBox_SelectedRole" runat="server" DataSourceID="DS_SelectedRole"
                                                                    DataTextField="ROLE_DESC" DataValueField="ROLE_KEY" SelectionMode="Multiple"
                                                                    Height="350px" ToolTip="Selected Role"></asp:ListBox>
                                                                <asp:SqlDataSource ID="DS_SelectedRole" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                                                                    SelectCommand="P_GetSelectedRoleByAppAndCategory" SelectCommandType="StoredProcedure"
                                                                    UpdateCommand="P_UpdateSelectedRoleInApp" UpdateCommandType="StoredProcedure" OnUpdating="DS_SelectedRole_Updating">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="appKey" QueryStringField="appKey" Type="Int32" />
                                                                        <asp:ControlParameter ControlID="DDL_RoleCategory" Name="categoryKey" PropertyName="SelectedValue"
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                    <UpdateParameters>
                                                                        <asp:Parameter Name="appKey" Type="Int32" />
                                                                        <asp:Parameter Name="roles" Type="String" />
                                                                        <asp:Parameter Name="categoryKey" Type="Int32" />
                                                                    </UpdateParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <table id="Table_Roles" runat="server" align="center">
                                                        <tr>
                                                            <td align="center">
                                                                <asp:Button ID="Butt_EditRole" runat="server" Text="Edit Role" CommandName="Edit" />
                                                                <asp:HiddenField ID="APP_KEY_HF" runat="server" Value='<%# Eval("APP_KEY") %>' />
                                                                <asp:GridView ID="RolesGV" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                    DataSourceID="RoleSqlDS" ForeColor="#333333" AllowPaging="True">
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="APP_KEY" HeaderText="APP_KEY" 
                                                                            SortExpression="APP_KEY" InsertVisible="False" ReadOnly="True" />
                                                                        <asp:BoundField DataField="APP_DESC" HeaderText="APP_DESC" 
                                                                            SortExpression="APP_DESC" />
                                                                        <asp:BoundField DataField="ROLE_KEY" HeaderText="ROLE_KEY" ReadOnly="True" 
                                                                            SortExpression="ROLE_KEY" InsertVisible="False" />
                                                                        <asp:BoundField DataField="ROLE_DESC" HeaderText="ROLE_DESC" 
                                                                            SortExpression="ROLE_DESC" />
                                                                        <asp:BoundField DataField="ROLE_CATEGORY_KEY" HeaderText="ROLE_CATEGORY_KEY" 
                                                                            SortExpression="ROLE_CATEGORY_KEY" InsertVisible="False" ReadOnly="True" />
                                                                        <asp:BoundField DataField="ROLE_CATEGORY_DESC" HeaderText="ROLE_CATEGORY_DESC" 
                                                                            SortExpression="ROLE_CATEGORY_DESC" />
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditRowStyle BackColor="#2461BF" />
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="RoleSqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                                                                    SelectCommand="P_SelectRoleAndCategoryByAppKey" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="appKey" QueryStringField="appKey" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:SqlDataSource ID="AppSqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                                                SelectCommand="SELECT APP_KEY FROM TB_APPLICATION WHERE (APP_KEY = @appKey)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="appKey" QueryStringField="appKey" />
                                                </SelectParameters>
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
        <asp:Button ID="Back_Butt" runat="server" Text="Back" PostBackUrl="~/aspx/manage/manageApps.aspx" />
    </div>
</asp:Content>

