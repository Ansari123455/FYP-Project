<%@ Page Title="FYP Portal| Feedback" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <Triggers>               
            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
        </Triggers>
        <ContentTemplate>
        <br />    
        <h2>Your Feedback or Complaint !!</h2>
        <p>Here, you may give us Feedback. Will you help me see how well I am doing by taking 3 – 5 minutes to give me your honest assessment? </p>
        <br />
        <div align="center">
            <asp:Image runat="server" ID="ProposalImage" Width="192" Height="161" BackColor="Transparent" ImageUrl="Images/feedback.png"/>
        </div>
        <fieldset>
        <legend>Feedback or Complaint !!</legend>
          
         <div>
            <asp:Label ID="Label1" runat="server" width="200px" Height="25px" Text="Feedback By:*"></asp:Label>
            <asp:TextBox ID="txt_feedbackby" ReadOnly="true" runat="server" width="200px" Height="25px" Text="Guest"></asp:TextBox>
         </div>
        <br />

         <div>
            <asp:Label ID="Label3" runat="server" width="200px" Height="25px" Text="Email ID:*"></asp:Label>
            <asp:TextBox ID="txt_emailid" runat="server" width="200px" Height="25px" placeholder="Enter Email ID!"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CausesValidation="false" ControlToValidate="txt_emailid" 
            Display="Dynamic" ForeColor="Red" ErrorMessage="* Please Enter Email ID!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator2"
                        runat="server" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txt_emailid"
                        ErrorMessage="Input valid email address!">
                    </asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="Label22" runat="server" width="200px" Height="20px" ForeColor="red" Font-Size="Smaller" Text="Example: hafizusamamunir@gmail.com"></asp:Label>
         </div>
        <br />  
        <div>
            <asp:Label ID="Label6" runat="server" width="200px" Height="25px" style="float:left; margin-left:4px;" Text="Subject:*"></asp:Label>
            <asp:TextBox ID="txt_sbj" runat="server" TextMode="MultiLine" placeholder="Enter Subject!"  width="200px" Height="100px"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CausesValidation="false" ControlToValidate="txt_sbj" 
            style="float:right; margin-right:22px;" Display="Dynamic" ForeColor="Red" ErrorMessage="RequiredFieldValidator">* Please Enter Subject!</asp:RequiredFieldValidator>
        </div>
        <br />              
        <div>
            <asp:Label ID="Label4" runat="server" width="200px" Height="25px" style="float:left; margin-left:4px;" Text="Feedback/Compliant Detail's:*"></asp:Label>
            <asp:TextBox ID="txt_task" runat="server" TextMode="MultiLine" placeholder="Enter Comments Detail's!" Columns="60" Rows="10"></asp:TextBox>

            <cc:HtmlEditorExtender
                id="HEE1"
                TargetControlID="txt_task"
                DisplaySourceTab="true"
                runat="server"  />
            <br /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CausesValidation="false" ControlToValidate="txt_task" 
            style="float:right; margin-right:33px;" Display="Dynamic" ForeColor="Red" ErrorMessage="RequiredFieldValidator">* Please Enter Comments Detail's!</asp:RequiredFieldValidator>
        </div>
        <br />
        <br />
        <div align="center">
                        <asp:Button ID="btnSubmit" runat="server"  Text="Submit" 
                                ForeColor="White" BorderColor="MediumSeaGreen" BackColor="#797A80" 
                                onclick="btnSubmit_Click" style="height: 26px; width:60px"/>
                          &nbsp;
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="false" Text="Clear" ForeColor="White" 
                                BorderColor="red" BackColor="#797A80" onclick="btnCancel_Click" style="height: 26px; width: 60px"/>
        </div>
        <br />
        <div align="center">
                <asp:Image runat="server" ID="ImagePreview" Visible="false"/>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <br />
        </fieldset>        
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>