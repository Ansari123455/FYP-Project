using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;

public partial class ForgotPassword : System.Web.UI.Page
{
    clsAdvisor objAdvisor = new clsAdvisor();

    protected void Page_Load(object sender, EventArgs e)
    {
        txt_email.Focus();
    }
    protected void backtologin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Advisor");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            objAdvisor.EmailIDforForgetPass = txt_email.Text.Trim();
            DataSet ds = objAdvisor.ForgotPasswordFac();

            if (ds.Tables[0].Rows.Count > 0)
            {
                string gmailusername = "majid.aziz786@gmail.com";
                string gmailpassword = "testpassword";
                MailMessage Msg = new MailMessage();
                // Sender e-mail address.
                Msg.From = new MailAddress(txt_email.Text);
                // Recipient e-mail address.
                Msg.To.Add(txt_email.Text);
                Msg.Subject = "FYP Services| Your Password Detail's";
                Msg.Body = "Hi " + ds.Tables[0].Rows[0]["UserName"] + ", <br/>Please check your Login Detail's<br/><br/>Your Registration ID: " + ds.Tables[0].Rows[0]["UserName"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["Password"] + "<br/><br/>";
                Msg.IsBodyHtml = true;
                // your remote SMTP server IP.
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential(gmailusername, gmailpassword);
                smtp.EnableSsl = true;
                smtp.Send(Msg);
                //Msg = null;
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Your Password Details is Sent to your Email ID..";
                // Clear the textbox valuess
                txt_email.Text = "";
            }
            else
            {
                ImagePreview.ImageUrl = "~/Images/oops.gif";
                ImagePreview.Visible = true;
                lblMsg.Text = "The Email ID you entered is not exists.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        catch (Exception ex)
        {
            ImagePreview.ImageUrl = "~/Images/oops.gif";
            ImagePreview.Visible = true;
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}