<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	String basePath = request.getContextPath() + "/";
	User loginUser = SessionUtil.getCommonUserFromSession();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>登录</title>
    <base href="<%=basePath%>">
    <meta name="viewport" content="target-densitydpi=device-dpi,width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0,maximum-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="<%=basePath%>mobile/css/style.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath%>mobile/js/jquery.min.js"></script>
    <style>
        input{
            font-size: 1.2rem;
            margin-left: 10px;
            width: 80%;
            border: none;
            background-color: transparent;
        }

        input:focus{
            background-color: transparent;
        }
        button{
            margin-top: 1em;
            margin-top: 1em;
            width: 100%;
            font-size: 1.2rem;
            color: white;
            border: none;
            background-color: lightgreen;
            border-radius: 20px;
            line-height: 1.6;
        }
        
        .mui-content{
            background-image: url("<%=basePath%>mobile/images/background.jpg");
                margin: 0;
			    padding: 0;
			    top: 0;
			    bottom: 0;
			    height: 100%;
			    position: fixed;
			    background-size: cover;
			    min-width: 100%;
        }
    </style>
        <script>
		jQuery(document).ready(function() {
			if (self != top) {
				parent.location.href = 'login';
			}
		});

		function submt(){
			$("form,#formID").submit();
		};

	</script>
</head>
<body>
    <div class="mui-content">
        <div class="logo-contain">
            <img src="<%=basePath%>mobile/images/log.png" id="login-logo">
        </div>
        <div class="text-contain">
        <form class="form-header" action="<%=basePath%>login" method="POST" class="margin-bottom-0" >
            <c:if test="${msg!=null }">
				<p style="color: red; margin-left: 10px;">${msg }</p>
			</c:if>
            <div id="inner-text-contain">
                <div class="login-input">
                   <div class="icon-div">
                       <img src="<%=basePath%>mobile/images/username.png" class="icon-size">
                    </div>
                    <input class="form-control input-lg" name="username" id="name" type="text" placeholder="用户名" required>
                </div>
                <hr>
                <div class="login-input" style="margin-bottom: 1em;">
                    <div class="icon-div">
                        <img src="<%=basePath%>mobile/images/password.png" class="icon-size">
                    </div>
                    <input class="form-control input-lg" name="password" id="password" type="password" placeholder="密  码" required>
                </div>
                <hr>
                <button type="submit">登&nbsp; &nbsp; 录</button>
            </div>
        </form>
        </div>
    </div>
</body>
</html>