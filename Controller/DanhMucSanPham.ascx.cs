using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controller_DanhMucSanPham : System.Web.UI.UserControl
{
    #region declare
    public int itemId = 0;

    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region Page_PreRender
    public void Page_PreRender(object sender, EventArgs e)
    {
        DataCategory objCategory = new DataCategory();

        DataTable objData = objCategory.getList();

        dtlData.DataSource = objData.DefaultView;
        dtlData.DataBind();
    }
    #endregion
}