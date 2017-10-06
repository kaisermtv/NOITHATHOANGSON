<%@ Page Language="C#" Title="Trang chủ" AutoEventWireup="true"  MasterPageFile="App_Master/Site.Master" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Src="~/Controller/Slider.ascx" TagPrefix="ctl" TagName="Slider" %>
<%@ Register Src="~/Controller/ViewQuery.ascx" TagPrefix="ctl" TagName="ViewQuery" %>
<%@ Register Src="~/Controller/GroupProduct.ascx" TagPrefix="ctl" TagName="GroupProduct" %>
<%@ Register Src="~/Controller/ProtectAvtive.ascx" TagPrefix="ctl" TagName="ProtectAvtive" %>
<%@ Register Src="~/Controller/Product.ascx" TagPrefix="ctl" TagName="Product" %>
<%@ Register Src="~/Controller/TinTuc.ascx" TagPrefix="ctl" TagName="TinTuc" %>
<%@ Register Src="~/Controller/Contact.ascx" TagPrefix="ctl" TagName="Contact" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="canonical" href="<%= SystemClass.http + SystemClass.getSetting("Domain") %>" />

    <meta property="og:title" content="<%= Page.Title %>"/>
    <meta property="og:type" content="Home" />
    <meta property="og:image" content="http://www.noingoaithathoangson.com/images/LogoFooter.png" />
    <meta property="og:url" content="http://www.noingoaithathoangson.com" />
    <meta property="og:description" content="Nội ngoại thất HOÀNG SƠN. Bán các loại đèn trang trí, sàn gỗ, sàn nhựa, cổng nhôm đúc"/>
    <meta property="og:author" content="hoangson"/>
    <meta property="og:keywords" content="<%= Page.Title %>" />
    <meta property="twitter:url" content="http://www.noingoaithathoangson.com" />
    <meta property="twitter:title"  content="<%= Page.Title %>" />
    <meta property="twitter:image" content="http://www.noingoaithathoangson.com/images/LogoFooter.png" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ctl:Slider runat="server" />
    <ctl:GroupProduct runat="server" />
    <ctl:ProtectAvtive runat="server" />
    <ctl:ViewQuery runat="server" />
    <ctl:Product runat="server" />
    <ctl:TinTuc runat="server" />
    <ctl:Contact runat="server" />
</asp:Content>