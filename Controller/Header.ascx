<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Controller_Header" %>

<header>
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8"><h1><%= GetSetting("Name") %></h1></div>
<div class="col-sm-2"><h3>Hotline: 02386 288 555</h3></div>
<div class="row">
<div class="col-sm-12"><center><img src="images/slogan.png" style=" width:250px;"/></center></div>
</div>
</div>  
</header>