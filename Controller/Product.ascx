<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Product.ascx.cs" Inherits="Controller_Product" %>

<section class="container1 product">
    <asp:Repeater runat="server" ID="dtlProduct">
        <ItemTemplate>
            <div class="col-sm-3 pditem">
                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-p<%#Eval("ID")%>" title="<%# Eval("NAME") %>">
                <img src="<%# Eval("IMG") %>" alt="<%# Eval("NAME") %>" /></a>
                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-p<%#Eval("ID")%>" title="<%# Eval("NAME") %>">
                    <h5><%# Eval("NAME") %></h5></a>
                <p><%# Eval("DESCRIBE") %></p>
                <div class="price"><%# Price(Eval("PRICE").ToString()) %></div>
                <a class="btn btn-user3" href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-p<%#Eval("ID")%>" title="<%# Eval("NAME") %>" title="more">Xem chi tiết ></a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    
<%--
    <div class="col-sm-3 pditem">
        <img src="/Images/Protect/san pham 2.png" alt="Cổng nhôm đúc 001" />
        <h5>Cổng nhôm đúc 002</h5>
        <p>Thông tin mô tả sản phẩm, ngắn gọn</p>
        <div class="price">55,000,000 đ</div>
        <a class="btn btn-user3" href="#" title="more">Xem chi tiết ></a>
    </div>

    <div class="col-sm-3 pditem">
        <img src="/Images/Protect/san pham 3.png" alt="Cổng nhôm đúc 001" />
        <h5>Cổng nhôm đúc 003</h5>
        <p>Thông tin mô tả sản phẩm, ngắn gọn</p>
        <div class="price">72,000,000 đ</div>
        <a class="btn btn-user3" href="#" title="more">Xem chi tiết ></a>
    </div>

    <div class="col-sm-3 pditem">
        <img src="/Images/Protect/san pham 4.png" alt="Cổng nhôm đúc 001" />
        <h5>Cổng nhôm đúc 004</h5>
        <p>Thông tin mô tả sản phẩm, ngắn gọn</p>
        <div class="price">75,000,000 đ</div>
        <a class="btn btn-user3" href="#" title="more">Xem chi tiết ></a>
    </div>

    <div class="col-sm-3 pditem">
        <img src="/Images/Protect/san pham 5.png" alt="Cổng nhôm đúc 001" />
        <h5>Đèn trang trí 001</h5>
        <p>Thông tin mô tả sản phẩm, ngắn gọn</p>
        <div class="price">25,000,000 đ</div>
        <a class="btn btn-user3" href="#" title="more">Xem chi tiết ></a>
    </div>

    <div class="col-sm-3 pditem">
        <img src="/Images/Protect/san pham 6.png" alt="Cổng nhôm đúc 001" />
        <h5>Đèn trang trí 002</h5>
        <p>Thông tin mô tả sản phẩm, ngắn gọn</p>
        <div class="price">30,000,000 đ</div>
        <a class="btn btn-user3" href="#" title="more">Xem chi tiết ></a>
    </div>

    <div class="col-sm-3 pditem">
        <img src="/Images/Protect/san pham 7.png" alt="Cổng nhôm đúc 001" />
        <h5>Đèn trang trí 003</h5>
        <p>Thông tin mô tả sản phẩm, ngắn gọn</p>
        <div class="price">28,000,000 đ</div>
        <a class="btn btn-user3" href="#" title="more">Xem chi tiết ></a>
    </div>

    <div class="col-sm-3 pditem">
        <img src="/Images/Protect/san pham 8.png" alt="Cổng nhôm đúc 001" />
        <h5>Đèn trang trí 004</h5>
        <p>Thông tin mô tả sản phẩm, ngắn gọn</p>
        <div class="price">15,000,000 đ</div>
        <a class="btn btn-user3" href="#" title="more">Xem chi tiết ></a>
    </div>--%>
</section>