<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/websocket/sockjs-0.3.4.js"></script>
    <script type="text/javascript" src="${ctxStatic}/websocket/stomp.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery-marquee/1.4.0/jquery.marquee.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <title>展示机客户端</title>
    <object classid="CLSID:76A64158-CB41-11D1-8B02-00600806D9B6" id="locator"
            style="display:none;visibility:hidden"></object>
    <object classid="CLSID:75718C9A-F029-11d1-A1AC-00C04FB6C223" id="foo"
            style="display:none;visibility:hidden"></object>
    <style>
        .marquee {
            width: 300px;
            overflow: hidden;
            border: 1px solid #ccc;
            background: #ccc;
        }
    </style>
    <script type="text/javascript">
        var sIPAddr = ""; // 本机ip地址
        var service = locator.ConnectServer();
        service.Security_.ImpersonationLevel = 3;
        service.InstancesOfAsync(foo, 'Win32_NetworkAdapterConfiguration');
        var $mq; // 滚动消息
        $.cookie.json = true;

        var stompClient = null;
        function connect() {
            var socket = new SockJS("/websocket");
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                console.log("Connected: " + frame);
                stompClient.subscribe("/queue/" + $("#ip").val(), function (message) {
                    var obj = JSON.parse(message.body);
                    var command = obj.command;
                    if (command == "ping") {
                        sendStatus();
                    } else if (command == "np") {
                        $.cookie("notice", obj);
                        notice_publish();
                    } else if (command == "nup") {
                        $.removeCookie("notice");
                        notice_undo_publish();
                    }
                });
            });
        }

        function sendStatus() {
            // 终端状态根据数据字典定义，1：空闲，2：播放，3：关闭
            stompClient.send("/cabinet/queue", {}, JSON.stringify({
                'clientIp': encodeURIComponent($("#ip").val()),
                'status': encodeURIComponent("1")
            }));
        }

        function notice_publish() {
            // 消息发布
            var obj = $.cookie("notice");
            if (typeof(obj) != "undefined"){
                var myDate = new Date();
                var currTime = myDate.getTime();
                if(obj.startTime <= currTime && obj.endTime >= currTime){
                    $(".marquee").html(obj.content);
                    $mq = $(".marquee").marquee({
                        duration: 15000
                    });
                }
            }

        }

        // 消息撤销
        function notice_undo_publish() {
            if (typeof($.cookie("notice")) == "undefined"){
                $(".marquee").html("&nbsp;");
                $mq = $(".marquee").marquee({
                    duration: 15000
                });
            }
        }

        $(function () {
            connect();
            notice_publish();
            notice_undo_publish();
        });

    </script>
    <script FOR="foo" EVENT="OnObjectReady(objObject,objAsyncContext)" LANGUAGE="JScript">
        if (objObject.IPEnabled != null && objObject.IPEnabled != "undefined" && objObject.IPEnabled == true) {
            if (objObject.IPEnabled && objObject.IPAddress(0) != null && objObject.IPAddress(0) != "undefined")
                sIPAddr = objObject.IPAddress(0);
        }
    </script>
    <script FOR="foo" EVENT="OnCompleted(hResult,pErrorObject, pAsyncContext)" LANGUAGE="JScript">
        $("#ip").val(sIPAddr);
    </script>
</head>
<body>
<input type="hidden" name="ip" id="ip">
<div class="marquee">&nbsp;</div>
</body>
</html>
