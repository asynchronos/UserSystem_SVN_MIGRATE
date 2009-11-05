<%@ Page Title="" Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true"
    CodeFile="manageUsers.aspx.cs" Inherits="aspx.manage.ManageUsers" %>

<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
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
                    Search for Users
                </td>
            </tr>
            <tr>
                <td class="bodyTextLowTopPadding" valign="middle">
                    <asp:Label ID="SearchByDropDownLabel" runat="server" Text="Search by:"></asp:Label>
                    <asp:DropDownList ID="SearchByDropDown" runat="server">
                        <asp:ListItem>EMP ID</asp:ListItem>
                        <asp:ListItem>NAME</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;
                    <asp:Label ID="ForLabel" runat="server" Text="for:"></asp:Label>
                    <asp:TextBox ID="FilterTextBox" runat="server"></asp:TextBox>
                    <asp:Button ID="FindButton" runat="server" Text="Find User" 
                        onclick="FindButton_Click" />
                    <br />
                    Wildcard characters * and ? are permitted.
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:LinkButton ID="All_LinkButt" runat="server" onclick="All_LinkButt_Click">All</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="UsersGV" runat="server" AutoGenerateColumns="False" DataSourceID="UsersSqlDS"
                        AllowPaging="True" CellPadding="4" DataKeyNames="EMP_ID" 
                        ForeColor="#333333" GridLines="None">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="EMP_ID" HeaderText="EMP_ID" ReadOnly="True" SortExpression="EMP_ID" />
                            <asp:BoundField DataField="NAME_TH" HeaderText="NAME_TH" SortExpression="NAME_TH"
                                ReadOnly="True" />
                            <asp:BoundField DataField="EXPIRE_DATE" HeaderText="EXPIRE_DATE" SortExpression="EXPIRE_DATE"
                                ReadOnly="True" />
                            <asp:CheckBoxField DataField="DEL_FLAG" HeaderText="DEL_FLAG" SortExpression="DEL_FLAG"
                                ReadOnly="True" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditUser_LinkButt" runat="server" 
                                        PostBackUrl='<%# "~/aspx/manage/editUser.aspx" + "?empId=" + Eval("EMP_ID") + "&mode=edit" %>'>Edit User</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="DelUser_LinkButt" runat="server">Delete User</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditRole_LinkButt" runat="server">Edit Role</asp:LinkButton>
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
                    <asp:SqlDataSource ID="UsersSqlDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
                        SelectCommand="P_GetUsersByEmpIdFilter" 
                        SelectCommandType="StoredProcedure" onselecting="UsersSqlDS_Selecting">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="FilterTextBox" Name="filterValue" 
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="AllUserSqlDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
                        SelectCommand="P_GetAllUsers" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:LinkButton ID="CreateNewUser_LinkButt" runat="server">Create new user</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
