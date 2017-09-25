using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProtectView : System.Web.UI.Page
{
    #region declre
    public string itemId = 0;
    public DataRow objData;

    private DataProtectActive objProtect = new DataProtectActive();
    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.itemId = getParam("id");
        }
        catch { }

        //if (!Page.IsPostBack)
        //{
        objData = objProtect.getData(itemId);
        //}

    }
    #endregion

    #region Method getParam
    private String getParam(String key)
    {
        try
        {
            if (RouteData.Values[key] != null) return RouteData.Values[key].ToString();
            if (Request[key] != null) return Request[key].ToString();
        }
        catch { }

        return null;
    }
    #endregion
}