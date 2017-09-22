<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Master/Site.master" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container1 productview">
        <div class="col-sm-4">
            <img src="<%= objData["IMG"] %>" alt="<%=objData["NAME"] %>" />
        </div>
        <div class="col-sm-6">
            <h2><%=objData["NAME"] %></h2>
            <p><%=objData["DESCRIBE"] %></p>
            <span class="price"><%=  Price(objData["PRICE"].ToString()) %></span>
        </div>
        <div class="info">
            <%= objData["CONTENT"] %>
        </div>
    </section>
</asp:Content>
