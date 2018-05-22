<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>组织管理</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/easyui.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/icon.css"
	rel="stylesheet" type="text/css">
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css">
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->
<style>
</style>
<script type="text/javascript"
	src="<%=basePath%>assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/libs/lodash.compat.min.js"></script>
<!--[if lt IE 9]><script src="<%=basePath%>assets/js/libs/html5shiv.js"></script><![endif]-->
<script type="text/javascript"
	src="<%=basePath%>plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/event.swipe/jquery.event.move.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/event.swipe/jquery.event.swipe.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/libs/breakpoints.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/respond/respond.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/cookie/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/daterangepicker/moment-with-langs.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/jquery.noty.js"></script>
<!-- layouts -->
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/bottom.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/bottomCenter.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/bottomLeft.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/bottomRight.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/center.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/centerLeft.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/centerRight.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/inline.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/top.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/topCenter.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/topLeft.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/topRight.js"></script>
<!-- themes -->
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/themes/default.js"></script>

<script type="text/javascript"
	src="<%=basePath%>plugins/blockui/jquery.blockUI.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/select2/select2.min.js"></script>

<script type="text/javascript"
	src="<%=basePath%>plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/validation/messages_zh.js"></script>

<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/plugins.form-components.js"></script>

<script type="text/javascript"
	src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>

<script>
	$(document).ready(function() {
		initPermissionTreeGrid();
		App.init();
		Plugins.init();
		FormComponents.init();
		$("#confirmAddBtn").click(addPermissionGroup);
		$("#resetFormBtn").click(resetForm);
		$("#backBtn").click(backToList);
		//添加成功对话框
		$("#btnSuccessContinue").click(resetForm);
		$("#btnSuccessBack").click(backToList);
		$("#btnSuccessClose").click(function() {
			$("#dlgAddSuccess").modal('hide');
		});

	});
	function initPermissionTreeGrid() {
		$('#permissionGrid')
				.treegrid(
						{
							url : 'permission/treegrid',
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
													return '<input type="checkbox" onchange="changePermission('
															+ row.id
															+ ','
															+ '\'show\''
															+ ')" checked="checked" class="permissionItem"  id="'
															+ row.id
															+ '_show'
															+ '">';
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
													return '<input type="checkbox"  onchange="changePermission('
															+ row.id
															+ ','
															+ '\'export\''
															+ ')" checked="checked"  class="permissionItem"  id="'
															+ row.id
															+ '_export' + '">';
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
													return '<input type="checkbox" onchange="changePermission('
															+ row.id
															+ ','
															+ '\'add\''
															+ ')" checked="checked" class="permissionItem"  id="'
															+ row.id
															+ '_add'
															+ '">';
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
													return '<input type="checkbox" onchange="changePermission('
															+ row.id
															+ ','
															+ '\'import\''
															+ ')" checked="checked" class="permissionItem"  id="'
															+ row.id
															+ '_import' + '">';
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
													return '<input type="checkbox" onchange="changePermission('
															+ row.id
															+ ','
															+ '\'delete\''
															+ ')" checked="checked"  class="permissionItem"  id="'
															+ row.id
															+ '_delete' + '">';
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
													return '<input type="checkbox" onchange="changePermission('
															+ row.id
															+ ','
															+ '\'update\''
															+ ')" checked="checked" class="permissionItem"  id="'
															+ row.id
															+ '_update' + '">';
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
													return '<input type="checkbox" onchange="changePermission('
															+ row.id
															+ ','
															+ '\'py\''
															+ ')" checked="checked" class="permissionItem"  id="'
															+ row.id
															+ '_py'
															+ '">';
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
													return '<input type="checkbox"  onchange="changePermission('
															+ row.id
															+ ','
															+ '\'px\''
															+ ')" checked="checked"  class="permissionItem"  id="'
															+ row.id
															+ '_px'
															+ '">';
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

	function changePermission(id, tail) {
		var a = $('#permissionGrid').treegrid('find', id);
		if (a.children.length == 0) {
			//alert("子节点");
			if ($("#" + id + "_" + tail).is(':checked')) {
				//只要有一个子节点授权，父节点就授权
				var codes = a.data.bit;
				var code = a.data.code + "." + tail;
				//如果没有这个权限码，添加
				if (codes.indexOf(code) == -1) {
					codes.push(code);
					a.data.bit = codes;
				}
				var parent = $('#permissionGrid').treegrid('find', a._parentId);
				var parentCodes = parent.data.bit;
				var parentCode = parent.data.code + "." + tail;
				if (parentCodes.indexOf(parentCode) == -1) {
					parentCodes.push(parentCode);
					parent.data.bit = parentCodes;
					$("#" + a._parentId + "_" + tail).prop("checked", true);
				}
				console.log($('#permissionGrid').treegrid('getData'));
			} else {
				var codes = a.data.bit;
				var code = a.data.code + "." + tail;
				for (var i = 0; i < codes.length; i++) {
					var source = codes[i];
					if (source == code) {
						codes.splice(i, 1);
						break;
					}
				}
				a.data.bit = codes;
				//当一个父节点中所有某一类的权限都没有授权时，父节点也不授权
				var parent = $('#permissionGrid').treegrid('find', a._parentId);
				var children = parent.children;
				var count = 0;
				for (var i = 0; i < children.length; i++) {
					var childrenCode = children[i].data.code + "." + tail;
					var childBits = children[i].data.bit;
					if (childBits.indexOf(childrenCode) > -1) {
						count++;
					}
				}
				if (count == 0) {
					$("#" + a._parentId + "_" + tail).prop("checked", false);
					var parentBits = parent.data.bit;
					var parentCode = parent.data.code + "." + tail;
					for (var i = 0; i < parentBits.length; i++) {
						if (parentBits[i] == parentCode) {
							parentBits.splice(i, 1);
							break;
						}
					}
					parent.data.bit = parentBits;
				}
				console.log($('#permissionGrid').treegrid('getData'));
			}

		} else {
			//alert("父节点");
			//父节点改变子节点除了没有获得权限的选择框，其他的都要跟着改变
			var children = a.children;
			if ($("#" + id + "_" + tail).is(':checked')) {
				var codes = a.data.bit;
				var code = a.data.code + "." + tail;
				var count = 0;

				//如果没有这个权限码，添加
				if (codes.indexOf(code) == -1) {
					codes.push(code);
					a.data.bit = codes;
				}
				//遍历所有子元素，如果子元素的某个权限不是禁止符号（本来就没有权限）就给它相应权限，并且选中
				for (var i = 0; i < children.length; i++) {
					var child = children[i];
					if ($("#" + child.id + "_" + tail).is('input')) {
						var codes = child.data.bit;
						var code = child.data.code + "." + tail;
						if (codes.indexOf(code) == -1) {
							codes.push(code);
							child.data.bit = codes;
							$("#" + child.id + "_" + tail).prop("checked", true);
						}

					}
				}
				console.log($('#permissionGrid').treegrid('getData'));
			} else {
				var codes = a.data.bit;
				var code = a.data.code + "." + tail;
				for (var i = 0; i < codes.length; i++) {
					if (codes[i] == code) {
						codes.splice(i, 1);
						break;
					}
				}
				a.data.bit = codes;

				for (var i = 0; i < children.length; i++) {
					var child = children[i];
					if ($("#" + child.id + "_" + tail).is('input')) {
						var codes = child.data.bit;
						var code = child.data.code + "." + tail;
						for(var x =0;x<codes.length;x++){
							if(codes[x]==code){
								codes.splice(x,1);
								break;
							}
						}
						child.data.bit = codes;
						$("#" + child.id + "_" + tail).prop("checked", false);
						
					}

				}
				console.log($('#permissionGrid').treegrid('getData'));
			}

		}
	}

	function showNoty(text, type, modal, layout) {
		noty({
			text : text,
			type : type,
			dismissQueue : true,
			modal : modal,
			layout : layout,
			theme : 'defaultTheme',
			timeout : 3000
		});
	}

	function resetForm() {
		
		$("#addForm")[0].reset();
		$("#dlgAddSuccess").modal('hide');
	}
	function backToList() {
		window.location.href = "permission/permission.jsp";
	}
	function addPermissionGroup() {
		var name = $("#permissionGroupName").val();
		var desc = $("#permissionGroupDescription").val();

		if (name == "") {
			showNoty("请填写权限组的【名称】!", "error", false, 'top');
			return;
		}
		var permissionGroup = {
			"name" : name,
			"description" : desc
		};
		var permissionData = $('#permissionGrid').treegrid('getData');
		var pool = [];
		
		var permissionPool = a(permissionData,pool);
		console.log(permissionPool);
		var requestParam = {
			"permissionGroup" : permissionGroup,
			"permissionPool" : permissionPool
		}
		$.ajax({
			url : 'permissiongroup/create',
			type : "POST",
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify(requestParam),
			success : function(data) {
				if (data.commonMessage.success) {
					$("#dlgAddSuccess").modal('show');
				} else {
					showNoty(data.commonMessage.errorMessage, "error", true, 'top');
				}
			}
		});
	}
	
	function a(permissionData,pool){
		for(var i in permissionData){
			if(permissionData[i].children.length!=0){
				a(permissionData[i].children,pool);
			}
			pool.push(b(permissionData[i]));
		}
		return pool;
	}
	
	function b(p){
		return {
			'permissionId':p.id,
			'permissionBit':p.data.bit
		};
	}
</script>
</head>
<body>
	<div id="container" style="width:100%;">
		<div id="content">
			<div class="container">
				<div class="crumbs">
					<ul id="breadcrumbs" class="breadcrumb">
						<li><i class="icon-home"></i> <a
							href="security/role/role.jsp">角色管理</a></li>
						<li class="current"><a>新增角色</a></li>
					</ul>
				</div>

				<!--button id="addDriverBtn" class="btn btn-sm btn-success">返回</button-->
				<br />
				<div class="row">
					<div class="col-md-12">
						<div class="widget box">
							<div class="widget-header">
								<h4>
									<i class="icon-reorder"></i> 新增角色信息 ${titleLabel}
								</h4>
							</div>
							<div class="widget-content">
								<form id="addForm" class="form-horizontal ">
									<div class="form-group">
										<label class="col-md-2 control-label">名称 <span
											class="required">*</span> :
										</label>
										<div class="col-md-10">
											<input type="text" id="permissionGroupName" name="permissionGroupName"
												class="form-control required" maxlength="50"> <label
												id="orNameErrorMSG" style="color: red;"></label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">描述 :</label>
										<div class="col-md-10">
											<textarea id="permissionGroupDescription" name="permissionGroupDescription"
												rows="3" class="form-control" maxlength="450"> </textarea>
										</div>

									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">权限设置 :</label>
										<div class="col-md-10">
											<div
												style="height: 260px; width: 100%; border: 1px solid #d9d9d9; overflow-y: auto">
												<table id="permissionGrid"
													style="width: 1150px; height: 258px;"></table>
											</div>
										</div>

									</div>
								</form>
								<div class="form-actions fluid">
									<div class="row">
										<div class="col-md-12">
											<div class="col-md-offset-2 col-md-10">
												<button id="backBtn" class="btn pull-right">
													返&nbsp;回</button>
												<button id="resetFormBtn" class="btn btn-inverse pull-right">
													重&nbsp;置</button>
												<button id="confirmAddBtn"
													class="btn btn-primary pull-right">确&nbsp;定</button>
												<!--a href="javascript:void(0);" class="btn button-previous"> <i class="icon-angle-left"></i> Back </a> 
						<a href="javascript:void(0);" class="btn btn-primary button-next"> Continue <i class="icon-angle-right"></i> </a> 
						<a href="javascript:void(0);" class="btn btn-success button-submit"> Submit <i class="icon-angle-right"></i> </a-->
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
		<div id="dlgAddSuccess" class="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">新增成功</h4>
					</div>
					<div class="modal-body">
						<p>新增组织成功！
						<ul>
							<li>点击【继续添加】新增其他记录。</li>
							<li>点击【返回列表】查看组织列表。
								</p>
					</div>
					<div class="modal-footer">
						<button id="btnSuccessContinue" type="button"
							class="btn btn-success">继续添加</button>
						<button id="btnSuccessBack" type="button" class="btn btn-primary">返回列表</button>
						<button id="btnSuccessClose" type="button" class="btn btn-default">关闭</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
</body>
</html>

