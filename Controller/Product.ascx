<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Product.ascx.cs" Inherits="Controller_Product" %>

<section class="container1 product">
    <% if (Title != ""){ %>
    <h2><%= Title %></h2>
    <% } %>
    <asp:Repeater runat="server" ID="dtlProduct">
        <ItemTemplate>
            <div class="col-sm-3 pditem">
                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-p<%#Eval("ID")%>" title="<%# Eval("NAME") %>">
                <div class="wrapper-images">
                <img src="<%# Eval("IMG") %>" alt="<%# Eval("NAME") %>" /></a>
                </div>
                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-p<%#Eval("ID")%>" title="<%# Eval("NAME") %>">
                    <h5><%# Eval("NAME") %></h5></a>
                <p><%# Eval("DESCRIBE") %></p>
                <div class="price"><%# Price(Eval("PRICE").ToString()) %></div>
                <a class="btn btn-user3" href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-p<%#Eval("ID")%>" title="<%# Eval("NAME") %>" title="more">Xem chi tiết ></a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    
</section>