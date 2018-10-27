<%@ Application Language="C#" %>

<script runat="server">

    void Application_BeginRequest(object sender, EventArgs e)
    {
        string path = HttpContext.Current.Request.Url.PathAndQuery;
        string pagequery = path.Substring(path.LastIndexOf("/") + 1);
        string[] pagequery_Elements = pagequery.Split('?');
        string ReturnUrl = pagequery_Elements[pagequery_Elements.Length - 1];

        // student is the folder name,please change the value as yours.
        // login is the page name in student folder.
        if (ReturnUrl.Contains("ReturnUrl") && (ReturnUrl.Contains("Convener") || ReturnUrl.Contains("Advisor")) && !path.Contains("FacultyLogin.aspx"))
        {
            Response.Redirect("~/FacultyLogin.aspx?" + ReturnUrl);
        }
        // teacher is the folder name,please change the value as yours.
        // login is the page name in teacher folder.
        if (ReturnUrl.Contains("ReturnUrl") && ReturnUrl.Contains("Student") && !path.Contains("StudentLogin"))
        {
            Response.Redirect("~/StudentLogin.aspx?" + ReturnUrl);
        }
        
        if (ReturnUrl.Contains("ReturnUrl") && ReturnUrl.Contains("uploads") && !path.Contains("StudentLogin.aspx"))
        {
            Response.Redirect("~/StudentLogin.aspx?" + ReturnUrl); 
        }

        if (ReturnUrl.Contains("ReturnUrl") && ReturnUrl.Contains("Reports") && !path.Contains("StudentLogin.aspx"))
        {
            Response.Redirect("~/StudentLogin.aspx?" + ReturnUrl);
        }
    }

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // this code is execute whenever user session is expired. 
        //That is even user close browser window instead of Log out after session time out time (default value 1 minute i mention in this project for testing purpose) this block execute

        //LoginSession obj = new LoginSession();
        //Session["UserName"] = clsLogin.UserName;
        //string user = Convert.ToString(Session["UserName"]);
        //try
        //{
        //    obj.Updval("UPDATE faculty_table set status='N' where UserName='" + user + "'");
        //    obj.Updval("UPDATE std_table set status='N' where UserName='" + user + "'");
        //}
        //catch (Exception ex)
        //{
        //    Response.Write(ex.ToString());
        //}
    }
       
</script>