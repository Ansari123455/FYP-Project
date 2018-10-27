<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginControl.ascx.cs" Inherits="LoginControl" %>

<asp:Menu ID="Menu1" runat="server" BackColor="#FFFBA6" style="position:absolute;left:8px; left:195px; top:185px; height: 25px; width: 279px;"
    DynamicHorizontalOffset="2" Font-Names="Tahoma" Font-Size="13px" 
    ForeColor="#990000" Orientation="Horizontal" StaticSubMenuIndent="10px">
    <StaticSelectedStyle BackColor="#FFCC66" />
    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
    <DynamicMenuStyle BackColor="#FFFBD6" />
    <DynamicSelectedStyle BackColor="#FFCC66" />
    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <StaticHoverStyle BackColor="#990000" ForeColor="White" />
    <Items>
        <asp:MenuItem NavigateUrl="Convener" Text="Convener Login!" Value="Convener Login!">
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="Advisor" Text="Advisor Login!" Value="Advisor Login!">
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="Student" Text="Student Login!" Value="Student Login!">
        </asp:MenuItem>
    </Items>
</asp:Menu>
