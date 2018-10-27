<%@ Page Title="FYP Portal| Project Ideas" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProjectsIdeas.aspx.cs" Inherits="ProjectsIdeas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnProjIdea" EventName="Click" />
        </Triggers> 
   <ContentTemplate>
    <h2>Project Ideas by Faculty Members!!</h2>
        <p>Here, you may View Project Ideas.</p>
        <br />
         <div align="center">

           
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
   
           <!-- <asp:LinkButton ID="btnProjIdea" runat="server" CausesValidation="false" Text="&nbsp;&nbsp;Click to View Project Ideas&nbsp;&nbsp;"
                 ForeColor="#797A80" BackColor="#FAF7DA" BorderColor="MediumSeaGreen" 
                 onclick="btnProjIdea_Click" style="margin-left:1px;"/>-->
         </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>