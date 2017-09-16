using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controller_GroupProduct : System.Web.UI.UserControl
{
    #region declare
    private DataCategory objCategory = new DataCategory();
    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable objData = objCategory.getList(1);

        dtlCateloge.DataSource = objData.DefaultView;
        dtlCateloge.DataBind();
    }
    #endregion
}