<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')}</title>
	<meta name="decorator" content="blank"/>
    <script src="/CabinetMS/static/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${ctxStatic}/bootstrap/2.3.1/css_cerulean/index.css" type="text/css" rel="stylesheet" />
      <c:if test="${tabmode eq '1'}"></c:if>
	<link rel="Stylesheet" href="${ctxStatic}/jerichotab/css/jquery.jerichotab.css" />

	<style type="text/css">
		html,body,table{text-align:center;}.form-signin-heading{font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#0663a2;}
      .form-signin{position:relative;text-align:left;width:300px;padding:40px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
        	-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05);}
      .form-signin .checkbox{margin-bottom:10px;color:#0663a2;} .form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
      .form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
      .form-signin .btn.btn-large{font-size:16px;} .form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
      .form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
      .header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
      label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
    </style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
	</script>
</head>
<body >
<div class="dgs11"  style=" height: 100%">

	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
	<div class="header">
		<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}" ><button data-dismiss="alert" class="close">×</button>
			<label id="loginError" class="error">${message}</label>
		</div>
	</div>
	<%--<h1 class="form-signin-heading">${fns:getConfig('productName')}</h1>--%>
    <div class="dgs12" >
   <div class="denglu_s" style=" padding-top:220px;">
	<form  id="loginForm" class=" " action="${ctx}/login" method="post">
		
		<div class="noankuan ">
			<div class="denglu_ss1"></div>
			<input  style="background:#0975D0; border:0px; line-height:35px; color:#FFFFFF;"  type="text" id="username" name="username" class="input-block-level required shukuan" placeholder="请输入用户名" value="${username}">
		</div>
	
			<div style="margin-top:13px;" class="noankuan ">
				<div class="denglu_ss"></div>
				<input style="background:#0975D0; border:0px; line-height:35px; color:#FFFFFF;"   type="password" id="password" name="password" class="input-block-level required shukuan" placeholder="请输入密码">
			</div>
		<c:if test="${isValidateCodeLogin}">
			<div class="validateCode">
				<label class="input-label mid" for="validateCode">验证码</label>
            	<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
			</div>
		</c:if>

        <input class="btn btn-large btn-primary an" type="submit"  style="width:305px; margin-top:13px;
" value="登 录"/>&nbsp;&nbsp;

	</form>
    </div>
    </div>
	<div class="footer">
	技术支持：${fns:getConfig('copyrightYear')}    &nbsp;&nbsp;   &nbsp;&nbsp;     版权所有：${fns:getConfig('version')}
	</div>
	<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
	</div>
</body>
</html>