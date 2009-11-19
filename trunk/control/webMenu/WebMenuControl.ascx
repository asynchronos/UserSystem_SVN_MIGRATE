<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebMenuControl.ascx.cs" Inherits="control.webMenu.WebMenuControl" %>

<div class="chromestyle" id="chromemenu">
    <ul>
        <asp:Literal ID="Literal_MM" runat="server" EnableViewState="true"></asp:Literal>
        <li id="LoginStatusMenu" runat="server" style="white-space: nowrap;">
            <asp:LoginStatus ID="LoginStatus" runat="server" 
                LogoutAction="RedirectToLoginPage" onloggingout="LoginStatus_LoggingOut" />
        </li>
    </ul>
</div>
<asp:SqlDataSource ID="SqlDS_Menu" runat="server" 
    ConnectionString="<%$ ConnectionStrings:USERConnectionString %>" 
    SelectCommand="P_GetMenuByRolesAndAppName" onselecting="SqlDS_Menu_Selecting" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="roles" Type="String" />
        <asp:Parameter Name="delimeter" Type="String" />
        <asp:Parameter Name="appName" Type="String" DefaultValue="USER_SYSTEM" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:Literal ID="Literal_MS" runat="server" EnableViewState="true"></asp:Literal>