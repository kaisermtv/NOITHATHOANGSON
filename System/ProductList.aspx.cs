using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_ProductList : System.Web.UI.Page
{
    #region declare
    private DataProduct objProduct = new DataProduct();

    public int index = 1;
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        Context.Items["strTitle"] = "DANH SÁCH SẢN PHẨM";

        if (!Page.IsPostBack)
        {
            DataCategory objCategory = new DataCategory();
            ddlGroup.DataSource = objCategory.getDataToCombobox("Tất cả");
            ddlGroup.DataValueField = "ID";
            ddlGroup.DataTextField = "NAME";
            ddlGroup.DataBind();

            try
            {
                ddlGroup.SelectedValue = int.Parse(Request["group"].ToString()).ToString();
            }
            catch
            {
                ddlGroup.SelectedValue = "0";
            }
        }

    }
    #endregion

    #region Page_PreRender
    public void Page_PreRender(object sender, EventArgs e)
    {
        DataTable objData = objProduct.getList(int.Parse(ddlGroup.SelectedValue), txtSearch.Value.Trim());

        //dtlAccount.DataSource = objData.DefaultView;
        //dtlAccount.DataBind();

        cpData.MaxPages = 1000;
        cpData.PageSize = 15;
        cpData.DataSource = objData.DefaultView;
        cpData.BindToControl = dtlData;
        dtlData.DataSource = cpData.DataSourcePaged;
        dtlData.DataBind();

        index = 1;
    }
    #endregion

    #region method btnDel_Click
    protected void btnDel_Click(object sender, EventArgs e)
    {
        int id;
        try
        {
            id = int.Parse(idDel.Value);
        }
        catch
        {
            SystemClass objSystemClass = new SystemClass();
            objSystemClass.addMessage("Có lỗi xảy ra!");
            return;
        }

        if (id != 0)
        {
            objProduct.delData(id);

            //getData();
        }
        else
        {
            SystemClass objSystemClass = new SystemClass();
            objSystemClass.addMessage("Có lỗi xảy ra!");
            return;
        }
    }
    #endregion
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {

    }
}