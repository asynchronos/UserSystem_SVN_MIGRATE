<%@ Page Title="" Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true"
    CodeFile="editUser.aspx.cs" Inherits="aspx.manage.EditUser" Culture="th-TH" UICulture="th-TH" %>

<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/webadminfile.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        EnableScriptGlobalization="True">
    </asp:ScriptManager>
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
                                        User
                                    </td>
                                </tr>
                                <tr>
                                    <td class="userDetailsWithFontSize" align="center">
                                        <div style="vertical-align: top;text-align:left;" id="UserDiv">
                                            <asp:FormView ID="User_FV" runat="server" DataKeyNames="EMP_ID" 
                                                DataSourceID="User_LinqDS">
                                                <EditItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                EMP_ID:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_IDTextBox" runat="server" Text='<%# Bind("EMP_ID") %>' Enabled="false" />
                                                            </td>
                                                            <td>
                                                                DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" Checked='<%# Bind("DEL_FLAG") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                EMP_TITLE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_TITLETextBox" runat="server" Text='<%# Bind("EMP_TITLE") %>' />
                                                            </td>
                                                            <td>
                                                                EMP_TITLE_E:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_TITLE_ETextBox" runat="server" Text='<%# Bind("EMP_TITLE_E") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                EMP_NAME:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_NAMETextBox" runat="server" Text='<%# Bind("EMP_NAME") %>' />
                                                            </td>
                                                            <td>
                                                                EMP_NAME_E:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_NAME_ETextBox" runat="server" Text='<%# Bind("EMP_NAME_E") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                EMP_SURNAME:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_SURNAMETextBox" runat="server" Text='<%# Bind("EMP_SURNAME") %>' />
                                                            </td>
                                                            <td>
                                                                EMP_SURNAME_E:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_SURNAME_ETextBox" runat="server" Text='<%# Bind("EMP_SURNAME_E") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                PASSWD:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="PASSWDTextBox" runat="server" Text='<%# Bind("PASSWD") %>' />
                                                            </td>
                                                            <td>
                                                                EMAIL:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                CREATE_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="CREATE_DATETextBox" runat="server" Text='<%# Eval("CREATE_DATE", "{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                            <td>
                                                                EXPIRE_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EXPIRE_DATETextBox" runat="server" Text='<%# Bind("EXPIRE_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>' />
                                                                <cc1:CalendarExtender ID="EXPIRE_DATETextBox_CalendarExtender" runat="server" Enabled="True"
                                                                    Format="dd/MM/yyyy HH:mm:ss" PopupButtonID="EXPIRE_DATEImage" TargetControlID="EXPIRE_DATETextBox">
                                                                </cc1:CalendarExtender>
                                                                <asp:Image ID="EXPIRE_DATEImage" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                LAST_SIGN_ON_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="LAST_SIGN_ON_DATETextBox" runat="server" Text='<%# Eval("LAST_SIGN_ON_DATE", "{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                            <td>
                                                                LAST_CHANGE_PASS_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="LAST_CHANGE_PASS_DATETextBox" runat="server" Text='<%# Bind("LAST_CHANGE_PASS_DATE", "{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                UPDATE_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="UPDATE_DATETextBox" runat="server" Text='<%# Bind("UPDATE_DATE", "{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <asp:Button ID="UpdateButton" runat="server" Text="Update"
                                                                    CausesValidation="True" CommandName="Update"/>
                                                                <asp:Button ID="UpdateCancelButton" runat="server" Text="Cancel"
                                                                    CausesValidation="False" CommandName="Cancel"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                EMP_ID:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_IDTextBox" runat="server" Text='<%# Bind("EMP_ID") %>' />
                                                            </td>
                                                            <td>
                                                                DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" Checked='<%# Bind("DEL_FLAG") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                EMP_TITLE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_TITLETextBox" runat="server" Text='<%# Bind("EMP_TITLE") %>' />
                                                            </td>
                                                            <td>
                                                                EMP_TITLE_E:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_TITLE_ETextBox" runat="server" Text='<%# Bind("EMP_TITLE_E") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                EMP_NAME:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_NAMETextBox" runat="server" Text='<%# Bind("EMP_NAME") %>' />
                                                            </td>
                                                            <td>
                                                                EMP_NAME_E:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_NAME_ETextBox" runat="server" Text='<%# Bind("EMP_NAME_E") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                EMP_SURNAME:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_SURNAMETextBox" runat="server" Text='<%# Bind("EMP_SURNAME") %>' />
                                                            </td>
                                                            <td>
                                                                EMP_SURNAME_E:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_SURNAME_ETextBox" runat="server" Text='<%# Bind("EMP_SURNAME_E") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                PASSWD:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="PASSWDTextBox" runat="server" Text='<%# Bind("PASSWD") %>' />
                                                            </td>
                                                            <td>
                                                                EMAIL:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                CREATE_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="CREATE_DATETextBox" runat="server" Text='<%# Bind("CREATE_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                            <td>
                                                                EXPIRE_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EXPIRE_DATETextBox" runat="server" Text='<%# Bind("EXPIRE_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>' />
                                                                <cc1:CalendarExtender ID="EXPIRE_DATETextBox_CalendarExtender" runat="server" Enabled="True"
                                                                    Format="dd/MM/yyyy HH:mm:ss" PopupButtonID="EXPIRE_DATEImage" TargetControlID="EXPIRE_DATETextBox">
                                                                </cc1:CalendarExtender>
                                                                <asp:Image ID="EXPIRE_DATEImage" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                LAST_SIGN_ON_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="LAST_SIGN_ON_DATETextBox" runat="server" Text='<%# Bind("LAST_SIGN_ON_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                            <td>
                                                                LAST_CHANGE_PASS_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="LAST_CHANGE_PASS_DATETextBox" runat="server" Text='<%# Bind("LAST_CHANGE_PASS_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                UPDATE_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="UPDATE_DATETextBox" runat="server" Text='<%# Bind("UPDATE_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <asp:Button ID="InsertButton" runat="server" Text="Insert"
                                                                    CausesValidation="True" CommandName="Insert"/>
                                                                <asp:Button ID="InsertCancelButton" runat="server" Text="Cancel"
                                                                    CausesValidation="False" CommandName="Cancel"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                EMP_ID:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_IDTextBox" runat="server" Text='<%# Bind("EMP_ID") %>' Enabled="false" />
                                                            </td>
                                                            <td>
                                                                DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" Checked='<%# Bind("DEL_FLAG") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                EMP_TITLE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_TITLETextBox" runat="server" Text='<%# Bind("EMP_TITLE") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                EMP_TITLE_E:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_TITLE_ETextBox" runat="server" Text='<%# Bind("EMP_TITLE_E") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                EMP_NAME:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_NAMETextBox" runat="server" Text='<%# Bind("EMP_NAME") %>' Enabled="false" />
                                                            </td>
                                                            <td>
                                                                EMP_NAME_E:
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                EMP_SURNAME:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_SURNAMETextBox" runat="server" Text='<%# Bind("EMP_SURNAME") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                EMP_SURNAME_E:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMP_SURNAME_ETextBox" runat="server" Text='<%# Bind("EMP_SURNAME_E") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                PASSWD:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="PASSWDTextBox" runat="server" Text='<%# Bind("PASSWD") %>' Enabled="false" />
                                                            </td>
                                                            <td>
                                                                EMAIL:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                CREATE_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="CREATE_DATETextBox" runat="server" Text='<%# Bind("CREATE_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                            <td>
                                                                EXPIRE_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="EXPIRE_DATETextBox" runat="server" Text='<%# Bind("EXPIRE_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                LAST_SIGN_ON_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="LAST_SIGN_ON_DATETextBox" runat="server" Text='<%# Bind("LAST_SIGN_ON_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                            <td>
                                                                LAST_CHANGE_PASS_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="LAST_CHANGE_PASS_DATETextBox" runat="server" Text='<%# Bind("LAST_CHANGE_PASS_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                UPDATE_DATE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="UPDATE_DATETextBox" runat="server" Text='<%# Bind("UPDATE_DATE","{0:dd/MM/yyyy HH:mm:ss}") %>'
                                                                    Enabled="False" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <asp:Button ID="EditButton" runat="server" Text="Edit"
                                                                    CausesValidation="False" CommandName="Edit"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:LinqDataSource ID="User_LinqDS" runat="server" ContextTypeName="UserSystemDataClasses.UserSystemDataClassesDataContext"
                                                TableName="TB_AUTHO_USERs" EnableInsert="True" EnableUpdate="True"
                                                Where="EMP_ID == @EMP_ID"
                                                OnInserting="User_LinqDS_Inserting" OnInserted="User_LinqDS_Inserted" 
                                                OnUpdating="User_LinqDS_Updating">
                                                <WhereParameters>
                                                    <asp:QueryStringParameter Name="EMP_ID" QueryStringField="empId" Type="String" />
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
                                    <td height="100%" class="userDetailsWithFontSize">
                                        <div style="vertical-align: top;" id="RoleDiv">
                                            <asp:FormView ID="Role_FV" runat="server" DataSourceID="EmpSqlDS" DataKeyNames="EMP_ID"
                                                Width="100%">
                                                <EditItemTemplate>
                                                    <table id="Table_Roles" runat="server" align="center">
                                                        <tr id="Table_Roles_R1">
                                                            <td id="Table_Roles_R1_C1" colspan="3" align="center">
                                                                <asp:HiddenField ID="EMP_ID_HF" runat="server" Value='<%# Eval("EMP_ID") %>' />
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
                                                                    SelectCommand="P_GetAllRoleCategory" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                        <tr id="Table_Roles_R3">
                                                            <td id="Table_Roles_R3_C1">
                                                                Not Selected Role<br />
                                                                <asp:ListBox ID="ListBox_NotSelectedRole" runat="server" DataSourceID="DS_NotSelectedRole"
                                                                    DataTextField="ROLE_DESC" DataValueField="ROLE_KEY" SelectionMode="Multiple"
                                                                    Height="350px" ToolTip="Not Selected Role"></asp:ListBox>
                                                                <asp:SqlDataSource ID="DS_NotSelectedRole" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                                                                    SelectCommand="P_GetNotSelectedRolesByEmpAndCategory" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="empId" QueryStringField="empId" Type="String" />
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
                                                                    SelectCommand="P_GetSelectedRoleByEmpAndCategory" SelectCommandType="StoredProcedure"
                                                                    UpdateCommand="P_UpdateSelectedRoleInEmp" UpdateCommandType="StoredProcedure" OnUpdating="DS_SelectedRole_Updating">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="empId" QueryStringField="empId" Type="String" />
                                                                        <asp:ControlParameter ControlID="DDL_RoleCategory" Name="categoryKey" PropertyName="SelectedValue"
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                    <UpdateParameters>
                                                                        <asp:Parameter Name="empId" Type="String" />
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
                                                                <asp:HiddenField ID="EMP_ID_HF" runat="server" Value='<%# Eval("EMP_ID") %>' />
                                                                <asp:GridView ID="UserRolesGV" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                    DataSourceID="RoleSqlDS" ForeColor="#333333" AllowPaging="True">
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="EMP_ID" HeaderText="EMP_ID" SortExpression="EMP_ID" />
                                                                        <asp:BoundField DataField="EMP_NAME" HeaderText="EMP_NAME" ReadOnly="True" SortExpression="EMP_NAME" />
                                                                        <asp:BoundField DataField="EMP_NAME_E" HeaderText="EMP_NAME_E" ReadOnly="True" SortExpression="EMP_NAME_E" />
                                                                        <asp:BoundField DataField="ROLE_KEY" HeaderText="ROLE_KEY" InsertVisible="False"
                                                                            ReadOnly="True" SortExpression="ROLE_KEY" />
                                                                        <asp:BoundField DataField="ROLE_DESC" HeaderText="ROLE_DESC" SortExpression="ROLE_DESC" />
                                                                        <asp:BoundField DataField="ROLE_CATEGORY_KEY" HeaderText="ROLE_CATEGORY_KEY" InsertVisible="False"
                                                                            ReadOnly="True" SortExpression="ROLE_CATEGORY_KEY" />
                                                                        <asp:BoundField DataField="ROLE_CATEGORY_DESC" HeaderText="ROLE_CATEGORY_DESC" SortExpression="ROLE_CATEGORY_DESC" />
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditRowStyle BackColor="#2461BF" />
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="RoleSqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                                                                    SelectCommand="P_SelectRoleAndCategoryByEmpId" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="empId" QueryStringField="empId" Type="String" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:SqlDataSource ID="EmpSqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                                                SelectCommand="SELECT EMP_ID FROM TB_AUTHO_USER WHERE (EMP_ID = @empId)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="empId" QueryStringField="empId" />
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
        <asp:Button ID="Back_Butt" runat="server" Text="Back" PostBackUrl="~/aspx/manage/manageUsers.aspx" />
    </div>
</asp:Content>
