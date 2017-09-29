<%@ Page Language="C#" Title="Danh mục" AutoEventWireup="true" MasterPageFile="~/App_Master/Site.master" CodeFile="Category.aspx.cs" Inherits="Category" %>

<%@ Register Src="~/Controller/Paging.ascx" TagPrefix="uc1" TagName="Paging" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <%--<link rel="stylesheet" type="text/css" href="/css/style1.css">--%>
    <style>
        .pagination {
            width: auto;
        }
    </style>
    
    <link rel="canonical" href="<%= getUrlCanonical() %>" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container1">
        <form method="post" style="margin: 20px auto;" id="searchFrom">
            <div class="col-sm-2"></div>
            <div class="col-sm-4">
                <input name="Search" style="margin-bottom:10px;" class="form-control" value="<%= Search %>" placeholder="Tìm kiếm" />
            </div>
            <div class="col-sm-3">
                <select class="form-control" style="margin-bottom:10px;" name="Group" onchange="SubmitForm('searchFrom')">
                    <option value="0">Tất cả</option>
                    <asp:Repeater ID="dtlGroup" runat="server">
                        <ItemTemplate>
                            <option value="<%# Eval("ID") %>" <%# (Eval("ID").ToString() == group.ToString())?"selected=\"selected\"":"" %>><%# Eval("NAME") %></option>
                        </ItemTemplate>
                    </asp:Repeater>
                </select>
            </div>
            <div class="col-sm-2">
                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span>Search
                </button>
            </div>
        </form>
        <asp:Repeater ID="dtlCat" runat="server" EnableViewState="False">
            <ItemTemplate>
                <div class="col-md-12" >
                    <h2 class="H2TraiNghiem" style="font-weight:bold;"><%# Eval("NAME").ToString().ToUpper() %></h2>
                    <br />
                </div>
                <div class="projects_holder clearfix v3 standard product">
                    <asp:Repeater runat="server" DataSource='<%# getItemData((int)Eval("ID"),page).DefaultView %>'>
                        <ItemTemplate>
                            <div class="col-sm-3 pditem">
                                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-p<%#Eval("ID")%>" title="<%# Eval("NAME") %>">
                                    <img src="<%# Eval("IMG") %>" alt="<%# Eval("NAME") %>" /></a>
                                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-p<%#Eval("ID")%>" title="<%# Eval("NAME") %>">
                                    <h5><%# Eval("NAME") %></h5>
                                </a>
                                <p><%# Eval("DESCRIBE") %></p>
                                <div class="price"><%# Price(Eval("PRICE").ToString()) %></div>
                                <a class="btn btn-user3" href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-p<%#Eval("ID")%>" title="<%# Eval("NAME") %>" title="more">Xem chi tiết ></a>
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
