<%@ Page Title="FYP Portal| Registration" Language="C#" MasterPageFile="~/ViewReports.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<%@ Register src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPrefix="UserControlImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div >
        <center>           
           
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnSubmitStd" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnCancelStd" EventName="Click" />
               <asp:PostBackTrigger ControlID="ddreg" />
               </Triggers>
                <ContentTemplate>
                   <br />
                    <h2>Registration Menu!!</h2>
                    <p>Welcome to Registration menu! Here, you may Sign Up to become a member of Final Year Project Supervision System.</p>
                    <br />
                        <asp:Label ID="Label5" runat="server" width="250px" Height="25px" ForeColor="Green" Text="Select Your Type of Registration:*"></asp:Label>
                        <asp:DropDownList ID="ddreg" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="ddreg_SelectedIndexChanged">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Faculty Registration Form</asp:ListItem>
                            <asp:ListItem>Student Registration Form</asp:ListItem>                             
                                </asp:DropDownList>
                    <br />
                  <fieldset id="field" visible="false" runat="server">
                  <br />
                    <table style="border: thin solid #5D7B9D; background-color: Window; width: 500px; ">
                        <tr>
                        <td colspan="6" align="center" style="background-color:#C1312F" >
                            <b style="color:White">&nbsp;Faculty Registration Form </b>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td >User Name:*</td>
                        <td><asp:TextBox ID="txtName" runat="server" placeholder="Enter UserName"></asp:TextBox></td>
                        <td>

                        </td>
                        <td colspan="3" rowspan="4">
                            <UserControlImage:BrowseImage ID="BrowseImage1" runat="server" />
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3">
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*User Name is Required" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                            <td >Designation:*</td>
                            <td><asp:TextBox ID="txt_Des" runat="server" placeholder="Enter Designation"></asp:TextBox></td>
                        <td>
                        
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Designation is Required" ControlToValidate="txt_Des" ></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td >Education:*</td>
                        <td><asp:TextBox ID="txt_edu" runat="server" placeholder="Enter Education"></asp:TextBox>
                        </td>
                        <td>
                        </td> 
                        <td>Gender:*</td>                       
                        <td align="left">
                            <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ControlToValidate="ddlGender" ></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3">
                            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="*Education Field is Required" ControlToValidate="txt_edu" ></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td>
                        Email ID:*
                        </td>
                        <td><asp:TextBox ID="txt_emailFac" runat="server" placeholder="Enter Email ID"></asp:TextBox>          
                        </td>
                        <td>
                       <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ErrorMessage="*" ControlToValidate="txt_emailFac" ></asp:RequiredFieldValidator>
                        </td>

                        <td>Type:*</td>                       
                        <td align="left">
                            <asp:DropDownList ID="dd_type" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Convener</asp:ListItem>
                            <asp:ListItem>Committee Member</asp:ListItem>                             
                            <asp:ListItem>Non-Committee Member</asp:ListItem>                            
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Required" ControlToValidate="dd_type" ></asp:RequiredFieldValidator>
                        </td>

                        </tr>
                        <tr>
                            <td colspan="3">
                            <asp:RegularExpressionValidator 
                                ID="RegularExpressionValidator2"
                                runat="server" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txt_emailFac"
                                ErrorMessage="Input valid email address!">
                            </asp:RegularExpressionValidator>
                            </td>
                            
                        </tr>
                        
                        
                        <tr>
                            <td>
                                Contact No.:*</td>
                            <td>
                                <asp:TextBox ID="txt_ph_no" runat="server" placeholder="Enter Phone No."></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvagency" runat="server" 
                                    ControlToValidate="txt_ph_no" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td colspan="3">
                                        <asp:Label ID="Label21" runat="server" width="200px" Height="20px" ForeColor="red" Font-Size="Small" Text="Example: 333-6755600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator3"
                                    runat="server" 
                                    ErrorMessage="Input valid mobile number!"
                                    ValidationExpression="^(?:\+?92[-. ]?)?\(?([0-9]{3})\)?[-. ]?([0-9]{7})$"
                                    ValidationGroup="mobile"
                                    ControlToValidate="txt_ph_no">
                                </asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        
                        
                        <tr>
                        <td>
                        Password:*
                        </td>
                        <td><asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox></td>
                        <td>
                        </td>
                            <td align="left">Confirm Password:*</td>
                            <td align="left">
                            <asp:TextBox ID="txt_confirm" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                        <td colspan="3">
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                    ControlToValidate="txtPass" ErrorMessage="*Password Field is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td colspan="3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txt_confirm" ErrorMessage="*Confirm Password Field is Required"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        
                        
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td colspan="3">
                            &nbsp;</td>
                        <td colspan="3">
                         <asp:Button ID="btnSubmit" runat="server"  Text="SignUp" Width="60" Height="26"
                                ForeColor="White" BorderColor="MediumSeaGreen" BackColor="#797A80" 
                                onclick="btnSubmit_Click" />
                          &nbsp;
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="false" Text="Cancel" ForeColor="White" 
                               Width="60" Height="26" BorderColor="red" BackColor="#797A80" onclick="btnCancel_Click" />
                        </td>
                        </tr>
                         
                        <tr>
                        <td colspan="6" style="background-color:#C1312F"></td>
                        </tr>
                        
               
                        </table>
                      <br />
                      <asp:Image runat="server" ID="ImagePreview1" Visible="false"/>
                      <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                      <br />
                    </fieldset>

                    <br />

                    <fieldset id="Fieldset1" visible="false" runat="server">
                    <br />
                    <table style="border: thin solid #5D7B9D; background-color: Window; width: 500px; ">
                        <tr>
                        <td colspan="6" align="center" style="background-color:#C1312F" >
                            <b style="color:White">&nbsp;Student Registration Form </b>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td >UserName:*</td>
                        <td><asp:TextBox ID="txt_name" runat="server" placeholder="Enter UserName"></asp:TextBox></td>
                        <td>

                        </td>
                        <td colspan="3" rowspan="4">
                            <UserControlImage:BrowseImage ID="BrowseImage2" runat="server" />
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*User Name is Required" ControlToValidate="txt_name" ></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                            <td >Season:*</td>
                            <td>
                            
                            <asp:DropDownList ID="dd_season" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                            <asp:ListItem>S</asp:ListItem>
                            </asp:DropDownList>

                            </td>
                        <td>
                        
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Season Field is Required" ControlToValidate="dd_season" ></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td >Year:*</td>
                        <td>
                          <!--  <asp:DropDownList ID="dd_year" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            </asp:DropDownList> -->
                        <asp:TextBox ID="ddd_year" runat="server" Text="" maxlength="4"></asp:TextBox>    
                        </td>
                        <td>

                        </td> 
                        <td>Program:*</td>                       
                        <td align="left">
                            <asp:DropDownList ID="dd_prog" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>BBA</asp:ListItem>
                            <asp:ListItem>BSIT</asp:ListItem>
                            <asp:ListItem>BSCS</asp:ListItem>
                           <asp:ListItem>MBA</asp:ListItem>
                            <asp:ListItem>MCS</asp:ListItem>
                            <asp:ListItem>MSMATH</asp:ListItem>
                            <asp:ListItem>MSPHY</asp:ListItem>
                            
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required" ControlToValidate="dd_prog"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Year Field is Required" ControlToValidate="ddd_year"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="ddd_year" validationexpression="\d+" ErrorMessage="Enter Numeric Only" />
                        </td>
                        </tr>

                        <tr>
                        <td>
                        Reg ID:*
                        </td>
                        <td>
                        <asp:TextBox ID="txt_id" runat="server" Text="" maxlength="20"></asp:TextBox>          
                        </td>
                        <td>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txt_id" ></asp:RequiredFieldValidator>
                        </td>

                        <td>CGPA:*</td>                       
                        <td align="left">
                             <asp:TextBox ID="txt_cgpa" runat="server" placeholder="Enter CGPA!"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="txt_cgpa" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator 
                                ID="RegularExpressionValidator6"
                                runat="server" 
                                ErrorMessage="Please enter correct CGPA!"
                                ValidationExpression="^\(?([2-3]{1}.)\)?([0-9]{2})$"
                                ValidationGroup="mobile"
                                ControlToValidate="txt_cgpa"
                                >
                            </asp:RegularExpressionValidator>
                        </td>
                        </tr>

                        <tr>
                            <td colspan="3">
                                <asp:RegularExpressionValidator ID="IntValidatorOrderSalesRecordNumber" runat="server" ValidationGroup="1"
                                    ErrorMessage="Numeric Values Only!" SetFocusOnError="True" ValidationExpression="(\d+)" ControlToValidate="txt_id"
                                    Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="Label2" runat="server" width="200px" Height="20px" ForeColor="red" Font-Size="Small" Text="Example: 3.20"></asp:Label>
                            </td>
                            <td align="left" valign="middle">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>

                        <tr>
                        <td>
                        Email ID:*
                        </td>
                        <td><asp:TextBox ID="txt_email" runat="server" placeholder="Enter Email"></asp:TextBox>          
                        </td>
                        <td>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txt_email" ></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            Gender:*
                        </td>
                        <td valign="middle" align="left">
                            <asp:DropDownList ID="dd_gender" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>                            
                            </asp:DropDownList> &nbsp;

                            </td>
                        <td>
                        
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Required" ControlToValidate="dd_gender" ></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                            <asp:RegularExpressionValidator 
                                ID="RegularExpressionValidator1"
                                runat="server" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txt_email"
                                ErrorMessage="Input valid email address!">
                            </asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td align="left" valign="middle">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                                Cell No.:*</td>
                            <td>
                                <asp:TextBox ID="txt_no" runat="server" placeholder="Enter Phone No."></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="txt_no" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td colspan="3">
                                        <asp:Label ID="Label1" runat="server" width="200px" Height="20px" ForeColor="red" Font-Size="Small" Text="Example: 333-6755600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:RegularExpressionValidator 
                                    ID="RegularExpressionValidator4"
                                    runat="server" 
                                    ErrorMessage="Input valid mobile number!"
                                    ValidationExpression="^(?:\+?92[-. ]?)?\(?([0-9]{3})\)?[-. ]?([0-9]{7})$"
                                    ValidationGroup="mobile"
                                    ControlToValidate="txt_no">
                                </asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        
                        
                        <tr>
                        <td>
                        Password:*
                        </td>
                        <td><asp:TextBox ID="txt_pass" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox></td>
                        <td>
                        </td>
                            <td align="left">Confirm Password:*</td>
                            <td align="left">
                            <asp:TextBox ID="txt_cpass" runat="server" TextMode="Password" placeholder="Confirm Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                        <td colspan="3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="txt_pass" ErrorMessage="*Password Field is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td colspan="3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                    ControlToValidate="txt_cpass" ErrorMessage="*Confirm Password Field is Required"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        
                        
                        <tr>
                        <td colspan="6"></td>
                        </tr>
                        <tr>
                        <td colspan="3">
                            &nbsp;</td>
                        <td colspan="3">
                         <asp:Button ID="btnSubmitStd" runat="server"  Text="SignUp" Width="60" Height="26"
                                ForeColor="White" BorderColor="MediumSeaGreen" BackColor="#797A80" 
                                onclick="btnSubmitStd_Click" />
                          &nbsp;
                        <asp:Button ID="btnCancelStd" runat="server" CausesValidation="false" Text="Cancel" ForeColor="White" 
                               Width="60" Height="26" BorderColor="red" BackColor="#797A80" onclick="btnCancelStd_Click" />
                        </td>
                        </tr>
                         
                        <tr>
                        <td colspan="6" style="background-color:#C1312F"></td>
                        </tr>
                        
               
                        </table>
                    <br />
                    <asp:Image runat="server" ID="ImagePreview" Visible="false"/>
                    <asp:Label ID="lblmsgStd" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    </fieldset>

                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
    </div>
</asp:Content>