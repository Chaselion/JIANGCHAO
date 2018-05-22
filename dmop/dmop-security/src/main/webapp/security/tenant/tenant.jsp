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
<title>租户管理</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" >
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
table.dataTable tbody tr.selected {
	background-color:#0081c2;
	color: white;
}

.btn-toggle-size {
	padding:6px 13px;
	height:39px;
	margin-bottom:-5px;
	display:inline-block;
	border-bottom:thin solid #fff;
}

.btn-collapse-border {
	border-top:thin solid #fff;
	border-left:thin solid #fff;
	border-right:thin solid #fff;
}

.btn-expand-border {
	border-top:thin solid #cfcfcf;
	border-left:thin solid #cfcfcf;
	border-right:thin solid #cfcfcf;
}

.longtext-ellipsis {
	max-width:300px;display: inline-block;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;
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
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>

<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<script>
	$(document).ready(function() {
		moment.lang('zh-cn');
		
		initList();
		
		$("#btnSearch").click(function () {
			queryTenant(0);
		});
		$("#btnAdvanceSearch").click(function () {
			queryTenant(0);
		});
		
		$("#btnReset").click(resetSearchCondition);
		
		$("#orgName").focus(chooseParentOrg);
		$("#btnConfirmChooseParentOrg").click(chooseOrg);
	
		$("#btnToggleSearchPanel").click(toggleAdvanceSearchPanel);
		initDateField("#txtStartCreateDate");
		initDateField("#txtEndCreateDate");
		
		$("#btnConfirmDelete").click(requestRemove);
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		
		//界面框架初始化 -- 开始
		App.init();
		Plugins.init();
		CarFormComponents.init();
		//界面框架初始化 -- 结束
		
		//添加按钮的点击事件
		$("#addBtn").click(function() {
			window.location.href="security/tenant/tenant_add.jsp";
		});
		
		//"删除选中"按钮点击事件
		$("#delSelectedBtn").click(function () {
			var node = $("#tenantTable").DataTable().row('.selected');
			if (node.length == 1) {
				var data = node.data();
				if (data.editable) {
					remove(data.id);
				} else {
					showNoty("该用户不可删除！", "error", false, 'top');
				}
			} else {
				showNoty("请选择要删除的用户！", "error", false, 'top');
			}
		});
		
		queryTenant(0);
	});

	
function toggleAdvanceSearchPanel() {
	$("#advSearchPanel").toggle();
	if ($("#advSearchPanel").is(":hidden")) {
		$("#btnToggleSearchPanel").text("更多搜索条件 ");
		$("#btnToggleSearchPanel").append("<i class='arrow icon-angle-down'></i>");
		$("#btnWrapperToggleSearchPanel").removeClass("btn-expand-border").addClass("btn-collapse-border");
		
		$("#useAdvanced").val('false');
	} else {
		$("#btnToggleSearchPanel").text("收起更多搜索 ");
		$("#btnToggleSearchPanel").append("<i class='arrow icon-angle-up'></i>");
		$("#btnWrapperToggleSearchPanel").removeClass("btn-collapse-border").addClass("btn-expand-border");
		
		$("#useAdvanced").val('true');
	}
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
		$("#orgName").val(node.name);
		$("#hiddenOrgId").val(node.id);
	}
	$('#dlgChooseParentOrg').modal('hide');
}
	
function initDateField(id) {
	//设置回放日期
	var playDate = moment();
	//$(id).val(playDate.format('YYYY-MM-DD'));
	$(id).daterangepicker({
		singleDatePicker: true,
		showDropdowns: true,
		startDate: playDate,
		format: 'YYYY-MM-DD'
	}, function(start, end, label) {
	});
}

function resetSearchCondition() {
	$("#txtSearchName").val("");
	$("#hiddenOrgId").val("");
	$("#formAdvanceSearch")[0].reset();
}

var gStart = 0;
var gEnd = 0;
var rowNum = -1;
function queryTenant(start) {
	start = start || 0;
	
	var name = $("#txtSearchName").val();
	var param = {"name" : name};
	param["start"] = start;
	param["countPerPage"] = 10;
	
	var useAdv = $("#useAdvanced").val();
	
	if (useAdv == "true") {
		var status = $("#selectStatus").val();
		if (status != "") {
			param["status"] = status;
		}
		
		var startCreateDate = $("#txtStartCreateDate").val();
		if (startCreateDate != "") {
			param["startCreateDate"] = startCreateDate;
		}
		
		var endCreateDate = $("#txtEndCreateDate").val();
		if (endCreateDate != "") {
			param["endCreateDate"] = endCreateDate;
		}
		
		if (startCreateDate != "" && endCreateDate != "") {
			var startCreateDateObj = moment(startCreateDate, 'YYYY-MM-DD');
			var endCreateDateObj = moment(endCreateDate, 'YYYY-MM-DD');
			
			if (startCreateDateObj.diff(endCreateDateObj) > 0) {
				//alert("error time! " + startCreateDateObj.diff(endCreateDateObj));
				showNoty("结束时间不应早于开始时间!", "error", false, 'top');
				return;
			}
		}
		
		//alert(JSON.stringify(param));
	}
	
	//alert(useAdv);
	var requestData = $.param(param, true);
	
	//////////
	$("#tenantTable").DataTable().clear().draw();
	drawPageInfo(0, 0, 0);
		
	var emptyPager = '<ul class="pagination">' + 
				'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
				'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
			'</ul>';
	$("#divPager").empty().append(emptyPager);
	
	$.post('tenant/queryTenant', requestData, function(data) {
		var tenants = data.tenants;
		var page = data.page;
		
		//
		gStart = page.start;
		var rowStart = page.start + 1;
		var rowEnd = rowStart + page.limit - 1;
		var count = page.count;
		rowStart = Math.min(rowStart, count);
		rowEnd = Math.min(rowEnd, count);
		
		rowNum = rowStart;
		
		$("#tenantTable").DataTable().rows.add( tenants ).draw();
		
		var recordsTotal = page.recordsTotal;
		drawPageInfo(rowStart, rowEnd, count);
		
		var pager = getPagerHtml(page.currentPage, page.totalPage, "toPage");
		$("#divPager").empty().append(pager);
	});
}
	
	////////
	function toUpdate(id) {
		window.location.href="security/tenant/tenant_update.jsp?id=" + id;
	}
	
	function remove(id) {
		$('#dlgConfirmDelete').data('id', id);
		$('#dlgConfirmDelete').modal('show');
	}
	
	//发送删除请求
	function requestRemove() {
		var id = $('#dlgConfirmDelete').data('id');
			
		if (id != undefined) {
			$("#btnCancelDelete").attr("disabled", "disabled");
			
			var requestData = $.param({"id" : id}, true);
			$.ajax({
				type: "POST",
				url: "user/delete",
				data: requestData,
				dataType: "json",
				success: function(data) {
					if (data.success == true) {
						showNoty(data.errorMessage, "success", false, 'top');
						
						queryTenant(gStart);
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
	
	//获取组织信息，并弹出明细对话框
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

function drawPageInfo(start, end, total) {
	var pageInfo = '<div style="float:left;margin-top:20px;">' + 
				'显示第 ' + start + ' 至 ' + end + '  项结果，共 ' + total + '  项' + // (由 ' + recordsTotal + '  项结果过滤)' + 
			'</div>';
	$("#divPageInfo").empty().append(pageInfo);
}

function toPage(pageIndex) {
	var countPerPage = 10;
	var start = pageIndex * countPerPage;
	queryTenant(start);
}
	
	function initList() {
		$("#tenantTable").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			info: false,
			searching: false,
			scrollY: "350px",
			scrollCollapse: false,
			"columnDefs": [{
				"targets": 0,
				"data": null,
				"className": "align-center",
				"render": function ( data, type, full, meta) {
				  return rowNum++;
				}
			}, {
				"targets": 1,
				"data": "name"
			}, {
				"className": "align-center",
				"targets": 2,
				"data": "country"
			}, {
				"className": "align-center",
				"targets": 3,
				"data": "province"
			}, {
				"className": "align-center",
				"targets": 4,
				"data": "city"
			}, {
				"className": "align-center",
				"targets": 5,
				"data": null,
				render: function(data, type, full, meta) {
					return '<span class="longtext-ellipsis" title="' + data.address + '">' + data.address + '</span>';
				}
			}, {
				"className": "align-center",
				"targets": 6,
				"data": "telephone"
			}, {
				"className": "align-center",
				"targets": 7,
				"data": null,
				render: function(data, type, full, meta) {
					var status = data.status;
					var labelClass = 'label-warning';
					var statusStr = '未知';
					if (status == 'AVAILABLE') {
						labelClass = 'label-success';
						statusStr = '可用';
					} else if (status == 'DISABLED') {
						labelClass = 'label-danger';
						statusStr = '禁用';
					}
					return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
				}
			}, {
				"className": "align-center",
				"targets": 8,
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.createTime);
					return day.format('YYYY-MM-DD');
				}
			}, {
				"className": "align-left",
				"targets": 9,
				"data": null,
				render: function(data, type, full, meta) {
					/*
					var organizationPath = data.organizationPath;
					var count = organizationPath.names.length;
					var htmlLink = "";
					for (var i = 0; i < count; i++) {
						htmlLink += '<a href="' + organizationPath.links[i] + '" title="' + organizationPath.names[i] + '"><span class="longtext-ellipsis">' + organizationPath.names[i] + '</span></a>'
						if (i != count -1) {
							htmlLink += ' &raquo; ';
						}
					}
					return htmlLink;
					*/
					return '<span class="longtext-ellipsis" title="' + data.description + '">' + data.description + '</span>';
				}
			}, {
				"targets": 10,
				"data": null,
				"render": function ( data, type, full, meta ) {
					if (data.status == 'AVAILABLE') {
						iconLock = 'icon-lock';
						tipLock = '禁用';
						funcLock = 'lock';
					} else {
						iconLock = 'icon-unlock';
						tipLock = '解禁';
						funcLock = 'unlock';
					}
					
					var htmlLock = '<li><a href="javascript:' + funcLock + '(' + data.id + ');" class="bs-tooltip" title="' + tipLock + '"><i class="' + iconLock + '"></i></a></li> ';
					//var htmlLock = '<a href="javascript:' + funcLock + '(' + data.id + ');" class="btn btn-xs bs-tooltip" title="' + tipLock + '"><i class="' + iconLock + '"></i></a>';
				
					/*
					var html = '<span class=\"btn-group\"> ';
					html += '<a href="javascript:getDetail(' + data.id + ');" class="btn btn-xs bs-tooltip" title="详情"><i class="icon-search"></i></a> ';
					if (data.editable) {
						html += '<a href="javascript:toUpdate(' + data.id + ');" class="btn btn-xs bs-tooltip" title="修改"><i class="icon-pencil"></i></a> ' + 
								htmlLock + '<a href="javascript:remove(' + data.id + ');" class="btn btn-xs bs-tooltip" title="删除"><i class="icon-trash"></i></a> ';
					}
					html += ' </span>';
					*/
					var html = '<ul class="table-controls">';
					//html += '<li><a href="javascript:getDetail(' + data.id + ');" class="bs-tooltip" title="详情"><i class="icon-search"></i></a></li> ';
					
					//if (data.editable) {
						html += '<li><a href="javascript:toUpdate(' + data.id + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li> '
								+ htmlLock;
								//+ '<li><a href="javascript:remove(' + data.id + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li> ';
					//}
					html += '</ul>';
					return html;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
			}]
		});
		
		$('#tenantTable').on('draw.dt', function () {
			$('#tenantTable tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
					$(this).removeClass('selected');
				}
				else {
					$("#tenantTable").DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			} );
		});
	}
	
	function lock(id) {
		updateStatus(id, 'tenant/lock');
	}
	
	function unlock(id) {
		updateStatus(id, 'tenant/unlock');
	}
	
	function updateStatus(id, url) {
		var requestData = $.param({"id" : id}, true);
			$.ajax({
				type: "POST",
				url: url,
				data: requestData,
				dataType: "json",
				success: function(data) {
					if (data.success == true) {
						showNoty(data.errorMessage, "success", false, 'top');
						
						queryTenant(gStart);
					} else {
						showNoty(data.errorMessage, "error", true, 'top');
					}		
				}
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
				<div class="col-md-6">
					<div class="input-group">
						<input type="text" class="form-control" id="txtSearchName" placeholder="输入租户名称进行搜索" value="" />
						<span class="input-group-btn">
							<button id="btnSearch" class="btn btn-primary" type="button"><i class="icon-search"></i> 租户搜索 </button>
						</span> 
					</div>
				</div>
				<div id="btnWrapperToggleSearchPanel" class="btn-toggle-size" style="">
					<a id="btnToggleSearchPanel" style="text-decoration:none" href="javascript:void(0);">更多搜索条件 <i class="arrow icon-angle-down"></i></a>
				</div>
				<div style="display:inline-block;padding-left:40px;">
					<button id="addBtn" class="btn btn-sm btn-success">新增租户</button>
					<!--button id="delSelectedBtn" class="btn btn-sm btn-primary">删除选中</button-->
				</div>
			</div>
			<div id="advSearchPanel" style="display:none;margin-top:4px;padding-top:8px;border-top:thin solid #cfcfcf;">
				<form id="formAdvanceSearch" class="form-inline" role="form">
					<input type="hidden" id="useAdvanced" value="false" />
					<div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="selectStatus">租户状态:</label>
						<select id="selectStatus" name="selectStatus" class="form-control" style="color:black;width:80px;">
							<option value="ALL" selected>全部</option>
							<option value="AVAILABLE">可用</option>
							<option value="DISABLED">禁用</option>
						</select>
					</div>
					<div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="txtPlayDate">创建日期:</label>
						<input type="text" class="form-control" style="width:80px;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtStartCreateDate" name="txtStartCreateDate" placeholder="开始日期">
						-
						<input type="text" class="form-control" style="width:80px;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtEndCreateDate" name="txtEndCreateDate" placeholder="结束日期">
					</div>
					<button id="btnAdvanceSearch" class="btn btn-primary" type="button" > 搜索 </button>
					<button id="btnReset" class="btn btn-default" type="button"> 重置 </button>
				</form>
			</div>
	
			<hr class="hr-margin-sm" />
	  
	  <div class="row">
        <div class="col-md-12">
		  <table id="tenantTable" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
                <thead>
                  <tr>
                    <th class="align-center col-md-1">#</th>
					<th class="align-center col-md-1">名称</th>
					<th class="align-center col-md-1">国家</th>
					<th class="align-center col-md-1">省</th>
					<th class="align-center col-md-1">市</th>
					<th class="align-center col-md-1">地址</th>
					<th class="align-center col-md-1">联系电话</th>
					<th class="align-center col-md-1">状态</th>
					<th class="align-center col-md-1">创建日期</th>
					<th class="align-center col-md-2">描述</th>
					<th class="align-center col-md-1">操作</th>
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

<div id="dlgConfirmDelete" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">删除用户信息</h4>
      </div>
      <div class="modal-body">
        <p>您确定要删除此用户吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgChooseParentOrg" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 选择所属组织</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
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

