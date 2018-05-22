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
		
		$("#btnConfirmDelete").click(requestRemove);
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		
		$("#btnConfirmOrgForm").click(updateOrg);	//提交修改表单
		
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
			window.location.href="security/organization/organization_add.jsp";
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
		
		var org = {
			"id" : orgId,
			"name" : name,
			"description" : desc
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
				}
			}).always(function() {
				resetDelDlgBtns();
			});
		}
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
				
				$("#orgId").val(org.id);
				$("#orgName").val(org.name);
				$("#orgDescription").val(org.description);
				
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
				},
				{field:'operation',title:'操作',width:'15%', align:'center',
					formatter: function(value, row, index){
						return '<ul class="table-controls"> <li><a href="javascript:getOrg(' + row.id + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li> <li><a href="javascript:removeOrg(' + row.id + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li> </ul>';
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
			timeout: 3000
		});
	}
</script>
</head>
<body>
<div id="container">
  <div id="content">
    <div class="container">
	  <div style="padding-top:5px;">
      </div>
	  
	  <button id="addOrgBtn" class="btn btn-sm btn-success">新增组织</button>
	  
	  <button id="delSelectedBtn" class="btn btn-sm btn-primary">删除选中</button>
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
  <div class="modal-dialog modal-lg">
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
					  <div class="col-md-6">
						<input type="text" id="orgName" name="orgName" class="form-control required" maxlength="50"> 
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-3 control-label">描述 :</label>
					  <div class="col-md-6">
						<textarea id="orgDescription" name="orgDescription" rows="5" class="form-control" maxlength="450"> </textarea>
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
        <p>您确定要删除组织信息吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>

