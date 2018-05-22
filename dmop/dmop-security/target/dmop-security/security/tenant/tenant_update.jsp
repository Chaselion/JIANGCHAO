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
<title>租户管理 - 修改租户</title>
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
<!--script type="text/javascript" src="<%=basePath%>js/car.plugins.form-components.js"></script-->
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/url-helper.js"></script>
<script>
$(document).ready(function(){
	//整页暂时屏蔽销售包的购买逻辑。待以后完善
	//initSalePackList();
	
	App.init();
	Plugins.init();
	//CarFormComponents.init();
	FormComponents.init();
	
	$("#name").on('input', function() {
		var name = $(this).val();
		$("#realname").val(name);
	});
	
	$("#confirmAddBtn").click(updateTenant);
	$("#backBtn").click(backToList);
	
	//添加成功对话框
	//$("#btnSuccessContinue").click(resetForm);
	$("#btnSuccessBack").click(backToList);
	$("#btnSuccessClose").click(function() {
		$("#dlgAddSuccess").modal('hide');
	});
	
	//querySalePack();
	queryIfSearchStringExist();
});

function queryIfSearchStringExist() {
	var params = window.location.search;
	if (params != null && params != "") {
		params = params.substr(1);	//去掉?号
		var id = getUrlParam(params, "id");
		if (id != "") {
			getTenant(id);
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
		timeout: 3000
	});
}

function getTenant(tenantId) {
	var requestData = "id=" + tenantId;
	$.post("tenant/getTenant", requestData, function(data) {
		if (data.commonMessage.success) {
			var tenant = data.tenant;
			
			$("#tenantId").val(tenant.id);
			$("#name").val(tenant.name);
			$("#country").val(tenant.country);
			$("#province").val(tenant.province);
			$("#city").val(tenant.city);
			$("#address").val(tenant.address);
			$("#telephone").val(tenant.telephone);
			$("#description").val(tenant.description);
			$("#status").val(tenant.status);
			
			var user = data.user;
			$("#userId").val(user.id);
			$("#username").val(user.username);
			$("#realname").val(user.realname);
			$("#mobilePhone").val(user.mobilePhone);
			$("#email").val(user.email);
		} else {
			showNoty(data.commonMessage.errorMessage, "error", true, 'top');
		}
	});
}


function backToList() {
	window.location.href="security/tenant/tenant.jsp";
}
function updateTenant() {
	var tenantValid = $("#tenantForm").validate().form();
	var userValid = $("#userForm").validate().form();
	if (!tenantValid || !userValid) return;

	var tenantId = $("#tenantId").val();
	var userId = $("#userId").val();
	if (tenantId == "" || userId == "") {
		showNoty("没有可更新的租户信息！", "error", false, 'top');
	}
	
	//tenant info
	
	var name = $("#name").val();
	var country = $("#country").val();
	var province = $("#province").val();
	var city = $("#city").val();
	var address = $("#address").val();
	var telephone = $("#telephone").val();
	var description = $("#description").val();
	var status = $("#status").val();
	var tenant = {
		"id" : tenantId,
		"name" : name,
		"country" : country,
		"province" : province,
		"city" : city,
		"address" : address,
		"telephone" : telephone,
		"description" : description,
		"status" : status
	};
	
	// user info
	
	var realname = $("#realname").val();
	var mobilePhone = $("#mobilePhone").val();
	var email = $("#email").val();
	
	var user = {
		"id": userId,
		"realname" : realname,
		"mobilePhone" : mobilePhone,
		"email" : email
	};
	
	//buy info
	/*
	var subscriber = {};
	var funcIds = [];
	
	var isBuy = $("#buyFunc").prop("checked");
	if (isBuy) {
		var begin_date = $("#startDate").val();
		var end_date = $("#endDate").val();
		var subscriber = {
			"begin_date" : begin_date,
			"end_date" : end_date
		};
		
		
		var salePackId = $('input[name="radioSalePack"]:checked').val();
		if (salePackId == undefined || salePackId == null || salePackId == '') {
			showNoty("请选择新增租户所要开通的功能版本!", "error", false, 'top');
			return;
		}
		funcIds.push(parseInt(salePackId));
	}
	*/
	
	
	var requestParam = {
		"tenant": tenant,
		"user" : user,
		//"subscriber" : subscriber,
		//"funcs": funcIds
	}
	$.ajax({
		url: 'tenant/update',
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


function initSalePackList() {
		$("#salePackList").data("datatable", {
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
				  //<input type="radio" class="uniform" name="radioNewType" value="new">
				  return '<input value="' + data.id + '" type="radio" name="radioSalePack">';
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
		
		$('#salePackList').on('draw.dt', function () {
			$('#salePackList').find(".bs-tooltip").tooltip({
				container: "body"
			});
			
			$('#salePackList tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
					$(this).removeClass('selected');
				}
				else {
					$("#salePackList").DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			} );
		});
	}
	
	function querySalePack() {
		$.post('function/getTenantSalePackage', "", function(data) {
			$("#salePackList").DataTable().rows.add( data ).draw();
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
					<li> <i class="icon-home"></i> <a href="security/tenant/tenant.jsp">租户管理</a> </li>
					<li class="current"> <a>修改租户</a> </li>
				</ul>
			</div>
	  
			<!--button id="addDriverBtn" class="btn btn-sm btn-success">返回</button-->
			<!--br /-->
			<div class="row" style="padding-top:5px;">
				<div id="addWrapper" class="col-md-12">
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 租户基本信息</h5>
						</div>
						
						<div class="widget-content" style="padding-top:5px;">
							<form id="tenantForm" class="form-horizontal ">
								<input type="hidden" id="tenantId" value="" />
								<div class="row">
									<div class="form-group col-md-6">
									  <label class="col-md-2 control-label">租户名称 <span class="required">*</span> :</label>
									  <div class="col-md-10">
										<input type="text" id="name" name="name" class="form-control required" maxlength="120"> 
									  </div>
									</div>
									<div class="form-group col-md-6">
									  <label class="col-md-2 control-label">国家 :</label>
									  <div class="col-md-10">
										<input type="text" id="country" name="country" class="form-control" maxlength="50"> 
									  </div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-6">
									  <label class="col-md-2 control-label">省份 :</label>
									  <div class="col-md-10">
										<input type="text" id="province" name="province" class="form-control" maxlength="50"> 
									  </div>
									</div>
									<div class="form-group col-md-6">
									  <label class="col-md-2 control-label">市 :</label>
									  <div class="col-md-10">
										<input type="text" id="city" name="city" class="form-control" maxlength="50"> 
									  </div>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-6">
									  <label class="col-md-2 control-label">地址 :</label>
									  <div class="col-md-10">
										<input type="text" id="address" name="address" class="form-control" maxlength="200"> 
									  </div>
									</div>
									<div class="form-group col-md-6">
									  <label class="col-md-2 control-label">联系电话 :</label>
									  <div class="col-md-10">
										<input type="text" id="telephone" name="telephone" class="form-control" maxlength="50"> 
									  </div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
									  <label class="col-md-1 control-label">描述 :</label>
									  <div class="col-md-10">
										<textarea id="description" name="description" rows="3" class="form-control" maxlength="250"> </textarea>
									  </div>
										 
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label class="col-md-1 control-label">租户状态 <span class="required">*</span> :</label>
										<div class="col-md-10">
											<select id="status" class="form-control required" >
												<option value="AVAILABLE">可用</option>
												<option value="DISABLED">禁用</option>
											</select>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					
					<!-- --------------------->
					
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 租户登录账号信息</h5>
						</div>
						
						<div class="widget-content" style="padding-top:5px;">
							<form id="userForm" class="form-horizontal ">
								<input type="hidden" id="userId" value="" />
								<div class="form-group">
								  <label class="col-md-1 control-label">登录名 <span class="required">*</span> :</label>
								  <div class="col-md-11">
									<input type="text" id="username" name="username" class="form-control required" readonly disabled="disabled" maxlength="32"> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-1 control-label">名称 :</label>
								  <div class="col-md-11">
									<input type="text" id="realname" name="realname" class="form-control" maxlength="32"> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-1 control-label">手机 <span class="required">*</span> :</label>
								  <div class="col-md-11">
									<input type="text" id="mobilePhone" name="mobilePhone" class="form-control digits required" maxlength="11"> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-1 control-label">电子邮箱 <span class="required">*</span> :</label>
								  <div class="col-md-11">
									<input type="text" id="email" name="email" class="form-control email required" maxlength="100"> 
								  </div>
								</div>
							</form>
						</div>
					</div>
					
					<!-- --------------------->
			  		<!-- 
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 开通功能</h5>
						</div>
						
						<div class="widget-content">
							<form id="funcForm" class="form-horizontal ">
								<div class="form-group">
								  <label class="col-md-1 control-label">是否开通功能 :</label>
								  <div class="col-md-11">
									<div class="checkbox">
										<input type="checkbox" id="buyFunc" name="buyFunc"> 
									  </div>
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-1 control-label">开通时长 :</label>
								  <div class="col-md-11">
									<select id="months" name="months" class="form-control">
										<option value="">一月</option>
										<option value="">二月</option>
										<option value="">三月</option>
										<option value="">半年</option>
										<option value="">一年</option>
										<option value="">二年</option>
										<option value="">三年</option>
									</select>
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-1 control-label">开时时间 :</label>
								  <div class="col-md-11">
									<input type="text" id="startDate" name="startDate" class="form-control required" maxlength="32"> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-1 control-label">结束时间 :</label>
								  <div class="col-md-11">
									<input type="text" id="endDate" name="endDate" class="form-control required" maxlength="32"> 
								  </div>
								</div>
							</form>
						</div>
						<div id="salePackListContainer" class="widget-content">
							<table id="salePackList" class="table table-highlight-head table-condensed table-bordered table-checkable datatable" data-scroll-y="true">
								<thead>
									<tr>
										<th class="col-md-1 radio-column">
										</th>
										<th class="col-md-4 align-center">版本名称</th>
										<th class="col-md-7 align-center">版本描述</th>
									</tr>
								</thead>
							</table> 
						</div>
					</div>	
					 -->
			  
					<div class="form-actions fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-offset-2 col-md-10"> 
									<button id="backBtn" class="btn pull-right"> 返&nbsp;回 </button>
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

<div id="dlgAddSuccess" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">修改成功</h4>
      </div>
      <div class="modal-body">
        <p>修改租户成功！ <ul><li>点击【返回列表】查看租户列表。</li><li>点击【关闭】停留此页。</li></p>
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

