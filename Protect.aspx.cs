using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Protect : System.Web.UI.Page
{
    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region getUrlCanonical
    public string getUrlCanonical()
    {
        return SystemClass.http + SystemClass.getSetting("Domain") + "/du-an-da-trien-khai";
    }
    #endregion
}