using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Registration : System.Web.UI.Page
{
    clsFaculty objFaculty = new clsFaculty();
    //clsAdvisor objAdvisor = new clsAdvisor();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Page.IsAsync)
        //{
        //    PostBackTrigger trigger = new PostBackTrigger();
        //    trigger.ControlID = (ddreg as DropDownList).ID;
        //    this.panel1.Triggers.Add(trigger);
        //}
    }
    protected void ddreg_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddreg.SelectedIndex != 0)
        {
            if (ddreg.SelectedItem.Text == "Faculty Registration Form")
            {
                Fieldset1.Visible = false;
                field.Visible = true;
            }
            else
            {
                field.Visible = false;
                Fieldset1.Visible = true;
            }
        }
        else
        {
            //lblMsg.Text = "Select Registration Form!";
            //lblMsg.Focus();
            field.Visible = false;
            Fieldset1.Visible = false;
        }
    }
    protected string checkgender()
    {
        //DataSet ds1 = objAdvisor.GetFacGender();
        //string gender = Convert.ToString(ds1.Tables[0].Rows[0]["Fac_Gender"]);
        string gender = ddlGender.SelectedItem.Text;

        if (gender == "Female")
        {
            return "noProfilePic_female_100x100.gif";
        }
        else
        {
            return "noProfilePic_male_100x100.gif";
        }
    }
    protected string checkgenderStd()
    {
        //DataSet ds1 = objAdvisor.GetFacGender();
        //string gender = Convert.ToString(ds1.Tables[0].Rows[0]["Fac_Gender"]);
        string gender = dd_gender.SelectedItem.Text;

        if (gender == "Female")
        {
            return "noProfilePic_female_100x100.gif";
        }
        else
        {
            return "noProfilePic_male_100x100.gif";
        }
    }
    protected void FacSignUp()
    {
        objFaculty.UserNameFac = txtName.Text;
        objFaculty.PasswordFac = txtPass.Text;
        objFaculty.DesignationFac = txt_Des.Text;
        objFaculty.EducationFac = txt_edu.Text;
        objFaculty.GenderFac = ddlGender.SelectedItem.Text;
        objFaculty.EmailFac = txt_emailFac.Text;
        objFaculty.PhoneNoFac = txt_ph_no.Text;
        objFaculty.TypeFac = dd_type.SelectedItem.Text;

        string s = objFaculty.InsertFacRegistration();
        if (s == "UserName already exist give another ..")
        {
            ImagePreview1.ImageUrl = "~/Images/oops.gif";
            ImagePreview1.Visible = true;
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = s;
            lblMsg.Focus();
        }
        else
        {
            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = s;
            ClearData();
            lblMsg.Focus();
        }
    }
    protected void StdSignUp()
    {
        objFaculty.UserNameStd = txt_name.Text;
        objFaculty.PasswordStd = txt_pass.Text;
        objFaculty.SeasonStd = dd_season.SelectedItem.Text;
        objFaculty.YearStd = ddd_year.Text;
        objFaculty.ProgramStd = dd_prog.SelectedItem.Text;
        objFaculty.GenderStd = dd_gender.SelectedItem.Text;
        objFaculty.EmailStd = txt_email.Text;
        objFaculty.PhoneNoStd = txt_no.Text;
        objFaculty.CgpaStd = txt_cgpa.Text;
        objFaculty.RegId = Convert.ToInt32(txt_id.Text);

        string s = objFaculty.InsertStdRegistration();
        if (s == "UserName already exist give another ..")
        {
            ImagePreview.ImageUrl = "~/Images/oops.gif";
            ImagePreview.Visible = true;
            lblmsgStd.ForeColor = System.Drawing.Color.Red;
            lblmsgStd.Text = s;
            lblmsgStd.Focus();
        }
        else
        {
            lblmsgStd.ForeColor = System.Drawing.Color.Green;
            lblmsgStd.Text = s;
            StdClearData();
            lblmsgStd.Focus();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlGender.SelectedItem.Text != "Select")
            {
                if (dd_type.SelectedItem.Text != "Select")
                {
                    if (txtPass.Text == txt_confirm.Text)
                    {
                        if (dd_type.SelectedItem.Text == "Convener")
                        {
                            DataSet dsCheckConv = objFaculty.ShowFacultyNameByType();
                            if (dsCheckConv.Tables[0].Rows.Count > 0)
                            {
                                ImagePreview1.ImageUrl = "~/Images/oops.gif";
                                ImagePreview1.Visible = true;
                                lblMsg.ForeColor = System.Drawing.Color.Red;
                                lblMsg.Text = "Convener Account Already Exists. Only 1 Convener is Allowed.";
                            }
                            else
                            {
                                if (!String.IsNullOrEmpty(clsUser.ImageNameFac) && !String.IsNullOrEmpty(clsUser.ImageContentTypeFac))
                                {
                                    objFaculty.RoleFac = "Convener";
                                    FacSignUp();
                                }
                                else
                                {
                                    string genderimage = checkgender();
                                    string filePath = Server.MapPath("~/Images/" + genderimage);
                                    string filename = Path.GetFileName(filePath);
                                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                                    BinaryReader br = new BinaryReader(fs);
                                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                                    br.Close();
                                    fs.Close();

                                    clsUser.ImageNameFac = genderimage;
                                    clsUser.ImageContentTypeFac = "image/gif";
                                    clsUser.ImageDataFac = bytes;
                                    objFaculty.RoleFac = "Convener";
                                    FacSignUp();
                                }
                            }
                        }
                        else
                        {
                            if (!String.IsNullOrEmpty(clsUser.ImageNameFac) && !String.IsNullOrEmpty(clsUser.ImageContentTypeFac))
                            {
                                objFaculty.RoleFac = "Advisor";
                                FacSignUp();
                            }
                            else
                            {
                                string genderimage = checkgender();
                                string filePath = Server.MapPath("~/Images/" + genderimage);
                                string filename = Path.GetFileName(filePath);
                                FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                                BinaryReader br = new BinaryReader(fs);
                                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                                br.Close();
                                fs.Close();

                                clsUser.ImageNameFac = genderimage;
                                clsUser.ImageContentTypeFac = "image/gif";
                                clsUser.ImageDataFac = bytes;
                                objFaculty.RoleFac = "Advisor";
                                FacSignUp();
                            }
                        }
                    }
                    else
                    {
                        ImagePreview1.ImageUrl = "~/Images/oops.gif";
                        ImagePreview1.Visible = true;
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "Password Mismatch. Try Again!";
                        lblMsg.Focus();
                    }
                }
                else
                {
                    ImagePreview1.ImageUrl = "~/Images/oops.gif";
                    ImagePreview1.Visible = true;
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Select Faculty Type field first!";
                    //dd_type.Focus();
                    lblMsg.Focus();
                }
            }
            else
            {
                ImagePreview1.ImageUrl = "~/Images/oops.gif";
                ImagePreview1.Visible = true;
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Select Gender field first!";
                //ddlGender.Focus();
                lblMsg.Focus();
            }
        }
        catch (Exception ex)
        {
            ImagePreview1.ImageUrl = "~/Images/oops.gif";
            ImagePreview1.Visible = true;
            lblMsg.Text = ex.Message;
            lblMsg.Focus();
        }

    }

    void ClearData()
    {
        txtName.Text = "";
        txtPass.Text = "";
        txt_confirm.Text = "";
        txt_Des.Text = "";
        txt_edu.Text = "";
        txt_emailFac.Text = "";
        txt_ph_no.Text = "";
        ddlGender.SelectedIndex = 0;
        dd_type.SelectedIndex = 0;
        BrowseImage1.Clearimage();
    }
    void StdClearData()
    {
        txt_name.Text = "";
        dd_season.SelectedIndex = 0;
        ddd_year.Text = "";
        dd_prog.SelectedIndex = 0;
        dd_gender.SelectedIndex = 0;
        txt_id.Text = "000";
        txt_cgpa.Text = "";
        txt_email.Text = "";
        txt_no.Text = "";
        txt_pass.Text = "";
        txt_cpass.Text = "";
        BrowseImage2.Clearimage();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        ClearData();
    }
    protected void btnSubmitStd_Click(object sender, EventArgs e)
    {
        try
        {
            if (dd_season.SelectedItem.Text != "Select")
            {
                if (ddd_year.Text != "")
                {
                    if (dd_prog.SelectedItem.Text != "Select")
                    {
                        if (dd_gender.SelectedItem.Text != "Select")
                        {
                            if (txt_pass.Text == txt_cpass.Text)
                            {
                                if (!String.IsNullOrEmpty(clsUser.ImageNameFac) && !String.IsNullOrEmpty(clsUser.ImageContentTypeFac))
                                {
                                    StdSignUp();
                                }
                                else
                                {
                                    string genderimageStd = checkgenderStd();
                                    string filePath = Server.MapPath("~/Images/" + genderimageStd);
                                    string filename = Path.GetFileName(filePath);
                                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                                    BinaryReader br = new BinaryReader(fs);
                                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                                    br.Close();
                                    fs.Close();

                                    clsUser.ImageNameFac = genderimageStd;
                                    clsUser.ImageContentTypeFac = "image/gif";
                                    clsUser.ImageDataFac = bytes;

                                    StdSignUp();
                                }
                            }
                            else
                            {
                                ImagePreview.ImageUrl = "~/Images/oops.gif";
                                ImagePreview.Visible = true;
                                lblmsgStd.ForeColor = System.Drawing.Color.Red;
                                lblmsgStd.Text = "Password Mismatch. Try Again!";
                                lblmsgStd.Focus();
                            }
                        }
                        else
                        {
                            ImagePreview.ImageUrl = "~/Images/oops.gif";
                            ImagePreview.Visible = true;
                            lblmsgStd.ForeColor = System.Drawing.Color.Red;
                            lblmsgStd.Text = "Select Gender field first!";
                            //dd_gender.Focus();
                            lblmsgStd.Focus();
                        }
                    }
                    else
                    {
                        ImagePreview.ImageUrl = "~/Images/oops.gif";
                        ImagePreview.Visible = true;
                        lblmsgStd.ForeColor = System.Drawing.Color.Red;
                        lblmsgStd.Text = "Select Program field first!";
                        //dd_prog.Focus();
                        lblmsgStd.Focus();
                    }
                }
                else
                {
                    ImagePreview.ImageUrl = "~/Images/oops.gif";
                    ImagePreview.Visible = true;
                    lblmsgStd.ForeColor = System.Drawing.Color.Red;
                    lblmsgStd.Text = "Select Year field first!";
                    //dd_year.Focus();
                    lblmsgStd.Focus();
                }
            }
            else
            {
                ImagePreview.ImageUrl = "~/Images/oops.gif";
                ImagePreview.Visible = true;
                lblmsgStd.ForeColor = System.Drawing.Color.Red;
                lblmsgStd.Text = "Select Season field first!";
                //dd_season.Focus();
                lblmsgStd.Focus();
            }
        }
        catch (Exception)
        {
            ImagePreview.ImageUrl = "~/Images/oops.gif";
            ImagePreview.Visible = true;
            lblmsgStd.ForeColor = System.Drawing.Color.Red;
            lblmsgStd.Text = "Reg Id already exists with same season, year and program.";
            lblmsgStd.Focus();
        }

    }
    protected void btnCancelStd_Click(object sender, EventArgs e)
    {
        lblmsgStd.Text = "";
        StdClearData();
    }
}