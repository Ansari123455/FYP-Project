<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" Title="FYP Portal| Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="news-wrapper" id="vscroller">
    </div>
   
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>
    <h1>Welcome to Final Year Project Supervision System !!</h1>
        <h2>Introduction !</h2>
        <br />
         <div>
         <p>
            &nbsp; &nbsp; &nbsp;
            This project is going to develop a computerize system that Automate the whole process of final year project conduction. Current system that used in processing FYP is a manual process which means all processes include <b>compilation, calculation, data filing, data storage</b> and etc are done by human in manual way. Therefore, a system that can reduce <b>human workloads</b> shall be developed in this project. Target users of this system are all academic staffs include <b>FYP committees, convener, advisors and final year students</b>.
         </p>
         <br />
        <h2>Background !</h2>
        <br />
         <p>
            &nbsp; &nbsp; &nbsp;
            The existing system doesn’t have all the features that a project management system should have. 
            So there was a need to develop a new system which should be highly customizable and 
            understandable in order to provide user the facility to extend the functionality and should meet 
            all the requirements. 
         </p>
         <br />
         <p>
            So, <b>FYPSS</b> is developed keeping in mind all the needs and future advancements so that a 
            distinction can be made between the existing and the new system.
         </p>
         <br />
         <h2>System User | User Hierarchy!</h2>
         <br />
         <p>
            &nbsp; &nbsp; &nbsp;
            The categories of end-user who will interact with the <b><i>Final Year Project Supervision System (FYPSS)</i></b> web application
         </p>
         <br />
         <asp:Image runat="server" ID="ImageUsers" BackColor="Transparent" Width="600" Height="300" ImageUrl="~/Images/users.png"/>
         </div>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>