using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductView : System.Web.UI.Page
{
    #region declre
    public string itemId = "";
    public DataRow objData;

    private DataProtectActive objProtect = new DataProtectActive();
    #endregion

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            itemId = getParam("Ma");
            objData = objProtect.getData(itemId);
        }
        catch {
            Response.Redirect("/du-an-da-trien-khai");
        }

        //if (!Page.IsPostBack)
        //{
           
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

    #region getUrlCanonical
    public string getUrlCanonical()
    {
        return SystemClass.http + SystemClass.getSetting("Domain") + "/" + SystemClass.convertToUnSign2(objData["NAME"].ToString()) + "/" + itemId;
    }
    #endregion
}