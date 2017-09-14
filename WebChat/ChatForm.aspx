<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChatForm.aspx.cs" Inherits="WebChat_ChatForm" %>


<!DOCTYPE html>
<html>
<head><title>Chat</title>
    <meta name="robots" content="noindex, nofollow" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Chat" />
    <meta name="keywords" content="Chat" />
    <meta charset="utf-8" />
    <style>
        body {
            background: #fff;
            font-size: 15px;
            margin: 0px;
            word-wrap: break-word;
            overflow: none;
            color: #666;
            line-height: 24px;
        }

        a {
            text-decoration: none;
            color: #06C;
        }

            a:hover {
                color: #0CF;
            }

        .nhanvien {
            background: #F7F7F7;
            display: inline-block;
            width: 97%;
            text-align: left;
            padding: 1px 2px 8px 5px;
            border-bottom: 1px #ccc solid;
            color: #333;
            margin-bottom: 8px;
        }

            .nhanvien .img {
                float: left;
                width: 64px;
                height: 64px;
                margin: 0px 5px 0px 0px;
            }

        .loichao {
            display: inline-block;
            width: 97%;
            text-align: left;
            padding: 2px 2px 8px 5px;
        }

        .khach {
            line-height: 23px;
            display: inline-block;
            width: 97%;
            text-align: left;
            padding: 2px 2px 4px 5px;
            border-top: 1px #ccc solid;
            color: #333;
        }

            .khach .img {
                background: #263f68;
                float: left;
                width: 32px;
                height: 32px;
                margin: 2px 5px 0px 0px;
            }

        .admin {
            line-height: 23px;
            display: inline-block;
            width: 97%;
            text-align: right;
            padding: 2px 5px 4px 2px;
            border-top: 1px #ccc solid;
            color: #333;
        }

            .admin .img {
                float: right;
                width: 32px;
                height: 32px;
                margin: 2px 0px 0px 5px;
            }

        img {
            border: 3px #ccc solid;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        #hopchat {
            position: fixed;
            bottom: 0px;
            right: 0px;
            width: 100%;
            text-align: left;
        }

        #ndht span {
            color: #CCC;
            font-size: 12px;
        }

            #ndht span a {
                color: #CCC;
            }

                #ndht span a:hover {
                    color: #000;
                }

        .danhan {
            border: 0px !important;
            float: none !important;
            width: 11px !important;
            height: 9px !important;
        }

        body::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 0px rgba(0,0,0,0.0);
            background-color: #3b3b3b;
        }

        body::-webkit-scrollbar {
            width: 1px;
            background-color: #3b3b3b;
        }

        body::-webkit-scrollbar-thumb {
            background-color: #3b3b3b;
        }

        @media screen and (max-device-width: 480px) {
            body {
                -webkit-text-size-adjust: none;
            }
        }

        input {
            border-radius: 0;
        }
    </style>
    <script src="/js/socket.io.js"></script>
<script>
    var socket = io.connect('http://localhost:<%= ChatSever.listenport.ToString() %>',null);

    socket.on('news', function (data) {
        console.log(data);
        socket.emit('my other event', { my: 'data' });
    });
</script>

    <script>



        var pley = true;
        function dl() {
            if (document.getElementById('ndc').value != '')
            {
                document.getElementById('ndc').style.color = '#fff';
                document.getElementById('ndht').innerHTML = document.getElementById('ndht').innerHTML.replace('<br><br><br>', '') + '<div class="khach"><img src="/admin/noavatar.png" alt="" class="img" />' + document.getElementById('ndc').value.replace(/<\/?[^>]+(>|$)/g, '') + '<br /><span>Đang gửi...</span></div><br><br><br>';
                window.scroll(0, 10000);
            }
        }

        window.onload = function () {

            var messages = [];
            //var socket = io.connect('http://localhost');
            //var field = document.getElementById("field");
            //var sendButton = document.getElementById("send");
            //var content = document.getElementById("content");

            //socket.on('message', function (data) {
            //    if (data.message) {
            //        messages.push(data.message);
            //        var html = '';
            //        for (var i = 0; i < messages.length; i++) {
            //            html += messages[i] + '<br />';
            //        }
            //        content.innerHTML = html;
            //    } else {
            //        console.log("There is a problem:", data);
            //    }
            //});

            //sendButton.onclick = function () {
            //    var text = field.value;
            //    socket.emit('send', { message: text });
            //};

        }
    </script>
</head>
<body>
    <div id="main">
        <div id="loichaobatdau">
            <div class="nhanvien">
                <img src="/images/avatar.jpg" style="width: 64px; height: 64px;" class="img" /><span style="font-size: 18px; color: black; font-weight: bold;"><img src="/admin/online.gif" alt="" style="border: 0px; width: 16px; height: 16px; margin-top: 4px;" class="img" />
                    <a href="/admin/?menu=setup" target="_top">Chưa Đặt Tên</a></span><br />
                Hỗ trợ trực tuyến</div>
            <div class="loichao">
                Chào mừng bạn đã đến với trang web.
                <br />
                Nếu cần thông tin hãy chat với mình nhé.
            </div>
        </div>
        <div id="ndht">
            <div class="admin">
                <img src="/images/avatar.jpg" class="img" />Chào bạn :)<br />
                <span>✓ Đã gửi lúc 10:46 20-06</span></div>
            <div class="admin">
                <img src="/images/avatar.jpg" class="img" />Có gì bạn cứ chat với mình nhé.<br />
                <span>✓ Đã gửi lúc 10:46 20-06</span></div>
            <div class="khach">
                <img src="/admin/noavatar.png" alt="" class="img" />svvsdv<br />
                <span>✓ Đã gửi lúc 10:46 20-06</span></div>
            <div class="admin">
                <img src="/images/avatar.jpg" class="img" />Chào bạn, bạn cho mình xin sđt nhé.<br />
                <span>✓ Đã gửi lúc 10:46 20-06</span></div>
            <div class="admin">
                <img src="/images/avatar.jpg" class="img" />svsdvsdv<br />
                <span>✓ Đã gửi lúc 10:47 20-06</span></div>
            <br>
            <br>
            <br>
        </div>
    </div>
    <div id="hopchat" style="height: 46px;">
        <form id="formchat" style="width: 100%; height: 40px; background: #3b3b3b; padding: 6px 0px 0px 0px;" name="formchat" onsubmit="dl()" method="post">
            <input spellcheck="false" id="ndc" type="text" maxlength="500" name="noidung" style="width: 76%; height: 20px; padding: 6px 0px 6px 3px; float: left; background: #fff;" placeholder="Nhập nội dung..." autocomplete="off" />
            <input id="gui" name="gui" style="width: 20%; height: 36px; padding-left: 3px; display: inline; float: right;" type="submit" value="Gửi" /><input name="tieudedangxem" type="hidden" value="’ encodeURIComponent(document.title) ’" />
            <input name="trangme" type="hidden" value="’ encodeURIComponent(top.location) ’" />
            <input name="trangtruoc" type="hidden" value="’ encodeURIComponent(document.referrer) ’" />
        </form>
    </div>
    <script> window.scroll(0, 10000);</script>
    <%--<script>
        (function (i, s, o, g, r, a, m)
        {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () { (i[r].q = i[r].q || []).push(arguments) }, i[r].l = 1 * new Date(); a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })
        (window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-63958904-2', 'auto');
        ga('send', 'pageview');

    </script>--%>
</body>
</html>
