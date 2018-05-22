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
<title>用户管理</title>
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

#dlgUserInfo div.form-group {
	margin-bottom: 5px;
}
#dlgUserInfo .modal-footer {
	padding-top: 6px;
	padding-bottom: 6px;
	margin-top: 0;
}
#dlgUserInfo .modal-body {
	padding: 2px 20px;
}
#dlgUserInfo .modal-header {
	padding: 8px 15px;
}
#dlgUserInfo .widget {
	margin-bottom: 5px;
}
#dlgUserInfo .widget .widget-header{
	margin-bottom: 8px;
}
#dlgUserInfo h5 {
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
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>

<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<script>
	$(document).ready(function() {
		moment.lang('zh-cn');
		
		initList();
		
		$("#btnSearch").click(function () {
			queryUser(0);
		});
		$("#btnAdvanceSearch").click(function () {
			queryUser(0);
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
			window.location.href="security/user/user_add.jsp";
		});
		
		//"删除选中"按钮点击事件
		$("#delSelectedBtn").click(function () {
			var node = $("#userTable").DataTable().row('.selected');
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
		
		queryUser(0);
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
function queryUser(start) {
	start = start || 0;
	
	var name = $("#txtSearchName").val();
	var param = {"realname" : name};
	param["start"] = start;
	param["countPerPage"] = 10;
	
	var useAdv = $("#useAdvanced").val();
	
	if (useAdv == "true") {
		var username = $("#username").val();
		if (username != "") {
			param["username"] = username;
		}
		
		var orgId = $("#hiddenOrgId").val();
		if (orgId != "") {
			param["orgId"] = orgId;
		}
		
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
	$("#userTable").DataTable().clear().draw();
	drawPageInfo(0, 0, 0);
		
	var emptyPager = '<ul class="pagination">' + 
				'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
				'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
			'</ul>';
	$("#divPager").empty().append(emptyPager);
	
	$.post('user/queryUser', requestData, function(data) {
		var users = data.users;
		var page = data.page;
		
		//
		gStart = page.start;
		var rowStart = page.start + 1;
		var rowEnd = rowStart + page.limit - 1;
		var count = page.count;
		rowStart = Math.min(rowStart, count);
		rowEnd = Math.min(rowEnd, count);
		
		rowNum = rowStart;
		
		$("#userTable").DataTable().rows.add( users ).draw();
		
		drawPageInfo(rowStart, rowEnd, count);
		
		var pager = getPagerHtml(page.currentPage, page.totalPage, "toPage");
		$("#divPager").empty().append(pager);
	});
}
	
	////////
	function toUpdate(id) {
		window.location.href="security/user/user_update.jsp?id=" + id;
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
						
						queryUser(gStart);
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
	queryUser(start);
}
	
	function initList() {
		$("#userTable").data("datatable", {
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
				  //return "<input value=\"" + data.id + "\" type=\"checkbox\" class=\"uniform\">";
				  
				  return rowNum++;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					//$(td).addClass('checkbox-column');
				}
			}, {
				"targets": 1,
				"data": "username"
			}, {
				"className": "align-center",
				"targets": 2,
				"data": "realname"
			}, {
				"className": "align-left",
				"targets": 3,
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
					return '<span class="longtext-ellipsis" title="' + data.organization_path + '">' + data.organization_path + '</span>';
				}
			}, {
				"className": "align-center",
				"targets": 4,
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
				"targets": 5,
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.createTime);
					return day.format('YYYY-MM-DD');
				}
			}, {
				"targets": 6,
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
					html += '<li><a href="javascript:getDetail(' + data.id + ');" class="bs-tooltip" title="详情"><i class="icon-search"></i></a></li> ';
					if (data.editable) {
						html += '<li><a href="javascript:toUpdate(' + data.id + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li> ' + 
								htmlLock + '<li><a href="javascript:remove(' + data.id + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li> ';
					}
					html += '</ul>';
					return html;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
			}]
		});
		
		$('#userTable').on('draw.dt', function () {
			/*
			$('#userTable').find(".bs-tooltip").tooltip({
				container: "body"
			});
			*/
			
			$('#userTable tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
					$(this).removeClass('selected');
				}
				else {
					$("#userTable").DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			} );
		});
	}
	
	function lock(id) {
		updateStatus(id, 'user/lock');
	}
	
	function unlock(id) {
		updateStatus(id, 'user/unlock');
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
						
						queryUser(gStart);
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
	
	function getDetail(id) {
		var requestData = "id=" + id + "&onlyUserOwn=true";
		$.post("user/getUserWithRole", requestData, function(data) {
			if (data.commonMessage.success) {
				var user = data.user;
				
				//$("#userId").val(user.id);
				$("#detail_username").val(user.username);
				$("#detail_realname").val(user.realname);
				$("#detail_mobilePhone").val(user.mobilePhone);
				$("#detail_email").val(user.email);
				if (user.organization) {
					$("#detail_txtParentOrg").val(user.organization.name);
				}
				
				var statusStr = "";
				if (user.status == 'AVAILABLE') {
					statusStr = '可用';
				} else if (user.status == 'DISABLED'){
					statusStr = '禁用';
				}
				$("#detail_status").val(statusStr);
				
				var roles = data.roles;
				drawRoleTable(roles);
				
				$("#dlgUserInfo").modal("show");
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
			}
		});
	}
	
	var theadPre = '<table id="roleList" ' + 
					'class="table table-highlight-head table-condensed table-striped table-bordered" ' +
					'data-scroll-y="true">' +
							'<thead>' +
								'<tr>' +
									'<th class="align-center">角色名称</th>' +
									'<th class="align-center">角色描述</th>' + 
								'</tr></thead>';
									
	function drawRoleTable(roles) {
		var rolesBody = [];
		for (var i = 0; i < roles.length; i++) {
			rolesBody.push('<tr><td>');
			rolesBody.push(roles[i].name);
			rolesBody.push('</td>');
			rolesBody.push('<td>');
			rolesBody.push(roles[i].description);
			rolesBody.push('</td></tr>');
		}
		rolesBody.push('</table>');
		
		var roleBodyStr = rolesBody.join('');
		
		var tableHtml = theadPre + roleBodyStr;
		$(tableHtml).replaceAll($("#roleList"));
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
						<input type="text" class="form-control" id="txtSearchName" placeholder="输入姓名进行搜索" value="" />
						<span class="input-group-btn">
							<button id="btnSearch" class="btn btn-primary" type="button"><i class="icon-search"></i> 用户搜索 </button>
						</span> 
					</div>
				</div>
				<div id="btnWrapperToggleSearchPanel" class="btn-toggle-size" style="">
					<a id="btnToggleSearchPanel" style="text-decoration:none" href="javascript:void(0);">更多搜索条件 <i class="arrow icon-angle-down"></i></a>
				</div>
				<div style="display:inline-block;padding-left:40px;">
					<button id="addBtn" class="btn btn-sm btn-success">新增用户</button>
					<button id="delSelectedBtn" class="btn btn-sm btn-primary">删除选中</button>
				</div>
			</div>
			<div id="advSearchPanel" style="display:none;margin-top:4px;padding-top:8px;border-top:thin solid #cfcfcf;">
				<form id="formAdvanceSearch" class="form-inline" role="form">
					<input type="hidden" id="useAdvanced" value="false" />
					<div class="form-group">
						<label class="control-label" for="username">登录名:</label>
						<input id="username" name="username" type="text" class="form-control" style="width:160px;">
					</div>
					<div class="form-group">
						<label class="control-label" for="input18">所属单位:</label>
						<input type="hidden" id="hiddenOrgId" name="hiddenOrgId" value="" />
						<input id="orgName" name="orgName" type="text" class="form-control" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
					</div>
					<div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="selectStatus">账号状态:</label>
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
		  <table id="userTable" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
                <thead>
                  <tr>
                    <th class="align-center" style="width:40px;">
						#
					</th>
					<th class="align-center col-md-1">登录名</th>
					<th class="align-center col-md-1">姓名</th>
					<th class="align-center col-md-4">所属单位</th>
					<th class="align-center col-md-1">账号状态</th>
					<th class="align-center col-md-2">创建时间</th>
					<th class="align-center col-md-2">操作</th>
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


<div id="dlgUserInfo" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 用户详情</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
			<div class="col-md-12">
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 用户基本信息</h5>
						</div>
						
						<div class="widget-content" style="padding-top:5px;">
							<form class="form-horizontal ">
								<input type="hidden" id="userId" name="userId" value="" />
								
								<div class="form-group">
								  <label class="col-md-2 control-label">登录名 :</label>
								  <div class="col-md-10">
									<input type="text" id="detail_username" name="detail_username" class="form-control input-sm readonly-white" readonly> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">姓名 :</label>
								  <div class="col-md-10">
									<input type="text" id="detail_realname" name="detail_realname" class="form-control input-sm readonly-white" readonly > 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">手机 :</label>
								  <div class="col-md-10">
									<input type="text" id="detail_mobilePhone" name="detail_mobilePhone" class="form-control input-sm readonly-white" readonly > 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">电子邮箱 :</label>
								  <div class="col-md-10">
									<input type="text" id="detail_email" name="detail_email" class="form-control input-sm readonly-white" readonly > 
								  </div>
								</div>
				
								<div id="lableParentOrg" class="form-group">
									<label class="col-md-2 control-label">所属组织 :</label>
									<div class="col-md-10">
										<input id="detail_txtParentOrg" type="text" class="form-control input-sm readonly-white" readonly value="">
									</div>
								</div>
				
								<div class="form-group">
								  <label class="col-md-2 control-label">账号状态 :</label>
								  <div class="col-md-10">
									<input id="detail_status" type="text" class="form-control input-sm readonly-white" readonly value="">
								  </div>
								</div>
				
							</form>
						</div>
					</div>
					
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 用户拥有角色</h5>
						</div>
						<div id="roleListContainer" class="widget-content">
							<table id="roleList" style="height:240px;width:300px">
							</table>
						</div>
					</div>
			</div>
		</div>
		<!-- end -->
      </div>
      <div class="modal-footer">
		<!--button id="btnConfirmChooseParentOrg" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button-->
        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
