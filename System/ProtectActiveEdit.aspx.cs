using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class System_ProtectActiveEdit : System.Web.UI.Page
{
    #region declare
    public int itemId = 0;

    private DataProtectActive objProtect = new DataProtectActive();
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


        //if (!Page.IsPostBack && this.itemId == 0)
        //{
        //    ddlTrangThai.SelectedValue = "1";
        //}

        if (!Page.IsPostBack && this.itemId != 0)
        {
            DataRow objData = objProtect.getData(this.itemId);
            if (objData == null)
            {
                objSystemClass.addMessage("Bạn cần chọn nhóm để sửa.");
                Response.Redirect("ProtectActiveList.aspx");
                return;
            }
            txtMA.Text = objData["MA"].ToString();
            txtName.Text = objData["NAME"].ToString();
            txtAddress.Text = objData["ADDRESS"].ToString();
            txtContent.Text = objData["DESCRIBE"].ToString();

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
            
            if (itemId == 0)
            {
                ret = objProtect.addData(txtMA.Text, txtName.Text, saveImage(FileUpload, htxtimg, htxtimg1), txtAddress.Text, txtContent.Text);
                if (ret != 0)
                {
                    objSystemClass.addMessage("Thêm sản dự án thành công");
                }
            }
            else
            {
                ret = objProtect.UpdateData(itemId,txtMA.Text, txtName.Text, saveImage(FileUpload, htxtimg, htxtimg1), txtAddress.Text, txtContent.Text);
                if (ret != 0)
                {
                    objSystemClass.addMessage("Cập nhật dự án thành công");
                }
            }
        }
        catch
        {
            
        }

        if (ret != 0)
        {
            Response.Redirect("ProtectActiveEdit.aspx?id=" + ret);
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
        string img = SystemClass.saveImage(fileupload.PostedFile, "PROTECTIMG", inputc.Value);

        if (inputc1.Value != "" && img != inputc1.Value) SystemClass.DeleteFile(inputc1.Value);

        inputc.Value = img;
        inputc1.Value = img;

        return img;
    }
    #endregion
}