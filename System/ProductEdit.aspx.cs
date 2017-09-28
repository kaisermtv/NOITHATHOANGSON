using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class System_ProductEdit : System.Web.UI.Page
{
    #region declare
    public int itemId = 0;
    public int group = 0;

    private DataProduct objProduct = new DataProduct();
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

        if (!Page.IsPostBack)
        {
            ddlGroup.DataSource = objCategory.getDataToCombobox();
            ddlGroup.DataTextField = "Name";
            ddlGroup.DataValueField = "ID";
            ddlGroup.DataBind();

            ddlGroup.SelectedValue = group.ToString();
        }

        //if (!Page.IsPostBack && this.itemId == 0)
        //{
        //    ddlTrangThai.SelectedValue = "1";
        //}

        if (!Page.IsPostBack && this.itemId != 0)
        {
            DataRow objData = objProduct.getData(this.itemId);
            if (objData == null)
            {
                objSystemClass.addMessage("Bạn cần chọn nhóm để sửa.");
                Response.Redirect("ProductList.aspx");
                return;
            }

            txtName.Text = objData["NAME"].ToString();
            txtDescribe.Text = objData["DESCRIBE"].ToString();
            txtPrice.Text = objData["PRICE"].ToString();
            ddlGroup.SelectedValue = objData["GROUPID"].ToString();
            //ddlTrangThai.SelectedValue = objData["NSTATUS"].ToString();
            txtContent.Text = objData["CONTENT"].ToString();

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
        float price = 0;
        try
        {
            price = float.Parse(txtPrice.Text.Trim());
        }
        catch { }

        int ret = 0;
        try
        {
            
            if (itemId == 0)
            {
                ret = objProduct.addData(txtName.Text, int.Parse(ddlGroup.SelectedValue), price, txtDescribe.Text, txtContent.Text, saveImage(FileUpload, htxtimg, htxtimg1));
                if (ret != 0)
                {
                    objSystemClass.addMessage("Thêm sản phẩm thành công");
                }
            }
            else
            {
                ret = objProduct.UpdateData(itemId, txtName.Text, int.Parse(ddlGroup.SelectedValue), price, txtDescribe.Text, txtContent.Text, saveImage(FileUpload, htxtimg, htxtimg1));
                if (ret != 0)
                {
                    objSystemClass.addMessage("Cập nhật sản phẩm thành công");
                }
            }
            
        }
        catch
        {
            
        }
        if (ret != 0)
        {
            Response.Redirect("ProductEdit.aspx?id=" + ret);
        }
        else
        {
            objSystemClass.addMessage(price.ToString());
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