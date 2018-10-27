using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class StudentLogin : System.Web.UI.Page
{
    clsLogin objLogin = new clsLogin();
    clsStudent objStudent = new clsStudent();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!String.IsNullOrEmpty(Request.QueryString["redirect"]))
        {
            string url1 = ResolveClientUrl("redirect");
            Response.Redirect(url1);
        }
        dd1.Focus();
        if (!Page.IsPostBack)
        {
            ShowDropDownList();
            ShowDropDownList1();
        }
        
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
            if (split[i] == "Student")
            {
                lblLogin.Text = "Student Login!";
            }

        }
    }
    protected void forgotpassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgotPasswordStudent.aspx");
    }
    public void ShowDropDownList()
    {
        DataSet ds = objLogin.ShowDropDownValues();
        dd1.DataSource = ds;
        dd1.DataBind();
        dd1.DataTextField = "Batch";
        dd1.DataBind();
    }
    public void ShowDropDownList1()
    {
        DataSet ds = objLogin.ShowDropDownValues1();
        dd2.DataSource = ds;
        dd2.DataBind();
        dd2.DataTextField = "Program";
        dd2.DataBind();
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
        Label7.Text = "UOS/" + dd1.SelectedValue.ToString() + "-" + dd2.SelectedValue.ToString() + "-" + TextBox1.Text + "/LHR";
        Label7.ForeColor = System.Drawing.Color.Green;
        TextBox1.Text = "000";
        bool remember = RememberMe.Checked;
        string str1 = null;
        string[] UserName = null;

        try
        {
            if (Label7.Text.Contains("@"))
            {
                string str = Label7.Text;
                UserName = str.Split('@');
                clsLogin.UserName1 = UserName[0].ToString();
                str1 = UserName[0].ToString();
            }
            else
            {
                clsLogin.UserName1 = Label7.Text.Trim();
                str1 = Label7.Text.Trim();
                Session["Name1"] = str1;
            }
            clsLogin.Password1 = txtpassword.Text.Trim();
            int id;
            string message;
            string Role = clsLogin.GetStudentLogin(out id, out message);

            if (Role == "NoUser")
            {
                ImagePreview.ImageUrl = "~/Images/oops.gif";
                ImagePreview.Visible = true;
                lblMsg.Text = message;

                objStudent.IL_UserName = Label7.Text;
                objStudent.IL_Password = txtpassword.Text;
                objStudent.IL_IPAddress = Request.UserHostAddress;

                objStudent.InsertInvalidLoginStd();

                objStudent.StdNameByRegID = Label7.Text;
                DataSet dsStdName = objStudent.StdNameByID();

                objStudent.MesgSubjForPP = "*** Suspicious Login Prevented!";
                objStudent.MesgForPP = "Someone recently tried to Login to your Account - Registration ID: " + txtusername.Text + ". We prevented the Log-in attempt in case this was a hijacker trying to access your account. Please review the details of the Log-in attempt.<br />Click <a href=\"../Student/InvalidLoginAttempt.aspx\">Here</a> to review the details!<br />Note: *** This is an automatically generated message, Please DO NOT REPLY TO THIS MESSAGE.";
                objStudent.MesgToRegIDForPP = Label7.Text;
                objStudent.MesgToStdNameForPP = Convert.ToString(dsStdName.Tables[0].Rows[0]["Std_Name"]) + " (Student)";

                objStudent.InsertProjectProposeNotification();
            }
            else
            {
                string url = Request.Url.ToString();
                string[] split = url.Split('/');
                for (int i = 0; i < split.Length; i++)
                {
                    //LoginSession obj = new LoginSession();
                    Session["UserType1"] = Role;
                    Session["UserId1"] = id;
                    //Session["UserName1"] = clsLogin.UserName;
                    //string user = Convert.ToString(Session["UserName1"]);
                    //Session["StudentStatus"] = clsLogin.GetStudentStatusByUserId(Convert.ToInt32(Session["UserId"]));
                    //string status = Convert.ToString(Session["StudentStatus"]);


                    if (Role.ToLower() == "student" && split[i] == "Student")
                    {

                        Session["StudentId1"] = clsLogin.GetStudentIdByUserId(Convert.ToInt32(Session["UserId1"]));
                        Session["UserName1"] = str1;

                        objStudent.LH_UserName = Convert.ToString(Session["UserName1"]);
                        objStudent.LH_IPAddress = Request.UserHostAddress;

                        objStudent.InsertLoginHistoryStd();

                        //Session["loggedin"] = true;
                        //obj.Updval("update std_table set status='Y' where UserName='" + user + "'");
                        FormsAuthentication.RedirectFromLoginPage(Role, createPersistentCookie: remember);
                        //Response.Redirect("~/Student/Default.aspx");
                    }
                    else
                    {
                        //if (status == "Y")
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