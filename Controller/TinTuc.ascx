<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TinTuc.ascx.cs" Inherits="Controller_TinTuc" %>

<section class="container1 homenews" >
    <h2>Tin tức - Sự kiện</h2>
    <asp:Repeater ID="dtlnews" runat="server">
        <ItemTemplate>
            <div class="col-sm-4 hnItem">
                <img src="<%# Eval("ImgUrl") %>" alt="<%# Eval("Title") %>" />
                <span class="newsdate"><%# ((DateTime)Eval("DayPost")).ToString("dd.MM.yyyy") %></span>
                <h5><%# Eval("Title") %></h5>
                <p><%# Eval("ShortContent") %></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>