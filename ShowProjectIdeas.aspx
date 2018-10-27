<%@ Page Language="C#" MasterPageFile="~/ViewReports.master" AutoEventWireup="true" CodeFile="ShowProjectIdeas.aspx.cs" Inherits="ShowProjectIdeas" Title="FYP Portal| Project Proposed Ideas !!" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
   <ContentTemplate>
    <div align="center">
        
       <%-- <CR:CrystalReportViewer ID="CrystalReportViewer2" runat="server" 
            AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1269px" 
            ReportSourceID="CrystalReportSource2" ToolbarImagesFolderUrl="" 
            ToolPanelWidth="200px" Width="1082px" />
        <CR:CrystalReportSource ID="CrystalReportSource2" runat="server">
            <Report FileName="Reports\ProjectProposeReport.rpt">
            </Report>
        </CR:CrystalReportSource>
        <CR:CrystalReportViewer ID="FYPProposeIdeas" runat="server" AutoDataBind="true" />
    </div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>