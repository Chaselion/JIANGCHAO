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
<title>组织管理 - 新增组织</title>
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
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/easyui.css" rel="stylesheet" type="text/css" >
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/icon.css" rel="stylesheet" type="text/css" >
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

<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<script>
$(document).ready(function(){
	$("#txtParentOrg").focus(chooseParentOrg);
	$("#btnConfirmChooseParentOrg").click(chooseOrg);
	
	App.init();
	Plugins.init();
	FormComponents.init();
	
	$("#confirmAddBtn").click(addOrg);
	$("#resetFormBtn").click(resetForm);
	$("#backOrgBtn").click(backToList);
	
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
		timeout: 3000
	});
}

function resetForm() {
	$("#addOrgForm")[0].reset();
	$("#hiddenParentId").val("");
	
	$("#dlgAddSuccess").modal('hide');
}
function backToList() {
	window.location.href="security/organization/organization.jsp";
}
function addOrg() {
	//var valid = $("#addOrgForm").validate().form();
	//if (!valid) return;
			
	var parentId = $("#hiddenParentId").val();
	var name = $("#orgName").val();
	var desc = $("#orgDescription").val();
	
	if (parentId == "") {
		showNoty("请选择【上级组织】!", "error", false, 'top');
		return;
	}
	if (name == "") {
		showNoty("请填写组织的【名称】!", "error", false, 'top');
		return;
	}
	
	var org = {
		"parentId" : parentId,
		"name" : name,
		"description" : desc
	};
	
	$.ajax({
		url: 'organization/add',
		type: "POST",
		contentType: "application/json",
		dataType:"json",
		data : JSON.stringify(org),
		success: function(data) {
			if (data.success) {
				$("#dlgAddSuccess").modal('show');
			} else {
				showNoty(data.errorMessage, "error", true, 'top');
			}
		}
	});
}

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
		$("#hiddenParentId").val(node.id);
	}
	$('#dlgChooseParentOrg').modal('hide');
}
</script>
</head>
<body>
<div id="container">
  <div id="content">
    <div class="container">
      <div class="crumbs">
        <ul id="breadcrumbs" class="breadcrumb">
          <li> <i class="icon-home"></i> <a href="security/organization/organization.jsp">组织管理</a> </li>
          <li class="current"> <a>新增组织</a> </li>
        </ul>
      </div>
	  
	  <!--button id="addDriverBtn" class="btn btn-sm btn-success">返回</button-->
	  <br />
	  <div class="row">
        <div class="col-md-12">
		  <div class="widget box">
            <div class="widget-header">
              <h4><i class="icon-reorder"></i> 新增组织信息 ${titleLabel}</h4>
            </div>
            <div class="widget-content">
              <form id="addOrgForm" class="form-horizontal ">
				
				<div class="form-group">
                  <label class="col-md-2 control-label">上级组织 <span class="required">*</span> :</label>
                  <div class="col-md-10">
                    <div class="input-group">
								  
								  <input id="txtParentOrg" type="text" class="form-control required" style="color:#555;background-color:#fff;" readonly value="">
								  <input id="hiddenParentId" type="hidden" value="">
								  <span class="input-group-btn">
								  <button class="btn btn-default" onclick="javascript:chooseParentOrg();" type="button">选择</button>
								  </span> 
								</div>
                  </div>
                </div>
				
				<div class="form-group">
                  <label class="col-md-2 control-label">名称 <span class="required">*</span> :</label>
                  <div class="col-md-10">
                    <input type="text" id="orgName" name="orgName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
					 
                </div>
				<div class="form-group">
                  <label class="col-md-2 control-label">描述 :</label>
                  <div class="col-md-10">
                    <textarea id="orgDescription" name="orgDescription" rows="5" class="form-control" maxlength="450"> </textarea>
                  </div>
					 
                </div>
              </form>
			  <div class="form-actions fluid">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="col-md-offset-2 col-md-10"> 
						<button id="backOrgBtn" class="btn pull-right"> 返&nbsp;回 </button>
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
        <p>新增组织成功！ <ul><li>点击【继续添加】新增其他记录。</li><li>点击【返回列表】查看组织列表。</p>
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
        <h4 class="modal-title"><i class="icon-reorder"></i> 选择上级组织</h4>
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

