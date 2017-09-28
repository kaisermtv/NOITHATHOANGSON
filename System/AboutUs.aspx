<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" MasterPageFile="~/App_Master/System.master" CodeFile="AboutUs.aspx.cs" Inherits="System_AboutUs" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <div class="AdminItem">
        <div class="AdminLeftItem">
            Domain:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="textDomain" runat="server" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Tên đơn vị:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtName" runat="server" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Mã số thuế:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtMaSoThue" runat="server" class="AdminTextControl"></asp:TextBox>
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

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Địa chỉ showroom:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtAddrenShowroom" runat="server" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Điện thoại:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtPhone" runat="server" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Địa chỉ Email:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtEmail" runat="server" Text="" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem">
        <div class="AdminLeftItem">
            Hotline:
        </div>
        <div class="AdminRightItem">
            <asp:TextBox ID="txtHotline" runat="server" Text="" class="AdminTextControl"></asp:TextBox>
        </div>
    </div>

    <div class="AdminItem" style="display:table">
        <div class="AdminLeftItem">
            Giới thiệu:
        </div>
        <div class="AdminRightItem" style="display:table">
            <CKEditor:CKEditorControl ID="txtGioiThieu" CssClass="editor1" runat="server" Height="210" Width="100%" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
        </div>
    </div>


    <div class="AdminItem">
        <div class="AdminLeftItem">
            &nbsp;&nbsp;
        </div>
        <div class="AdminRightItem">
            <asp:Button ID="btnSave" runat="server" Text="Ghi nhận" CssClass="btn btn-primary" OnClick="btnSave_Click" />
        </div>
    </div>

</asp:Content>

