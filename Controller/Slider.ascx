<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Slider.ascx.cs" Inherits="Controller_Slider" %>
<% if(count > 0){ %>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <asp:Repeater runat="server" ID="dtlIndicators" >
        <HeaderTemplate><% index = 0; %></HeaderTemplate>
        <ItemTemplate>
            <li data-target="#myCarousel" data-slide-to="<%= index %>"<%= index++ ==0?" class=\"active\"":"" %>></li>
        </ItemTemplate>
    </asp:Repeater>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
      <asp:Repeater runat="server" ID="dtlSlider">
          <HeaderTemplate><% index = 0; %></HeaderTemplate>
          <ItemTemplate>
              <div style="vertical-align:central;text-align:center;" class="item<%= index++ ==0?" active":"" %>">
                  <img src="<%# Eval("IMG") %>" alt="<%# Eval("TITLE") %>">
                  <div style="width:100%;height:100%;z-index:1000;color:white;text-align:center;vertical-align:central;position:absolute;top:0px;text-shadow: -1px 0 black, 0 1px black,1px 0 black, 0 -1px black">
                      <h2><%# Eval("TITLE") %></h2>
                  </div>
                  
              </div>
          </ItemTemplate>
      </asp:Repeater>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<% } %>