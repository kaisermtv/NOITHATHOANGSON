<%@ Page Language="C#" Title="Trang chủ" AutoEventWireup="true"  MasterPageFile="App_Master/Site.Master" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Src="~/Controller/Slider.ascx" TagPrefix="ctl" TagName="Slider" %>
<%@ Register Src="~/Controller/ViewQuery.ascx" TagPrefix="ctl" TagName="ViewQuery" %>
<%@ Register Src="~/Controller/GroupProduct.ascx" TagPrefix="ctl" TagName="GroupProduct" %>
<%@ Register Src="~/Controller/ProtectAvtive.ascx" TagPrefix="ctl" TagName="ProtectAvtive" %>
<%@ Register Src="~/Controller/Product.ascx" TagPrefix="ctl" TagName="Product" %>
<%@ Register Src="~/Controller/TinTuc.ascx" TagPrefix="ctl" TagName="TinTuc" %>
<%@ Register Src="~/Controller/Contact.ascx" TagPrefix="ctl" TagName="Contact" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ctl:Slider runat="server" />
    <ctl:GroupProduct runat="server" />
    <ctl:ProtectAvtive runat="server" />
    <ctl:ViewQuery runat="server" />
    <ctl:Product runat="server" />
    <ctl:TinTuc runat="server" />
    <ctl:Contact runat="server" />
</asp:Content>