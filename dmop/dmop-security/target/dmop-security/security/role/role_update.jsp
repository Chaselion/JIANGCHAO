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
<title>角色管理 - 修改角色</title>
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
<link rel="stylesheet" href="<%=basePath%>plugins/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<style>
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
<script type="text/javascript" src="<%=basePath%>plugins/select2/select2.min.js"></script>

<script type="text/javascript" src="<%=basePath%>plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/validation/messages_zh.js"></script>

<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/zTree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/zTree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>js/url-helper.js"></script>
<script>
$(document).ready(function(){
	
	App.init();
	Plugins.init();
	FormComponents.init();
	
	$("#confirmBtn").click(updateRole);
	$("#backBtn").click(backToList);
	
	//添加成功对话框
	$("#btnSuccessBack").click(backToList);
	$("#btnSuccessClose").click(function() {
		$("#dlgSuccess").modal('hide');
	});
	
	queryIfSearchStringExist();
});

function queryIfSearchStringExist() {
	var params = window.location.search;
	if (params != null && params != "") {
		params = params.substr(1);	//去掉?号
		var id = getUrlParam(params, "id");
		if (id != "") {
			getRole(id);
		}
	}
}

var zTreeSettingCheck = {
	check: {
		enable: true
	},
	
	data: {
		/*
		simpleData: {
			enable: true,
			idKey: "id",
			pIdKey: "pid"
		},
		*/
		key: {
			"children": "children",
			"name": "name"
		}
	}
};

var globalFuncTree = null;

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

function backToList() {
	window.location.href="security/role/role.jsp";
}
function updateRole() {
	var id = $("#roleId").val();
	var name = $("#roleName").val();
	var desc = $("#roleDescription").val();
	
	if (id == "") {
		showNoty("未指定要修改的角色!", "error", false, 'top');
		return;
	}
	if (name == "") {
		showNoty("请填写角色的【名称】!", "error", false, 'top');
		return;
	}
	
	var role = {
		"id" : id,
		"name" : name,
		"description" : desc
	};
	
	var funcNodes = globalFuncTree.getCheckedNodes(true);
	var funcIds = extractCheckedId(funcNodes, "car");
	
	var requestParam = {
		"role" : role,
		"funcs": funcIds
	}
	$.ajax({
		url: 'role/update',
		type: "POST",
		contentType: "application/json",
		dataType:"json",
		data : JSON.stringify(requestParam),
		success: function(data) {
			if (data.success) {
				$("#dlgSuccess").modal('show');
			} else {
				showNoty(data.errorMessage, "error", true, 'top');
			}
		}
	});
}

function extractCheckedId(treeNodes) {
	var ids = [];
	var tmp = null;
	for (var i = 0, len = treeNodes.length; i < len; i++) {
		tmp = treeNodes[i];
		ids.push(tmp.id);
	}
	
	return ids;
}

	function getRole(roleId) {
		var requestData = "id=" + roleId;
		$.post("role/getRole", requestData, function(data) {
			if (data.commonMessage.success) {
				var role = data.role;
				
				$("#roleId").val(role.id);
				$("#roleName").val(role.name);
				$("#roleDescription").val(role.description);
				
				var funcs = data.funcs;
				globalFuncTree = $.fn.zTree.init($("#funcTree"), zTreeSettingCheck, funcs);
				globalFuncTree.expandAll(true);
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
				//$("#orgTreeGrid").treegrid('reload');
				//$("#orgTreeGrid").treegrid('unselectAll');
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
          <li> <i class="icon-home"></i> <a href="security/role/role.jsp">角色管理</a> </li>
          <li class="current"> <a>修改角色</a> </li>
        </ul>
      </div>
	  
	  <!--button id="addDriverBtn" class="btn btn-sm btn-success">返回</button-->
	  <br />
	  <div class="row">
        <div class="col-md-12">
		  <div class="widget box">
            <div class="widget-header">
              <h4><i class="icon-reorder"></i> 修改角色信息 ${titleLabel}</h4>
            </div>
            <div class="widget-content">
              <form id="addForm" class="form-horizontal ">
				<input type="hidden" id="roleId" name="roleId" value="" />
				<div class="form-group">
                  <label class="col-md-2 control-label">名称 <span class="required">*</span> :</label>
                  <div class="col-md-10">
                    <input type="text" id="roleName" name="roleName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
					 
                </div>
				<div class="form-group">
                  <label class="col-md-2 control-label">描述 :</label>
                  <div class="col-md-10">
                    <textarea id="roleDescription" name="roleDescription" rows="3" class="form-control" maxlength="450"> </textarea>
                  </div>
					 
                </div>
				<div class="form-group">
                  <label class="col-md-2 control-label">权限设置 :</label>
                  <div class="col-md-10">
					<div style="height:260px;width:100%;border:1px solid #d9d9d9;overflow-y:auto">
						<ul id="funcTree" class="ztree" ></ul>
					</div>
                  </div>
					 
                </div>
              </form>
			  <div class="form-actions fluid">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="col-md-offset-2 col-md-10"> 
						<button id="backBtn" class="btn pull-right"> 返&nbsp;回 </button>
						<button id="confirmBtn" class="btn btn-primary pull-right"> 确&nbsp;定 </button>
					  </div>
                    </div>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
	  
  </div>
</div>

<div id="dlgSuccess" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">修改成功</h4>
      </div>
      <div class="modal-body">
        <p>修改角色成功！ <ul><li>点击【返回列表】查看角色列表。</li><li>点击【关闭】停留此页。</li></p>
      </div>
      <div class="modal-footer">
		<button id="btnSuccessBack" type="button" class="btn btn-primary">返回列表</button>
        <button id="btnSuccessClose" type="button" class="btn btn-default">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</body>
</html>

