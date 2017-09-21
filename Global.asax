﻿<%@ Application Language="C#" %>
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
        routes.MapPageRoute("view1", "{name}-v{id}", "~/NewsView.aspx", false, null, routeValueDictionary);

        routes.MapPageRoute("category", "{name}-gp{id}", "~/Category.aspx", false, null, routeValueDictionary);

        
        routes.MapPageRoute("gioithieu", "gioi-thieu", "~/Contact.aspx");
        routes.MapPageRoute("lienhe", "lien-he", "~/Contact.aspx");
        routes.MapPageRoute("Contact", "contact", "~/Contact.aspx");

        routes.MapPageRoute("ContactOk", "ContactOk", "~/ContactOk.aspx");

        routes.MapPageRoute("tintuc", "tin-tuc", "~/News.aspx");
        routes.MapPageRoute("news", "news", "~/News.aspx");

        routes.MapPageRoute("view", "view", "~/NewsView.aspx");
        routes.MapPageRoute("catview", "catview", "~/CatView.aspx");
        
    }

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(System.Web.Routing.RouteTable.Routes);

        //ChatSever.RunChatSever();
    }

    void Application_End(object sender, EventArgs e)
    {
        
    }

    void Application_Error(object sender, EventArgs e)
    {
    }

       
</script>
