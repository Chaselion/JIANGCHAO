<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	User loginUser = SessionUtil.getCommonUserFromSession();
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>iframe父页面</title>
<link href="<%=basePath%>mobile/css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=basePath%>mobile/css/app.css" />
<link rel="stylesheet" href="<%=basePath%>mobile/css/icons-extra.css" />
<link rel="stylesheet" href="<%=basePath%>mobile/css/mui.picker.min.css" />
<script src="<%=basePath%>mobile/js/echarts.js"></script>
<script src="<%=basePath%>mobile/js/mui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>mobile/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>mobile/js/mui.picker.min.js"></script>
<script type="text/javascript" src="<%=basePath%>mobile/js/fastclick.js"></script>
<style>
.mui-card .mui-control-content {
	padding: 10px;
}

.mui-control-content {
	height: 150px;
}

html, body {
	background: white;
	height: 100%;
	padding-bottom: 25px;
	overflow: hidden;
}

.mui-content {
	height: 100%;
}
</style>
</head>
		 <script type="text/javascript">
		 var cometdConfig = {
		 	contextPath: '${pageContext.request.contextPath}'
		 };
		 </script>
<script type="text/javascript">
 		$(function(){
			var bb = document.getElementById("bb");
			bb.addEventListener('tap', function() {
				$("header")[0].innerHTML="";
				$("header").append("<h1 class='mui-title'>实时信息</h1>");
				
			});
			var aa = document.getElementById("aa");
			aa.addEventListener('tap', function() {
				$("header")[0].innerHTML="";
				$("header").append("<h1 class='mui-title'>报警信息</h1>");
				alarm.window.queryData();
			});
			var cc = document.getElementById("cc");
			cc.addEventListener('tap', function() {
				$("header")[0].innerHTML="";
				$("header").append("<h1 class='mui-title'>统计信息</h1>");
			});
			var dd = document.getElementById("dd");
			dd.addEventListener('tap', function() {
				$("header")[0].innerHTML="";
				$("header").append("<h1 class='mui-title'>关于</h1>");
			});
		}); 

		 
	</script>
<body id="body">
	<header class="mui-bar mui-bar-nav">
		<h1 class='mui-title'>实时信息</h1>
	</header>
	<div class="mui-content">
		<div id="tabbar" class="mui-control-content mui-active"
			style="height: 100%;">
			<iframe id="wen-content" src="<%=basePath%>mobile/realtime.jsp"
				name="frame" width="100%" style="height: 100%; border: none;"></iframe>
		</div>

		<div id="tabbar-with-chat" class="mui-control-content"
			style="height: 100%;">
			<iframe name="alarm" src="<%=basePath%>mobile/alarm.jsp" width="100%"
				style="height: 100%; border: none;"></iframe>
		</div>

		<div id="tabbar-with-contact" class="mui-control-content"
			style="height: 100%;">
			<iframe src="<%=basePath%>mobile/echart.jsp" width="100%"
				style="height: 100%; border: none;"></iframe>
		</div>
		<div id="tabbar-with-map" class="mui-control-content"
			style="height: 100%;">
			<iframe src="<%=basePath%>mobile/about.jsp" width="100%"
				style="height: 100%; border: none;"></iframe>
		</div>
	</div>
	<iframe id="wen-content" name="frame" width="100%"
		style="height: 100%; border: none; margin-top: 44px;"></iframe>

	<nav class="mui-bar mui-bar-tab">
		<a id="bb" class="mui-tab-item  mui-active" href="#tabbar"> <span
			class="mui-icon-extra mui-icon-extra-order"></span>
		</a> <a id="aa" class="mui-tab-item" href="#tabbar-with-chat"> <span
			class="mui-icon-extra mui-icon-extra-notice"></span>
		</a> <a id="cc" class="mui-tab-item" href="#tabbar-with-contact"> <span
			class="mui-icon-extra mui-icon-extra-trend"></span>
		</a> <a id="dd" class="mui-tab-item" href="#tabbar-with-map"> <span
			class="mui-icon mui-icon-info" style="top: 0;"></span>
		</a>
	</nav>

</body>
</html>
