using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controller_ProtectAvtive : System.Web.UI.UserControl
{
    #region declare
    private DataProtectActive objProtect = new DataProtectActive();

    public int limit = 3;
    public int page = 1;
    public bool viewpage = false;
    private int maxitem = 0;
    private int maxPage = 1;
    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region Even Page_PreRender()
    public void Page_PreRender(object sender, EventArgs e)
    {
        if (viewpage)
        {
            #region phan trang
            maxitem = objProtect.getDataCount();
            maxPage = maxitem / limit;
            if (maxitem % limit > 0 || maxPage == 0) maxPage++;
            if (page > maxPage) page = maxPage;
            if (page < 1) page = 1;

            pageId.MaxPage = maxPage;
            pageId.iPage = page;

            #endregion
        }


        DataTable objData = objProtect.getDataTop(limit, page);
        if(objData != null)
        {
            dtlProduct.DataSource = objData.DefaultView;
            dtlProduct.DataBind();
        }
        // index = 1;
    }
    #endregion
}