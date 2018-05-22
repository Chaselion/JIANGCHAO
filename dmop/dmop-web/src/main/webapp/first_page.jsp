<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
    String userName=null;
	User loginUser = SessionUtil.getCommonUserFromSession();
	if(loginUser!=null){
		 userName = loginUser.getUsername();
	}else{
		 userName = "游客";
	}
	String basePath = request.getContextPath() + "/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>首页</title>
<link href="<%=basePath%>css/metro.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="<%=basePath%>js/jquery.plugins.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/metro.js"></script> --%>
<link rel="stylesheet" href="<%=basePath%>plugins/font-awesome/css/font-awesome.min.css">
<!--[if IE 7]><link rel="stylesheet" href="<%=basePath%>plugins/font-awesome/css/font-awesome-ie7.min.css"><![endif]-->
<style>
	#changeView{
	    color: white;
	    background-color: coral;
	    border: none;
	    height: 2rem;
	    border-radius: 5px;
	    padding:5px;
	    text-decoration: none;
	}
</style>
</head>

<body>
	<!-- 代码 开始 -->
	<div class="metro-layout horizontal">
		<div class="header">
			<div class="logo-position">
				<img class="logo" src="images/logo.png" />
			</div>
			<div class="user-icon">
				<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i> <i
					id="log-out-btn" class="fa fa-angle-down" aria-hidden="true"></i>
				<ul id="login-out">
					<shiro:guest>
						<li><a href="<%=basePath%>pageJump/toLogin">登录</a></li>
					</shiro:guest>
					<shiro:authenticated>
						<li><a id="exitLogin" href="<%=basePath%>/logout">退出</a></li>
					</shiro:authenticated>
				</ul>
			</div>
			<div class="head-info" id="online-count">
			</div>
			<div class="head-info" id="alarm-count">
			</div>
			<div class="head-info" id="get-out">
			</div>
			<div id="index-title" style="float:right;margin-top:3.5rem;margin-right:1rem">
				<h style="font-size:20px"><%=userName%>&nbsp; ,&nbsp;欢迎使用DMOP</h>
				<a id="changeView" href="<%=basePath%>NewFile1.jsp">切换视图</a>
			</div>
		</div>


		<div class="content clearfix"
			style="width: 3000px; margin-top: 20%; overflow: hidden; position: absolute; bottom: 0;">
			<div class="down-part dragscroll" style="height: 90%">
				<c:forEach items="${menuModule }"  var="m">
				<div class="table-contain">
					<h>${m.text }</h>
					<table class="out-table">
						<c:forEach items="${m.children }" var="splitedChildren">
						<tr>
							<c:forEach items="${splitedChildren }" var="child">
								<c:if test="${not empty child.text }">
								<td <c:if test="${child.isFat}">colspan="2"</c:if><c:if test="${child.isTall }">rowspan="2"</c:if>>
									<c:choose>
										<c:when test="${child.isFat}">
											<div style="border: none; width: 285px; height: 150px; position: relative; top: -8px; background-color: ${child.color}" 
												onclick="pageJump('${child.url}')" >
												<a style='position:absolute;bottom:5%;left: 5%;'>${child.text }</a>
												<i style='position:absolute;top:20%;left:20%' class ='${child.iconcls }'></i>
											</div>
										</c:when>
										<c:when test="${child.isTall}">
											<div style="border: none; width: 135px; height: 320px; position: relative; top: -8px; background-color: ${child.color}" 
												onclick="pageJump('${child.url}')" >
												<a style='position:absolute;bottom:5%;left: 5%;'>${child.text }</a>
												<i style='position:absolute;top:20%;left:20%' class ='${child.iconcls }'></i>
											</div>
										</c:when>
										<c:otherwise>
											<div style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: ${child.color}" 
												onclick="pageJump('${child.url}')" >
												<a style='position:absolute;bottom:5%;left: 5%;'>${child.text }</a>
												<i style='position:absolute;top:20%;left:20%' class ='${child.iconcls }'></i>
											</div>
										</c:otherwise>
									</c:choose>
								</td>
								</c:if>
							</c:forEach>
						</tr>
						</c:forEach>
					</table>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 代码 结束 -->

</body>
<script type="text/javascript">	
	$.post('homepage/getData', "", function(data) {
		 var all = data.status_count;
		 var statusCount = all.elecve;
		 var div0 = document.getElementById("online-count");
		 div0.removeChild(div0.firstChild);
		 var div1 = document.getElementById("alarm-count");
		 div1.removeChild(div1.firstChild);
		 var div2 = document.getElementById("get-out");
		 div2.removeChild(div2.firstChild);
		 $("#online-count").append("<p>在线数 : " + statusCount[1].count + "</p>")
		 $("#alarm-count").append("<p>告警数 : " + statusCount[0].count + "</p>")
		 $("#get-out").append("<p>吞吐量: " + statusCount[2].count + "</p>")
		}) 

		function queryData(){
		    $.post('homepage/getData', "", function(data) {
			 var all = data.status_count;
			 var statusCount = all.elecve;
			 var div0 = document.getElementById("online-count");
			 div0.removeChild(div0.firstChild);
			 var div1 = document.getElementById("alarm-count");
			 div1.removeChild(div1.firstChild);
			 var div2 = document.getElementById("get-out");
			 div2.removeChild(div2.firstChild);
			 $("#online-count").append("<p>在线数 : " + statusCount[1].count + "</p>")
			 $("#alarm-count").append("<p>告警数 : " + statusCount[0].count + "</p>")
			 $("#get-out").append("<p>吞吐量 : " + statusCount[2].count + "</p>")
			}) 
		}
		setInterval("queryData()",10000);
	
	$(document).ready(function(){
		 $(".horizontal").click(function() {
             $("#login-out").fadeOut();
     	});

	});
	
/* 	$("#log-out-btn").click(function(){
		$("#login-out").show();
	});	 */

	$("#log-out-btn").click(function(event){
		$("#login-out").toggle();
		 $(document).one("click",function() { //对document绑定一个影藏Div方法
			$("#login-out").hide();
	     });
		  event.stopPropagation();
	});	
	
	   $("#login-out").click(function(event) {
	        event.stopPropagation(); //阻止事件向上冒泡
	    });
	   
	   
	function pageJump(url){
		window.location.href= <%=basePath%> + "pageJump/toModulePage?url=" + url;
	}
	
</script>
</html>