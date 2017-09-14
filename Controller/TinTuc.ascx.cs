using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controller_TinTuc : System.Web.UI.UserControl
{
    #region declare
    private DataNews objNews = new DataNews();
    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable objData = objNews.getDataTop(3,1);

        dtlnews.DataSource = objData.DefaultView;
        dtlnews.DataBind();

    }
    #endregion


}