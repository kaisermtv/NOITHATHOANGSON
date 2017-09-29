using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_MenuEdit : System.Web.UI.Page
{
    #region declare
    private DataMenu objMenu = new DataMenu();
    private SystemClass objSystemClass = new SystemClass();

    public int itemId = 0;
    public int menuid = 1;
    public int mid = 1;

    public int type = 1;
    public int pid = 0;
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
            this.pid = int.Parse(Request["pid"].ToString());
        }
        catch { }

        try
        {
            this.type = int.Parse(Request["type"].ToString());
        }
        catch { }

        try
        {
            this.mid = int.Parse(Request["mid"].ToString());
        }
        catch { }

        if (!Page.IsPostBack)
        {
            DataRow objData = null;

            if (itemId != 0)
            {
                objData = objMenu.getData(this.itemId);
                if (objData == null)
                {
                    objSystemClass.addMessage("Không tìm thấy menu.");
                    Response.Redirect("Menu.aspx");
                    return;
                }
            }
            
            ddlGroup.DataSource = objMenu.getDataToCombobox("-- Thư mục gốc --");
            ddlGroup.DataValueField = "ID";
            ddlGroup.DataTextField = "NAME";
            ddlGroup.DataBind();

            if(objData != null)
            {
                if (objData["PID"].ToString() != null && objData["PID"].ToString() != "")
                {
                    ddlGroup.SelectedValue = objData["PID"].ToString();
                }
                else
                {
                    ddlGroup.SelectedValue = "0";
                }

                txtName.Text = objData["NAME"].ToString();
                menuid = (int)objData["MenuID"];
                txtDescribe.Text = objData["DESCRIBE"].ToString();
            }
            else
            {
                ddlGroup.SelectedValue = pid.ToString();
                menuid = 1;
            }
            

            if (mid == 1)
            {
                if(menuid == 1 && objData != null)
                    txtLink.Text = objData["LINK"].ToString();
            }
            else if (mid == 2)
            {
                if (menuid == 2 && objData != null)
                    dtlMenuName.SelectedValue = objData["LINK"].ToString();
            }
            else if (mid == 3)
            {
                DataNewsGroup objGroupNew = new DataNewsGroup();
                ddlGroupNews.DataSource = objGroupNew.getDataToCombobox(null);
                ddlGroupNews.DataValueField = "ID";
                ddlGroupNews.DataTextField = "NAME";
                ddlGroupNews.DataBind();

                if (menuid == 3 && objData != null)
                    ddlGroupNews.SelectedValue = objData["LINK"].ToString();
            }
            else if (mid == 4)
            {
                if (menuid == 4 && objData != null)
                    txNewsID.Text = objData["LINK"].ToString();
            }
            else if (mid == 5)
            {
                DataCategory objCategory = new DataCategory();
                ddlDanhMuc.DataSource = objCategory.getDataToCombobox(null);
                ddlDanhMuc.DataValueField = "ID";
                ddlDanhMuc.DataTextField = "NAME";
                ddlDanhMuc.DataBind();

                if (menuid == 5 && objData != null)
                    ddlDanhMuc.SelectedValue = objData["LINK"].ToString();
            }
            else if (mid == 6)
            {
                if (menuid == 6 && objData != null)
                    txtProductID.Text = objData["LINK"].ToString();
            }
            
        }
    }
    #endregion

    #region method btnSaver_Click
    protected void btnSaver_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim() == "")
        {
            objSystemClass.addMessage("Không được để trông tên menu");
            return;
        }
        
        int ret = 0;
        try
        {
            DataSQL objSQL = new DataSQL("tblMenu");

            if(itemId != 0)
            {
                objSQL["ID"] = itemId;
            }
            else
            {
                objSQL["NTYPE"] = type;
            }

            objSQL["MenuID"] = type;
            objSQL["PID"] = int.Parse(ddlGroup.SelectedValue);
            objSQL["NAME"] = txtName.Text;
            objSQL["DESCRIBE"] = txtDescribe.Text;

            if (mid == 1)
            {
                objSQL["LINK"] = txtLink.Text;
            }
            else if (mid == 2)
            {
                objSQL["LINK"] = dtlMenuName.SelectedValue;
            }
            else if (mid == 3)
            {
                objSQL["LINK"] = ddlGroupNews.SelectedValue;
            }
            else if (mid == 4)
            {
                objSQL["LINK"] = txNewsID.Text;
            }
            else if (mid == 5)
            {
                objSQL["LINK"] = ddlDanhMuc.SelectedValue;
            }
            else if (mid == 6)
            {
                objSQL["LINK"] = txtProductID.Text;
            }

            ret = (int)objSQL.setData();
        }
        catch
        {
            
        }

        if(ret != 0)
        {
            objSystemClass.addMessage("Cập nhật menu thành công");
            Response.Redirect("MenuEdit.aspx?id=" + ret);
        }
        else
        {
            objSystemClass.addMessage("Có lỗi xảy ra!");
        }
    }
    #endregion
}