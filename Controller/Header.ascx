﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Controller_Header" %>

<header>
    <div class="container1">

    <div class="col-sm-9" style="text-align:left;">
        <div style="float:left;margin-right:20px;height:100%">
        <a href="/" ><img src="/images/logo.png" alt="Logo" style="width:auto"></a>
            </div>
        <div style="width:100%;">
        <h1><%= GetSetting("Name") %></h1>
        <p><img src="/images/diachi.jpg" style=" width:20px; height:auto;" /> Địa chỉ: <%=GetSetting("Address") %></p>
        <p><img src="/images/diachi.jpg" style=" width:20px; height:auto;"/> Địa chỉ Showroom: <%=GetSetting("AddressShowroom") %></p>
        <p><img src="/images/DienThoai.png" style=" width:20px; height:auto;"/> Số điện thoại: <%=GetSetting("Phone") %></p>
            </div>
    </div>
    <div class="col-sm-3" style="text-align:right;">
        <img src="/images/hotline.gif" alt="hotline" style="width:200px;" />
    </div>    
    </div>
</header>
