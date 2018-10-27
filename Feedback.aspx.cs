using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Feedback : System.Web.UI.Page
{
    clsUser objUser = new clsUser();
    clsConvener objConvener = new clsConvener();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserName1"])) && String.IsNullOrEmpty(Convert.ToString(Session["UserName"])) && String.IsNullOrEmpty(Convert.ToString(Session["UserName2"])))
            {
                txt_feedbackby.Text = Convert.ToString(Session["UserName1"]);
            }
            else
                if (String.IsNullOrEmpty(Convert.ToString(Session["UserName1"])) && String.IsNullOrEmpty(Convert.ToString(Session["UserName"])) && !String.IsNullOrEmpty(Convert.ToString(Session["UserName2"])))
                {
                    txt_feedbackby.Text = Convert.ToString(Session["UserName2"]) + " (Faculty Member)";
                }
                else
                {
                    txt_feedbackby.Text = "Guest";
                }
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_feedbackby.Text.StartsWith("UOS") || txt_feedbackby.Text == "Guest")
            {
                objUser.FeedbackbyStd = txt_feedbackby.Text;
                objUser.FeedbackSbjStd = txt_sbj.Text;
                objUser.FeedbackDesStd = txt_task.Text;
                objUser.FeedbackEmailStd = txt_emailid.Text;

                string s = objUser.InsertFeedback();
                lblMsg.Text = s;
                lblMsg.ForeColor = System.Drawing.Color.Green;
                clear();
            }
            else
            {
                objUser.FeedbackFacName = txt_feedbackby.Text;
                objUser.FeedbackbyFac = Convert.ToInt32(Session["AdvisorId"]);
                objUser.FeedbackSbjFac = txt_sbj.Text;
                objUser.FeedbackDesFac = txt_task.Text;
                objUser.FeedbackEmailFac = txt_emailid.Text;

                string s = objUser.InsertFeedbackFac();
                lblMsg.Text = s;
                lblMsg.ForeColor = System.Drawing.Color.Green;
                clear();
            }

            DataSet datas = objConvener.ShowFacultyNameByType();

            objConvener.ConvenerID = Convert.ToInt32(datas.Tables[0].Rows[0]["UserID"]);
            objConvener.MesgToConvener = Convert.ToString(datas.Tables[0].Rows[0]["UserName"]) + " (Convener)";
            objConvener.MesgForGA = "New Feedback/Complaint is submitted by User or Guest. Click <a href=\"ViewFeedback.aspx\">Here</a> to View Feedback/Complaint!<br /><br />Note: *** This is an automatically generated message, Please DO NOT REPLY TO THIS MESSAGE.";
            objConvener.MesgSubject = "*** New Feedback/Complaint Notification!";

            objConvener.InsertFYPGroupNotification();
        }
        catch (Exception ex)
        {
            ImagePreview.ImageUrl = "~/Images/oops.gif";
            ImagePreview.Visible = true;
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    void clear()
    {
        txt_sbj.Text = "";
        txt_emailid.Text = "";
        txt_task.Text = "";
        //txt_feedbackby.Text = "Guest";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        clear();
    }
}