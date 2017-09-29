<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="App_Master/Site.Master" CodeFile="Protect.aspx.cs" Inherits="Protect" %>

<%@ Register Src="~/Controller/ProtectAvtive.ascx" TagPrefix="ctl" TagName="ProtectAvtive" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="canonical" href="<%= getUrlCanonical() %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <ctl:ProtectAvtive runat="server" viewpage='true' limit='12' />
</asp:Content>