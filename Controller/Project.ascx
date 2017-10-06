<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Project.ascx.cs" Inherits="Controller_Project" %>
<section class="container1 product">  
    <h2>CÁC DỰ ÁN KHÁC</h2>
    <asp:Repeater runat="server" ID="dtlProduct">
        <ItemTemplate>
            <div class="col-sm-3 pditem">
                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>/<%#Eval("Ma")%>" title="<%# Eval("NAME") %>">
                 <div class="wrapper-images">
                <img src="<%# Eval("IMG") %>" alt="<%# Eval("NAME") %>" /></a>
                 </div>
                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>/<%#Eval("Ma")%>" title="<%# Eval("NAME") %>">
                    <h5><%# Eval("NAME") %></h5></a>               
                <a class="btn btn-user3" href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>/<%#Eval("Ma")%>" title="<%# Eval("NAME") %>" title="more">Xem chi tiết ></a>
            </div>
        </ItemTemplate>
    </asp:Repeater>   

</section>