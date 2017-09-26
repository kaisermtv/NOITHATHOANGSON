<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Controller_Header" %>

<header>
    <div class="container1">
    <div class="col-sm-3"></div>
    <div class="col-sm-6">
        <h1><%= GetSetting("Name") %></h1>
    </div>
    <div class="col-sm-3">
        <h3>Hotline: <%= GetSetting("Hotline") %></h3>
    </div>
    <div class="col-sm-12">
        <center><img src="/images/slogan.png" style=" width:250px;"/></center>
    </div>
    </div>
</header>
