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
        section {
            display: block;
            float: left;
            width: 98%;
            height: 98%;
            overflow: hidden;
            padding: 10px;
            margin: 0;
            border: 2px solid #ddd;
            cursor: pointer;
        }

        section p {
            font-weight: bold;
            text-align: center;
            margin: 0;
        }

        section:-webkit-full-screen {
            float: none;
            width: 98%;
            height: 98%;
            padding: 10px;
            margin: 10px;
            border: 0 none;
        }

        section:-moz-full-screen {
            float: none;
            width: 98%;
            height: 98%;
            padding: 10px;
            margin: 10px;
            border: 0 none;
        }

        section:-ms-full-screen {
            float: none;
            width: 98%;
            height: 98%;
            padding: 10px;
            margin: 10px;
            border: 0 none;
        }

        section:-o-full-screen {
            float: none;
            width: 98%;
            height: 98%;
            padding: 10px;
            margin: 10px;
            border: 0 none;
        }

        section:full-screen {
            float: none;
            width: 98%;
            height: 98%;
            padding: 10px;
            margin: 10px;
            border: 0 none;
        }
    </style>
    <script type="text/javascript">
        var pfx = ["webkit", "moz", "ms", "o", ""];
        function RunPrefixMethod(obj, method) {
            var p = 0, m, t;
            while (p < pfx.length && !obj[m]) {
                m = method;
                if (pfx[p] == "") {
                    m = m.substr(0, 1).toLowerCase() + m.substr(1);
                }
                m = pfx[p] + m;
                t = typeof obj[m];
                if (t != "undefined") {
                    pfx = [pfx[p]];
                    return (t == "function" ? obj[m]() : obj[m]);
                }
                p++;
            }
        }

        $(function () {
            var f = document.getElementById("fullscreen");
            f.onclick = function() {
                if (RunPrefixMethod(document, "FullScreen") || RunPrefixMethod(document, "IsFullScreen")) {
                    RunPrefixMethod(document, "CancelFullScreen");
                }
                else {
                    RunPrefixMethod(f, "RequestFullScreen");
                }
            };
        });


    </script>
</head>
<body>
<section id="fullscreen">
    <marquee direction="right" loop="40" width="640px"><span style="color: black">滚动新闻</span></marquee>
    <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640px" height="264px"
           data-setup="{}" autoplay loop>
        <source src="http://vjs.zencdn.net/v/oceans.mp4" type="video/mp4">
        <source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm">
        <source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg">
    </video>
</section>

</body>
</html>
