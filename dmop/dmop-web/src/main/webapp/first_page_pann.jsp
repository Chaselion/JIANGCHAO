<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath() + "/";
%>
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
<script type="text/javascript"
	src="<%=basePath%>js/jquery.plugins.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/metro.js"></script>
<link rel="stylesheet"
	href="<%=basePath%>plugins/font-awesome/css/font-awesome.min.css">
<!--[if IE 7]><link rel="stylesheet" href="<%=basePath%>plugins/font-awesome/css/font-awesome-ie7.min.css"><![endif]-->
<!--[if IE 8]><link href="assets/css/ie8.css" rel="stylesheet" type="text/css"><![endif]-->
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#log-out-btn").click(function(){
			$(".login-out").show();
		});
		
		
	})
		
/* 	$(document).ready(function() {    
	 $('#exitLogin').click(function () {
			$.ajax({
				type:'post',
				url:'operateLog/exitLog',
				dataType:'json',
				success:function(data){
					}
			});
			});
	}); */
	
	$(function(){
	 	$.post("firstPage/getData","",function(data){
	 		debugger;
				var totalData = data.menuModule;//所有数据
				var text0 =  totalData[0].text;
				var text1 =  totalData[1].text;
				var text2 =  totalData[2].text;
				var text3 =  totalData[3].text;
				var text4 =  totalData[4].text;
				$("#contain1 h").text(text0);
				$("#contain2 h").text(text1);
				$("#contain3 h").text(text2);
				$("#contain4 h").text(text3);				
				$("#contain5 h").text(text4);
				
				var arr = [];
				for(i = 0;i<5;i++){
					arr.push(totalData[i].children);					
				}
				//console.warn(arr);
				
		 		var children0=	arr[0];
		 		var children1= arr[1];
		 		var children2= arr[2];
		 		var children3= arr[3];
		 		var children4= arr[4];
		 		console.log(children0);
		 		
		 		var allId0 = $("#table1 div");
		 		var allId1 = $("#table2 div");
		 		var allId2 = $("#table3 div");
		 		var allId3 = $("#table4 div");
		 		var allId4 = $("#table5 div");
		 		var arrId0 = [];
		 		var arrId1 = [];
		 		var arrId2 = [];
		 		var arrId3 = [];
		 		var arrId4 = [];
		 		for(var j=0;j<allId0.length;j++){
		 			arrId0[j] = allId0[j].id;	
		 				for(var k=0;k<children0.length;k++){
		 					console.log("******" + children0[k].url);	 				
		 					if(j===k){	 	
		 						 var page_url = children0[j].url;	
		 						 //console.warn(page_url);
			 					 $("#"+arrId0[j]).append("<a style='position:absolute;bottom:5%'>" + children0[j].text + "</a>"); 
			 					 $("#"+arrId0[j]).append("<i style='position:absolute;top:20%;left:20%' class = '" + children0[j].iconcls + " icon-4x'></i>");
			 					 
			 					 (function(j,page_url){
				 					 $("#"+arrId0[j]).on('click',function(event){
				 						window.location.href= <%=basePath%> + "pageJump/toModulePage?url=" + page_url;	
				 					 });
				 					 
			 					 })(j,page_url);  
			 					 
			 					 
		 					}
		 			}	
		 		}	
		 		for(j=0;j<allId1.length;j++){
		 			arrId1[j] = allId1[j].id;	
		 				for(k=0;k<children1.length;k++){
		 					if(j==k){
		 						 var page_url = children1[j].url;
			 					 $("#"+arrId1[j]).append("<a style='position:absolute;bottom:5%'>" + children1[j].text + "</a>"); 
			 					 $("#"+arrId1[j]).append("<i style='position:absolute;top:20%;left:20%' class = '" + children1[j].iconcls + " icon-4x'></i>");
			 					 (function(j,page_url){
				 					 $("#"+arrId1[j]).on('click',function(event){
				 						window.location.href= <%=basePath%> + "pageJump/toModulePage?url=" + page_url;	
				 					 }); 
			 					 })(j,page_url);
	
		 					}
		 			}	
		 		}		
		 		for(j=0;j<allId2.length;j++){
		 			arrId2[j] = allId2[j].id;	
		 				for(k=0;k<children2.length;k++){
		 					if(j===k){
		 						 var page_url = children2[j].url;
			 					 $("#"+arrId2[j]).append("<a style='position:absolute;bottom:5%'>" + children2[j].text + "</a>"); 
			 					 $("#"+arrId2[j]).append("<i style='position:absolute;top:20%;left:20%' class = '" + children2[j].iconcls + " icon-4x'></i>");
			 					(function(j,page_url){
				 					 $("#"+arrId2[j]).on('click',function(event){
				 						window.location.href= <%=basePath%> + "pageJump/toModulePage?url=" + page_url;	
				 					 }); 
			 					 })(j,page_url);
	
		 					}
		 			}	
		 		}		
		 		for(j=0;j<allId3.length;j++){
		 			arrId3[j] = allId3[j].id;	
		 				for(k=0;k<children3.length;k++){
		 					if(j===k){
		 						 var page_url = children3[j].url;
			 					 $("#"+arrId3[j]).append("<a style='position:absolute;bottom:5%'>" + children3[j].text + "</a>"); 
			 					 $("#"+arrId3[j]).append("<i style='position:absolute;top:20%;left:20%' class = '" + children3[j].iconcls + " icon-4x'></i>");
			 					(function(j,page_url){
				 					 $("#"+arrId3[j]).on('click',function(event){
				 						window.location.href= <%=basePath%> + "pageJump/toModulePage?url=" + page_url;	
				 					 }); 
			 					 })(j,page_url);
		 					}
		 			}	
		 		}	
		 		for(j=0;j<allId4.length;j++){
		 			arrId4[j] = allId4[j].id;	
		 				for(k=0;k<children4.length;k++){
		 					if(j===k){
		 						 var page_url = children4[j].url;
			 					 $("#"+arrId4[j]).append("<a style='position:absolute;bottom:5%'>" + children4[j].text + "</a>"); 
			 					 $("#"+arrId4[j]).append("<i style='position:absolute;top:20%;left:20%' class = '" + children4[j].iconcls + " icon-4x'></i>");
			 					(function(j,page_url){
				 					 $("#"+arrId4[j]).on('click',function(event){
				 						window.location.href= <%=basePath%>
	+ "pageJump/toModulePage?url="
												+ page_url;
									});
						})(j, page_url);
					}
				}
			}
		});

	});
</script>
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

				<ul class="login-out">
					<shiro:guest>
						<li><a href="<%=basePath%>pageJump/toLogin">登录</a></li>
					</shiro:guest>
					<shiro:authenticated>
						<li><a id="exitLogin" href="<%=basePath%>/logout">退出</a></li>
					</shiro:authenticated>
				</ul>
			</div>
			<div class="head-info">
				<p>在线数：10</p>
			</div>
			<div class="head-info">
				<p>告警数：10</p>
			</div>
			<div class="head-info">
				<p>吞吐量：10</p>
			</div>
			<div class="controls">
				<span class="down" title="Scroll down" style="display: none"></span>
				<span class="up" title="Scroll up" style="display: none"></span> <span
					class="next" title="向右滚动"></span> <span class="prev" title="向左滚动"></span>
				<span class="toggle-view" title="切换滚动方式"></span>
			</div>
		</div>


		<div class="content clearfix"
			style="width: 3000px; margin-top: 20%; overflow: hidden; position: absolute; bottom: 0;">
			<div class="down-part dragscroll" style="height: 90%">
				<div class="table-contain" id="contain1">
					<h></h>
					<table class="out-table" id="table1">
						<tr>
							<td>
								<div id="a0"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: mediumslateblue">
								</div>
							</td>
							<td colspan="2">
								<div id="a1"
									style="border: none; width: 285px; height: 150px; position: relative; top: -8px; background-color: Gold">
								</div>
							</td>

						</tr>
						<tr>
							<td rowspan="2">
								<div id="a2"
									style="border: none; width: 135px; height: 320px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="a3"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="a4"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>

						</tr>
						<tr>
							<td>
								<div id="a5"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="a6"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="table-contain" id="contain2">
					<h></h>
					<table class="out-table" id="table2">
						<tr>
							<td colspan="2">
								<div id="b0"
									style="border: none; width: 285px; height: 150px; position: relative; top: -8px; background-color: coral">
								</div>
							</td>
							<td rowspan="2">
								<div id="b1"
									style="border: none; width: 135px; height: 320px; position: relative; top: -8px; background-color: darkorchid">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="b2"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: dimgray">
								</div>
							</td>
							<td>
								<div id="b3"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="b4"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="b5"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="b6"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="table-contain" id="contain3">
					<h></h>
					<table class="out-table" id="table3">
						<tr>
							<td>
								<div id="c0"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: red">
								</div>
							</td>
							<td>
								<div id="c1"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: cornflowerblue">
								</div>
							</td>
							<td>
								<div id="c2"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: Gold">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="c3"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td colspan="2">
								<div id="c4"
									style="border: none; width: 285px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="c5"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="c6"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="c7"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="table-contain" id="contain4">
					<h></h>
					<table class="out-table" id="table4">
						<tr>
							<td rowspan="2">
								<div id="d0"
									style="border: none; width: 135px; height: 320px; position: relative; top: -8px; background-color: pink">
								</div>
							</td>
							<td>
								<div id="d1"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: mediumslateblue">
								</div>
							</td>
							<td>
								<div id="d2"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: coral">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="d3"
									style="border: none; width: 285px; height: 150px; position: relative; top: -8px; background-color: darkorchid">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="d4"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="d5"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="d6"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="table-contain" id="contain5">
					<h></h>
					<table class="out-table" id="table5">
						<tr>
							<td>
								<div id="e0"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: LightGreen">
								</div>
							</td>
							<td>
								<div id="e1"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: red">
								</div>
							</td>
							<td>
								<div id="e2"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: Gold">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="e3"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: dimgray">
								</div>
							</td>
							<td>
								<div id="e4"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="e5"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="e6"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="e7"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
							<td>
								<div id="e8"
									style="border: none; width: 135px; height: 150px; position: relative; top: -8px; background-color: transparent">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- 代码 结束 -->

</body>
</html>