<%@ Page Language="C#" Title="Danh mục" AutoEventWireup="true" MasterPageFile="~/App_Master/Site.master" CodeFile="Category.aspx.cs" Inherits="Category" %>

<%@ Register Src="~/Controller/Paging.ascx" TagPrefix="uc1" TagName="Paging" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <%--<link rel="stylesheet" type="text/css" href="/css/style1.css">--%>
    <style>
        .pagination {
            width: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:Repeater ID="dtlCat" runat="server" EnableViewState="False">
            <ItemTemplate>
                <div class="row col-md-12">
                    <h2 class="H2TraiNghiem"><%# Eval("NAME").ToString().ToUpper() %></h2>
                    <br />
                </div>
                <div class="projects_holder clearfix v3 standard product">
                    <asp:Repeater runat="server" DataSource='<%# getItemData((int)Eval("ID")).DefaultView %>'>
                        <ItemTemplate>
                            <div class="col-sm-3 pditem">
                                <img src="<%# Eval("IMG") %>" alt="<%# Eval("NAME") %>" />
                                <h5><%# Eval("NAME") %></h5>
                                <p><%# Eval("DESCRIBE") %></p>
                                <div class="price"><%# int.Parse(Eval("PRICE").ToString()).ToString("0,0") %> đ</div>
                                <a class="btn btn-user3" href="#" title="more">Xem chi tiết ></a>
                            </div>
                            </article>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="filler"></div>
                    <div class="filler"></div>
                    <div class="filler"></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <% if (MaxPage > 1)
            { %>
        <uc1:Paging ID="pageId" runat="server" />
        <% } %>
    </div>
</asp:Content>
