<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Contact.ascx.cs" Inherits="Controller_Contact" %>

<section class="container1 contact">
    <h2>Liên hệ</h2>
    <div class="row">
        <div class="col-sm-4">
            <div class="box">
                <div class="box-left">
                    <img src="/Images/Dia diem.png" />
                </div>
                <div class="box-right">
                    Địa chỉ: Khối 4 thị trấn Quán Hành, huyện Nghi Lộc, tỉnh Nghệ An
	 <br />
                    Địa chỉ Showroom: Đại lộ Lê Nin, xóm 13 xã Nghi Phú, thành phố vinh, tỉnh Nghệ An
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
                    noingoaithathongson@gmail.com
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
                    noingoaithathongson@gmail.com
                </div>
            </div>
        </div>
    </div>

    <div  style="margin-top: 25px; overflow: auto;">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d15108.540178406187!2d105.65878408573835!3d18.79213411671467!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1505373680861" width="100%" height="315" frameborder="0" style="border: 0" allowfullscreen></iframe>
    </div>
    <!--End Rows-->

    <div class="row box-contact">
        <div class="col-sm-6">
            <ul>
                <li>
                    <input type="text" placeholder="* Họ và tên" width="100%" />
                </li>
                <li>
                    <input type="text" placeholder="* Địa chỉ" width="100%" />
                </li>
                <li>
                    <input type="text" placeholder="Số điện thoại" width="100%" />
                </li>
            </ul>
        </div>
        <div class="col-sm-6">
            <ul>
                <li>
                    <textarea placeholder="Nội dung" width="100%"> </textarea>
                </li>
                <li>
                    <button type="button" class="btn btn-info">GỬI THÔNG TIN</button></li>
            </ul>
        </div>
    </div>
    <!--End rows-->

</section>
