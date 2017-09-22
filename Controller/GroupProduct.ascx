<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GroupProduct.ascx.cs" Inherits="Controller_GroupProduct" %>

<section class="cateloge container1">
    <asp:Repeater ID="dtlCateloge" runat="server">
        <ItemTemplate>
            <div class="col-sm-3 gpItem">
                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-gp<%#Eval("ID")%>" title="<%# Eval("NAME") %>">
                    <h5><%# Eval("NAME") %></h5>
                </a>
                <a href="/<%# SystemClass.convertToUnSign2(Eval("NAME").ToString()) %>-gp<%#Eval("ID")%>" title="<%# Eval("NAME") %>">
                    <img src="<%# Eval("IMG") %>" alt="<%# Eval("NAME") %>" /></a>
                <p><%# Eval("DESCRIBE") %></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</section>
