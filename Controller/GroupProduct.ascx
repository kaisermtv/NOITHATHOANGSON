<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GroupProduct.ascx.cs" Inherits="Controller_GroupProduct" %>

<section class="cateloge container1">
    <asp:Repeater ID="dtlCateloge" runat="server">
        <ItemTemplate>
            <div class="col-sm-3 gpItem">
                <h5><%# Eval("NAME") %></h5>
                <img src="<%# Eval("IMG") %>" alt="<%# Eval("NAME") %>" />
                <p><%# Eval("DESCRIBE") %></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>
