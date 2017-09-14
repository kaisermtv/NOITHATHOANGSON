using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controller_Menu : System.Web.UI.UserControl
{
    #region declare 
    public int index = 0;

    private DataMenu objMenu = new DataMenu();
    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable objData = objMenu.getList();

        dtlMenu.DataSource = objData.DefaultView;
        dtlMenu.DataBind();

    }
    #endregion
}