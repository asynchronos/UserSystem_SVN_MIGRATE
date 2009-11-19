<%@ Page Title="Edit Menu" Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true" CodeFile="editMenu.aspx.cs" Inherits="aspx.manage.EditMenu" %>

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
                                        Menu
                                    </td>
                                </tr>
                                <tr>
                                    <td class="divDetailsWithFontSize" align="center">
                                        <div style="vertical-align: top; text-align: left;" id="MenuDiv">
                                            
                                            <asp:FormView ID="Menu_FV" runat="server" DataKeyNames="MENU_KEY" 
                                                DataSourceID="Menu_LinqDS">
                                                <EditItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                MENU_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_KEYTextBox" runat="server" Text='<%# Eval("MENU_KEY") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_TITLE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_TITLETextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_TITLE") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_URL:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_URLTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_URL") %>' />
                                                                <asp:Label ID="MENU_URL_Ex_Label" runat="server" Text="Example : ~/aspx/manage/managePage.aspx"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_POPUP_OPT:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_POPUP_OPTTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_POPUP_OPT") %>' />
                                                                <asp:Label ID="MENU_POPUP_OPT_Ex_Label" runat="server" Text="Example : width=400,height=300"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_REL:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_RELTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_REL") %>' />
                                                                <asp:Label ID="MENU_REL_Ex_Label" runat="server" Text="Example : dropAdminMenu(ãÊèã¹¡Ã³Õ·ÕèµéÍ§¡ÒÃãËéÁÕSubMenu)"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_TOOLTIP:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_TOOLTIPTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_TOOLTIP") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_PRIORITY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_PRIORITYTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_PRIORITY") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="MENU_DEL_FLAGCheckBox" runat="server" 
                                                                    Checked='<%# Bind("MENU_DEL_FLAG") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_PARENT_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="MENU_PARENT_DDL" runat="server" 
                                                                    DataSourceID="MenuParent_SqlDS" DataTextField="MENU_TITLE" 
                                                                    DataValueField="MENU_KEY" SelectedValue='<%# Eval("MENU_PARENT_KEY") %>'
                                                                    AppendDataBoundItems="true">
                                                                    
                                                                    <asp:ListItem Text="Null" Value="" Selected="True"></asp:ListItem>

                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="MenuParent_SqlDS" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
                                                                    SelectCommand="P_GetAllMenuWithoutItSelf" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="menuKey" QueryStringField="menuKey" 
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                                <asp:HiddenField ID="MENU_PARENT_HF" runat="server"
                                                                    Value='<%# Bind("MENU_PARENT_KEY") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="UpdateButton" runat="server" Text="Update"
                                                                    CausesValidation="True" CommandName="Update" onclick="UpdateButton_Click"/>
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
                                                                MENU_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_KEYTextBox" runat="server"
                                                                    Text='<%# Eval("MENU_KEY") %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_TITLE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_TITLETextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_TITLE") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_URL:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_URLTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_URL") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_POPUP_OPT:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_POPUP_OPTTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_POPUP_OPT") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_REL:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_RELTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_REL") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_TOOLTIP:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_TOOLTIPTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_TOOLTIP") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_PRIORITY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_PRIORITYTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_PRIORITY") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="MENU_DEL_FLAGCheckBox" runat="server" 
                                                                    Checked='<%# Bind("MENU_DEL_FLAG") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_PARENT_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="MENU_PARENT_DDL" runat="server" 
                                                                    DataSourceID="MenuParent_SqlDS" DataTextField="MENU_TITLE" 
                                                                    DataValueField="MENU_KEY" SelectedValue='<%# Eval("MENU_PARENT_KEY") %>'
                                                                    AppendDataBoundItems="true">
                                                                    
                                                                    <asp:ListItem Text="Null" Value="" Selected="True"></asp:ListItem>

                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="MenuParent_SqlDS" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
                                                                    SelectCommand="P_GetAllMenuWithoutItSelf" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="menuKey" QueryStringField="menuKey" 
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                                <asp:HiddenField ID="MENU_PARENT_HF" runat="server"
                                                                    Value='<%# Bind("MENU_PARENT_KEY") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="InsertButton" runat="server" Text="Insert"
                                                                    CausesValidation="True" CommandName="Insert" onclick="InsertButton_Click"/>
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
                                                                MENU_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_KEYTextBox" runat="server"
                                                                    Text='<%# Eval("MENU_KEY") %>' Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_TITLE:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_TITLETextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_TITLE") %>' Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_URL:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_URLTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_URL") %>' Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_POPUP_OPT:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_POPUP_OPTTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_POPUP_OPT") %>' Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_REL:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_RELTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_REL") %>' Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_TOOLTIP:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_TOOLTIPTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_TOOLTIP") %>' Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_PRIORITY:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="MENU_PRIORITYTextBox" runat="server" 
                                                                    Text='<%# Bind("MENU_PRIORITY") %>' Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_DEL_FLAG:
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="MENU_DEL_FLAGCheckBox" runat="server" 
                                                                    Checked='<%# Bind("MENU_DEL_FLAG") %>' Enabled="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                MENU_PARENT_KEY:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="MENU_PARENT_DDL" runat="server" 
                                                                    DataSourceID="MenuParent_SqlDS" DataTextField="MENU_TITLE" 
                                                                    DataValueField="MENU_KEY" SelectedValue='<%# Bind("MENU_PARENT_KEY") %>'
                                                                    Enabled="false" AppendDataBoundItems="true">
                                                                    
                                                                    <asp:ListItem Text="Null" Value=""></asp:ListItem>
                                                                    
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="MenuParent_SqlDS" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
                                                                    SelectCommand="P_GetAllMenuWithoutItSelf" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="menuKey" QueryStringField="menuKey" 
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Button ID="EditButton" runat="server" Text="Edit"
                                                                    CausesValidation="False" CommandName="Edit"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:LinqDataSource ID="Menu_LinqDS" runat="server" 
                                                ContextTypeName="UserSystemDataClasses.UserSystemDataClassesDataContext" 
                                                EnableInsert="True" EnableUpdate="True" TableName="TB_MENUs" 
                                                Where="MENU_KEY == @MENU_KEY" OnUpdating="Menu_LinqDS_Updating"
                                                OnInserting="Menu_LinqDS_Inserting">
                                                <WhereParameters>
                                                    <asp:QueryStringParameter Name="MENU_KEY" QueryStringField="menuKey" 
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
                                            <asp:FormView ID="Role_FV" runat="server" DataSourceID="MenuSqlDS" DataKeyNames="MENU_KEY"
                                                Width="100%">
                                                <EditItemTemplate>
                                                    <table id="Table_Roles" runat="server" align="center">
                                                        <tr id="Table_Roles_R1">
                                                            <td id="Table_Roles_R1_C1" colspan="3" align="center">
                                                                <asp:HiddenField ID="MENU_KEY_HF" runat="server" Value='<%# Eval("MENU_KEY") %>' />
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
                                                                    SelectCommand="P_GetNotSelectedRolesByMenuAndCategory" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="menuKey" QueryStringField="menuKey" Type="Int32" />
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
                                                                    SelectCommand="P_GetSelectedRoleByMenuAndCategory" SelectCommandType="StoredProcedure"
                                                                    UpdateCommand="P_UpdateSelectedRoleInMenu" UpdateCommandType="StoredProcedure" OnUpdating="DS_SelectedRole_Updating">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="menuKey" QueryStringField="menuKey" Type="Int32" />
                                                                        <asp:ControlParameter ControlID="DDL_RoleCategory" Name="categoryKey" PropertyName="SelectedValue"
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                    <UpdateParameters>
                                                                        <asp:Parameter Name="menuKey" Type="String" />
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
                                                                <asp:HiddenField ID="MENU_KEY_HF" runat="server" Value='<%# Eval("MENU_KEY") %>' />
                                                                <asp:GridView ID="RolesGV" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                    DataSourceID="RoleSqlDS" ForeColor="#333333" AllowPaging="True">
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="MENU_KEY" HeaderText="MENU_KEY" SortExpression="MENU_KEY" />
                                                                        <asp:BoundField DataField="MENU_TITLE" HeaderText="MENU_TITLE" ReadOnly="True" 
                                                                            SortExpression="MENU_TITLE" />
                                                                        <asp:BoundField DataField="MENU_URL" HeaderText="MENU_URL" ReadOnly="True" SortExpression="MENU_URL" />
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
                                                                    SelectCommand="P_SelectRoleAndCategoryByMenuKey" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="menuKey" QueryStringField="menuKey" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:SqlDataSource ID="MenuSqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                                                SelectCommand="SELECT MENU_KEY FROM [TB_MENU] WHERE (MENU_KEY = @menuKey)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="menuKey" QueryStringField="menuKey" />
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
        <asp:Button ID="Back_Butt" runat="server" Text="Back" PostBackUrl="~/aspx/manage/manageMenues.aspx" />
    </div>
</asp:Content>

