using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class ViewDocuments : System.Web.UI.Page
{
    clsConvener objConvener = new clsConvener();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridBind();
            TotalDocuments();
        }
    }
    protected void GridBind()
    {
        try
        {
            DataSet ds = objConvener.ViewUploadedDocumentsForGuests();
            if (ds.Tables[0].Rows.Count > 0)
            {
                gv_doc.DataSource = ds.Tables[0];
                gv_doc.DataBind();
            }
            else
            {
                gv_doc.EmptyDataText = "No Document(s) Found!!";
                gv_doc.ForeColor = System.Drawing.Color.White;
                gv_doc.BackColor = Color.FromName("#507CD1");
                gv_doc.Font.Bold = true;
                gv_doc.DataBind();
            }
        }
        catch (Exception ex)
        {
            ImagePreview.ImageUrl = "~/Images/oops.gif";
            ImagePreview.Visible = true;
            lblMsg.Text = ex.Message.ToString();
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void TotalDocuments()
    {
        DataSet dsTotalLogins = objConvener.TotalDocumentsForGuests();
        int totalLogin = Convert.ToInt32(dsTotalLogins.Tables[0].Rows[0]["TotalDocumentsGuests"]);
        lbltlogin.Text = Convert.ToString(totalLogin);
    }
    protected void gvgrp_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType.Equals(DataControlRowType.DataRow))
        {
            e.Row.Cells[0].Text = "" + ((((GridView)sender).PageIndex * ((GridView)sender).PageSize) + (e.Row.RowIndex + 1));
        }
    }

    protected void LinkButton_Click(Object sender, CommandEventArgs e)
    {
        string[] arg = new string[2];
        arg = e.CommandArgument.ToString().Split(';');

        string check = arg[0];
        int doc_id = Convert.ToInt32(arg[1]);

        if (!String.IsNullOrEmpty(check))
        {
            string filepath = Convert.ToString(arg[0]);
            LinkButton btnAdd = (LinkButton)sender;
            ScriptManager.GetCurrent(this.Page).RegisterPostBackControl(btnAdd);

            Response.AddHeader("content-disposition", "attachment; filename=" + filepath);
            //string url = Server.MapPath("~/uploads/" + filepath);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('"+url+"','_newtab');", true);
            Response.WriteFile(Server.MapPath("~/uploads/" + filepath));
            Response.End();
        }
        else
        {
            ImagePreview.ImageUrl = "~/Images/oops.gif";
            ImagePreview.Visible = true;
            lblMsg.Text = "No Attachment Found!";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            GridBind();
        }
    }

    protected void OpenPDF(object sender, CommandEventArgs e)
    {
        string[] arg = new string[2];
        arg = e.CommandArgument.ToString().Split(';');
        string check = arg[0];
        int doc_id = Convert.ToInt32(arg[1]);

        if (!String.IsNullOrEmpty(check))
        {
            string filepath = Convert.ToString(arg[0]);

            Response.AddHeader("content-disposition", "attachment; filename=" + filepath);
            Response.Redirect("https://docs.google.com/viewer?url=" + Server.MapPath("~/uploads/" + filepath));
            Response.End();
        }
        else
        {
            ImagePreview.ImageUrl = "~/Images/oops.gif";
            ImagePreview.Visible = true;
            lblMsg.Text = "No Attachment Found!";
            lblMsg.ForeColor = System.Drawing.Color.Red;
            GridBind();
        }
    }
}