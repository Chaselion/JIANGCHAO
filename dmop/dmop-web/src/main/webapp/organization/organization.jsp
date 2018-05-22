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
<title>组织管理</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" >
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/easyui.css" rel="stylesheet" type="text/css" >
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/icon.css" rel="stylesheet" type="text/css" >
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css">
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->
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
<script type="text/javascript" src="<%=basePath%>plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/select2/select2.min.js"></script>

<script type="text/javascript" src="<%=basePath%>plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/validation/messages_zh.js"></script>

<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>js/car.plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>

<script>
	$(document).ready(function() {
		initOrgTreeGrid();
		
		/*
		$('#carList').on('draw.dt', function () {
			$('#carList').find(".bs-tooltip").tooltip({
				container: "body"
			});
		});
		*/
		getCustoms();
		getalarm();
		getalarms();
		$("#btnConfirmDelete").click(requestRemove);
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		$("#confirmAddBtn").click(addOrg);
		$("#resetFormBtn").click(resetForm);
		$("#backOrgBtn").click(function() {
			$("#dlgOrgInfos").modal('hide');
		});
		$("#btnConfirmOrgForm").click(updateOrg);	//提交修改表单
		$("#btnConfirmexport").click(exportAlarm);
		$('#dlgOrgForm').on('hidden.bs.modal', function (e) {
			//清空表单输入
			$("#orgForm")[0].reset();
			$("#orgForm").validate().resetForm();
		});
		
		//界面框架初始化 -- 开始
		App.init();
		Plugins.init();
		CarFormComponents.init();
		//界面框架初始化 -- 结束
		
		//添加按钮的点击事件
		$("#addOrgBtn").click(function() {
			$("#dlgOrgInfos").modal({backdrop: 'static'});
			$("#dlgOrgInfos").modal("show");
			//window.location.href="organization/organization_add.jsp";
		});
		
		//"删除选中"按钮点击事件
		$("#delSelectedBtn").click(function () {
			var node = $("#orgTreeGrid").treegrid("getSelected");
			if (node) {
				removeOrg(node.id);
			} else {
				showNoty("请选择要删除的组织信息！", "error", false, 'top');
			}
		})
	});
	
	function updateOrg() {
		var valid = $("#orgForm").validate().form();
		if (!valid) return;
		
		var orgId = $("#orgId").val();
		var name = $("#orgName").val();
		var desc = $("#orgDescription").val();
		var customid = $("#customid").val();
		var orgtype = $("#type").val();
		var alarmstrategyid = $("#alarmstrategyid").val();
		var note = $("#note").val();
		var org = {
			"organizationId" : orgId,
			"name" : name,
			"description" : desc,
			"customId" : customid,
			"type" : orgtype,
			"alarmStrategyId" : alarmstrategyid,
			"note" : note
		};
		
		$.ajax({
			url: 'organization/update',
			type: "POST",
			contentType: "application/json",
			dataType:"json",
			data : JSON.stringify(org),
			success : function(data){
				if (data.success) {
					showNoty("保存成功!", "success", false, 'top');
					
					$("#dlgOrgForm").modal("hide");
					$("#orgTreeGrid").treegrid('reload');
					$("#orgTreeGrid").treegrid('unselectAll');
				} else {
					showNoty(data.errorMessage, "error", true, 'top');
				}
			},
			error: function() {
				showNoty("您无权限操作", "error", true, 'top');
			}
		});
	}
	
	function removeOrg(orgId) {
		$('#dlgConfirmDelete').data('orgId', orgId);
		$('#dlgConfirmDelete').modal('show');
	}
	
	//发送删除请求
	function requestRemove() {
		var orgId = $('#dlgConfirmDelete').data('orgId');
			
		if (orgId != undefined) {
			$("#btnCancelDelete").attr("disabled", "disabled");
			
			var requestData = $.param({"orgId" : orgId}, true);
			$.ajax({
				type: "POST",
				url: "organization/delete",
				data: requestData,
				dataType: "json",
				success: function(data) {
					if (data.success == true) {
						showNoty("删除成功!", "success", false, 'top');
						$("#orgTreeGrid").treegrid('reload');
						$("#orgTreeGrid").treegrid('unselectAll');
					} else {
						showNoty(data.errorMessage, "error", true, 'top');
					}		
				},
				error: function() {
					showNoty("您无权限操作", "error", true, 'top');
				}
			}).always(function() {
				resetDelDlgBtns();
			});
		}
	}
	//获取报警策略
	function getalarm() {
	    $.post("organization/queryAlarmStrategy", "", function(data) {
		  if (data.commonMessage.success) {
			var alarms = data.alarmStrategy;
			var jqCompanyList = $("#alarmstrategyid");
			for (var i = 0; i < alarms.length; i++) {
				var tmpCom = alarms[i];
				jqCompanyList.append('<option value="' + tmpCom.alarmStrategyId + '">' + tmpCom.name + '</option>');
			}
		} else {
			showNoty(data.commonMessage.errorMessage, "error", false, 'top');
		}
	});
	}
	//获取客户
	function getCustoms() {
	    $.post("organization/querycustom", "", function(data) {
		  if (data.commonMessage.success) {
			var customs = data.customs;
			var jqCompanyList = $("#customid");
			for (var i = 0; i < customs.length; i++) {
				var tmpCom = customs[i];
				jqCompanyList.append('<option value="' + tmpCom.customId + '">' + tmpCom.name + '</option>');
			}
		} else {
			showNoty(data.commonMessage.errorMessage, "error", false, 'top');
		}
	});
	}
	
	//导出数据
	function exportAlarm() {
		
		var form = $("<form>");	//定义一个form表单
		form.attr("style", "display:none");
		form.attr("target", "");
		form.attr("method", "post");
		form.attr("action", <%=basePath%> + "DownloadOrgQuery");
	  
		$("body").append(form);
		form.submit();//表单提交
		form.remove();
		resetexportDlgBtns();
	}
	//重置导出确认对话框中按钮的文字和状态
	function resetexportDlgBtns() {
		$("#dlgConfirmexport").modal("hide");
		
		
		$("#btnConfirmexport").button("reset");
		$("#btnCancelexport").removeAttr("disabled", "disabled");
	}
	function  exportshow(){
		$('#dlgConfirmexport').modal('show');
	}

	//上传表格
	function doExcelUpload(param){
		
		var fd = new FormData();
		if(param.files[0]){	
			
			fd.append('fileToUpload',param.files[0]);
			fd.append('table',"organization");
			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener("progress",uploadProgress,false);
			xhr.addEventListener("load", uploadComplete, false);  
		    xhr.addEventListener("error", uploadFailed, false);  
		    xhr.addEventListener("abort", uploadCanceled, false);  
		    xhr.open("POST", "excel/addorganization");//修改成自己的接口  
		    xhr.send(fd);
		    var file=$("#excel").val();
		}
		
	}
	
	function uploadProgress(evt) {  
        if (evt.lengthComputable) {  
          var percentComplete = Math.round(evt.loaded * 100 / evt.total);  
          document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';  
        }  
        else {  
          document.getElementById('progressNumber').innerHTML = 'unable to compute';  
        }  
      }
	function uploadComplete(evt) {  
	       /* 服务器端返回响应时候触发event事件*/ 
	        var res = JSON.parse(evt.target.responseText);
		 if (res.commonMessage.success == true) {
	       showNoty(res.commonMessage.errorMessage, "success", false, 'top');
	       $("#orgTreeGrid").treegrid('reload');
			$("#orgTreeGrid").treegrid('unselectAll');
	       }else{
	    	   showNoty(res.commonMessage.errorMessage, "error", true, 'top');
	       }
		}  
		function uploadFailed(evt) {  
	      // alert("There was an error attempting to upload the file.");  
		}  
		function uploadCanceled(evt) {  
	       //alert("The upload has been canceled by the user or the browser dropped the connection.");  
		}
	
	//重置删除确认对话框中按钮的文字和状态
	function resetDelDlgBtns() {
		$("#dlgConfirmDelete").modal("hide");
		$('#dlgConfirmDelete').removeData('orgId');
		
		$("#btnConfirmDelete").button("reset");
		$("#btnCancelDelete").removeAttr("disabled", "disabled");
	}
	
	//获取组织信息，并弹出修改对话框
	function getOrg(orgId) {
		var requestData = "orgId=" + orgId;
		$.post("organization/getOrg", requestData, function(data) {
			if (data.commonMessage.success) {
				var org = data.org;
				
				$("#orgId").val(org.organizationId);
				$("#orgName").val(org.name);
				$("#orgDescription").val(org.description);
				$("#customid").val(org.customId);
				$("#type").val(org.type);
				$("#alarmstrategyid").val(org.alarmStrategyId);
				$("#note").val(org.note);
				$("#dlgOrgForm").modal({backdrop: 'static'});
				$("#dlgOrgForm").modal("show");
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
				$("#orgTreeGrid").treegrid('reload');
				$("#orgTreeGrid").treegrid('unselectAll');
			}
		});
	}
	
	function initOrgTreeGrid() {
		$('#orgTreeGrid').treegrid({
			url:'organization_ui/ctreegrid',
			idField:'id',
			treeField:'name',
			columns:[[
				{field:'name',title:'名称',width:'25%'},
				{field:'custom',title:'客户',width:'15%',
					formatter: function(value, row, index){
						if (row.data){
							return row.data.custom;
						} else {
							return value;
						}
					}
				},
				{field:'description',title:'备注',width:'17%', 
					formatter: function(value, row, index){
						if (row.data){
							return row.data.description;
						} else {
							return value;
						}
					}
				},
				{field:'alarmStrategyId',title:'报警策略',width:'10%',
					formatter: function(value, row, index){
						if (row.data){
							return row.data.alarmStrategyId;
						} else {
							return value;
						}
					}
				},{field:'create_date',title:'创建日期',width:'12%',
					formatter: function(value, row, index){
						if (row.data){
							return row.data.create_date;
						} else {
							return value;
						}
					}
				},{field:'modify_date',title:'修改日期',width:'12%',
					formatter: function(value, row, index){
						if (row.data){
							return row.data.modify_date;
						} else {
							return value;
						}
					}
				},
				{field:'operation',title:'操作',width:'10%', align:'center',
					formatter: function(value, row, index){
						if (row.id!=1){
						return '<ul class="table-controls"> <shiro:hasPermission name="System.SecurityMgmt.Ani.update"><li><a href="javascript:getOrg(' + row.id + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li></shiro:hasPermission> <shiro:hasPermission name="System.SecurityMgmt.Ani.delete"><li><a href="javascript:removeOrg(' + row.id + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li></shiro:hasPermission> </ul>';
						}else{
							return "";
						}
						}
				}
			]]
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
</script>
</head>
<body>
<div id="container" style="width:100%;">
  <div id="content">
    <div class="container">
	  <div style="padding-top:5px;">
      </div>
	  
	  <shiro:hasPermission name="System.SecurityMgmt.Ani.add">
                <button id="addOrgBtn" class="btn btn-sm btn-success">新增组织</button>
                </shiro:hasPermission>
                <shiro:hasPermission name="System.SecurityMgmt.Ani.delete">
                <button id="delSelectedBtn" class="btn btn-sm btn-primary">删除选中</button>
                </shiro:hasPermission>
	  <shiro:hasPermission name="System.SecurityMgmt.Ani.export">
               <button id="btnOutPut" class="btn btn-sm btn-success" type="button"  onclick="javascript:exportshow();">导出</button>
                </shiro:hasPermission>
					<shiro:hasPermission name="System.SecurityMgmt.Ani.import">
                <button id="importExcel" class="btn btn-sm btn-success" onclick="$('#excel').click();return false;" >导入</button>
                </shiro:hasPermission>

			    <input type="file" id="excel" onchange="doExcelUpload(this);" style="display: none">
	  <hr class="hr-margin-sm" />
	  
	  <div class="row">
        <div class="col-md-12">
		  <table id="orgTreeGrid">
          </table>	  
        </div>
      </div>
	  
	</div>
</div>

</div>

<div id="dlgOrgForm" class="modal">
  <div class="modal-dialog modal-lg" style="width:600px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 修改组织信息</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
        <div class="row">
			<div class="col-md-12">
			  <form id="orgForm" class="form-horizontal">
					<input type="hidden" id="orgId" name="orgId" value="-1">
					
					<div class="form-group">
					  <label class="col-md-3 control-label">名称 <span class="required">*</span> :</label>
					  <div class="col-md-3">
						<input type="text" id="orgName" name="orgName" class="form-control required" maxlength="50"> 
					  </div>
					  <label class="col-md-3 control-label">报警策略 :</label>
					  <div class="col-md-3">
						
						<select id="alarmstrategyid" name="alarmstrategyid" class="form-control input-sm" style="width:100%"></select>
					  </div>
					</div>
					<div class="form-group" style="display:none">
					  <label class="col-md-3 control-label">客户 <span class="required">*</span> :</label>
					  <div class="col-md-3">
						
						<select id="customid" name="customid" class="form-control input-sm" style="width:100%"></select>
					  </div>
					</div>
					<div class="form-group" style="display:none">
					  <label class="col-md-3 control-label">组织类型<span class="required">*</span> :</label>
					  <div class="col-md-3">
						<select id="orgtype" name="orgtype" class="form-control input-sm" style="width:100%">
                       <option value="1">大型</option>
                        <option value="2">中等</option>
                  
                  </select>
					  </div>
					</div>
				
					<div class="form-group" style="display:none">
					  <label class="col-md-3 control-label">备注  :</label>
					  <div class="col-md-3">
						<input type="text" id="note" name="orgName" class="form-control required" maxlength="50"> 
					  </div>
					</div>
					<div class="form-group" >
					  <label class="col-md-3 control-label">备注 :</label>
					  <div class="col-md-3">
					  <input type="text" id="orgDescription" name="orgDescription" class="form-control" maxlength="50"> 
						
					  </div>
					</div>
				  </form>
			</div>
		</div>
		<!-- end -->
	  
      </div>
      <div class="modal-footer">
		<button id="btnConfirmOrgForm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgConfirmDelete" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">删除组织信息</h4>
      </div>
      <div class="modal-body">
        <span>您确定要删除组织信息吗?(<span style="color: red">删除组织时同时删除该组织下用户和终端！</span>)</span>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div id="dlgConfirmexport" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">导出组织信息</h4>
      </div>
      <div class="modal-body">
        <p>您确定要导出组织信息吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmexport" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelexport" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- /新增组织 -->
<script>
$(document).ready(function(){
	$("#txtParentOrg").focus(chooseParentOrg);
	$("#btnConfirmChooseParentOrg").click(chooseOrg);
	FormComponents.init();
	
	
	//添加成功对话框
	$("#btnSuccessContinue").click(resetForm);
	$("#btnSuccessBack").click(backToList);
	$("#btnSuccessClose").click(function() {
		$("#dlgAddSuccess").modal('hide');
	});
	
});

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

function resetForm() {
	$("#addOrgForm")[0].reset();
	$("#hiddenParentId").val("");
	
	$("#dlgAddSuccess").modal('hide');
}
function backToList() {
	window.location.href="organization/organization.jsp";
}
function addOrg() {
	//var valid = $("#addOrgForm").validate().form();
	//if (!valid) return;
	var parentId = $("#hiddenParentId").val();
	var name = $("#addorgName").val();
	var desc = $("#addorgDescription").val();
	var customid = $("#addcustomid").val();
	var orgtype = $("#addorgtype").val();
	var alarmstrategyid = $("#addalarmstrategyid").val();
	var note = $("#addnote").val();
	if (parentId == "") {
		showNoty("请选择上级组织!", "error", false, 'top');
		return;
	}
	if (name == "") {
		showNoty("请填写名称!", "error", false, 'top');
		return;
	}
	var org = {
		"parentId" : parentId,
		"name" : name,
		"description" : desc,
		"customId" : customid,
		"type" : orgtype,
		"alarmStrategyId" : alarmstrategyid,
		"note" : note
	};
	
	$.ajax({
		url: 'organization/add',
		type: "POST",
		contentType: "application/json",
		dataType:"json",
		data : JSON.stringify(org),
		success: function(data) {
			if (data.success) {
				$("#dlgOrgInfos").modal('hide');
				$("#orgTreeGrid").treegrid('reload');
				$("#orgTreeGrid").treegrid('unselectAll');
				resetForm();
			} else {
				showNoty(data.errorMessage, "error", true, 'top');
			}
		},
		error: function() {
			showNoty("您无权限操作", "error", true, 'top');
		}
	});
}

function chooseParentOrg() {
	$('#dlgChooseParentOrg').modal('show');
	initOrgTreeGridtwo();
}

function initOrgTreeGridtwo() {
		$('#orgTreeGridtwo').treegrid({
			width: 'auto',
			url:'organization_ui/ctreegrid',
			idField:'id',
			treeField:'name',
			columns:[[
				{field:'name',title:'名称',width:'40%'},
				{field:'description',title:'描述',width:'60%', 
					formatter: function(value, row, index){
						if (row.data){
							return row.data.description;
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
	
	
function getalarms() {
    $.post("organization/queryAlarmStrategy", "", function(data) {
	  if (data.commonMessage.success) {
		var alarms = data.alarmStrategy;
		var jqCompanyList = $("#addalarmstrategyid");
		jqCompanyList.append('<option value="-1">= 点击选择报警策略 =</option>');
		for (var i = 0; i < alarms.length; i++) {
			var tmpCom = alarms[i];
			jqCompanyList.append('<option value="' + tmpCom.alarmStrategyId + '">' + tmpCom.name + '</option>');
		}
	} else {
		showNoty(data.commonMessage.errorMessage, "error", false, 'top');
	}
});
}

function chooseOrg() {
	var node = $("#orgTreeGridtwo").treegrid("getSelected");
	if (node) {
		$("#txtParentOrg").val(node.name);
		$("#hiddenParentId").val(node.id);
	}
	$('#dlgChooseParentOrg').modal('hide');
}
</script>
<div id="dlgOrgInfos" class="modal">
  <div class="modal-dialog modal-lg" style="width:600px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 新增组织</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
        <div class="col-md-12">
		  
            <div class="widget-content">
              <form id="addOrgForm" class="form-horizontal ">
				
				<div class="form-group">
                  <label class="col-md-2 control-label">上级组织 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <div class="input-group">
								  
								  <input id="txtParentOrg" type="text" class="form-control required" style="color:#555;background-color:#fff;" readonly value="">
								  <input id="hiddenParentId" type="hidden" value="">
							
								</div>
                  </div>
                  <label class="col-md-2 control-label">名称 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <input type="text" id="addorgName" name="orgName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
                </div>
				
                <div class="form-group" style="display:none">
                  <label class="col-md-2 control-label">客户 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <input type="text" id="addcustomid" name="orgName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
					 
                </div>
                <div class="form-group" style="display:none">
                  <label class="col-md-2 control-label">组织类型 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                   
                  <select id="addorgtype" name="orgtype" class="form-control input-sm" style="width:100%">
                       <option value="1">大型</option>
                        <option value="2">中等</option>
                  
                  </select>
                  </div>
					 
                </div>
                <div class="form-group">
                  <label class="col-md-2 control-label">报警策略 :</label>
                  <div class="col-md-3">
                  <select id="addalarmstrategyid" name="alarmstrategyid" class="form-control input-sm" style="width:100%"></select>
                  </div>
                  <label class="col-md-2 control-label">备注 :</label>
                  <div class="col-md-3">
                  <input type="text" id="addorgDescription" name="orgDescription" class="form-control required" maxlength="50">
                   
                  </div>
				<!--  	<label class="col-md-2 control-label">备注  :</label>
                  <div class="col-md-3">
                    <input type="text" id="addnote" name="orgName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div> -->
                </div>
			
              </form>
			  <div class="form-actions fluid">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="col-md-offset-2 col-md-10"> 
						<button id="backOrgBtn" class="btn pull-right"> 取&nbsp;消</button>
						<button id="resetFormBtn" class="btn btn-inverse pull-right"> 重&nbsp;置 </button>
						<button id="confirmAddBtn" class="btn btn-primary pull-right"> 确&nbsp;定 </button>
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
		<!-- end -->
      </div>
     
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgChooseParentOrg" class="modal">
  <div class="modal-dialog modal-lg" style="width:400px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 选择上级组织</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
			<div style="width:100%">
			
			</div>
		</div>
		<table id="orgTreeGridtwo" style="height:200px;">
                
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

