<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/websocket/sockjs-0.3.4.js"></script>
    <script type="text/javascript" src="${ctxStatic}/websocket/stomp.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery-marquee/1.4.0/jquery.marquee.min.js"></script>
    <title>展示机客户端</title>
    <style>
        .marquee {
            width: 300px;
            overflow: hidden;
            border: 1px solid #ccc;
            background: #ccc;
        }
    </style>
    <script type="text/javascript">

        var stompClient = null;
        function connect() {
            var socket = new SockJS("/websocket");
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                console.log("Connected: " + frame);
                stompClient.subscribe("/queue/${ip}", function (message) {
                    var command = decodeURIComponent(JSON.parse(message.body).command);
                    if(command == "ping"){
                        sendStatus();
                    }else if(command == "np"){
                        notice_publish();
                    }else if(command == "nup"){
                        notice_undo_publish();
                    }
                });
            });
        }

        function sendStatus() {
            // 终端状态根据数据字典定义，1：空闲，2：播放，3：关闭
            stompClient.send("/cabinet/queue", {}, JSON.stringify({
                'clientIp': encodeURIComponent("${ip}"),
                'status': encodeURIComponent("1")
            }));
        }

        var $mq = $(".marquee").marquee();
        function notice_publish() {
            // 消息发布
            var myDate = new Date();
            myDate.getTime();
            $mq.marquee("resume");
        }

        function notice_undo_publish() {
            // 消息撤销
            $mq.marquee("pause");
        }

        $(function () {
            connect();

        });


    </script>
</head>
<body>
<input type="text" name="id" value="${ip}">
<div class="marquee">jQuery marquee is the best marquee plugin in the world</div>
</body>
</html>
