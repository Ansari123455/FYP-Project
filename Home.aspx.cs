using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    //LoginSession obj = new LoginSession();
    //const string SQL = "select UserName from std_table"; 
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = "Your IP address is: " + Request.UserHostAddress + "---" + Request.Params["REMOTE_ADDR"].ToString() + "<br />" + "You are browsing this site with: " + Request.ServerVariables["http_user_agent"].ToString() + "<br />" + "The method used to call the page: " + Request.ServerVariables["request_method"].ToString() + "<br />" + "The server's domain name: " + Request.ServerVariables["server_name"].ToString() + "<br />" + "The server's port: " + Request.ServerVariables["server_port"].ToString() + "<br />" + "The server's software: " + Request.ServerVariables["server_software"].ToString() + "<br />" + "The DNS lookup of the IP address is: " + Request.ServerVariables["REMOTE_HOST"].ToString();
        //obj.selquery(SQL);
    }
    //protected void btnProjIdea_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("ShowProjectIdeas.aspx");
    //}
    //protected void btnFypGroup_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("ViewFYPGroups.aspx");
    //}
}