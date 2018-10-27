using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class FacultyLogin : System.Web.UI.Page
{
    clsFaculty objFaculty = new clsFaculty();
    clsAdvisor objAdvisor = new clsAdvisor();
    clsConvener objConvener = new clsConvener();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.QueryString["redirect"]))
        {
            string url1 = ResolveClientUrl("redirect");
            Response.Redirect(url1);
        }

        txtusername.Focus();

        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetNoServerCaching();
        HttpContext.Current.Response.Cache.SetNoStore();
        
        DateTime myDateTime = DateTime.Now;
        Label1.Text = DateTime.Now.ToLongDateString();

        lblMsg.Text = "";

        string url = Request.Url.ToString();
        string[] split = url.Split('/');
        for (int i = 0; i < split.Length; i++)
        {
            if (split[i] == "Convener")
            {
                lblLogin.Text = "Convener Login!";
            }
            else if (split[i] == "Advisor")
            {
                lblLogin.Text = "Advisor Login!";
            }

        }
    }
    protected void forgotpassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgotPassword.aspx");
    }
    public void ShowAlertMessage(string error)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "ShowMessage('" + error + "');", true);
    }
    public void ShowAlertMessage1(string error1)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "err_msg", "ShowMessage1('" + error1 + "');", true);
    }
    protected void LogIn_Clicked(object sender, EventArgs e)
    {
        bool remember = RememberMe.Checked;
        string str1 = null;
        string[] UserName = null;

        try
        {
            if (txtusername.Text.Contains("@"))
            {
                string str = txtusername.Text;
                UserName = str.Split('@');
                clsLogin.UserName = UserName[0].ToString();
                str1 = UserName[0].ToString();
            }
            else
            {
                clsLogin.UserName = txtusername.Text.Trim();
                str1 = txtusername.Text.Trim();
                Session["Name"] = str1;
            }
            clsLogin.Password = txtpassword.Text.Trim();
            int id;
            string message;
            string Role = clsLogin.GetUserLogin(out id, out message);
           

            if (Role == "NoUser")
            {
                ImagePreview.ImageUrl = "~/Images/oops.gif";
                ImagePreview.Visible = true;
                lblMsg.Text = message;

                objFaculty.IL_UserID = txtusername.Text;
                objFaculty.IL_Password = txtpassword.Text;
                objFaculty.IL_IPAddress = Request.UserHostAddress;

                objFaculty.InsertInvalidLoginFac();

                objAdvisor.TP_AdvName = txtusername.Text;
                DataSet dsAdvID = objAdvisor.GetAdvisorID();

                objConvener.ConvenerID = Convert.ToInt32(dsAdvID.Tables[0].Rows[0]["UserID"]);
                objConvener.MesgToConvener = txtusername.Text + " (Advisor)";
                objConvener.MesgForGA = "Someone recently tried to Login to your Account - UserName: " + txtusername.Text + ". We prevented the Log-in attempt in case this was a hijacker trying to access your account. Please review the details of the Log-in attempt.<br />Click <a href=\"../Advisor/InvalidLoginAttempt.aspx\">Here</a> to review the details!<br />Note: *** This is an automatically generated message, Please DO NOT REPLY TO THIS MESSAGE.";
                objConvener.MesgSubject = "*** Suspicious Login Prevented!";

                objConvener.InsertFYPGroupNotification();

            }
            else
            {
                string url = Request.Url.ToString();
                string[] split = url.Split('/');
                for (int i = 0; i < split.Length; i++)
                {
                    Session["UserType"] = Role;
                    Session["UserId"] = id;
                    //Session["UserName1"] = clsLogin.UserName;
                    //string user = Convert.ToString(Session["UserName1"]);
                    //Session["ConvenerStatus"] = clsLogin.GetConvenerStatusByUserId(Convert.ToInt32(Session["UserId"]));
                    //string status = Convert.ToString(Session["ConvenerStatus"]);
                    //Session["AdvisorStatus"] = clsLogin.GetAdvisorStatusByUserId(Convert.ToInt32(Session["UserId"]));
                    //string status1 = Convert.ToString(Session["AdvisorStatus"]);

                    if (Role.ToLower() == "convener" && split[i] == "Convener")
                    {
                        Session["ConvenerId"] = clsLogin.GetConvenerIdByUserId(Convert.ToInt32(Session["UserId"]));
                        Session["UserName"] = str1;

                        objFaculty.LH_UserID = Convert.ToInt32(Session["ConvenerId"]);
                        objFaculty.LH_IPAddress = Request.UserHostAddress;

                        objFaculty.InsertLoginHistoryFac();

                        //Session["loggedin1"] = true;

                        //clsUser.UpdateStatus(user);
                        //obj.Updval("update faculty_table set status='Y' where UserName='" + user + "'");
                        
                        FormsAuthentication.RedirectFromLoginPage("Convener", createPersistentCookie: remember);
                        //Response.Redirect("~/Convener/Default.aspx");
                    }
                    else if (Role.ToLower() == "advisor" && split[i] == "Advisor")
                    {
                        Session["AdvisorId"] = clsLogin.GetAdvisorIdByUserId(Convert.ToInt32(Session["UserId"]));
                        Session["UserName2"] = str1;

                        objFaculty.LH_UserID = Convert.ToInt32(Session["AdvisorId"]);
                        objFaculty.LH_IPAddress = Request.UserHostAddress;

                        objFaculty.InsertLoginHistoryFac();

                        //Session["loggedin2"] = true;
                        //clsUser.UpdateStatus(user);
                        //obj.Updval("update faculty_table set status='Y' where UserName='" + user + "'");
                        FormsAuthentication.RedirectFromLoginPage("Advisor", createPersistentCookie: remember);
                        //Response.Redirect("~/Advisor/Default.aspx");
                    }
                    else
                    {
                        //if (status == "Y" || status1 == "Y")
                        //{
                        //    lblMsg.Text = "Your Account is Already InUse.<br /> Please Close Previous Session and Try Again!";
                        //}
                        //else
                        //{
                            ImagePreview.ImageUrl = "~/Images/oops.gif";
                            ImagePreview.Visible = true;
                            lblMsg.Text = "Please Select Your Valid Login Page!<br /> Login UnSuccessful!!";
                        //}
                    }
                }
            }
        }
        catch (Exception)
        {
            ImagePreview.ImageUrl = "~/Images/oops.gif";
            ImagePreview.Visible = true;
            lblMsg.Text = "Your UserName is Invalid. Try Again!<br /> Login UnSuccessful!!";
        }
        
    }
}