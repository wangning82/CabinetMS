<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/websocket/sockjs-0.3.4.js"></script>
    <script type="text/javascript" src="${ctxStatic}/websocket/stomp.js"></script>
    <script type="text/javascript" src="${ctxStatic}/video.js-5.10.4/ie8/videojs-ie8.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/video.js-5.10.4/video.min.js"></script>
    <link href="${ctxStatic}/video.js-5.10.4/video-js.min.css" rel="stylesheet">
    <title>展示机客户端</title>
    <style>

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

        $(function () {
            connect();
        });


    </script>
</head>
<body>
<input type="text" name="id" value="${ip}">
<marquee direction="right" loop="40" width="640px"><span style="color: black">滚动新闻</span></marquee>
<video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640px" height="264px"
       data-setup="{}" autoplay loop>
    <source src="http://vjs.zencdn.net/v/oceans.mp4" type="video/mp4">
    <source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm">
    <source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg">
</video>


</body>
</html>
