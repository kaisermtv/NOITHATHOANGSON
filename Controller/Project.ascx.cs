using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controller_Project : System.Web.UI.UserControl
{
    #region declare
    private DataProduct objProduct = new DataProduct();
    public string Title = "";
    public int Limit = 8;
    public int Group = 0;
    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region Even Page_PreRender()
    public void Page_PreRender(object sender, EventArgs e)
    {
        DataTable objData = new DataProtectActive().getDataTop(Limit,Group);
        dtlProduct.DataSource = objData.DefaultView;
        dtlProduct.DataBind();

        // index = 1;
    }
    #endregion

  }