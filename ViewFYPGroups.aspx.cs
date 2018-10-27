using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using CrystalDecisions.CrystalReports.Engine;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
//using CrystalDecisions.Shared;

public partial class ViewFYPGroups : System.Web.UI.Page
{
    SqlConnection sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand sqlcmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    DataTable dt1 = new DataTable();

    clsStudent objStd = new clsStudent();
    protected void Page_Load(object sender, EventArgs e)
    {
        //CrystalReportViewer1.HasExportButton = false;
        btnSearch_Click(this, new EventArgs());
        ImagePreview.Visible = false;
        lblMsg.Text = "";
        //if (!Page.IsPostBack)
        //{
        //    txt_title.Focus();
        //}
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {    
        {
            string query;
            try
            {
                sqlcon.Open();
                query = "select Proj_GrpID, ProjTitle , AdvName, CoAdvName, ProjAbstract, CreatedDate from ProjGroup where ProjTitle='" + txt_title.Text + "'";
                sqlcmd = new SqlCommand(query, sqlcon);
                da = new SqlDataAdapter(sqlcmd);
                dt.Clear();
                da.Fill(dt);
                

                objStd.ProjTitleGroup = txt_title.Text;
                string groupid = objStd.ShowFYPGroups();

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    /*
                    //Assign data to the primary report
                    ReportDocument RptDoc = new ReportDocument();
                    RptDoc.Load(Server.MapPath("~/Reports/ViewFYPGroup.rpt"));
                    RptDoc.SetDataSource(dt);

                    query = "select UserName, StdName, CGPA, EmailID, PhoneNo from StdGroup where Proj_GrpID ='" + groupid + "'";
                    sqlcmd = new SqlCommand(query, sqlcon);
                    da = new SqlDataAdapter(sqlcmd);
                    dt1.Clear();
                    da.Fill(dt1);
                    //txt_title.Text = "";
                    //Get sub report and assign datatable1 to that report 
                    foreach (ReportObject repOp in RptDoc.ReportDefinition.ReportObjects)
                    {
                        if (repOp.Kind == ReportObjectKind.SubreportObject)
                        {
                            string SubRepName = ((SubreportObject)repOp).SubreportName;
                            ReportDocument subRepDoc = RptDoc.Subreports[SubRepName];
                            subRepDoc.SetDataSource(dt1);
                        }
                    }
                    //Assign report to the crystal report viewer 
                    RptDoc.SetParameterValue("ProjTitle", txt_title.Text);
                    //RptDoc.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "1.pdf");
                    FYPGroup.ReportSource = RptDoc;
                    FYPGroup.DataBind();
                    FYPGroup.HasToggleGroupTreeButton = false;
                    FYPGroup.HasPageNavigationButtons = false;
                    FYPGroup.HasCrystalLogo = false;
                    FYPGroup.HasToggleParameterPanelButton = false;
                    //FYPGroup.HasDrilldownTabs = false;
                    //FYPGroup.HasDrilldownTabs = false;
                    FYPGroup.HasDrillUpButton = false;
                    FYPGroup.HasGotoPageButton = false;
                    //FYPGroup.DisplayGroupTree = false;
                    FYPGroup.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
                    FYPGroup.AllowedExportFormats = (int)(ViewerExportFormats.PdfFormat | ViewerExportFormats.WordFormat);
                    */
                }
                else
                {
                    ImagePreview.ImageUrl = "~/Images/oops.gif";
                    ImagePreview.Visible = true;
                    lblMsg.Text = "Select/Enter Correct Name of Project Title!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
                
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                sqlcon.Close();
            }
            
        }
        //ReportDocument rptDoc = new ReportDocument();
        //FYPGroup ds = new FYPGroup();
        //ds.EnforceConstraints = false;

        //DataTable dt = new DataTable();
        //dt.TableName = "ProjGroup";

        //objStd.ProjTitleGroup = txtUserName.Text;
        //dt = objStd.ShowFYPGroups().Tables[0];

        //ds.Tables[0].Merge(dt);

        //rptDoc.Load(Server.MapPath("Reports/ViewFYPGroups.rpt"));
        //rptDoc.SetDataSource(ds);

        ////ReportDocument reportdocument = new ReportDocument();
        ////reportdocument.Load(Server.MapPath("Reports/ViewFYPGroups.rpt"));
        ////reportdocument.SetDatabaseLogon("", "", "Majid-PC", "FYP");
        //rptDoc.SetParameterValue("ProjTitle", txtUserName.Text);
        //CrystalReportViewer1.ReportSource = rptDoc;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetProjectTitle(string prefixText)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select ProjTitle from ProjGroup where IsApproved=1 and ProjTitle like '%'+@Title+'%'", con);
        cmd.Parameters.AddWithValue("@Title", prefixText);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        List<string> ProjectTitle = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectTitle.Add(dt.Rows[i][0].ToString());
        }
        //for (int j = 0; j < ProjectTitle.Count; j++)
        //{
        //    //List<string> a = new List<string>();
        //    string a = ProjectTitle[j];
        //}
        return ProjectTitle;
    }
}