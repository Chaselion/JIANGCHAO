<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
<title>权限管理</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" >
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
<link rel="stylesheet" href="<%=basePath%>plugins/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<style>
table.dataTable tbody tr.selected {
	background-color:#0081c2;
	color: white;
}

#dlgRoleInfo div.form-group {
	margin-bottom: 5px;
}
#dlgRoleInfo .modal-footer {
	padding-top: 6px;
	padding-bottom: 6px;
	margin-top: 0;
}
#dlgRoleInfo .modal-body {
	padding: 2px 20px;
}
#dlgRoleInfo .modal-header {
	padding: 8px 15px;
}
#dlgRoleInfo .widget {
	margin-bottom: 5px;
}
#dlgRoleInfo .widget .widget-header{
	margin-bottom: 8px;
}
#dlgRoleInfo h5 {
	font-size:13px;
	font-weight:bold;
	margin-top:5px;
	margin-bottom:5px;
}
.readonly-white {
	color:#555 !important;
	background-color:#fff !important;
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
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>

<script>
	var permissionPoolCache = {};
	$(document).ready(function() {
		initRoleList();
		$("#btnSearch").click(function () {
			queryRole(0);
		});
		
		$("#btnConfirmDelete").click(requestRemove);
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		
		//界面框架初始化 -- 开始
		App.init();
		Plugins.init();
		CarFormComponents.init();
		//界面框架初始化 -- 结束
		FormComponents.init();
		//添加按钮的点击事件
		$("#addBtn").click(function() {
			$("#dlgpermissionInfo").modal({backdrop: 'static'});
			$("#dlgpermissionInfo").modal("show");
			initPermissionTreeGrid();
			//window.location.href="security/role/permission_group_add.jsp";
		});
		$('#dlgRoleInfo').on('hidden.bs.modal', function (e) {
			//清空表单输入
			$("#roleInfoForm")[0].reset();
		});
		initAlltree();
		//initPermissionTreeGrid();
		//FormComponents.init();
		$("#confirmAddBtn").click(addPermissionGroup);
		$("#resetFormBtn").click(resetForm);
		$("#backBtn").click(function() {
			$("#dlgpermissionInfo").modal('hide');
		});
		queryRole(0);
		$("#getdetilp").click(function() {
			$("#permissionItem").empty();
			//$("#permissionItem").treegrid('unselectAll');
		});
		$("#btnConfirmUpdate").click(function(){
			var groupId = $("#hiddenUpdateId").data('id');
			var name = $("#updatingName").val();
			var desc = $("#updatingDescription").val();

			if (name == "") {
				showNoty("请填写权限组的【名称】!", "error", false, 'top');
				return;
			}
			var permissionGroup = {
				"permissionGroupId":groupId,
				"name" : name,
				"description" : desc
			};
			var permissionData = $('#updatingTreeData').treegrid('getData');
			var pool = [];
			
			var permissionPool = formatPreparedPermissionData(permissionData,pool);
			
			var requestParam = {
				"permissionGroup" : permissionGroup,
				"permissionPool" : permissionPool
			}
			$.ajax({
				url : 'permissiongroup/update',
				type : "POST",
				contentType : "application/json",
				dataType : "json",
				data : JSON.stringify(requestParam),
				success : function(data) {
					if (data.commonMessage.success) {
						showNoty("修改成功", "success", false, 'top');
					} else {
						showNoty(data.commonMessage.errorMessage, "error", true, 'top');
					}
				},
				error: function() {
					showNoty("您无权限操作", "error", true, 'top');
				}
			}).always(function(){
				$("#updatePermissionGroup").modal("hide");
				queryRole(0);
			});
			
			
		});
	});
	function uchangePermission(id, tail) {
		var a = $('#updatingTreeData').treegrid('find', id);
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
				var parent = $('#updatingTreeData').treegrid('find', a._parentId);
				var parentCodes = parent.data.bit;
				var parentCode = parent.data.code + "." + tail;
				if (parentCodes.indexOf(parentCode) == -1) {
					parentCodes.push(parentCode);
					parent.data.bit = parentCodes;
					$("#" + a._parentId + "_" + tail).prop("checked", true);
				}
				console.log($('#updatingTreeData').treegrid('getData'));
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
				var parent = $('#updatingTreeData').treegrid('find', a._parentId);
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
				console.log($('#updatingTreeData').treegrid('getData'));
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
				console.log($('#updatingTreeData').treegrid('getData'));
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
				console.log($('#updatingTreeData').treegrid('getData'));
			}

		}
	}
	function formatPreparedPermissionData(permissionData,pool){
		for(var i in permissionData){
			if(permissionData[i].children.length!=0){
				formatPreparedPermissionData(permissionData[i].children,pool);
			}
			pool.push(prepareData(permissionData[i]));
		}
		return pool;
	}
	
	function prepareData(p){
		return {
			'permissionId':p.id,
			'permissionBit':p.data.bit
		};
	}
	
	
	
	function initAlltree(){
		$.post("permission/treegrid",null,function(data){
			
			
			permissionPoolCache = getOwnPermissionBitMap(data,permissionPoolCache);
			
			
		});
	}
	function getOwnPermissionBitMap(permissionData,pool){
		for(var i in permissionData){
			if(permissionData[i].children.length!=0){
				getOwnPermissionBitMap(permissionData[i].children,pool);
			}
			pool[permissionData[i].id] = permissionData[i].data.bit;
		}
		return pool;
	}
	
	
	function initUpdatingDataTree(id){
		$('#updatingTreeData')
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
											return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'show\''+ ')" checked="checked"  class="permissionItem"  id="'+ row.id+ '_show'+ '">';
										} else {
											if(permissionPoolCache[row.id].indexOf(bit)>-1){
											return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'show\''+ ')"   class="permissionItem"  id="'+ row.id+ '_show'+ '">';												
											}else{
												return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';												
											}
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
											return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'export\''+ ')" checked="checked"  class="permissionItem"  id="'+ row.id+ '_export'+ '">';
										} else {
											if(permissionPoolCache[row.id].indexOf(bit)>-1){
												return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'export\''+ ')"   class="permissionItem"  id="'+ row.id+ '_export'+ '">';
											}else{
												return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';	
											}
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
											return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'add\''+ ')" checked="checked"  class="permissionItem"  id="'+ row.id+ '_add'+ '">';
										} else {
											if(permissionPoolCache[row.id].indexOf(bit)>-1){
												return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'add\''+ ')"   class="permissionItem"  id="'+ row.id+ '_add'+ '">';
											}else{												
												return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
											}
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
											return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'import\''+ ')" checked="checked"  class="permissionItem"  id="'+ row.id+ '_import'+ '">';
										} else {
											if(permissionPoolCache[row.id].indexOf(bit)>-1){
												return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'import\''+ ')"   class="permissionItem"  id="'+ row.id+ '_import'+ '">';
											}else{												
												return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
											}
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
											return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'delete\''+ ')" checked="checked"  class="permissionItem"  id="'+ row.id+ '_delete'+ '">';
										} else {
											if(permissionPoolCache[row.id].indexOf(bit)>-1){
												return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'delete\''+ ')"   class="permissionItem"  id="'+ row.id+ '_delete'+ '">';
											}else{												
												return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
											}
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
											return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'update\''+ ')" checked="checked"  class="permissionItem"  id="'+ row.id+ '_update'+ '">';
										} else {
											if(permissionPoolCache[row.id].indexOf(bit)>-1){
												return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'update\''+ ')"   class="permissionItem"  id="'+ row.id+ '_update'+ '">';
											}else{												
												return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
											}
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
											return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'py\''+ ')" checked="checked"  class="permissionItem"  id="'+ row.id+ '_py'+ '">';
										} else {
											if(permissionPoolCache[row.id].indexOf(bit)>-1){
												return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'py\''+ ')"  class="permissionItem"  id="'+ row.id+ '_py'+ '">';
											}else{												
												return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
											}
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
											return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'px\''+ ')" checked="checked"  class="permissionItem"  id="'+ row.id+ '_px'+ '">';
										} else {
											if(permissionPoolCache[row.id].indexOf(bit)>-1){
												return '<input type="checkbox"  onchange="uchangePermission('+ row.id+ ','+ '\'px\''+ ')"  class="permissionItem"  id="'+ row.id+ '_px'+ '">';
											}else{												
												return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
											}
										}
									} else {
										return value;
									}
								}
							}

					] ]
				});
	}
	
	
	function toUpdate(id) {
		$("#hiddenUpdateId").val = "";
		$("#updatePermissionGroup").modal({backdrop: 'static'});
		$("#updatePermissionGroup").modal("show");
		$.post("permissiongroup/get",{"groupId":id},function(data){
			if(data.commonMessage.success){
				$("#updatingName").val(data.group.name);
				$("#updatingDescription").val(data.group.description);
				initUpdatingDataTree(data.group.permissionGroupId);
				
				$("#hiddenUpdateId").data('id',data.group.permissionGroupId);
			}else{
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
			}
		}).error(function(){
			showNoty(data.commonMessage.errorMessage, "error", true, 'top');
		});
	}
	
	function remove(id) {
		$('#dlgConfirmDelete').data('id', id);
		$('#dlgConfirmDelete').modal('show');
	}
	
	
	function doRemove(id){
		var requestData = $.param({"groupId" : id}, true);
		$.ajax({
			type: "POST",
			url: "permissiongroup/deletePermissionGroup",
			data: requestData,
			dataType: "json",
			success: function(data) {
				if (data.commonMessage.success) {
					showNoty("删除成功", "success", false, 'top');
				} else {
					showNoty(data.commonMessage.errorMessage, "error", false, 'top');
				}		
			},
			error: function() {
				showNoty("您无权限操作", "error", false, 'top');
			}
		}).always(function() {
			$("#dlgConfirmDelete").modal("hide");
			$("#makeSureDelete").modal("hide");
			queryRole(0);
		});
		
	}
	
	//发送删除请求
	function requestRemove() {
		var id = $('#dlgConfirmDelete').data('id');
		if (id != undefined) {
			$("#btnCancelDelete").attr("disabled", "disabled");
			var requestData = $.param({"groupId" : id}, true);
			$.ajax({
				type: "POST",
				url: "user/queryByPermissionGroup",
				data: requestData,
				dataType: "json",
				success: function(data) {
					if (data.commonMessage.success == true) {
						var affectUsers = data.affectUsers;
						if(affectUsers.length>0){
							for(var i in affectUsers){
								$("#bindedUser").append('<li>'+affectUsers[i].realname+'</li>');
							}
							showNoty("该权限组与下列用户绑定,是否删除？", "error", false, 'top');
							$("#makeSureDelete").modal("show");
							$("#btnSureDelete").click(function(){
								doRemove(id);
							});
							
						}else{
							
							doRemove(id);
							
						}
					} else {
						showNoty(data.errorMessage, "error", true, 'top');
					}		
				},
				error: function() {
				}
			}).always(function() {
				resetDelDlgBtns();
			});
		}
	}
	
	//重置删除确认对话框中按钮的文字和状态
	function resetDelDlgBtns() {
		$("#dlgConfirmDelete").modal("hide");
		$('#dlgConfirmDelete').removeData('id');
		
		$("#btnConfirmDelete").button("reset");
		$("#btnCancelDelete").removeAttr("disabled", "disabled");
	}
	

	
var gStart = 0;
var gEnd = 0;
var rowNum = -1;
function queryRole(start) {
	start = start || 0;
	
	var name = $("#txtSearchName").val();
	
	var param = {};
	param["name"] = name;
	param["start"] = start;
	param["countPerPage"] = 50;
	
	var requestData = $.param(param, true);
	
	$("#roleList").DataTable().clear().draw();
	drawPageInfo(0, 0, 0);
		
	var emptyPager = '<ul class="pagination">' + 
				'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
				'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
			'</ul>';
	$("#divPager").empty().append(emptyPager);
	
	$.post('permissiongroup/querypage', requestData, function(data) {
		var roles = data.permissiongroups;
		var page = data.page;
		
		gStart = page.start + 1;
		gEnd = gStart + page.limit - 1;
		var count = page.count;
		gStart = Math.min(gStart, count);
		gEnd = Math.min(gEnd, count);
		
		rowNum = gStart;
		
		$("#roleList").DataTable().rows.add( roles ).draw();
		drawPageInfo(gStart, gEnd, count);
		
		var pager = getPagerHtml(page.currentPage, page.totalPage, "toPage");
		$("#divPager").empty().append(pager);
	});
}

function drawPageInfo(start, end, total) {
	var pageInfo = '<div style="float:left;margin-top:20px;">' + 
				'显示第 ' + start + ' 至 ' + end + '  项结果，共 ' + total + '  项' + // (由 ' + recordsTotal + '  项结果过滤)' + 
			'</div>';
	$("#divPageInfo").empty().append(pageInfo);
}

function toPage(pageIndex) {
	var countPerPage = 50;
	var start = pageIndex * countPerPage;
	queryRole(start);
}
	
	function initRoleList() {
		$("#roleList").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			searching: false,
			info: false,
			//scrollY: "400px",
			scrollCollapse: false,
			"columnDefs": [{
				"targets": 0,
				"data": null,
				"className": "align-center",
				"render": function ( data, type, full, meta) {
				  //return "<input value=\"" + data.id + "\" type=\"checkbox\" class=\"uniform\">";
				  
				  return rowNum++;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					//$(td).addClass('checkbox-column');
				}
			}, {
				"targets": 1,
				"className": "align-center",
				"data": "name"
			}, {
				"className": "align-left",
				"targets": 2,
				"data": "description"
			},{
				"className": "align-center",
				"targets": 3,
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.createDateTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
			}, {
				"className": "align-center",
				"targets": 4,
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.modifyDateTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
			}, {
				"targets": 5,
				"data": null,
				"render": function ( data, type, full, meta ) {
					var html = '<ul class="table-controls"> ';
					html += '<li><a href="javascript:getDetail(' + data.permissionGroupId+');" class="bs-tooltip" title="详情"><i class="icon-search"></i></a></li> ';
					
						html += '<shiro:hasPermission name="System.SecurityMgmt.Org.update"><li><a href="javascript:toUpdate(' + data.permissionGroupId+ ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li></shiro:hasPermission> <shiro:hasPermission name="System.SecurityMgmt.Org.delete"><li><a href="javascript:remove(' + data.permissionGroupId + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li></shiro:hasPermission> ';
					
					html += ' </ul>'
				  return html;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
			}]
		});
		
		$('#roleList').on('draw.dt', function () {
			$('#roleList').find(".bs-tooltip").tooltip({
				container: "body"
			});
			
			$('#roleList tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
					$(this).removeClass('selected');
				}
				else {
					$("#roleList").DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			} );
		});
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
	
	
	function getDetail(roleId) {
		$("#dlgRoleInfo").modal({backdrop: 'static'});
		$("#dlgRoleInfo").modal("show");
		$.post("permissiongroup/get",{"groupId":roleId},function(data){
			if(data.commonMessage.success){
				$("#roleName").val(data.group.name);
				$("#roleDescription").val(data.group.description);
				initDataTree(data.group.permissionGroupId);
				
			}else{
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
			}
		}).error(function(){
			showNoty(data.commonMessage.errorMessage, "error", true, 'top');
		});
		
		
		//var requestData = "id=" + roleId;
		
	}
	function initDataTree(id){
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
<div id="container" style="width:100%;">
  <div id="content">
    <div class="container">
	  <div style="padding-top:5px;">
      </div>
	  
	  <div style="padding-top:5px;">
				<div class="col-md-6">
				<shiro:hasPermission name="System.SecurityMgmt.Org.add">
                <button id="addBtn" class="btn btn-sm btn-success">新增权限组</button>
                </shiro:hasPermission>
					
				</div>
		
				<div class="col-md-6">
					<div style="float:right;display:inline-block;width:270px;">
						<!-- <div class="input-group">
							<input type="text" class="form-control" id="txtSearchName" placeholder="输入权限名称进行过滤" value="" />
							<span class="input-group-btn">
								<button id="btnSearch" class="btn btn-primary" type="button"><i class="icon-search"></i> 过滤 </button>
							</span> 
						</div> -->
					</div>
					
				</div>
			</div>
	  
	  <div class="row">
        <div class="col-md-12">
		  <table id="roleList" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
                <thead>
                  <tr>
                   <th class="align-center" style="width:40px;">
						#
					</th>
                    <th class="col-md-2 align-center">权限组名称</th>
					<th class="col-md-4 align-center">描述</th>
					<th class="align-center col-md-2">创建时间</th>
					<th class="align-center col-md-2">修改时间</th>
					<th class="col-md-2 align-center">操作</th>
                  </tr>
                </thead>
          </table>  
        </div>
      </div>
	  <div class="row">
		<div id="divPageInfo" class="col-md-6">
			<div style="float: left; margin-top: 20px;">显示第 0 至 0 项结果，共 0 项 </div>
			</div>
			<div class="col-md-6">
				<div id="divPager" style="float: right;">
					<ul class="pagination">
						<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>
						<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

</div>

<div id="updatePermissionGroup" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 权限信息</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
        <div class="row">
			<div class="col-md-12">
			  <form id="roleInfoForm" class="form-horizontal">
			  		<div id="hiddenUpdateId" hidden="hidden"></div>
					<div class="form-group">
					  <label class="col-md-2 control-label">名称 :</label>
					  <div class="col-md-3">
						<input type="text" id="updatingName" name="updatingName" class="form-control "  maxlength="50"> 
					  </div>
					  <label class="col-md-2 control-label">描述   :</label>
					  <div class="col-md-3">
					  <input type="text" id="updatingDescription" name="updatingDescription" class="form-control "  maxlength="450">
					  </div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">权限设置 :</label>
							<div class="col-md-10">
								<div style="height: 260px; width: 100%; border: 1px solid #d9d9d9; overflow-y: auto">
									<table id="updatingTreeData" style="width: 1150px; height: 258px;"></table>
								</div>
							</div>
					</div>
				  </form>
			</div>
		</div>
		<!-- end -->
	  
      </div>
      <div class="modal-footer">
        <button id="btnConfirmUpdate" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button  type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div id="dlgRoleInfo" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 权限信息</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
        <div class="row">
			<div class="col-md-12">
			  <form id="roleInfoForm" class="form-horizontal">
					<div class="form-group">
					  <label class="col-md-2 control-label">名称 :</label>
					  <div class="col-md-3">
						<input type="text" id="roleName" name="roleName" class="form-control readonly-white" readonly maxlength="50"> 
					  </div>
					  <label class="col-md-2 control-label">描述 :</label>
					  <div class="col-md-3">
					  <input type="text" id="roleDescription" name="roleDescription" class="form-control readonly-white" readonly maxlength="450"> 
					  </div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">权限设置 :</label>
							<div class="col-md-10">
								<div style="height: 260px; width: 100%; border: 1px solid #d9d9d9; overflow-y: auto">
									<table id="permissionItem" style="width: 1150px; height: 258px;"></table>
								</div>
							</div>
					</div>
				  </form>
			</div>
		</div>
		<!-- end -->
	  
      </div>
      <div class="modal-footer">
        <button type="button" id="getdetilp" class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgConfirmDelete" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">删除权限信息</h4>
      </div>
      <div class="modal-body">
        <p>您确定要删除权限信息吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div id="makeSureDelete" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">下列用户和该权限组绑定，是否删除？</h4>
      </div>
      <div class="modal-body">
        <ul id="bindedUser">
        	
        </ul>
      </div>
      <div class="modal-footer">
		<button id="btnSureDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnAbandonDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-- /新增权限 -->
<script>
	$(document).ready(function() {
		//initPermissionTreeGrid();
		//App.init();
		//Plugins.init();
		//FormComponents.init();
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
															+ ')" checked="checked" class="permissionItem"  id="b'
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
															+ ')" checked="checked"  class="permissionItem"  id="b'
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
															+ ')" checked="checked" class="permissionItem"  id="b'
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
															+ ')" checked="checked" class="permissionItem"  id="b'
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
															+ ')" checked="checked"  class="permissionItem"  id="b'
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
															+ ')" checked="checked" class="permissionItem"  id="b'
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
															+ ')" checked="checked" class="permissionItem"  id="b'
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
															+ ')" checked="checked"  class="permissionItem"  id="b'
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
			if ($("#b" + id + "_" + tail).is(':checked')) {
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
					$("#b" + a._parentId + "_" + tail).prop("checked", true);
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
					$("#b" + a._parentId + "_" + tail).prop("checked", false);
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
			if ($("#b" + id + "_" + tail).is(':checked')) {
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
					if ($("#b" + child.id + "_" + tail).is('input')) {
						var codes = child.data.bit;
						var code = child.data.code + "." + tail;
						if (codes.indexOf(code) == -1) {
							codes.push(code);
							child.data.bit = codes;
							$("#b" + child.id + "_" + tail).prop("checked", true);
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
					if ($("#b" + child.id + "_" + tail).is('input')) {
						var codes = child.data.bit;
						var code = child.data.code + "." + tail;
						for(var x =0;x<codes.length;x++){
							if(codes[x]==code){
								codes.splice(x,1);
								break;
							}
						}
						child.data.bit = codes;
						$("#b" + child.id + "_" + tail).prop("checked", false);
						
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
			timeout : 500
		});
	}

	function resetForm() {
		//initPermissionTreeGrid();
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
					$("#dlgpermissionInfo").modal('hide');
					$("#permissionGrid").treegrid('reload');
					$("#permissionGrid").treegrid('unselectAll');	
					resetForm();
					queryRole(0);
					showNoty("新增成功", "success", false, 'top');
				} else {
					showNoty(data.commonMessage.errorMessage, "error", true, 'top');
				}
			},
			error: function() {
				showNoty("您无权限操作", "error", true, 'top');
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
<div id="dlgpermissionInfo" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 新增权限</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
					<div class="col-md-12">
						<div class="widget ">
							
							<div class="widget-content">
								<form id="addForm" class="form-horizontal ">
									<div class="form-group">
										<label class="col-md-2 control-label">名称 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
											<input type="text" id="permissionGroupName" name="permissionGroupName"
												class="form-control required" maxlength="50"> <label
												id="orNameErrorMSG" style="color: red;"></label>
										</div>
										<label class="col-md-2 control-label">描述 :</label>
										<div class="col-md-3">
											<input type="text" id="permissionGroupDescription" name="permissionGroupDescription"
												class="form-control " maxlength="450"> 
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-md-2 control-label">权限设置 :</label>
										<div class="col-md-10">
											<div style="height: 260px; width: 100%; border: 1px solid #d9d9d9; overflow-y: auto">
												<table id="permissionGrid" style="width: 1150px; height: 258px;"></table>
											</div>
										</div>

									</div>
								</form>
								<div class="form-actions fluid">
									<div class="row">
										<div class="col-md-12">
											<div class="col-md-offset-2 col-md-10">
												<button id="backBtn" class="btn pull-right">
													取&nbsp;消</button>
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
		<!-- end -->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>

