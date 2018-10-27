<%@ Page Title="FYP Portal| Faculty Forgot Password" Language="C#" MasterPageFile="~/ViewReports.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
        </Triggers> 
   <ContentTemplate>
    <br /><br />
    <h2 style="margin-left:200px;">Recover Forgotten Password!!</h2>
    <p style="margin-left:200px;">Welcome to Recover Password menu! Here, you may Recover Forgotten Password via your Email Address.</p>
    <br />
    <fieldset style="width:600px;margin-left:200px;">
    <legend>Recover Forgotten Password!!</legend>
        
    <div style="margin-left:20px;">
        <br /><br />
        <asp:Label ID="Label5" runat="server" width="173px" Height="25px" Text="Email ID:*"></asp:Label>
        <asp:TextBox ID="txt_email" runat="server" BackColor="#FAF7DA" width="200px" Height="25px" placeholder="Enter Email ID!"></asp:TextBox>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_email" 
        Display="Dynamic" ForeColor="Red" ErrorMessage="* Please Enter Email ID!"></asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator 
            ID="RegularExpressionValidator2"
            runat="server" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ControlToValidate="txt_email"
            ErrorMessage="Input valid email address!">
            </asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="Label22" runat="server" width="200px" Height="20px" ForeColor="red" Font-Size="Smaller" Text="Example: hafizusamamunir@gmail.com"></asp:Label>
    </div>
    <br />
    <div align="center">
        <asp:LinkButton ID="btnSearch" runat="server" Text="&nbsp;&nbsp;Submit&nbsp;&nbsp;" 
        ForeColor="#797A80" BackColor="#FAF7DA" BorderColor="MediumSeaGreen" 
        onclick="btnSearch_Click" style="margin-left:1px;"/>
        &nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="backtologin" runat="server" CausesValidation="false" Text="&nbsp;&nbsp;Back to Login Page&nbsp;&nbsp;"
                 ForeColor="#797A80" BackColor="#FAF7DA" BorderColor="MediumSeaGreen" 
                 onclick="backtologin_Click" style="margin-left:1px;"/>
    </div>
        <br />
        <div align="center">
            <asp:Image runat="server" ID="ImagePreview" Visible="false"/>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <br />
    </fieldset>
    <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>