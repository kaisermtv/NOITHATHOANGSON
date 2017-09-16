<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GroupProduct.ascx.cs" Inherits="Controller_GroupProduct" %>

<section class="cateloge container1">
    <asp:Repeater ID="dtlCateloge" runat="server">
        <ItemTemplate>
            <div class="col-sm-3 gpItem">
                <h5><%# Eval("") %></h5>
                <img src="<%# Eval("") %>" alt="<%# Eval("") %>" />
                <p><%# Eval("") %></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <div class="col-sm-3 gpItem">
        <h5>Sàn gỗ</h5>
        <img src="/Images/POST/San go.png" alt="Sàn gỗ>" />
        <p>Ván sàn Châu Âu -Chất lượng Cao và phù hợp nhất trên thị trường hiện nay. Giao hàng nhanh 24h · Đổi trả miễn phí</p>
    </div>
    <div class="col-sm-3 gpItem">
        <h5>Sàn nhựa</h5>
        <img src="/Images/POST/san nhua.png" alt="Sàn nhựa" />
        <p>Sàn nhựa tại thành phố Vinh - Nhà phân phối sàn nhựa lớn nhất tại Việt Nam, Cung cấp mua bán sàn nhựa vân gỗ, sàn nhựa hèm khóa, sàn nhựa pvc</p>
    </div>
    <div class="col-sm-3 gpItem">
        <h5>Cổng nhôm đúc</h5>
        <img src="/Images/POST/Cong nhom duc.png" alt="Cổng nhôm đúc" />
        <p>Chuyên tư vấn, thiết kế, thi công các sản phẩm Nhôm Đúc trang trí nội ngoại thất. Công Nghệ Hiện Đại · Tư Vấn Miễn Phí · Bảo Hành Trọn Đời</p>
    </div>
    <div class="col-sm-3 gpItem">
        <h5>Đèn trang trí</h5>
        <img src="/Images/POST/den.png" alt="Đèn trang trí" />
        <p>Đèn trang trí -Chất lượng Cao và phù hợp nhất trên thị trường hiện nay. Giao hàng nhanh 24h · Đổi trả miễn phí</p>
    </div>
</section>
