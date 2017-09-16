<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TinTuc.ascx.cs" Inherits="Controller_TinTuc" %>

<section class="container1 homenews" >
    <h2>Tin tức - Sự kiện</h2>
    <asp:Repeater ID="dtlnews" runat="server">
        <ItemTemplate>
            <div class="col-sm-4 hnItem">
                <a href="/<%# SystemClass.convertToUnSign2(Eval("Title").ToString()) %>-v<%#Eval("Id")%>" title="<%# Eval("Title") %>">
                <img src="<%# Eval("ImgUrl") %>" alt="<%# Eval("Title") %>" /></a>
                <span class="newsdate"><%# ((DateTime)Eval("DayPost")).ToString("dd.MM.yyyy") %></span>
                <a href="/<%# SystemClass.convertToUnSign2(Eval("Title").ToString()) %>-v<%#Eval("Id")%>" title="<%# Eval("Title") %>"><h5><%# Eval("Title") %></h5></a>
                <p><%# Eval("ShortContent") %></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>