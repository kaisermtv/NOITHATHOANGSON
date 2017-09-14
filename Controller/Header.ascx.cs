using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controller_Header : System.Web.UI.UserControl
{
    #region declare
    private DataSetting objSetting = new DataSetting();
    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region Method GetSetting
    public string GetSetting(string key)
    {
        return objSetting.getValue(key);
    }
    #endregion
}