<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProtectAvtive.ascx.cs" Inherits="Controller_ProtectAvtive" %>
<%@ Register Src="~/Controller/Paging.ascx" TagPrefix="uc1" TagName="Paging" %>
<section class="container1 protectactive">
    <h2>Dự án đã triển khai</h2>

    <div class="padata">
        <asp:Repeater runat="server" ID="dtlProduct">
            <ItemTemplate>
                <div class="col-sm-4 paitem">
                    <img src="<%# Eval("IMG") %>" alt="<%# Eval("NAME") %>" />
                    <div class="pacontai">
                        <div class="span">Mã số: <%# Eval("MA") %>   |   <%# ((DateTime)Eval("CreateDate")).ToString("dd-MM-yyyy") %></div>
                        <h5><%# Eval("NAME") %></h5>
                        <small><%# Eval("ADDRESS") %></small>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <% if (viewpage) { %>
    <uc1:Paging ID="pageId" runat="server" />
    <% } else { %>
    <div class="divcenter">
        <a class="btn btn-user1" href="/du-an-da-trien-khai" title="Xem tất cả các dự án">Xem tất cả dự án</a>
    </div>
    <% } %>
</section>
