<%@ Page Title="" Language="C#" MasterPageFile="~/master/MasterPage.master" AutoEventWireup="true"
    CodeFile="login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="loginDiv" style="text-align: center;">
        <table border="0" cellpadding="4" cellspacing="0" style="border-collapse: collapse;
            background-color: #EFF3FB; border: Solid 1px #B5C7DE; color: #333333">
            <tr>
                <td>
                    <table border="0" cellpadding="0" width="300px">
                        <tr>
                            <td align="center" colspan="2" style="color: White; background-color: #507CD1; font-weight: bold;">
                                Log In
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="LoginControl">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginControl">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color: Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#507CD1"
                                    BorderStyle="Solid" BorderWidth="1px" CommandName="Login" ForeColor="#284E98"
                                    Text="Log In" ValidationGroup="LoginControl" onclick="LoginButton_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
