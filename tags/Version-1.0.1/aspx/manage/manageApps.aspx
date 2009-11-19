<%@ Page Title="Manage Application" Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true" CodeFile="manageApps.aspx.cs" Inherits="aspx.manage.ManageApps" %>

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
                    Search for Applications
                </td>
            </tr>
            <tr>
                <td class="bodyTextLowTopPadding" valign="middle">
                    <asp:Label ID="SearchByDropDownLabel" runat="server" Text="Search by:"></asp:Label>
                    <asp:DropDownList ID="SearchByDropDown" runat="server">
                        <asp:ListItem>APP KEY</asp:ListItem>
                        <asp:ListItem>APP DESC</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;
                    <asp:Label ID="ForLabel" runat="server" Text="for:"></asp:Label>
                    <asp:TextBox ID="FilterTextBox" runat="server"></asp:TextBox>
                    <asp:Button ID="FindButton" runat="server" Text="Find Application" OnClick="FindButton_Click" />
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
                    <asp:GridView ID="AppsGV" runat="server" AutoGenerateColumns="False" DataSourceID="AppsSqlDS"
                        AllowPaging="True" CellPadding="4" DataKeyNames="APP_KEY" 
                        ForeColor="#333333" AllowSorting="True">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="APP_KEY" HeaderText="APP_KEY" ReadOnly="True" 
                                SortExpression="APP_KEY" InsertVisible="False" />
                            <asp:BoundField DataField="APP_DESC" HeaderText="APP_DESC" 
                                SortExpression="APP_DESC" />
                            <asp:BoundField DataField="PRIORITY" HeaderText="PRIORITY" 
                                SortExpression="PRIORITY" />
                            <asp:CheckBoxField DataField="DEL_FLAG" HeaderText="DEL_FLAG" 
                                SortExpression="DEL_FLAG" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditApp_LinkButt" runat="server" PostBackUrl='<%# "~/aspx/manage/editApp.aspx" + "?appKey=" + Eval("APP_KEY") + "&mode=edit" %>'>Edit Application</asp:LinkButton>
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
                    <asp:SqlDataSource ID="AppsSqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                        SelectCommand="P_GetApplicationByKeyFilter" SelectCommandType="StoredProcedure" OnSelecting="AppsSqlDS_Selecting">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="FilterTextBox" Name="filterValue" PropertyName="Text"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="AllAppSqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:USERConnectionString %>"
                        SelectCommand="P_GetAllApplication" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:LinkButton ID="CreateNewApp_LinkButt" runat="server" PostBackUrl="~/aspx/manage/editApp.aspx?mode=create">Create new app</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

