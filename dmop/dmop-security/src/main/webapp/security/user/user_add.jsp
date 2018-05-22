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
<title>用户管理 - 新增用户</title>
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
<script>
$(document).ready(function(){
	initRoleList();
	
	App.init();
	Plugins.init();
	CarFormComponents.init();
	
	$("#txtParentOrg").focus(chooseParentOrg);
	$("#btnConfirmChooseParentOrg").click(chooseOrg);
	
	$("#confirmAddBtn").click(addUser);
	$("#resetFormBtn").click(resetForm);
	$("#backBtn").click(backToList);
	
	//添加成功对话框
	$("#btnSuccessContinue").click(resetForm);
	$("#btnSuccessBack").click(backToList);
	$("#btnSuccessClose").click(function() {
		$("#dlgAddSuccess").modal('hide');
	});
	
	queryRole();
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
	$("#hiddenOrgId").val("");
	$("#lableParentOrg").removeClass("has-error");
	$("#parentOrgErrorMSG").removeClass("has-error help-block");
	
	var x = $("#roleListContainer :checkbox:checked").each(function() {
		$(this).attr("checked", false);
	});
	
	/*
	if (x != undefined && x.length > 0) {
		for (var i = 0; i < x.length; i++) {
			//roleIds.push(parseInt(x[i].value));
			$(x[i]).prop("checked", false);
		}
	}
	*/
	
	//globalFuncTree.checkAllNodes(false);
	$("#dlgAddSuccess").modal('hide');
}
function backToList() {
	window.location.href="security/user/user.jsp";
}
function addUser() {
	var valid = $("#addForm").validate().form();
	var orgName = $("#txtParentOrg").val();
	if (orgName == "") {
		$("#lableParentOrg").addClass("has-error");
		$("#parentOrgErrorMSG").addClass("has-error help-block");
	}
	if (!valid) return;

	var username = $("#username").val();
	var password = $("#password").val();
	var realname = $("#realname").val();
	var mobilePhone = $("#mobilePhone").val();
	var email = $("#email").val();
	var orgId = $("#hiddenOrgId").val();
	var status = $("#status").val();
	
	var user = {
		"username" : username,
		"password" : password,
		"realname" : realname,
		"mobilePhone" : mobilePhone,
		"email" : email,
		"orgId" : orgId,
		"status" : status,
	};
	
	var x = $("#roleList tbody tr td.checkbox-column :checkbox:checked");//.prop("checked");
	var roleIds = [];
	if (x != undefined && x.length > 0) {
		for (var i = 0; i < x.length; i++) {
			roleIds.push(parseInt(x[i].value));
		}
	}
	
	var requestParam = {
		"user" : user,
		"roles": roleIds
	}
	$.ajax({
		url: 'user/create',
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

function initRoleList() {
		$("#roleList").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			searching: false,
			info: false,
			scrollY: "200px",
			scrollCollapse: false,
			"columnDefs": [{
				"targets": 0,
				"data": null,
				"render": function ( data, type, full, meta) {
				  //return "<input value=\"" + data.id + "\" type=\"checkbox\" class=\"uniform\">";
				  return "<input value=\"" + data.id + "\" type=\"checkbox\" >";
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('checkbox-column');
				}
			}, {
				"targets": 1,
				"className": "align-left",
				"data": "name"
			}, {
				"className": "align-left",
				"targets": 2,
				"data": "description"
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
	
	function queryRole() {
		$.post('role/getAvailRole', "", function(data) {
			var roles = data.roles;
			$("#roleList").DataTable().rows.add( roles ).draw();
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
					<li> <i class="icon-home"></i> <a href="security/user/user.jsp">用户管理</a> </li>
					<li class="current"> <a>新增用户</a> </li>
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
								<div class="form-group">
								  <label class="col-md-2 control-label">登录名 <span class="required">*</span> :</label>
								  <div class="col-md-6">
									<input type="text" id="username" name="username" class="form-control required" maxlength="32"> 
								  </div>
								</div>
								<div class="form-group">
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
								</div>
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
										<option value="AVAILABLE">可用</option>
										<option value="DISABLED">禁用</option>
									</select>
								  </div>
								</div>
				
							</form>
						</div>
					</div>
					
					<!-- --------------------->
			  
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 权限设置</h5>
						</div>
						<div id="roleListContainer" class="widget-content">
							<table id="roleList" class="table table-highlight-head table-condensed table-bordered table-checkable datatable" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
								<thead>
									<tr>
										<th class="col-md-1 checkbox-column">
											<input type="checkbox" >
										</th>
										<th class="col-md-4 align-center">角色名称</th>
										<th class="col-md-7 align-center">角色描述</th>
									</tr>
								</thead>
							</table> 
						</div>
					</div>	
			  
					<div class="form-actions fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-offset-2 col-md-10"> 
									<button id="backBtn" class="btn pull-right"> 返&nbsp;回 </button>
									<button id="resetFormBtn" class="btn btn-inverse pull-right"> 重&nbsp;置 </button>
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
        <h4 class="modal-title">新增成功</h4>
      </div>
      <div class="modal-body">
        <p>新增用户成功！ <ul><li>点击【继续添加】新增其他记录。</li><li>点击【返回列表】查看用户列表。</p>
      </div>
      <div class="modal-footer">
		<button id="btnSuccessContinue" type="button" class="btn btn-success">继续添加</button>
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

