﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Master/Site.master" CodeFile="ProjectView.aspx.cs" Inherits="ProductView" %>
<%@ Register Src="~/Controller/Product.ascx" TagPrefix="ctl" TagName="Product" %>
<%@ Register src="Controller/Project.ascx" tagname="Project" tagprefix="uc1" %>
<%@ Register Src="~/Controller/IMGModal.ascx" TagPrefix="ctl" TagName="IMGModal" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="canonical" href="<%= getUrlCanonical() %>" />
    <meta property="og:title" content="<%=objData["NAME"] %>"/>
    <meta property="og:type" content="Product" />
    <meta property="og:image" content="http://www.noingoaithathoangson.com<%= objData["IMG"] %>" />
    <meta property="og:url" content="<%= getUrlCanonical() %>" />
    <meta property="og:description" content="<%=objData["ADDRESS"] %>"/>
    <meta property="og:author" content="hoangson"/>
    <meta property="og:keywords" content="<%=objData["NAME"] %>" />
    <meta property="twitter:url" content="<%= getUrlCanonical() %>" />
    <meta property="twitter:title"  content="<%=objData["NAME"] %>" />
    <meta property="twitter:image" content="http://www.noingoaithathoangson.com<%= objData["IMG"].ToString() %>" />

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
    <section class="container1 productview">
        <div style="display: table;width:100%">
            <div class="col-sm-4">
                <img id="myImg" src="<%= objData["IMG"] %>" alt="<%=objData["NAME"] %>" />
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

        <ctl:IMGModal runat="server" />
        <script>
            $(".panel-body img").click(function () {
                showimg($(this).attr('src'), $(this).attr('alt'));
            })

            $("#myImg").click(function () {
                showimg($(this).attr('src'), $(this).attr('alt'));
            })
        </script>

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
       
    <uc1:Project ID="Project1" runat="server" />

</asp:Content>
