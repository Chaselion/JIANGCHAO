<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	String basePath = request.getContextPath() + "/";
	User loginUser = SessionUtil.getCommonUserFromSession();
	String userName = loginUser.getUsername();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>关于</title>
    <base href="<%=basePath%>">
     <meta name="viewport" content="target-densitydpi=device-dpi,width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0,maximum-scale=1.0">
    <link href="<%=basePath%>mobile/css/style.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath%>mobile/css/mui.min.css" rel="stylesheet"/>  
	<link rel="stylesheet" href="<%=basePath%>mobile/css/icons-extra.css" />
	<link rel="stylesheet" href="<%=basePath%>mobile/css/app.css" />
	<script src="<%=basePath%>mobile/js/mui.min.js"></script>  
</head>
<style>
	.mui-content {
	    background-color: white;
	}
	
	button{
		margin-top: 10px;
		margin-left: 15px;
		padding: 10px 0;
	}
</style>
<body>
<!-- 	<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">关于</h1>
	</header> -->
	<div class="mui-content">
	        <div class="img-contain">
	            <img src="<%=basePath%>mobile/images/about.png" id="about-img">
	        </div>
			<div class="mui-card">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">检测更新</li>
					<li class="mui-table-view-cell mui-collapse">
						<a class="mui-navigate-right" href="#">版本说明</a>
						<div class="mui-collapse-content">
							<p>当前版本：V1.0.0</p>
							<p>功能说明：<br>&nbsp;&nbsp;&nbsp;&nbsp;1.实时信息：及时了解终端在线离线，附有搜索功能及下拉刷新；<br>&nbsp;&nbsp;&nbsp;&nbsp;2.报警信息：获取最新报警信息并推送至相关用户手机上；<br>&nbsp;&nbsp;&nbsp;&nbsp;3.统计信息：数据清晰，帮助用户更好掌握信息变化;<br>&nbsp;&nbsp;&nbsp;&nbsp;4.关于:产品相关.</p>
						    
						</div>
					</li>
					<li class="mui-table-view-cell">
						当前用户
						<a style="float: right;color: #007aff;"><%=userName%></a>
					</li>	
					<button type="button" class="mui-btn mui-btn-primary mui-btn-block mui-btn-outlined" style="width: 92%; height: 2.5em; padding: 10px 0;">
						<a id="exitLogin" href="<%=basePath%>/logout">退 出 登 录</a>
					</button>
				</ul>	
			</div>
    </div>
</body>
</html>