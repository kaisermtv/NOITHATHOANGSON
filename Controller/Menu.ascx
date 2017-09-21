<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Controller_Menu" %>
<nav class="navbar">
    <div class="container-fluid container1">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="/">
                <img src="/images/logo.png" alt="Logo"></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <asp:Repeater ID="dtlMenu" runat="server">
                    <HeaderTemplate><% index = 0; %></HeaderTemplate>
                    <ItemTemplate>
                        <li<%= index++ == 0?" class=\"active\"":"" %>><a href="<%# Eval("LINK") %>"><%# Eval("NAME") %></a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>

    </div>
    <div class="hr">
        <hr />
        <hr style="width:40%;" />
    </div>
</nav>
