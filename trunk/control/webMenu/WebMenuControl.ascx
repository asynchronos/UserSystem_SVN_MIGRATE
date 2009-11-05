<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebMenuControl.ascx.cs" Inherits="control.webMenu.WebMenuControl" %>

<div class="chromestyle" id="chromemenu">
    <ul>
        <asp:Literal ID="Literal_MM" runat="server" EnableViewState="false"></asp:Literal>
        <li id="LoginStatusMenu" runat="server" style="white-space: nowrap;">
            <asp:LoginStatus ID="LoginStatus" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/aspx/loginOut/logout.aspx" />
        </li>
    </ul>
</div>
<asp:SqlDataSource ID="SqlDS_Menu" runat="server" 
    ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
    SelectCommand="P_GetMenuByRoles" onselecting="SqlDS_Menu_Selecting" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="roles" Type="String" />
        <asp:Parameter Name="delimeter" Type="String" />
        <asp:Parameter Name="appName" Type="String" DefaultValue="USER_SYSTEM" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:Literal ID="Literal_MS" runat="server" EnableViewState="false"></asp:Literal>