<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>固件管理</title>
	<style>
		body{
			background-image:url("images/firmware.jpg")
		}
	
		#cover-body{
			width:100%;
			height:100%;
			opacity: 0.5;
	    	background-color: rgb(41, 105, 176);
	    	bottom: 0;
		    left: 0;
		    position: absolute;
		    right: 0;
		    top: 0;
		    z-index: 2;
		}
		
		#put-title{
			height:150px;
			width:700px;
			margin-left:180px;
			margin-top:20%;
			
		}
		
		h{
			color: white;
    		font-size: 100;
		}
	
	</style>
</head>
<body>
	<div id="cover-body">
		<div id="put-title">
			<h>功能开发中...</h>
		</div>
	</div>

</body>

</html>