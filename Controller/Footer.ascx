<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="Controller_Footer" %>
<footer>
    <div class="container1 ftcontainer">
        <div class="ftlogo">
            <a href="/"><img src="/images/logo.png" alt="Logo"></a>
        </div>
        <div class="ftinfo">
            <h3><%= GetSetting("Name") %></h3>
            <p>Mã số thuế: <%= GetSetting("MaSoThue") %></p>
            <p>Địa chỉ: <%= GetSetting("Address") %></p>
            <p>Địa chỉ showroom: <%= GetSetting("AddressShowroom") %></p>
            <p>Hotline: <%= GetSetting("Hotline") %></p>
        </div>
    </div>
    <div class="ftstatus">
        Online: <%= SystemClass.Online %> Trong ngày: <%= SystemClass.OnlineDay %> Trong tháng: 550 Tổng lượt truy cập: 123 900 
    </div>
</footer>
