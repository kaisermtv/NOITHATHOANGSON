<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" MasterPageFile="~/App_Master/System.master" CodeFile="MenuEdit.aspx.cs" Inherits="System_MenuEdit" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">


    <ul class="nav nav-tabs">
        <li <%= (type == 1)?"class=\"active\"":"" %>><a href="/System/MenuEdit.aspx?id=<%= itemId  %>&type=1">Tự tạo liên kết</a></li>
        <li <%= (type == 2)?"class=\"active\"":"" %>><a href="/System/MenuEdit.aspx?id=<%= itemId  %>&type=2">Các mục sẵn có</a></li>
        <li <%= (type == 3)?"class=\"active\"":"" %>><a href="/System/MenuEdit.aspx?id=<%= itemId  %>&type=3">Thêm nhóm tin</a></li>
        <li <%= (type == 4)?"class=\"active\"":"" %>><a href="/System/MenuEdit.aspx?id=<%= itemId  %>&type=4">Thêm bài viết</a></li>
        <li <%= (type == 5)?"class=\"active\"":"" %>><a href="/System/MenuEdit.aspx?id=<%= itemId  %>&type=5">Thêm danh mục</a></li>
        <li <%= (type == 6)?"class=\"active\"":"" %>><a href="/System/MenuEdit.aspx?id=<%= itemId  %>&type=6">Thêm sản phẩm</a></li>
    </ul>
    <div class="tab-content">
            <div class="AdminItem">
                <div class="AdminLeftItem">
                    Thư mục cha:
                </div>
                <div class="AdminRightItem">
                    <asp:DropDownList ID="ddlGroup" runat="server" class="AdminTextControl"></asp:DropDownList>
                </div>
            </div>

        <% if (type == 1){ %>
            <div class="AdminItem">
                <div class="AdminLeftItem">
                    Tên menu:
                </div>
                <div class="AdminRightItem">
                    <asp:TextBox ID="txtName" runat="server" class="AdminTextControl"></asp:TextBox>
                </div>
            </div>

            <div class="AdminItem" style="display: table">
                <div class="AdminLeftItem">
                    Mô tả:
                </div>
                <div class="AdminRightItem" style="display: table">
                    <asp:TextBox ID="txtDescribe" runat="server" class="AdminTextControl" TextMode="MultiLine" Style="resize: vertical"></asp:TextBox>
                </div>
            </div>

            <div class="AdminItem" style="display: table">
                <div class="AdminLeftItem">
                    Link:
                </div>
                <div class="AdminRightItem" style="display: table">
                    <asp:TextBox ID="txtLink" runat="server" class="AdminTextControl"></asp:TextBox>
                </div>
            </div>
        <% }else if(type == 2){ %>

        <% }else if(type == 3){ %>

        <% }else if(type == 4){ %>

        <% }else if(type == 5){ %>

        <% } %>


    </div>
    <div class="AdminItem">
        <div class="AdminLeftItem">
            &nbsp;&nbsp;
        </div>
        <div class="AdminRightItem">
            <asp:Button ID="btnSaver" runat="server" CssClass="btn btn-primary" Text="Ghi Nhận" OnClick="btnSaver_Click" />
            <a href="/System/Menu.aspx?id=<%= ddlGroup.SelectedValue  %>&type=<%=menuid %>" class="btn btn-default">Thoát</a>
            <a href="/System/MenuNew.aspx?pid=<%= ddlGroup.SelectedValue %>&type=<%=menuid %>" class="btn btn-danger" style="float: right">Thêm mới</a>
        </div>
    </div>

</asp:Content>


