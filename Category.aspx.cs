using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Category : System.Web.UI.Page
{
    #region declare 
    private DataProduct objProduct = new DataProduct();
    private DataCategory objGroup = new DataCategory();

    public int group = 0;
    public string title = "";
    public int page = 1;
    public int maxItem = 0;
    public int MaxPage = 1;
    public string Search = "";

    public int maxPageItem = 12;
    #endregion 

    #region Even Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.HttpMethod == "POST")
        {
            string url = "";
            try
            {
                group = int.Parse(Request.Form["Group"]);
            }
            catch{}

            if (group == 0)
            {
                url = "/danh-muc";
            }
            else
            {
                url = "/" + SystemClass.convertToUnSign2(objGroup.getNameById(group)) + "-gp" + group;
            }

            if(Request.Form["Search"] != "")
            {
                url += "?Search=" + HttpUtility.UrlEncode(Request.Form["Search"]);
            }

            Response.Redirect(url);
        }

        dtlGroup.DataSource = objGroup.getDataToCombobox("");
        dtlGroup.DataBind();

        try
        {
            group = int.Parse(getParam("id"));
        }
        catch(Exception ex)
        {
            group = 0;
        }

        try
        {
            Search = getParam("Search");
        }
        catch { }

        try
        {
            page = int.Parse(getParam("page"));
        }
        catch{}

        int[] id = null;

        if(group != 0)
        {
            id = new int[1] { group };

            maxItem = objProduct.getDataCount(group);
        }
        else
        {
            //id = new int[4] { 53, 50, 51, 52 };
            maxPageItem = 4;
            maxItem = 4;
        }

        MaxPage = maxItem / maxPageItem;
        if (maxItem % maxPageItem > 0) MaxPage += 1;
        if (maxItem < 1) maxItem = 1;

        pageId.iPage = page;
        pageId.MaxPage = MaxPage;

        DataTable objData = objGroup.getNameById(id);
        if(objData != null)
        {
            dtlCat.DataSource = objData.DefaultView;
            dtlCat.DataBind();
        }

    }
    #endregion

    #region Method getItemData
    public DataTable getItemData(int id,int page = 1)
    {
        try
        {
            DataTable objData = objProduct.getDataTop(maxPageItem, id, page, false, Search, "DESC");


            return objData;
        }
        catch
        {
            return new DataTable();
        }
    }
    #endregion

    #region Method getCountData
    public int getCountData(int id)
    {
        try
        {
            return objProduct.getDataCount(id, false, Search);
            
        }
        catch
        {
            return 0;
        }
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

    #region Method Price
    public string Price(string price)
    {
        if (price == "0") return "Liên hệ";

        return int.Parse(price).ToString("0,0") + " đ";
    }
    #endregion
}