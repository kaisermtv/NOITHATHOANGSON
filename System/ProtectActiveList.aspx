﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Master/System.master" CodeFile="ProtectActiveList.aspx.cs" Inherits="System_ProtectActiveList" %>


<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="Server">
    <script>
        function delmodal(id, name) {
            $("#MainContent_idDel").val(id);
            $("#ttk").html(name);

            $("#myModal").modal("show");
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <table class="table" border ="0" style ="margin-top:-20px;">
        <tr>
            <td>
                <input type="text" id="txtSearch" placeholder="Nhập tên bài viết cần tìm kiếm" runat="server" class="form-control" />
            </td>
            <td style="width: 40px !important; text-align: center;">
                <asp:ImageButton ID="btnSearch" ImageUrl="/images/Search.png" runat="server" Style="margin-bottom: -15px; margin-left: -15px;" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>


    <asp:Repeater ID="dtlData" runat="server" EnableViewState="False">
        <HeaderTemplate>
            <table class="DataListTable">
                <tr class="DataListTableHeader">
                    <th class="DataListTableHeaderTdItemTT" style="width: 4%;">TT</th>
                    <th class="DataListTableHeaderTdItemJustify" style="width: 15%;">Mã số</th>
                    <th class="DataListTableHeaderTdItemJustify">Tên dự án</th>
                    <th class="DataListTableHeaderTdItemJustify" style="width: 10%;">Thời gian</th>
                    <th class="DataListTableHeaderTdItemCenter" style="width: 3%;">Sửa</th>
                    <th class="DataListTableHeaderTdItemCenter" style="width: 3%;">Xóa</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td class="DataListTableTdItemTT"><%# this.index++ %></td>
                <td class="DataListTableTdItemJustify"><%# Eval("MA") %></td>
                <td class="DataListTableTdItemJustify"><%# Eval("NAME") %></td>
                <td class="DataListTableTdItemJustify"><%# ((DateTime)Eval("CreateDate")).ToString("dd/MM/yyyy") %></td>
                <td class="DataListTableTdItemCenter">
                    <a href="ProtectActiveEdit.aspx?id=<%# Eval("ID") %>">
                        <img src="/Images/Edit.png" alt="Chỉnh sửa thông tin">
                    </a>
                &nbsp;&nbsp;</td>
                <td class="DataListTableTdItemCenter">
                    <a href="#myModal" onclick="delmodal(<%# Eval("ID") %>,'<%# Eval("NAME") %>')">
                        <img src="/Images/delete.png" alt="Xóa nhóm">
                    </a>
                &nbsp;&nbsp;</td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <cc1:CollectionPager ID="cpData" runat="server" BackText="" FirstText="Đầu"
        ControlCssClass="ProductPage" LabelText="" LastText="Cuối" NextText="" UseSlider="true"
        ResultsFormat="" BackNextLinkSeparator="" ResultsLocation="None" BackNextLocation="None"
        PageNumbersSeparator="&nbsp;">
    </cc1:CollectionPager>

    <br />
    <a href="ProtectActiveEdit.aspx" class="btn btn-primary">Thêm dự án</a>
    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <input id="idDel" type="hidden" runat="server" />
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Xóa dự án</h4>
          </div>
          <div class="modal-body">
            <p>Bạn xác nhận xóa dự án: <b id="ttk"></b></p>
          </div>
          <div class="modal-footer">
            <asp:Button ID="btnDel" runat ="server" CssClass="btn btn-primary" Text="Xác nhận xóa" OnClick="btnDel_Click" />
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>

      </div>
    </div>
</asp:Content>
