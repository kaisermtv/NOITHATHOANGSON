using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class System_ProductGroupEdit : System.Web.UI.Page
{
    #region declare
    public int itemId = 0;
    public int group = 0;

    private DataCategory objCategory = new DataCategory();
    private SystemClass objSystemClass = new SystemClass();
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.itemId = int.Parse(Request["id"].ToString());
        }
        catch { }

        try
        {
            this.group = int.Parse(Request["group"].ToString());
        }
        catch { }


        if (!Page.IsPostBack && this.itemId == 0)
        {
            ddlTrangThai.SelectedValue = "1";
        }

        if (!Page.IsPostBack && this.itemId != 0)
        {
            DataRow objData = objCategory.getData(this.itemId);
            if (objData == null)
            {
                objSystemClass.addMessage("Bạn cần chọn nhóm để sửa.");
                Response.Redirect("ProductGroupList.aspx");
                return;
            }

            try
            {
                group = (int)objData["PID"];
            }
            catch { }
            
            txtName.Text = objData["NAME"].ToString();
            txtDescribe.Text = objData["DESCRIBE"].ToString();
            ddlTrangThai.SelectedValue = objData["NSTATUS"].ToString();

            htxtimg1.Value = objData["IMG"].ToString();
            htxtimg.Value = objData["IMG"].ToString();
        }
    }
    #endregion

    #region method btnSaver_Click
    protected void btnSaver_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim() == "")
        {
            objSystemClass.addMessage("Không được để trống tên nhóm");
            return;
        }

        int ret = 0;
        try
        {
            DataSQL objSQL = new DataSQL("tblCategory");

            if(itemId != 0)
            {
                objSQL["ID"] = itemId;
            }

            if(group != 0)
            {
                objSQL["PID"] = group;
            }

            objSQL["NAME"] = txtName.Text;
            objSQL["IMG"] = saveImage(FileUpload, htxtimg, htxtimg1);
            objSQL["DESCRIBE"] = txtDescribe.Text;
            objSQL["NSTATUS"] = int.Parse(ddlTrangThai.SelectedValue);

            ret = (int)objSQL.setData();
        }
        catch { }
        
        //int ret = objCategory.setData(this.itemId, saveImage(FileUpload, htxtimg, htxtimg1), txtName.Text, txtDescribe.Text, int.Parse(ddlTrangThai.SelectedValue));

        if (ret != 0)
        {
            objSystemClass.addMessage("Cập nhật thành công");
            Response.Redirect("ProductGroupEdit.aspx?id=" + ret);
        }
        else
        {
            objSystemClass.addMessage("Có lỗi xảy ra!");
        }

    }
    #endregion

    #region method saveImage
    private String saveImage(FileUpload fileupload, HtmlInputHidden inputc, HtmlInputHidden inputc1)
    {
        string img = SystemClass.saveImage(fileupload.PostedFile, "POSTIMAGE", inputc.Value);

        if (inputc1.Value != "" && img != inputc1.Value) SystemClass.DeleteFile(inputc1.Value);

        inputc.Value = img;
        inputc1.Value = img;

        return img;
    }
    #endregion
}