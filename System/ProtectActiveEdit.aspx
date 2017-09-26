<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Master/System.master" CodeFile="ProtectActiveEdit.aspx.cs" Inherits="System_ProtectActiveEdit" %>


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

    <script>
        var roxyFileman = '/fileman/index.html';
        $(function () {
            CKEDITOR.replace('MainContent_txtContent', {
                filebrowserBrowseUrl: roxyFileman,
                filebrowserImageBrowseUrl: roxyFileman + '?type=image',
                removeDialogTabs: 'link:upload;image:upload'
            });
        });

        $(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Thông tin chung</a></li>
        <li><a data-toggle="tab" href="#menu1">Thông tin chi tiết</a></li>
    </ul>

    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
    <div class="AdminItem">
        <div class="AdminLeftItem">
            Mã dự án:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtMA" runat="server" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Tên dự án:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtName" runat="server" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Địa chỉ:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtAddress" runat="server" class="AdminTextControl"></asp:TextBox>
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
            </div>

    <div id="menu1" class="tab-pane fade">
            <CKEditor:CKEditorControl ID="txtContent" CssClass="editor1" runat="server" Height="210" Width="100%" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            &nbsp;&nbsp;
        </div>
        <div class="AdminRightItem">
            <asp:Button ID="btnSaver" runat ="server" CssClass="btn btn-primary" Text="Ghi Nhận" OnClick="btnSaver_Click" />
            <a href="/System/ProtectActiveList.aspx" class="btn btn-default">Thoát</a>
            <a style="float:right;" href="/System/ProtectActiveEdit.aspx" class="btn btn-danger">Thêm dự án</a>
        </div>
    </div>

</asp:Content>

