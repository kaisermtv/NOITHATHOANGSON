using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controller_Slider : System.Web.UI.UserControl
{
    #region declare
    public int index = 0;
    public int count = 0;

    private DataSlider objSlider = new DataSlider();
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable objdata = objSlider.getList(0);
        if (objdata != null)
        {
            count = objdata.Rows.Count;

            dtlIndicators.DataSource = objdata.DefaultView;
            dtlIndicators.DataBind();

            dtlSlider.DataSource = objdata.DefaultView;
            dtlSlider.DataBind();
        }
    }
}