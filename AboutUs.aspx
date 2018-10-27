<%@ Page Title="FYP Portal| AboutUs" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>
    <h1>Why FYPSS ??</h1>
        <h2>Introduction !</h2>
        <br />
         <div>
         <p>
            &nbsp; &nbsp; &nbsp;
                Providing the facility to the <b>Convener, Advisor, Final year student and General user (Guests)</b>. In which student can select the final year project or thesis online, advisor can assign the task and evaluate them and convener can make announcements.
         </p>
         <br />
        <h2>Problem Identification !</h2>
        <br />
         <p>
            <b>Problem to cause failure in project:</b>
            <br />
            &nbsp; &nbsp; &nbsp;
            Sometimes, <b><i>students blame</i></b> advisor for not being cooperative and helpful <b><i>and vice versa</i></b>.
            <br />
            <br />
           <b>Unaware on latest update:</b>
            <br />
            &nbsp; &nbsp; &nbsp;
            Students are not aware on the latest updated information.
            <br />
            <br />
            <b>Compilation:</b>
            <br />
            &nbsp; &nbsp; &nbsp;
            They are facing troublesome and inconvenient in compilation. For examples, advisors need to collect all undertaking letters from students in order to make sure every student is undertaken by one advisor.
         </p>
         <br />
         
         </div>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>