<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>修改密码</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css">
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css">
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->
<style>
div.form-group {
	margin-bottom: 5px;
}
label.help-block.has-error {
	margin-top: 2px;
	margin-bottom: 0px;
}

#addWrapper h5 {
	font-size:13px;
	font-weight:bold;
	margin-top:5px;
	margin-bottom:5px;
}
#addWrapper .widget {
	margin-bottom:0px;
}
#addWrapper .widget .widget-header {
	margin-bottom: 0px;
}
</style>

<script type="text/javascript" src="<%=basePath%>assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/libs/lodash.compat.min.js"></script>
<!--[if lt IE 9]><script src="<%=basePath%>assets/js/libs/html5shiv.js"></script><![endif]-->
<script type="text/javascript" src="<%=basePath%>plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/event.swipe/jquery.event.move.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/event.swipe/jquery.event.swipe.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/libs/breakpoints.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/respond/respond.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/cookie/jquery.cookie.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/daterangepicker/moment-with-langs.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/jquery.noty.js"></script>
<!-- layouts -->
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/bottom.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/bottomCenter.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/bottomLeft.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/bottomRight.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/center.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/centerLeft.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/centerRight.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/inline.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/top.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/topCenter.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/topLeft.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/noty/layouts/topRight.js"></script>
<!-- themes -->
<script type="text/javascript" src="<%=basePath%>plugins/noty/themes/default.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/blockui/jquery.blockUI.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/select2/select2.min.js"></script>

<script type="text/javascript" src="<%=basePath%>plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/validation/messages_zh.js"></script>

<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>js/car.plugins.form-components.js"></script>
<script>
$(document).ready(function(){
	App.init();
	Plugins.init();
	CarFormComponents.init();
	
	$("#confirmAddBtn").click(updatePwd);
	$("#resetFormBtn").click(resetForm);
});

function showNoty(text, type, modal, layout) {
	noty({
		text: text,
		type: type,
		dismissQueue: true,
		modal: modal,
		layout: layout,
		theme: 'defaultTheme',
		timeout: 3000
	});
}

function resetForm() {
	$("#addForm")[0].reset();
	$("#addForm").validate().resetForm();
}
function updatePwd() {
	var valid = $("#addForm").validate().form();
	if (!valid) return;

	var old_password = $("#old_password").val();
	var password = $("#password").val();
	var confirmPassword = $("#confirmPassword").val();
	
	var requestParam = {
		"old_password" : old_password,
		"password" : password,
		"confirmPassword" : confirmPassword
	};
	
	$.ajax({
		url: 'pwd/updatePwd',
		type: "POST",
		contentType: "application/json",
		dataType:"json",
		data : JSON.stringify(requestParam),
		success: function(data) {
			if (data.success) {
				showNoty(data.errorMessage, "success", false, 'top');
			} else {
				showNoty(data.errorMessage, "error", true, 'top');
			}
		}
	});
}

</script>
</head>
<body>
<div id="container">
	<div id="content">
		<div class="container">
			<div class="crumbs">
				<ul id="breadcrumbs" class="breadcrumb">
					<li> <i class="icon-home"></i> <a href="security/update_pwd.jsp">修改密码</a> </li>
				</ul>
			</div>
	  
			<!--button id="addDriverBtn" class="btn btn-sm btn-success">返回</button-->
			<!--br /-->
			<div class="row" style="padding-top:5px;">
				<div id="addWrapper" class="col-md-12">
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 修改密码</h5>
						</div>
						
						<div class="widget-content" style="padding-top:5px;">
							<form id="addForm" class="form-horizontal ">
								<div class="form-group">
								  <label class="col-md-2 control-label">旧密码 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<input type="password" id="old_password" name="old_password" class="form-control required" maxlength="32"> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">新密码 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<input type="password" id="password" name="password" class="form-control required" maxlength="32"> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">确认新密码 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<input type="password" id="confirmPassword" name="confirmPassword" class="form-control required" equalto="[name='password']" maxlength="32"> 
								  </div>
								</div>
				
							</form>
						</div>
					</div>
					
					<!-- --------------------->
			  
					<div class="form-actions fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-offset-2 col-md-10"> 
									<button id="resetFormBtn" class="btn btn-inverse pull-right"> 重&nbsp;置 </button>
									<button id="confirmAddBtn" class="btn btn-primary pull-right"> 确&nbsp;定 </button>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>

