﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/App_Master/Site.master" CodeFile="ProjectView.aspx.cs" Inherits="ProjectView" %>

<%@ Register Src="~/Controller/DanhMucTin.ascx" TagPrefix="uc1" TagName="DanhMucTin" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/front-end.css">
    <link rel="stylesheet" type="text/css" href="/css/reset.css">

    <%--<meta property="fb:app_id" content="<%= FacebookAPI.App_id %>" />--%>
    <%--<meta property="fb:admins" content="570235299813675"/>--%>
    
    
    <meta property="og:title" content="<%=objData["Name"] %>"/>
    <meta property="og:image" content="http://www.noingoaithathoangson.com<%= objData["IMG"] %>" />
    <meta property="og:description" content="<%=objData["DESCRIBE"] %>"/>
    <meta property="og:author" content="yolo"/>
    <meta property="og:keywords" content="<%=objData["Name"] %>"
    <meta property="twitter:url" content="http://www.noingoaithathoangson.com" />
    <meta property="twitter:title"  content="<%=objData["Name"] %>" />
    <meta property="twitter:image" content="http://www.noingoaithathoangson.com<%= objData["IMG"].ToString() %>" />

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="fb-root"></div>
    <div class ="container1">
    <div class="container-fluid">
        <div class="main">
            <div class="row show-grid">
                <div class="news-wraper col-xs-12 col-md-12">
                    <div class="row" id ="HeaderNewsView">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <ul id="NavDetail">
                                <li><a href="/">Trang chủ</a></li>
                                <li><a href="/">Dự án</a></li>
                                <li></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row show-grid">
                        <div class="clearfix visible"></div>
                        <div class="cleft col-xs-12 col-sm-12 col-md-8 col-lg-8 ">

                            <div class="row">
                                <div id="" class="col-xs-12 col-sm-12 col-md-12">
                                    <h3 class="tieu-de" style="margin-top: 10px; margin-bottom: 10px; font-size: 24px;"><%= objData["Name"] %></h3>
                                     <label class="time">Ngày đăng: <%= ((DateTime)objData["CreateDate"]).ToString("dd/MM/yyyy h:mm:ss tt") %> </label>
                                    <p id="article_new" class="sapo" style="font-weight: bold; margin-bottom: 30px; font-size: 19px;">
                                        <%=objData["ADDRESS"]  %>
                                    </p>
                                    <div id ="ImageNewsView">
                                        <img onerror="imgCatchError(this)" src="<%=objData["IMG"] %>" alt="" style="margin: 10px auto 20px; display: block;" />
                                    </div>
                                    <div id="article_new_content" class="content-detail">
                                        <%=objData["Describe"]%>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 50px; margin-bottom: 50px;" id="ShareToolNewsView">

                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <a href="https://www.facebook.com/sharer.php?&u=http://www.noingoaithathoangson.com<%=Request.RawUrl %>"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
                                    <a href="https://twitter.com/intent/tweet?&url=http://www.noingoaithathoangson.com<%=Request.RawUrl %>"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
                                    <a href="https://plus.google.com?url=http://www.noingoaithathoangson.com<%=Request.RawUrl %>"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
                                    <a href="javascript:;" id="btn-save" style="position: static !important" title="Download">
                                        <img src="/images/word-download.png" style="height: 35px;width:auto;" /></a>
                                    <hr />
                                    <h3 class="tieu-de" id="BinhLuanNewsView">Bình luận </h3>
                                    <fb:comments data-id="570235299813675" data-width="100%"></fb:comments>

                                    <%--<div class="fb-comments" data-href="http://113.164.227.242:4083<%=Request.RawUrl %>" data-width="750"></div>--%>
                                </div>
                            </div>
                            <asp:Repeater ID="dtlTinMoi" runat="server" EnableViewState="False">
                                <HeaderTemplate>
                                    <div class="row related-news">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <h3 class="tieu-de">Tin mới hơn</h3>
                                            <ul class="lst-news-r">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li>
                                        <a href="/<%# SystemClass.convertToUnSign2(Eval("Title").ToString()) %>-v<%#Eval("Id")%>" title="<%#Eval("Title") %>">
                                            <div class="img-w">
                                                <img onerror="imgCatchError(this)" src="<%# Eval("ImgUrl") %>" alt="" />
                                            </div>
                                            <div class="re-news-title">
                                                <%# Eval("Title") %>
                                                <span><%# ((DateTime)Eval("DayPost")).ToString("dd/MM/yyy") %></span>
                                            </div>
                                        </a>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </div>
                            </div>
                                </FooterTemplate>
                            </asp:Repeater>
                            <div class="row related-news">
                                <asp:Repeater ID="dtlTinCu" runat="server" EnableViewState="False">
                                    <HeaderTemplate>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <h3 class="tieu-de">Tin cũ hơn</h3>
                                            <ul class="lst-news-r">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <a href="/<%# SystemClass.convertToUnSign2(Eval("Title").ToString()) %>-v<%#Eval("Id")%>" title="<%#Eval("Title") %>">
                                                <div class="img-w">
                                                    <img onerror="imgCatchError(this)" src="<%# Eval("ImgUrl") %>" alt="" />
                                                </div>
                                                <div class="re-news-title">
                                                    <%# Eval("Title") %>
                                                    <span><%# ((DateTime)Eval("DayPost")).ToString("dd/MM/yyy") %></span>
                                                </div>
                                            </a>
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                </div>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="cright hidden-xs   col-sm-12 col-md-4 col-xs-4">
                            <uc1:DanhMucTin ID="danhMuc" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    
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
