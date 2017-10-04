<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Master/Site.master" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<%@ Register Src="~/Controller/Product.ascx" TagPrefix="ctl" TagName="Product" %>
<%@ Register Src="~/Controller/IMGModal.ascx" TagPrefix="ctl" TagName="IMGModal" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <meta property="og:title" content="<%=objData["NAME"] %>"/>
    <meta property="og:type" content="Product" />
    <meta property="og:image" content="http://www.noingoaithathoangson.com<%= objData["IMG"] %>" />
    <meta property="og:url" content="<%= getUrlCanonical() %>" />
    <meta property="og:description" content="<%=objData["DESCRIBE"] %>"/>
    <meta property="og:author" content="hoangson"/>
    <meta property="og:keywords" content="<%=objData["NAME"] %>" />
    <meta property="twitter:url" content="http://www.noingoaithathoangson.com" />
    <meta property="twitter:title"  content="<%=objData["NAME"] %>" />
    <meta property="twitter:image" content="http://www.noingoaithathoangson.com<%= objData["IMG"].ToString() %>" />

    <link rel="canonical" href="<%= getUrlCanonical() %>" />

    <style>
        .panel-body img:hover {
            opacity: 0.7;
        }
        #myImg:hover {
            opacity: 0.7;
        }


    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container1 productview" >
        <div style="display: table;width:100%">
            <div class="col-sm-4">
                <img id="myImg" src="<%= objData["IMG"] %>" alt="<%=objData["NAME"] %>" />
            </div>
            <div class="col-sm-6">
                <h2>TÊN SẢN PHẨM: <%=objData["NAME"] %></h2>
                <p><%=objData["DESCRIBE"] %></p>
                <span class="price">GIÁ: <%=  Price(objData["PRICE"].ToString()) %></span>
            </div>
        </div>
        <div class="info">
            <div class="col-xs-12">
                <div class="panel panel-primary product-type">
                    <div class="panel-heading">
                        <h3 class="panel-title">Thông tin sản phẩm</h3>
                        <%--<span class="pull-right clickable"><i class="glyphicon glyphicon-plus-sign collapse-ico"></i></span>--%>
                    </div>
                    <div class="panel-body">
                        <%= objData["CONTENT"]  %>
                    </div>
                </div>
            </div>
        </div>

        <ctl:IMGModal runat="server" />
        <script>
            $(".panel-body img").click(function(){
                showimg($(this).attr('src'), $(this).attr('alt'));
            })

            $("#myImg").click(function () {
                showimg($(this).attr('src'), $(this).attr('alt'));
            })
        </script>

        <div style="margin-top: 50px; margin-bottom: 50px;" id="ShareToolNewsView">

                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <a href="https://www.facebook.com/sharer.php?&u=http://www.noingoaithathoangson.com<%=Request.RawUrl %>"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
                                    <a href="https://twitter.com/intent/tweet?&url=http://www.noingoaithathoangson.com<%=Request.RawUrl %>"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
                                    <a href="https://plus.google.com/share?url=http://www.noingoaithathoangson.com<%=Request.RawUrl %>"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
                                    <div class="fb-like" data-href="http://www.noingoaithathoangson.com<%=Request.RawUrl %>" data-layout="button_count" data-action="like" data-size="large" data-show-faces="true" data-share="false"></div>
                                    <h3 class="tieu-de" id="BinhLuanNewsView">Bình luận </h3>                                                                 
                                    <div class="fb-comments" data-href="http://www.noingoaithathoangson.com<%=Request.RawUrl %>" data-width="100%"></div>
                                                         
                                </div>
                            </div>
    </section>


    <ctl:Product ID="ctlSPLQ" runat="server" Title="Sản phẩm cùng loại" Limit="4" />   

    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=<%= FacebookAPI.App_id %>";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

</asp:Content>
