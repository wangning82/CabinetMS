<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <!-- Website Design By: www.happyworm.com -->
    <title>Demo : jPlayer as a video player</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${ctxStatic}/static/jquery-jplayer/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />
    <script src="${ctxStatic}/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctxStatic}/static/jquery-jplayer/jplayer/jquery.jplayer.min.js"></script>
    <script type="text/javascript">
        //<![CDATA[
        $(document).ready(function(){

            $("#jquery_jplayer_1").jPlayer({
                ready: function () {
                    $(this).jPlayer("setMedia", {
                        title: "",
                        m4v: "${content}"
                    }).jPlayer("play");
                },

                ended: function() {
                    $(this).jPlayer("play");
                },

                swfPath: "${ctxStatic}/static/jquery-jplayer/jplayer",
                supplied: "webmv, ogv, m4v",

                fullWindow: true,
//                fullScreen: true,
//                size: {
//                    width: $(top.document).width(),
//                    height: $(top.document).height(),
//                    cssClass: "jp-video-360p"
//                },

                useStateClassSkin: true,
                autoBlur: false,
                smoothPlayBar: true,
                keyEnabled: true,
                remainingDuration: true,
                toggleDuration: true
            });

        });
        //]]>
    </script>
</head>
<body>
<div id="jp_container_1" class="jp-video jp-video-360p" role="application" aria-label="media player">
    <div class="jp-type-single">
        <div id="jquery_jplayer_1" class="jp-jplayer"></div>
        <div class="jp-gui">
            <div class="jp-video-play">
                <button class="jp-video-play-icon" role="button" tabindex="0">play</button>
            </div>
            <div class="jp-interface">
                <div class="jp-progress">
                    <div class="jp-seek-bar">
                        <div class="jp-play-bar"></div>
                    </div>
                </div>
                <div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
                <div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
                <div class="jp-controls-holder">
                    <div class="jp-controls">
                        <button class="jp-play" role="button" tabindex="0">play</button>
                        <button class="jp-stop" role="button" tabindex="0">stop</button>
                    </div>
                    <div class="jp-volume-controls">
                        <button class="jp-mute" role="button" tabindex="0">mute</button>
                        <button class="jp-volume-max" role="button" tabindex="0">max volume</button>
                        <div class="jp-volume-bar">
                            <div class="jp-volume-bar-value"></div>
                        </div>
                    </div>
                    <div class="jp-toggles">
                        <button class="jp-repeat" role="button" tabindex="0">repeat</button>
                        <button class="jp-full-screen" role="button" tabindex="0">full screen</button>
                    </div>
                </div>
                <div class="jp-details">
                    <div class="jp-title" aria-label="title">&nbsp;</div>
                </div>
            </div>
        </div>
        <div class="jp-no-solution">
            <span>Update Required</span>
            To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
        </div>
    </div>
</div>
</body>

</html>
