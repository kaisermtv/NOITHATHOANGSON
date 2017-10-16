<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="Controller_Footer" %>
<footer>
    <div class="container1 ftcontainer">
        <div class="ftlogo">
            <a href="/"><img src="/images/logoFooter.png" alt="Logo"></a>
        </div>
        <div class="ftinfo">
            <h3><%= GetSetting("Name") %></h3>
            <p>Mã số thuế: <%= GetSetting("MaSoThue") %></p>
            <p>Địa chỉ: <%= GetSetting("Address") %></p>
            <p>Địa chỉ showroom: <%= GetSetting("AddressShowroom") %></p>
            <p>Hotline: <%= GetSetting("Hotline") %></p>
            <p>Số điện thoại: <%= GetSetting("Phone") %></p>

            
        </div>
        <div style="float:right;margin-bottom:20px;" class="fb-page" data-href="https://www.facebook.com/sangosannhuadenledhoangson/" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/sangosannhuadenledhoangson/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/sangosannhuadenledhoangson/">Đèn led cao cấp - Sàn gỗ, sàn nhựa Hoàng Sơn</a></blockquote></div>

        <%--<a href="https://www.facebook.com/sangosannhuadenledhoangson/" style="float:right;margin-bottom:20px;" title="fakebook page" class="btn btn-facebook btn-social" ><i class="fa fa-facebook fa-fw"></i>Facebook Page</a>--%>
    </div>
    <div class="ftstatus">
        Online: <%= SystemClass.Online %>   .:.   Trong ngày: <%= SystemClass.OnlineDay %>   .:.   Trong tháng: <%= SystemClass.OnlineMonth %>   .:.   Tổng lượt truy cập: <%= SystemClass.OnlineAll %>
    </div>
</footer>
