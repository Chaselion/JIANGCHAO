<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DMOP</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="<%=basePath%>/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/menu/index.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/bootstrap/css/bootstrap-dialog.min.css">
<script src="<%=basePath%>/plugins/menu/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap/js/bootstrap-dialog.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/jquery.noty.js"></script>
</head>
<style>
	#exitLogin{
	    color: lightgray;
	    font-size: 20px;
	    bottom: 0;
	    float: right;
	    padding-bottom: -10px;
	    margin-top: 90px;
	    margin-right: 20px;
	}
	
	ul{
            list-style: none;
        }
        .nav>li{
            float: left;
        }
        ul a{
            display: block;
            text-decoration: none;
            width: 100px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            font-size: 20px;
            
        }
        .nav>li:first-child a{
            border-radius: 10px 0 0 10px;
        }
        .nav>li:last-child a{
            border-radius: 0 10px 10px 0;
        }
        .drop-down{
            /*position: relative;*/
            height: 50px;
        }
        .drop-down-content{
            padding: 0;
            opacity: 0.3;
            height: 0;
            overflow: hidden;
            transition: all 1s ease;
            background-color:#ffffff;
            /*position: absolute;*/
        }
        
        h3{
            font-size: 30px;
            clear: both;
/*            position: relative;
            z-index: -1;*/
        }
        .drop-down-content li:hover a{
            background-color:#b9aaaa;
        }
        .nav .drop-down:hover .drop-down-content{
            opacity: 1;
            height: 100px;
        }
</style>
<script type="text/javascript">
$(function(){
	
 		$.post("<%=basePath%>/firstPage/getModuleData","",function(data){
 			function getQueryString(url) {
 			    var reg = new RegExp('(^|&)' + url + '=([^&]*)(&|$)', 'i');
 			    var r = window.location.search.substr(1).match(reg);
 			    if (r != null) {
 			        return unescape(r[2]);
 			    }
 			    return null;
 			}
 			$("iframe").attr("src", "/dmop-web" + getQueryString("url"));
		
			var totalData = data.menuModule;//所有数据
			var title = [];
			var allTitle = $(".introduction span");//放置父级text位置
			var iconPosition = $(".mynew-icons");
			var allIcon=[];
			var arrTitle = [];
			var allChildren = [];	//所有父级	
			for(i=0;i<totalData.length;i++){
					allChildren.push(totalData[i].children);
					for(j=0;j<allTitle.length;j++){
						arrTitle[j] = allTitle[j].id;
						if(i==j){
							$("#"+arrTitle[j]).text(totalData[i].text);				
						}
					}//将父级text放入
					
					for(k=0;k<iconPosition.length;k++){
						allIcon[k] = iconPosition[k].id;
						if(i==k){
							$("#"+allIcon[k]).append("<i class = '" + totalData[i].iconcls + " icon-4x' style='color:#336ca6'></i>");
						}
					}//将父级icon放入

			}
 			
			console.warn(allChildren);
			//第一个父级的子级放入各个li
			var children0 = allChildren[0];
			var li0 = $("#li-contain0 li");
			var arrli0 = [];
			for(j=0;j<li0.length;j++){
				arrli0[j] = li0[j].id;
				for(i=0;i<children0.length;i++){
					 var page_url = children0[i].url;
					if(j==i){
						$("#"+arrli0[j]).append("<a>" + children0[i].text + "</a>");
						 (function(j,page_url){
	 						 
		 					 $("#"+arrli0[j]).on('click',function(event){
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}
			
			var children1 = allChildren[1];
			var li1 = $("#li-contain1 li");
			var arrli1 = [];
			for(j=0;j<li1.length;j++){
				arrli1[j] = li1[j].id;
				for(i=0;i<children1.length;i++){
					 var page_url = children1[i].url;
					if(j==i){
						$("#"+arrli1[j]).append("<a>" + children1[i].text + "</a>");
 						(function(j,page_url){	 
		 					 $("#"+arrli1[j]).on('click',function(event){
		 						
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}	
			var children2 = allChildren[2];
			var li2 = $("#li-contain2 li");
			var arrli2 = [];
			for(j=0;j<li2.length;j++){
				arrli2[j] = li2[j].id;
				for(i=0;i<children2.length;i++){
					var page_url = children2[i].url;
					if(j==i){
						$("#"+arrli2[j]).append("<a>" + children2[i].text + "</a>");
						(function(j,page_url){	 
		 					 $("#"+arrli2[j]).on('click',function(event){
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}
			
			var children3 = allChildren[3];
			var li3 = $("#li-contain3 li");
			var arrli3 = [];
			for(j=0;j<li3.length;j++){
				arrli3[j] = li3[j].id;
				for(i=0;i<children3.length;i++){
					 var page_url = children3[i].url;
					if(j==i){
						$("#"+arrli3[j]).append("<a>" + children3[i].text + "</a>");
						(function(j,page_url){	 
		 					 $("#"+arrli3[j]).on('click',function(event){
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}
			
			var children4 = allChildren[4];
			var li4 = $("#li-contain4 li");
			var arrli4 = [];
			for(j=0;j<li4.length;j++){
				arrli4[j] = li4[j].id;
				for(i=0;i<children4.length;i++){
					 var page_url = children4[i].url;
					if(j==i){
						$("#"+arrli4[j]).append("<a>" + children4[i].text + "</a>");
						(function(j,page_url){	 
		 					 $("#"+arrli4[j]).on('click',function(event){
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}
	
 		});
 		
 	window.onload = function(){
 		var lis = $(".function-list li");
 		var len = lis.length;
 		for(var i=0;i<len;i++){
 			lis[i].onclick = function(){
 				for(var j=0;j<len;j++){
 					lis[j].style.backgroundColor="transparent";
 				}
 				this.style.backgroundColor = "lightgray";
 			}
 		}
 	}
 		
	});	



</script>
<body>
    <div class="guide-slider" id="guideSlider">
        <div id="logo-position">
            <a href="<%=basePath%>/index"><img id="head-logo" src="<%=basePath%>/images/logo.png"></a>
        </div>
        <ul class="guide-list" style="width:90%;background-color: #ffffff;">
            <li class="guide on">
                <div class="display">
                    <div class="mynew-icons" id="icon0"></div>
                    <div class="introduction"><span id="mo-title0"></span></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain0">
                            <li id="a0" class="function"></li>
                            <li id="a1" class="function"></li>
                            <li id="a2" class="function"></li>
                            <li id="a3" class="function"></li>
                            <li id="a4" class="function"></li>
                            <li id="a5" class="function"></li>
                        </ul>
                    </div>
                </div>
            </li>
             <li class="guide">
                <div class="display">
                     <div class="mynew-icons" id="icon1"></div>
                    <div class="introduction"><span id="mo-title1"></span></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain1">
                            <li id="b0" class="function"></li>
                            <li id="b1" class="function"></li>
                            <li id="b2" class="function"></li>
 							<li id="b3" class="function"></li>
 							<li id="b4" class="function"></li>
 							<li id="b5" class="function"></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="guide">
                <div class="display">
                    <div class="mynew-icons" id="icon2"></div>
                    <div class="introduction"><span id="mo-title2"></span></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain2">
                            <li id="c0" class="function"></li>
                            <li id="c1" class="function"></li>
                            <li id="c2" class="function"></li>
                            <li id="c3" class="function"></li>
                            <li id="c4" class="function"></li>
							<li id="c5" class="function"></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="guide">
                <div class="display">
                   <div class="mynew-icons" id="icon3"></div>
                    <div class="introduction"><span id="mo-title3"></span></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain3">
                            <li id="d0" class="function"></li>
                            <li id="d1" class="function"></li>
                            <li id="d2" class="function"></li>
							<li id="d3" class="function"></li>
							<li id="d4" class="function"></li>
							<li id="d5" class="function"></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="guide">
                <div class="display">
                     <div class="mynew-icons" id="icon4"></div>
                    <div class="introduction"><span id="mo-title4"></span></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain4">
                            <li id="e0" class="function"></li>
                            <li id="e1" class="function"></li>
                            <li id="e2" class="function"></li>
                            <li id="e3" class="function"></li>
                            <li id="e4" class="function"></li>
                            <li id="e5" class="function"></li>
                        </ul>
                    </div>
                </div>
            </li>
            <shiro:authenticated>
				
			<%-- 	<li class="dropdown"><a id="exitLogin" href="#" title="" data-toggle="dropdown"><i class="icon-user"></i><span>设置 </span><i class="icon-angle-down left-padding"></i></a>
            <ul id="login-out" class="dropdown-menu pull-right">
              <li><a href="javascript:showNavTab('<%=basePath%>/security/update_pwd.jsp', '修改密码', ['甩挂智能车联网监控平台','修改密码']);" title=""><i class="icon-cog"></i>修改密码</a></li>
			  <li class="divider"></li>
			  <li><a  href="<%=basePath%>/logout">退出</a></li>
            </ul>
          </li> --%>
          
          
          <ul class="nav" >
         <li class="drop-down"><a href="#" style="color: #336ca6;margin-top: 70px;margin-right: 2px;"><i class="fa fa-cog"></i></a>
             <ul class="drop-down-content">
                <li><a data-toggle="modal" data-target="#myModal" id="psd" style="color:#336ca6;border:none;text-decoration:none" >修改密码</a></li>
                <li><a style="color: #336ca6;border:none;text-decoration:none" href="<%=basePath%>/logout">退出登录</a></li>
             </ul>
             </li>

     </ul>
			</shiro:authenticated>
        </ul>
    </div>
    
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width:500px">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			<div class="modal-body">
				原密码：<input type="password" id="oldpassword" class="form-control" placeholder="原密码"><br/>
				新密码：<input type="password" id="newpassword" class="form-control" placeholder="新密码"><br/>
				重复密码：<input type="password" id="confirmpassword" class="form-control" placeholder="确认密码">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button>
				<button  style="background-color:#336ca6;" type="button" id="confirmpsdBtn" class="btn btn-primary">
					确认
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
   $(function () { $('#myModal').modal('hide')});
</script>
<script>
   $(function () { $('#myModal').on('hide.bs.modal', function () {
		$('#oldpassword').val("");
		$('#newpassword').val("");
		$('#confirmpassword').val("");
      })
   });
</script>
    <iframe id="wen-content" width="100%" margin-top="155px" min-height="700px" scrolling="no" style="border:none;"></iframe>
</body>

<script type="text/javascript">
var $guideSlider = $("#guideSlider").eq(0);

$guideSlider.find(".guide-list .guide").hover(function() {
    $(this).addClass("on").siblings().removeClass("on");
});



$("#exitLogin").click(function(event){
	$("#login-out").toggle();
	 $(document).one("click",function() { //对document绑定一个影藏Div方法
		$("#login-out").hide();
     });
	  event.stopPropagation();
});	
$("#login-out").click(function(event) {
    event.stopPropagation(); //阻止事件向上冒泡
});
$("#confirmpsdBtn").click(function() {
	

	var oldpassword = $("#oldpassword").val();
	var newpassword = $("#newpassword").val();
	var confirmpassword = $("#confirmpassword").val();
	if (oldpassword == "") {
		BootstrapDialog.alert("请填写原密码!");
		//showNoty("请填写原密码!", "error", false, 'top');
		return;
	}
	
	if (newpassword == "") {
		BootstrapDialog.alert("请填写新密码!");
		//showNoty("请填写新密码!", "error", false, 'top');
		return;
	}
	if (confirmpassword == "") {
		BootstrapDialog.alert("请重复密码!");
		
		return;
	}

	var requestData = {
		"oldpassword" : oldpassword,
		"newpassword" : newpassword,
		"confirmpassword" : confirmpassword
	}
	$.ajax({
		url : '/dmop-web/user/updatePwd',
		type : "POST",
		contentType : "application/json",
		dataType : "json",
		data : JSON.stringify(requestData),
		success : function(data) {
			if (data.success) {
				BootstrapDialog.alert('密码修改成功!');
				$('#myModal').modal('hide');
			} else {
				BootstrapDialog.alert(data.errorMessage);
			}
		}
	});
	//window.location.href="user/user_add.jsp";
});
function toUpdatepsd() {
	BootstrapDialog.show({
        title: '修改密码',
        message: function(dialog) {
        	 var $content =$('<input type="password" id="oldpassword" class="form-control" placeholder="原密码"><br/><input type="password" id="newpassword" class="form-control" placeholder="新密码"><br/><input type="password" id="confirmpassword" class="form-control" placeholder="确认密码">');
        	 return $content;
        },
        	buttons: [{
            label: '提交',
            cssClass: 'btn-primary',
            hotkey: 13, // Enter.
            action: function() {
            	alert("ddd");
            	var modal = $(this);
            	var oldpassword =  $("#psd").find('#oldpassword').val();
    			var newpassword = $("#newpassword").val();
    			var confirmpassword = $("#confirmpassword").val();
    			alert(oldpassword);
    			if (oldpassword == "") {
    				alert("dxx");
    				showNoty("请填写原密码!", "error", false, 'top');
    				return;
    			}
    			
    			if (newpassword == "") {
    				showNoty("请填写新密码!", "error", false, 'top');
    				return;
    			}
    			if (confirmpassword == "") {
    				showNoty("请确认新密码!", "error", false, 'top');
    				return;
    			}

    			var requestData = {
    				"oldpassword" : oldpassword,
    				"newpassword" : newpassword,
    				"confirmpassword" : confirmpassword
    			}
    			$.ajax({
    				url : 'user/updatePwd',
    				type : "POST",
    				contentType : "application/json",
    				dataType : "json",
    				data : JSON.stringify(requestData),
    				success : function(data) {
    					if (data.success) {
    						//queryUser(0);
    						$('#oldpassword').html('');
    						$('#newpassword').html('');
    						$('#confirmpassword').html('');
    						backToList();
    					} else {
    						showNoty(data.errorMessage, "error", true, 'top');
    					}
    				}
    			});
            }
        }]
    });
	
	//window.location.href="user/user_update.jsp?id=" + id;
}
function showNoty(text, type, modal, layout) {
	noty({
		text: text,
		type: type,
		dismissQueue: true,
		modal: modal,
		layout: layout,
		theme: 'defaultTheme',
		timeout: 500
	});
}
</script>
</html>