using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;

public partial class ForgotPasswordStudent : System.Web.UI.Page
{
    clsStudent objStudent = new clsStudent();

    protected void Page_Load(object sender, EventArgs e)
    {
        txt_email.Focus();
    }
    protected void backtologin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Student");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            objStudent.EmailIDforForgetPass = txt_email.Text.Trim();
            DataSet ds = objStudent.ForgotPasswordStd();

            if (ds.Tables[0].Rows.Count > 0)
            {
                //string gmailusername = "majid.aziz786@yahoo.com";
                //string gmailpassword = "testpassword";
                MailMessage Msg = new MailMessage();
                // Sender e-mail address.
                Msg.From = new MailAddress("FYPServices@majid.com");
                // Recipient e-mail address.
                Msg.To.Add(txt_email.Text);
                Msg.Subject = "FYP Services| Your Password Detail's";
                Msg.Body = "<br />Hi " + ds.Tables[0].Rows[0]["Std_Name"] + ", <br/>Please check your Login Detail's<br/><br/>Your Registration ID: " + ds.Tables[0].Rows[0]["UserName"] + "<br/>Your Password: " + ds.Tables[0].Rows[0]["Password"] + "<br/>";
                Msg.IsBodyHtml = true;
                // your remote SMTP server IP.
                SmtpClient smtp = new SmtpClient();
                smtp.UseDefaultCredentials = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.SpecifiedPickupDirectory;
                smtp.PickupDirectoryLocation = "C:/Users/Majid/Documents/Visual Studio 2010/WebSites/FYP/uploads/";
                //smtp.Host = "smtp.yahoo.com";
                //smtp.Port = 465;
                //smtp.EnableSsl = true;
                //smtp.UseDefaultCredentials = false;
                //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                //smtp.Credentials = new System.Net.NetworkCredential(gmailusername, gmailpassword);
                smtp.Send(Msg);
                //Msg = null;
                ImagePreview.Width = 60;
                ImagePreview.Height = 94;
                ImagePreview.ImageUrl = "~/Images/goodidea.gif";
                ImagePreview.Visible = true;
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