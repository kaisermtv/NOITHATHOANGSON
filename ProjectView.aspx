<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Master/Site.master" CodeFile="ProjectView.aspx.cs" Inherits="ProductView" %>

<%@ Register Src="~/Controller/Product.ascx" TagPrefix="ctl" TagName="Product" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container1 productview">
        <div style="display: table;width:100%">
            <div class="col-sm-4">
                <img src="<%= objData["IMG"] %>" alt="<%=objData["NAME"] %>" />
            </div>
            <div class="col-sm-6">
                <h2>Tên dự án: <%=objData["NAME"] %></h2>
                <p><b>Mã dự án: <%=objData["MA"] %></b> Đăng ngày <%= ((DateTime)objData["CreateDate"]).ToString("dd/MM/yyyy") %></p>
                <span class="price">Địa chỉ: <%=  objData["ADDRESS"].ToString() %></span>
            </div>
        </div>
        <br />
        <div class="info">
            <div class="col-xs-12">
                <div class="panel panel-primary product-type">
                    <div class="panel-heading">
                        <h3 class="panel-title">Thông tin dự án</h3>
                        <%--<span class="pull-right clickable"><i class="glyphicon glyphicon-plus-sign collapse-ico"></i></span>--%>
                    </div>
                    <div class="panel-body">
                        <%= objData["DESCRIBE"]%>
                    </div>
                </div>
            </div>
        </div>

        <div  style="margin-top: 50px; margin-bottom: 50px;" id="ShareToolNewsView">

                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <a href="https://www.facebook.com/sharer.php?&u=http://www.noingoaithathoangson.com<%=Request.RawUrl %>"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
                                    <a href="https://twitter.com/intent/tweet?&url=http://www.noingoaithathoangson.com<%=Request.RawUrl %>"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
                                    <a href="https://plus.google.com?url=http://www.noingoaithathoangson.com<%=Request.RawUrl %>"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>

                                    <h3 class="tieu-de" id="BinhLuanNewsView">Bình luận </h3>
                                    <fb:comments data-id="570235299813675" data-width="100%"></fb:comments>

                                    <%--<div class="fb-comments" data-href="http://113.164.227.242:4083<%=Request.RawUrl %>" data-width="750"></div>--%>
                                </div>
                            </div>
    </section>


    <ctl:Product ID="ctlSPLQ" runat="server" Title="Sản phẩm cùng loại" Limit="4" />

    
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=<%= FacebookAPI.App_id %>";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

    <script type="text/javascript">

        $("#btn-save").click(function () {
            var text = document.getElementById('article_new').textContent + '\n'
                + document.getElementById('article_new_content').textContent;
            var filename = 'yolo'
            var blob = new Blob([text], { type: "text/plain;charset=utf-8" });
            saveAs(blob, filename + ".txt");
        });
    </script>
</asp:Content>
