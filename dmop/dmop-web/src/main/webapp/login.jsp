<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DMOP云平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/animate.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/css-index.css" rel="stylesheet" type="text/css">
    <script>
		jQuery(document).ready(function() {
			if (self != top) {
				parent.location.href = 'login';
			}
		});
		/*
		 jQuery(document).ready(function(){
		 jQuery("#formID").validationEngine();
		 });
		 jQuery(document).ready(function(){
		 $("#captcha").click(function(){
		 $(this).attr("src", "${contextPath}/Captcha.jpg?time=" + new Date());
		 return false;
		 });
		 });
		 */
		 
		//判断当前窗口是否有顶级窗口，如果有就让当前的窗口的地址栏发生变化，    
		//这样就可以让登陆窗口显示在整个窗口了    
		function loadTopWindow(){    
		    if (window.top!=null && window.top.document.URL!=document.URL){    
		        window.top.location= document.URL;     
		    }    
		} 

		function submt(){
			//$("#password")[0].value= hex_md5($("#password")[0].value);
			$("form,#formID").submit();
		};

	</script>
</head>
<body onload="loadTopWindow()">
<div id="preloader"></div>
<div id="top"></div>

<!-- /.parallax full screen background image -->
<div class="fullscreen landing parallax" style="background-image:url('<%=basePath%>images/bg.jpg');" data-img-width="2000" data-img-height="1333" data-diff="100">
	
	<div class="overlay" style="height: 1900px;">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
				
					<!-- /.logo -->
					<div class="logo wow fadeInDown"> <a href=""><img src="<%=basePath%>images/logo.png" alt="logo"></a></div>

					<!-- /.main title -->
						<h1 class="wow fadeInLeft">
						Welcome to DMOP!
						</h1>

					<!-- /.header paragraph -->
					<div class="landing-text wow fadeInUp">
						<p>欢迎使用DMOP</p>
					</div>				  

					<!-- /.header button -->
				<%-- 	<div class="head-btn wow fadeInLeft">
						<a class="btn-primary" href="<%=basePath%>index">返回首页</a>
					</div> --%>
	
				</div> 
				
				<!-- /.signup form -->
				<div class="col-md-5">

					<div class="signup-header wow fadeInUp">
						<h3 class="form-title text-center">请登录</h3>
						<form class="form-header" action="<%=basePath%>login" method="POST" class="margin-bottom-0" >
							<c:if test="${msg!=null }">
								<p style="color: red; margin-left: 10px;">${msg }</p>
							</c:if>
						<input type="hidden" name="u" value="503bdae81fde8612ff4944435">
						<input type="hidden" name="id" value="bfdba52708">
							<div class="form-group">
								<input class="form-control input-lg" name="username" id="name" title="请输入用户名" type="text" placeholder="用户名" required>
							</div>
							<div class="form-group">
								<input class="form-control input-lg" name="password" id="email" title="请输入密码" type="password" placeholder="密  码" required>
							</div>
							<div class="form-group last">
								<input type="submit" class="btn btn-warning btn-block btn-lg"  style="border-radius: 50px;" value="登  录">
							</div>
							<p>
								Copyright &copy; 2018, DMOP v4.2.0509, All Rights Reserve.
							</p>
						</form>
					</div>				
				
				</div>
			</div>
		</div> 
	</div> 
</div>

	
	<!-- /.javascript files -->
    <script type="text/javascript"  src="<%=basePath%>js/jqueryAA.js"></script>
    <script  type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script  type="text/javascript" src="<%=basePath%>js/custom.js"></script>
    <script  type="text/javascript" src="<%=basePath%>js/jquery.sticky.js"></script>
	<script type="text/javascript"  src="<%=basePath%>js/wow.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/owl.carousel.min.js"></script>
	<script>
		new WOW().init();
	</script>
</body>
</html>