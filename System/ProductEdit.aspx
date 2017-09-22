<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Master/System.master" CodeFile="ProductEdit.aspx.cs" Inherits="System_ProductEdit" %>


<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="Server">
    <script>
        function LoadImgSrc(input, img, imp) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $(img)
                        .attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            } else {
                $(img).attr('src', '');
                document.getElementById('MainContent_' + imp).value = "";
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    
    <div class="AdminItem">
        <div class="AdminLeftItem">
            Tên sản phẩm:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtName" runat="server" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Nhóm sản phẩm:
        </div>
        <div class="AdminRightItem">
            <asp:DropDownList ID="ddlGroup" runat="server" class="AdminTextControl"></asp:DropDownList>
        </div>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Giá sản phẩm:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtPrice" runat="server" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem" style="display:table">
        <div class="AdminLeftItem">
            Hình đại diện
        </div>
        <div class="AdminRightItem" style="display:table">
            <img id="preview" src="<%=htxtimg.Value %>" style="max-width: 100%;max-height:200px" alt="Hình đại diện" /> <br />
                <label class="file-upload" style="margin-top: 1px;">
                    <input type="hidden" id="htxtimg" runat="server"/>
                    <input type="hidden" id="htxtimg1" runat="server"/>
                    <asp:FileUpload ID="FileUpload" onchange="LoadImgSrc(this,'#preview','htxtimg');" runat="server" Width="100%" accept="image/x-png, image/gif, image/jpeg" CssClass="FileUploadImage" Height="22px" />
                </label>
        </div>
    </div>

    <div class="AdminItem" style="display:table">
        <div class="AdminLeftItem">
            Mô tả:
        </div>
        <div class="AdminRightItem" style="display:table">
            <asp:TextBox ID="txtDescribe"  runat="server" class="AdminTextControl" TextMode="MultiLine" style="resize:vertical"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem" style="display:table">
        <div class="AdminLeftItem">
            Thông tin sản phẩm:
        </div>
        <div class="AdminRightItem" style="display:table">
            <CKEditor:CKEditorControl ID="txtContent" CssClass="editor1" runat="server" Height="210" Width="100%" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
        </div>
    </div>

    <%--<div class="AdminItem">
        <div class="AdminLeftItem">
            Trạng thái:
        </div>
        <div class="AdminRightItem">
            <asp:DropDownList ID="ddlTrangThai" runat="server" class="AdminTextControl">
                <asp:ListItem Value="1">Chia sẻ</asp:ListItem>
                <asp:ListItem Value="2">Lưu trữ</asp:ListItem>
                <asp:ListItem Value="3">Ẩn danh mục</asp:ListItem>
                <asp:ListItem Value="0">-/-</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>--%>


    <div class="AdminItem">
        <div class="AdminLeftItem">
            &nbsp;&nbsp;
        </div>
        <div class="AdminRightItem">
            <asp:Button ID="btnSaver" runat ="server" CssClass="btn btn-primary" Text="Ghi Nhận" OnClick="btnSaver_Click" />
            <a href="/System/ProductList.aspx<%= (group.ToString() == ddlGroup.SelectedValue)?"?group="+group:"" %>" class="btn btn-default">Thoát</a>
            <a style="float:right;" href="/System/ProductEdit.aspx<%= (group.ToString() == ddlGroup.SelectedValue)?"?group="+group:"" %>" class="btn btn-danger">Thêm sản phẩm</a>
        </div>
    </div>

</asp:Content>

