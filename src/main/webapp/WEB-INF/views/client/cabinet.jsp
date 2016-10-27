<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/websocket/sockjs-0.3.4.js"></script>
    <script type="text/javascript" src="${ctxStatic}/websocket/stomp.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery-marquee/1.4.0/jquery.marquee.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctxStatic}/html2canvas/0.4.1/html2canvas.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/moment/moment.min.js"></script>

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
                    } else if(command == "screenshot"){
                        screenShot();
                    } else if(command == "shutdown"){
                        shutDown();
                    } else if (command == "np") {
                        $.cookie("notice", obj);
                        notice_publish();
                    } else if (command == "nup") {
                        $.removeCookie("notice");
                        notice_undo_publish();
                    } else if(command == "tp"){
                        $.cookie("tactic", obj);
                        tactic_publish();
                    } else if(command == "tup"){
                        $.removeCookie("tactic");
                        tactic_undo_publish();
                    }
                });
            }, function () {
                connect();
            });
        }

        // 发送客户端状态
        function sendStatus() {
            // 终端状态根据数据字典定义，1：空闲，2：播放，3：关闭
            stompClient.send("/cabinet/queue", {}, JSON.stringify({
                'clientIp': encodeURIComponent($("#ip").val()),
                'status': encodeURIComponent("1")
            }));
        }
        
        // 消息发布
        function notice_publish() {
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

        // 策略发布
        function tactic_publish(){
            window.setInterval(function () {
                monitor();
            }, 60000);
        }

        // 监控节目时间
        function monitor() {
            var obj = $.cookie("tactic");
            var myday = moment().format("YYYYMMDD");
            var mytime = moment().format("Hms");
            if(obj.startDate <= myday && obj.endDate >= myday){
                for(var i = 0; i < obj.detailList.length; i ++){
                    var program = obj.detailList[i];
                    if(program.startTime <= mytime && program.endTime >= mytime){
                        $("#mainFrame").src = "${ctx}/program/program/preview?id=" + program.id;
                        $("#mainFrame").show();
                    }
                }
            }
        }

        // 策略撤销
        function tactic_undo_publish() {
            if (typeof($.cookie("tactic")) == "undefined"){
                $("#mainFrame").src = "";
                $("#mainFrame").hide();
            }
        }

        // 关机
        function shutDown() {
            var shell = new ActiveXObject("WScript.Shell");
            shell.Run("shutdown /s /t 60"); // 60秒后关机
        }

        // 截屏
        function screenShot() {
            html2canvas(document.body, {
                allowTaint: true,
                taintTest: false,
                onrendered: function (canvas) {
                    canvas.id = "mycanvas";
                    var dataUrl = canvas.toDataURL(); //生成base64图片数据
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "${ctxc}/client/saveScreenShotPic",
                        data: {
                            imgStr: dataUrl,
                            ip : $("#ip").val()
                        },
                        dataType: "json",
                        success: function (data) {
                            console.log(data);
                        }
                    });
                }
            });

        }
        
        $(function () {
            connect();
            notice_publish();
            notice_undo_publish();
            tactic_publish();
            tactic_undo_publish();
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
<input type="button" value="时间" onclick="test();">
<iframe id="mainFrame" name="mainFrame" src="" style="overflow:visible;" scrolling="yes" frameborder="no" width="100%" height="650"></iframe>
</body>
</html>
