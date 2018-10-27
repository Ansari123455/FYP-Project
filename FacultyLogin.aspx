<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyLogin.aspx.cs" Inherits="FacultyLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Fyp management system, convener console" />

    <title>FYP Portal| Faculty Login !!</title>

    <script language="JavaScript" type="text/javascript">
        window.history.forward();
    </script>
    
    <link rel="stylesheet" type="text/css" href="styles/css.css" />
    <link rel="stylesheet" type="text/css" href="styles/css1.css" />
    <link rel="stylesheet" type="text/css" href="styles/style.css" />
    <link rel="stylesheet" type="text/css" href="styles/style_main.css" />
    <link href="styles/nav.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="styles/jquery-ui-1.8.19.custom.css" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/gif" />
    <script src="scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="scripts/check_browser_close.js" type="text/javascript"></script>
    <script src="scripts/jquery-ui.min.js" type="text/javascript"></script>
          
    <script type="text/javascript">
        function ShowMessage(message) {
            $(document).ready(function () {
                $("#dialog").text(message);
                $("#dialog").dialog({
                    modal: true,
                    height: 'auto',
                    width: 'auto',
                    buttons: {
                        OK: function () {
                            $(this).dialog("close");
                        }
                    }
                });
            });
        } 
    </script>

    <script type="text/javascript">
        function ShowMessage1(message1) {
            // var message1 = '<p>You have been logged out of the system. To log in, please return to the <a href=\"Login.aspx\"> login page</a></p>';
            $(document).ready(function () {
                //$("#dialog").text(message);
                $(message1).dialog({
                    modal: true,
                    height: 'auto',
                    width: 'auto',
                    title: 'Information Alert!!'
                });
            });
        } 
    </script>

    <script type="text/javascript">

        jQuery(function ($) {

            // simple jQuery validation script
            $('#login').submit(function () {

                var valid = true;
                var errorcn = 'error';

                $('.' + errorcn, this).remove();

                $('.required', this).each(function () {
                    var parent = $(this).parent();
                    if ($(this).val() == '') {
                        var msg = $(this).attr('title');
                        msg = (msg != '') ? msg : errormsg;
                        $('<span class="' + errorcn + '">' + msg + '</span>')
					.appendTo(parent)
					.fadeIn('fast')
					.click(function () { $(this).remove(); })
                        valid = false;
                    };
                });
                return valid;
            });
        })	
</script>
</head>
<body>
    <div class="header">
       <a href="Home.aspx" class="ciit_logo" id="ciit_logo"></a> 
       <a href="Home.aspx" class="ciit_isb_logo" id="ciit_isb_logo"></a>
       <a href="Home.aspx" class="fyp_logo" id="Div1"></a>
       
        <div class="right_head">
           <div class="time_bar">
           <p><asp:Label ID="Label1" runat="server"> </asp:Label> </p>
           </div>
        </div>

        <nav role='navigation'>

            <left><a href="Home.aspx"><img src="Images/cover1.png" /> </a></left>
            <ul>
              <li><a href="Convener">Convener Login!</a></li>
              <li><a href="Advisor">Advisor Login!</a></li>
              <li><a href="Student">Student Login!</a></li>      
		    </ul>
       

    </div>

    <form id="login" runat="server" autocomplete="off">
        <h1>
        <asp:Label ID="lblLogin" runat="server" style="margin:20px; color: white; font-weight:900" ></asp:Label>
        <br />
        Login to your account!</h1>
            <div>
                <label for="login_username">Username:*</label>
                <asp:TextBox ID="txtusername" runat="server" class="field required" title="Please provide your username?" placeholder="Username"/>
            </div>
            <div>
                <label for="login_password">Password:*</label>
                <asp:TextBox TextMode="Password" ID="txtpassword" runat="server" class="field required" title="Password is required!" placeholder="Password"/>
            </div>
            <div class="submit">
            <asp:Button ID="Button1" Text="Login" runat="server" OnClick="LogIn_Clicked" />
            <label><asp:CheckBox runat="server" ID="RememberMe" /> Remember my login on this computer.</label>
            <br /><br />
            <asp:LinkButton ID="forgotpassword" runat="server" CausesValidation="false" Text="Can't access your account?"
                 ForeColor="#797A80" BorderColor="MediumSeaGreen" 
                 onclick="forgotpassword_Click" style="margin-left:1px;"/>
                <p class="back">
                    <asp:Literal Text="Invalid Username/Password. Try Again!!" runat="server" Visible="false" ID="ErrorMessage" />
                    <asp:Image runat="server" ID="ImagePreview" Visible="false"/>
                    <asp:Label ID="lblMsg" runat="server" ForeColor="red"></asp:Label>   
                </p>
                <div id="dialog" title="Information Alert!!" style="display: none">
                </div>
    </div>
    </form>
    <div id="footer" class="footer">
      <p>FYP Copyright &copy; 2016-2017</p>
    </div>
</body>
</html>
