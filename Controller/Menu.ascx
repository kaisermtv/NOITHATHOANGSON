<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Controller_Menu" %>
<nav class="navbar">
    <div class="container-fluid container1" >
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <%--<a href="/" style="line-height:20px;color:white;">Trang chủ</a>--%>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <asp:Repeater ID="dtlMenu" runat="server">
                    <HeaderTemplate><% index = 0; %></HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <a <%# Eval("COUNTCHILD").ToString() != "0"?"data-toggle=\"dropdown\"":"" %> href="<%# Eval("LINK") %>"><%# Eval("NAME").ToString().ToUpper() %></a>
                                <asp:Repeater runat="server" DataSource='<%# getSubMenu((int) Eval("ID") ) %>' >
                                    <HeaderTemplate>
                                        <ul class="dropdown-menu">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><a href="<%# Eval("LINK") %>"><%# Eval("NAME").ToString().ToUpper() %></a></li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>

    </div>
    <%--<div class="hr">
        <hr />
        <hr style="width:40%;" />
    </div>--%>
</nav>
