<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="App_Master/Site.Master" CodeFile="Protect.aspx.cs" Inherits="Protect" %>

<%@ Register Src="~/Controller/ProtectAvtive.ascx" TagPrefix="ctl" TagName="ProtectAvtive" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="description" content="Các dự án sàn gỗ, cổng nhôm đúc, đèn trang trí đang và đã được thực hiện bởi công ty cổ phần Hoàng Sơn" />
    <link rel="canonical" href="<%= getUrlCanonical() %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ctl:ProtectAvtive runat="server" viewpage='true' limit='12' />
</asp:Content>