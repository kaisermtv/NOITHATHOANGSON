<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">
    public static void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("trangchu", "trang-chu", "~/Default.aspx");
        routes.MapPageRoute("home", "home", "~/Default.aspx");

        RouteValueDictionary routeValueDictionary = new RouteValueDictionary { { "id", @"[0-9]+" }, { "name", ".*" } };
        routes.MapPageRoute("tintuc1", "{name}-cat{id}", "~/News.aspx", false,null, routeValueDictionary);
        routes.MapPageRoute("view2", "tin-tuc/{name}-v{id}", "~/NewsView.aspx", false, null, routeValueDictionary);
        routes.MapPageRoute("view3", "news/{name}-v{id}", "~/NewsView.aspx", false, null, routeValueDictionary);
        routes.MapPageRoute("duan", "{name}/{Ma}", "~/ProjectView.aspx");
        routes.MapPageRoute("view1", "{name}-v{id}", "~/NewsView.aspx", false, null, routeValueDictionary);
        routes.MapPageRoute("sanpham", "{name}-p{id}", "~/ProductView.aspx", false, null, routeValueDictionary);
        routes.MapPageRoute("category", "{name}-gp{id}", "~/Category.aspx", false, null, routeValueDictionary);

        routes.MapPageRoute("danhmuc", "danh-muc", "~/Category.aspx");

        routes.MapPageRoute("du-an", "du-an-da-trien-khai", "~/Protect.aspx");


        routes.MapPageRoute("gioithieu", "gioi-thieu", "~/About.aspx");

        routes.MapPageRoute("lienhe", "lien-he", "~/Contact.aspx");
        routes.MapPageRoute("Contact", "contact", "~/Contact.aspx");


        routes.MapPageRoute("tintuc", "tin-tuc", "~/News.aspx");
        routes.MapPageRoute("news", "news", "~/News.aspx");

        routes.MapPageRoute("view", "view", "~/NewsView.aspx");
        routes.MapPageRoute("catview", "catview", "~/CatView.aspx");

    }

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(System.Web.Routing.RouteTable.Routes);

        //ChatSever.RunChatSever();
        DataSetting objSetting = new DataSetting();
        try
        {
            SystemClass.OnlineDay = int.Parse(objSetting.getValue("OnlineDay"));
            SystemClass.OnlineNowDay = objSetting.getValue("OnlineNowDay");
        }
        catch { }
        if(SystemClass.OnlineNowDay == "")
        {
            SystemClass.OnlineNowDay = DateTime.Now.ToString("dd/MM/yyyy");
            SystemClass.OnlineDay = 0;
            objSetting.setValue("OnlineNowDay",SystemClass.OnlineNowDay);
        }

        try
        {
            SystemClass.OnlineMonth = int.Parse(objSetting.getValue("OnlineMonth"));
            SystemClass.OnlineNowMonth = objSetting.getValue("OnlineNowMonth");
        }
        catch { }
        if(SystemClass.OnlineNowMonth == "")
        {
            SystemClass.OnlineNowMonth = DateTime.Now.ToString("MM/yyyy");
            SystemClass.OnlineMonth = 0;
            objSetting.setValue("OnlineNowMonth",SystemClass.OnlineNowMonth);
        }

        try
        {
            SystemClass.OnlineAll = int.Parse(objSetting.getValue("OnlineAll"));
        }
        catch { }
    }

    void Application_End(object sender, EventArgs e)
    {
    }

    void Application_Error(object sender, EventArgs e)
    {
    }

    void Session_Start(object sender, EventArgs e)
    {
        DataSetting objSetting = new DataSetting();

        string buf = DateTime.Now.ToString("dd/MM/yyyy");
        if(buf != SystemClass.OnlineNowDay )
        {
            SystemClass.OnlineNowDay = buf;
            SystemClass.OnlineDay = 0;

            objSetting.setValue("OnlineNowDay",buf);
        }

        buf = buf.Substring(3);
        if(buf != SystemClass.OnlineNowMonth )
        {
            SystemClass.OnlineNowMonth = buf;
            SystemClass.OnlineMonth = 0;
            objSetting.setValue("OnlineNowMonth",buf);
        }

        SystemClass.Online++;
        SystemClass.OnlineDay++;
        SystemClass.OnlineMonth++;
        SystemClass.OnlineAll++;
        
        objSetting.setValue("OnlineDay",SystemClass.OnlineDay);
        objSetting.setValue("OnlineMonth",SystemClass.OnlineMonth);
        objSetting.setValue("OnlineAll",SystemClass.OnlineAll);
    }

    void Session_End(object sender, EventArgs e)
    {
        SystemClass.Online--;
    }

</script>
