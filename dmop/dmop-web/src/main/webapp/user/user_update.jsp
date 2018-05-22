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
<title>用户管理 - 修改用户</title>
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
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/tree.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/datagrid.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/panel.css" rel="stylesheet" type="text/css">
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

<script type="text/javascript" src="<%=basePath%>plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/tabletools/TableTools.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/colvis/ColVis.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/columnfilter/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/DT_bootstrap.js"></script>
<!-- 加载国际化语言 -->
<script type="text/javascript" src="<%=basePath%>plugins/datatables/i18n/zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>js/car.plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/url-helper.js"></script>
<script>
$(document).ready(function(){
	App.init();
	Plugins.init();
	CarFormComponents.init();
	
	$("#txtParentOrg").focus(chooseParentOrg);
	$("#btnConfirmChooseParentOrg").click(chooseOrg);
	
	$("#confirmAddBtn").click(updateUser);
	$("#backBtn").click(backToList);
	
	//添加成功对话框
	$("#btnSuccessBack").click(backToList);
	$("#btnSuccessClose").click(function() {
		$("#dlgAddSuccess").modal('hide');
	});
	
	initPermissionGroup();
	queryIfSearchStringExist();
});

function queryIfSearchStringExist() {
	var params = window.location.search;
	if (params != null && params != "") {
		params = params.substr(1);	//去掉?号
		var id = getUrlParam(params, "id");
		if (id != "") {
			getUser(id);
			
		}
	}
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

function backToList() {
	window.location.href="user/user.jsp";
}
function updateUser() {
	var valid = $("#addForm").validate().form();
	var orgName = $("#txtParentOrg").val();
	if (orgName == "") {
		$("#lableParentOrg").addClass("has-error");
		$("#parentOrgErrorMSG").addClass("has-error help-block");
	}
	if (!valid) return;

	var id = $("#userId").val();
	var realname = $("#realname").val();
	var mobilePhone = $("#mobilePhone").val();
	var email = $("#email").val();
	var orgId = $("#hiddenOrgId").val();
	var status = $("#status").val();
	var alarmlev = $("#alarmlev").val();
	var note = $("#note").val();
	var groupId = $("#permissionGroupSelect").val();
	if(groupId==0){
		showNoty("未授予用户权限", "error", true, 'top');
		return;
	}
	var user = {
		"id" : id,
		"realname" : realname,
		"mobilePhone" : mobilePhone,
		"email" : email,
		"orgId" : orgId,
		"status" : status,
		"alarmlev" :alarmlev,
		"note" :note,
		"groupId":groupId
	};
	
	
	var requestParam = {
		"user" : user,
	}
	$.ajax({
		url: 'user/update',
		type: "POST",
		contentType: "application/json",
		dataType:"json",
		data : JSON.stringify(requestParam),
		success: function(data) {
			if (data.success) {
				$("#dlgAddSuccess").modal('show');
			} else {
				showNoty(data.errorMessage, "error", true, 'top');
			}
		}
	});
}

////////////
function chooseParentOrg() {
	$('#dlgChooseParentOrg').modal('show');
	initOrgTreeGrid();
}
function initPermissionGroup(){
	$.post("permissiongroup/getPermissionGroupByOrganization",null,function(data){
		if(data.commonMessage.success){
			for(var i in data.groups){
				$("#permissionGroupSelect").append('<option value="'+data.groups[i].permissionGroupId+'">'+data.groups[i].name+'</option>')
			}
		}else{
			showNoty(data.commonMessage.errorMessage, "error", true, 'top');
		}
	}).error(function(){
		showNoty("出现未知错误", "error", true, 'top');
	});
}
function initOrgTreeGrid() {
		$('#orgTreeGrid').treegrid({
			width: 'auto',
			url:'organization_ui/treegrid',
			idField:'id',
			treeField:'name',
			columns:[[
				{field:'name',title:'名称',width:'40%'},
				{field:'description',title:'描述',width:'30%', 
					formatter: function(value, row, index){
						if (row.data){
							return row.data.description;
						} else {
							return value;
						}
					}
				},
				{field:'create_date',title:'创建日期',width:'15%',
					formatter: function(value, row, index){
						if (row.data){
							return row.data.create_date;
						} else {
							return value;
						}
					}
				}
			]],
			onDblClickRow : function(row) {
				chooseOrg();
			}
		});
	}

function chooseOrg() {
	var node = $("#orgTreeGrid").treegrid("getSelected");
	if (node) {
		$("#txtParentOrg").val(node.name);
		$("#hiddenOrgId").val(node.id);
		$("#lableParentOrg").removeClass("has-error").addClass("has-success");
		$("#parentOrgErrorMSG").removeClass("has-error help-block");
	}
	$('#dlgChooseParentOrg').modal('hide');
}


	
	function getUser(id) {
		var requestData = "id=" + id;
		$.post("user/getUserWithRole", requestData, function(data) {
			if (data.commonMessage.success) {
				var user = data.user;
				var organization=data.organization;
				$("#userId").val(user.userId);
				$("#username").val(user.username);
				$("#realname").val(user.realname);
				$("#mobilePhone").val(user.mobilePhone);
				$("#email").val(user.email);
				//if (user.organization) {
					$("#hiddenOrgId").val(organization.organizationId);
					$("#txtParentOrg").val(organization.name);
				//}
				$("#status").val(user.state);
				$("#alarmlev").val(user.alarmLevelId);
				$("#note").val(user.note);
				//debugger;
				$("#permissionGroupSelect option").each(function(){
					if($(this).val()==user.permissionGroupId){
						$(this).attr('selected','selected');
					}	
				});
				if(null!=user.permissionGroupId){
					initPermissionItem(user.permissionGroupId);					
				}
				
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
			}
		});
	}
	function permissionGroupChange(){
		var groupId = $("#permissionGroupSelect").val();
		initPermissionItem(groupId);
		
	}
	function initPermissionItem(id){
		$('#permissionItem')
		.treegrid(
				{
					url : 'permission/treegridById?id='+id+'',
					idField : 'id',
					treeField : 'name',
					fit : 'true',
					fitColumns : 'true',
					columns : [ [
							{
								field : 'name',
								title : '名称',
								width : '21%'
							},
							{
								field : 'show',
								title : '查询',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".show";

										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'show\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_show'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'export',
								title : '导出',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".export";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'export\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_export'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'add',
								title : '添加',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".add";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'add\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_add'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'import',
								title : '导入',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".import";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'import\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_import'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'delete',
								title : '删除',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".delete";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'delete\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_delete'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'update',
								title : '修改',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".update";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'update\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_update'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'py',
								title : '替补权限A',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code + ".py";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'py\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_py'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'px',
								title : '替补权限B',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code + ".px";

										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'px\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_px'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							}

					] ]
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
					<li> <i class="icon-home"></i> <a href="user/user.jsp">用户管理</a> </li>
					<li class="current"> <a>修改用户</a> </li>
				</ul>
			</div>
	  
			<!--button id="addDriverBtn" class="btn btn-sm btn-success">返回</button-->
			<!--br /-->
			<div class="row" style="padding-top:5px;">
				<div id="addWrapper" class="col-md-12">
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 用户基本信息</h5>
						</div>
						
						<div class="widget-content" style="padding-top:5px;">
							<form id="addForm" class="form-horizontal ">
								<input type="hidden" id="userId" name="userId" value="" />
								
								<div class="form-group">
								  <label class="col-md-2 control-label">登录名 :</label>
								  <div class="col-md-6">
									<input type="text" id="username" name="username" class="form-control" readonly> 
								  </div>
								</div>
								<!--div class="form-group">
								  <label class="col-md-2 control-label">密码 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<input type="password" id="password" name="password" class="form-control required" maxlength="32"> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">确认密码 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<input type="password" id="confirmPassword" name="confirmPassword" class="form-control required" equalto="[name='password']" maxlength="32"> 
								  </div>
								</div-->
								<div class="form-group">
								  <label class="col-md-2 control-label">姓名 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<input type="text" id="realname" name="realname" class="form-control required" maxlength="32"> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">手机 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<input type="text" id="mobilePhone" name="mobilePhone" class="form-control digits required" maxlength="11"> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">电子邮箱 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<input type="text" id="email" name="email" class="form-control email required" maxlength="100"> 
								  </div>
								</div>
				
								<div id="lableParentOrg" class="form-group">
									<label class="col-md-2 control-label">所属组织 <span class="required">*</span> :</label>
									<div class="col-md-6">
										<div class="input-group">
											<input id="txtParentOrg" type="text" class="form-control" style="color:#555;background-color:#fff;" readonly value="">
											<input id="hiddenOrgId" type="hidden" value="">
											<span class="input-group-btn">
												<button class="btn btn-default" onclick="javascript:chooseParentOrg();" type="button">选择</button>
											</span> 
										</div>
									</div>
									<label id="parentOrgErrorMSG" for="txtParentOrg" class="" style="display:none">必选字段</label>
								</div>
				
								<div class="form-group">
								  <label class="col-md-2 control-label">账号状态 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<select id="status" class="form-control required" >
										<option value="1">可用</option>
										<option value="2">禁用</option>
									</select>
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">报警等级 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<select id="alarmlev" class="form-control required" >
										<option value="1">初级报警</option>
										<option value="2">中级报警</option>
										<option value="3">高级报警</option>
										<option value="4">紧急报警</option>
									</select>
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">备注 :</label>
								  <div class="col-md-6">
									<input type="text" id="note" name="note" class="form-control" maxlength="11"> 
								  </div>
								</div>
								<div class="form-group">
										<label class="col-md-2 control-label">用户权限组 : <span
											class="required">*</span> :</label>
										<div class="col-md-10">
											<select id="permissionGroupSelect" onchange="permissionGroupChange()">
												<option value="0">未选择</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">权限组预览 :</label>
										<div class="col-md-10">
											<div
												style="height: 260px; width: 100%; border: 1px solid #d9d9d9; overflow-y: auto">
												<table id="permissionItem"
													style="width: 1150px; height: 258px;"></table>
											</div>
										</div>
									</div>
							</form>
						</div>
					</div>
			
			  
					<div class="form-actions fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-offset-2 col-md-10"> 
									<button id="backBtn" class="btn pull-right"> 返&nbsp;回 </button>
									<!--button id="resetFormBtn" class="btn btn-inverse pull-right"> 重&nbsp;置 </button-->
									<button id="confirmAddBtn" class="btn btn-primary pull-right"> 确&nbsp;定 </button>
								</div>
							</div>
						</div>
					</div>
					
					
					<!--div class="widget box">
						<div class="widget-header">
							<h4><i class="icon-reorder"></i> 新增用户信息 ${titleLabel}</h4>
						</div>
						<div class="widget-content">
					  
					  
						</div>
					</div-->
				</div>
			</div>
		</div>
	</div>
</div>

<div id="dlgAddSuccess" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">修改成功</h4>
      </div>
      <div class="modal-body">
        <p>修改用户成功！ <ul><li>点击【返回列表】查看用户列表。</li><li>点击【关闭】停留此页。</p>
      </div>
      <div class="modal-footer">
		<button id="btnSuccessBack" type="button" class="btn btn-primary">返回列表</button>
        <button id="btnSuccessClose" type="button" class="btn btn-default">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgChooseParentOrg" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 选择用户所属组织</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
			<div style="width:100%">
			
			</div>
		</div>
		<table id="orgTreeGrid" style="height:300px">
                
			</table>
		<!-- end -->
      </div>
      <div class="modal-footer">
		<button id="btnConfirmChooseParentOrg" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>

