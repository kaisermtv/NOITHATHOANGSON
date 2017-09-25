<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="App_Master/Site.Master" CodeFile="ProtectView.aspx.cs" Inherits="ProtectView" %>


<%@ Register Src="~/Controller/Product.ascx" TagPrefix="ctl" TagName="Product" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container1 productview">
        <div style="display: table">
            <div class="col-sm-4">
                <img src="<%= objData["IMG"] %>" alt="<%=objData["NAME"] %>" />
            </div>
            <div class="col-sm-6">
                <h2>TÊN SẢN PHẨM: <%=objData["NAME"] %></h2>
                <p><%=objData["DESCRIBE"] %></p>
                <span class="price">GIÁ: <%=  Price(objData["PRICE"].ToString()) %></span>
            </div>
        </div>
        <div class="info">
            <div class="col-xs-12">
                <div class="panel panel-primary product-type">
                    <div class="panel-heading">
                        <h3 class="panel-title">Thông tin sản phẩm</h3>
                        <%--<span class="pull-right clickable"><i class="glyphicon glyphicon-plus-sign collapse-ico"></i></span>--%>
                    </div>
                    <div class="panel-body">
                        <%= objData["CONTENT"]  %>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <ctl:Product ID="ctlSPLQ" runat="server" Title="Sản phẩm cùng loại" Limit="4" />
</asp:Content>
