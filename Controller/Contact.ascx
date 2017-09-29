<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Contact.ascx.cs" Inherits="Controller_Contact" %>

<section class="container1 contact" id="contact"> 
    <h2>Liên hệ</h2>
    <div style="width:100%;display:table;">
        <div class="col-sm-4">
            <div class="box">
                <div class="box-left">
                    <img src="/Images/Dia diem.png" />
                </div>
                <div class="box-right">
                    Địa chỉ: <%= GetSetting("Address") %>
	 <br />
                    Địa chỉ Showroom: <%= GetSetting("AddressShowroom") %>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="box">
                <div class="box-left">
                    <img src="/Images/email.png" />
                </div>
                <div class="box-right">
                    <b>Địa chỉ Email</b>
                <br />
                    <%= GetSetting("Email") %>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="box">
                <div class="box-left">
                    <img src="/Images/dien thoai.png" />
                </div>
                <div class="box-right">
                    <b>Số điện thoại</b>
                <br />
                    <%= GetSetting("Phone") %>
                </div>
            </div>
        </div>
    </div>

    <div  style="margin-top: 25px; overflow: auto; width:100%;">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d15108.540178406187!2d105.65878408573835!3d18.79213411671467!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1505373680861" width="100%" height="315" frameborder="0" style="border: 0" allowfullscreen></iframe>
    </div>
    <!--End Rows-->

    <div style="width:100%;display:table;" class="box-contact">
        <form method="post" action="/lien-he">
        <div class="col-sm-6">
            <ul>
                <li>
                    <input type="text" name="txtHoVaTen" placeholder="* Họ và tên" width="100%" />
                </li>
                <li>
                    <input type="text" name="txtDiaChi" placeholder="* Địa chỉ" width="100%" />
                </li>
                <li>
                    <input type="text" name="txtPhone" placeholder="Số điện thoại" width="100%" />
                </li>
            </ul>
        </div>
        <div class="col-sm-6">
            <ul>
                <li>
                    <textarea name="txtContent" placeholder="Nội dung" width="100%"> </textarea>
                </li>
                <li>
                    <input type="submit" class="btn btn-info" value="GỬI THÔNG TIN" /></li>
            </ul>
        </div>
            </form>
    </div>
    <!--End rows-->

</section>
