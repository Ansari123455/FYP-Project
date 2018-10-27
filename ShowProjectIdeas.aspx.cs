using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ShowProjectIdeas : System.Web.UI.Page
{
    clsStudent objStd = new clsStudent();
    protected void Page_Load(object sender, EventArgs e)
    {
        ReportDocument rptDoc = new ReportDocument();
        CrystalReporting ds = new CrystalReporting();
        DataTable dt = new DataTable();
        dt.TableName = "Propose Project Report";
        dt = objStd.ShowProjectIdeas().Tables[0];
        ds.Tables[0].Merge(dt);
        rptDoc.Load(Server.MapPath("~/Reports/ProjectProposeReport.rpt"));
        rptDoc.SetDataSource(ds);
        FYPProposeIdeas.ReportSource = rptDoc;
        FYPProposeIdeas.AllowedExportFormats = (int)(ViewerExportFormats.ExcelFormat | ViewerExportFormats.PdfFormat | ViewerExportFormats.WordFormat);
        //FYPProposeIdeas.HasCrystalLogo = false;
        FYPProposeIdeas.HasDrillUpButton = false;
        FYPProposeIdeas.HasToggleGroupTreeButton = false;
        //FYPProposeIdeas.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
        //FYPProposeIdeas.ToolPanelWidth = 120;
    }
    
}