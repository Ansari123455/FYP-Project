<%@ Page Language="C#" MasterPageFile="~/ViewReports.master" AutoEventWireup="true" CodeFile="ViewFYPGroups.aspx.cs" Inherits="ViewFYPGroups" Title="FYP Portal| View FYP Groups!!" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
        </Triggers> 
   <ContentTemplate>
    <br /><br />
      <%-- <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
           AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" 
           ReportSourceID="CrystalReportSource2" ToolbarImagesFolderUrl="" 
           ToolPanelWidth="200px" Width="1104px" />
       <CR:CrystalReportSource ID="CrystalReportSource2" runat="server">
           <Report FileName="Reports\ViewFYPGroup.rpt">
           </Report>
       </CR:CrystalReportSource>--%>
    <h2 style="margin-left:200px;">Search FYP Group!!</h2>
    <p style="margin-left:200px;">Welcome to FYP Group menu! Here, you may Search your FYP Group via Project Title.</p>
    <br />
    <fieldset style="width:600px;margin-left:200px;">
    <legend>View FYP Group!!</legend>
        
    <div style="margin-left:20px;">
        <asp:Label ID="Label5" runat="server" width="150px" Height="25px" Text="Project Title:*"></asp:Label>
        <asp:TextBox ID="txt_title" runat="server" width="200px" Height="25px" placeholder="Enter Project Title!"></asp:TextBox>

        <ajax:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txt_title" CompletionListCssClass="AutoExtender" CompletionListItemCssClass="autocomplete_highlightedListItem" CompletionListHighlightedItemCssClass="autocomplete_completionListElement"
        MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="10" ServiceMethod="GetProjectTitle" >
        </ajax:AutoCompleteExtender>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_title" 
        Display="Dynamic" ForeColor="Red" ErrorMessage="RequiredFieldValidator">* Please Enter Project Title:!</asp:RequiredFieldValidator>
    </div>
    <br />
    <div align="center">
        <asp:Button ID="btnSearch" runat="server" Text="Search" 
        ForeColor="White" BorderColor="MediumSeaGreen" BackColor="#797A80" 
        onclick="btnSearch_Click" style="height: 26px; width:60px"/>
    </div>
        <br />
        <div align="center">
            <asp:Image runat="server" ID="ImagePreview" Visible="false"/>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <br />
    </fieldset>
    <br />
    <div align="center">
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
  <%--  <CR:CrystalReportViewer ID="FYPGroup" runat="server" 
            AutoDataBind="True" DisplayToolbar="False" GroupTreeImagesFolderUrl="" 
            Height="1202px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
            ToolPanelView="None" ToolPanelWidth="200px" Width="1104px"  />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="~\Reports\ViewFYPGroup.rpt">
            </Report>
        </CR:CrystalReportSource>--%>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>