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
<title>报警日志</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" >
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css">
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->
<link rel="stylesheet" href="<%=basePath%>plugins/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/linkbutton.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/pagination.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/datagrid.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/panel.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/bootstrap/layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>plugins/jquery-easyui-1.4.2/themes/icon.css" rel="stylesheet" type="text/css" >
<link href="<%=basePath%>css/alarm-helper.css" rel="stylesheet" type="text/css" >
<style>
.tr-alarm-critical {
	background-color:#e25856
}
.tr-alarm-major {
	background-color: #ff9600;
}
.tr-alarm-minor {
	background-color: #f8fc60;
}
.tr-alarm-warning {
	background-color: #658db3;
}

.ztree {
	height: 300px;
	overflow-y: scroll;
	overflow-x: auto;
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

<script type="text/javascript" src="<%=basePath%>plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/tabletools/TableTools.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/colvis/ColVis.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/columnfilter/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/DT_bootstrap.js"></script>
<!-- 加载国际化语言 -->
<script type="text/javascript" src="<%=basePath%>plugins/datatables/i18n/zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/blockui/jquery.blockUI.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/autosize/jquery.autosize.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/zTree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/zTree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>js/noty-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/alarm-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-pagehelper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/url-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/locale/easyui-lang-zh_CN.js"></script>
<script>
$(document).ready(function(){
	moment.lang('zh-cn');
	
	initResourceTypeTree();
	$("#btnSearchEntity").click(queryResourceEntity);
	$("#btnSelectAllEntity").click(onClickBtnSelectAllEntity);
	$("#btnSelectEntity").click(onClickBtnSelectEntity);
	$("#btnRemoveEntity").click(onClickBtnRemoveEntity);
	$("#btnRemoveAllEntity").click(onClickBtnRemoveAllEntity);
	$("#btnConfirmSelectEntity").click(onClickBtnConfirmSelectEntity);
	$("#btnEntityReset").click(resetEntitySearch);
	$("#btnToggleSearchPanel").click(toggleAdvanceSearchPanel);
	$("#combotreeSearchEntityType").focus(showResourceTypeTree);
	
	initAlarmCauseTree();
	$("#alarmCauseIds").focus(showAlarmCauseTree);
	
	initDateField("#txtStartDate");
	initDateField("#txtEndDate");
	
	$("#btnQueryAlarm").click(function () {
		if(validateDate(0)){
			queryAlarm(0);
		};
	});
	$("#btnConfirmexport").click(exportAlarm);
	function validateDate(start, countPerPage) {
		start = start || 0;
		var param = {};

		param["start"] = start;

		var startCreateDate = $("#txtStartDate").val();
		var endCreateDate = $("#txtEndDate").val();
		if(startCreateDate == "" && endCreateDate == ""){
			return true;
		}
		/* if (startCreateDate != "") {
			param["startCreateDate"] = startCreateDate;
		} else {
			showNoty("开始时间不能为空!", "error", true, 'top');
			return false;
		} */
		if (contrastTime("#txtStartDate") == 0 && ((startCreateDate != "" && endCreateDate == "") || (startCreateDate !="" && endCreateDate != ""))) {
			showNoty("开始时间不能超过当前日期!", "error", true, 'top');
			return false;
		}
		/* if (endCreateDate != "") {
			param["endCreateDate"] = endCreateDate;
		} else {
			showNoty("结束时间不能为空!", "error", true, 'top');
			return false;
		} */
		/* if (contrastTime("#txtEndDate") == 0 && ((startCreateDate == "" && endCreateDate != "")  || (startCreateDate !="" && endCreateDate != ""))) {
			showNoty("结束时间不能超过当前日期!", "error", true, 'top');
			return false;
		} */
		if (startCreateDate != "" && endCreateDate != "") {
			var startCreateDateObj = moment(
					startCreateDate, 'YYYY-MM-DD');
			var endCreateDateObj = moment(endCreateDate,
					'YYYY-MM-DD');
			if (startCreateDateObj.diff(endCreateDateObj) > 0) {
				//alert("error time! " + startCreateDateObj.diff(endCreateDateObj));
				showNoty("结束时间不应早于开始时间!", "error", false,
						'top');
				return false;
			}
		}
		return true;
	}
	
	
	$("#alarmList").data("datatable", {
		language: dt_lang,	//加载国际化语言
		processing: true,
		serverSide: false,
		ordering: false,
		paging: false,
		info: false,
		searching: false,
		autoWidth: false,
		"createdRow": function ( row, data, index ) {
			var labelClass = "";
			var alarmLevel = data.alarmLevel;
			if (alarmLevel == SEVERITY_CRITICAL) {
				labelClass = "tr-alarm-critical";
			} else if (alarmLevel == SEVERITY_MAJOR) {
				labelClass = "tr-alarm-major";
			} else if (alarmLevel == SEVERITY_MINOR) {
				labelClass = "tr-alarm-minor";
			} else if (alarmLevel == SEVERITY_WARNING) {
				labelClass = "tr-alarm-warning";
			}
			$('td', row).addClass(labelClass);
		},
		"columnDefs": [{
			"className": "align-center",
			"targets": 0,
			"data": null,
			"render": function ( data, type, full, meta) {
				return rowNum++;
				}
			}, {
				"className": "align-center",
				"targets": 1,
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.createDateTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
				
			},{
				"className": "align-center",
				"targets": 2,
				"data": "deviceClass"
			}, {
				"className": "align-center",
				"targets": 3,
				"data": "conditionName",
			}, {
				"className": "align-center",
				"targets": 4,
				"data": "currentAlarmValue"
			}, {
				"className": "align-center",
				"targets": 5,
				"data": "currentAlarmLevel"
			}, {
				"className": "align-center",
				"targets": 6,
				"data": "deviceName"
			}, {
				"className": "align-center",
				"targets": 7,
				"data": "organizationName"
			}, /* {
				"className": "align-center",
				"targets": 8,
				"data": "customName"
			}, */ {
				"className": "align-center",
				"targets": 8,
				"data": null,
				render: function(data, type, full, meta) {
					var status = data.isRelieve;
					
					var labelClass = 'label-warning';
					var statusStr = '未知';
					if (status =='1') {
						labelClass = 'label-danger';
						statusStr = '报警';
					} else if (status == '0') {
						labelClass = 'label-success';
						statusStr = '解除';
					}
					return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
				}
			}, {
				"className": "align-center",
				"targets": 9,
				"data": null,
				render: function(data, type, full, meta) {
					var status = data.isPromote;
					
					var labelClass = 'label-warning';
					var statusStr = '未知';
					if (status =='1') {
						labelClass = 'label-success';
						statusStr = '是';
					} else if (status == '0') {
						labelClass = 'label-danger';
						statusStr = '否';
					}
					return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
				}
			}, {
				"className": "align-center",
				"targets": 10,
				"data": null,
				render: function(data, type, full, meta) {
					var status = data.isSend;
					
					var labelClass = 'label-warning';
					var statusStr = '未知';
					if (status =='1') {
						labelClass = 'label-success';
						statusStr = '是';
					} else if (status == '0') {
						labelClass = 'label-danger';
						statusStr = '否';
					}
					return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
				}
			},{
				"className": "align-center",
				"targets": 11,
				"data": "measureName"
			},{
				"className": "align-center",
				"targets": 12,
				"data": "message"
			}]
	});
	
	$("#pagebar").pageHelper({toPage: toPage});
	
	App.init();Plugins.init();FormComponents.init();
	
	/*
	initSearchEntityDataGrid();
	gSearchEntityDataGridInit = true;
	initSelectedEntityDataGrid();
	gSelectedEntityDataGridInit = true;
	*/
	//是否根据传入页面参数执行默认查询
	queryIfSearchStringExist();
	queryAlarm(0);
});


//////////////////////////////////////////////////////
function queryIfSearchStringExist() {
	//alert(window.location.search);
	var params = window.location.search;
	if (params != null && params != "") {
		toggleAdvanceSearchPanel();	//若不打开面板，则实体选择datagrid没有初始化，会报js错误
		
		params = params.substr(1);	//去掉?号
		initConditionWithParam(params);
		queryAlarm();
	}
}

function toAlarmDetail(alarmId, entityId, entityType, alarmRaisedTime) {
	if(entityType == 'elecve.car'){
		parent.showNavTab('<%=basePath%>car_alarm_detail.jsp?aid=' + alarmId +'&sysCarId=' + entityId + '&alarmRaisedTime=' + alarmRaisedTime, '车辆告警明细面板', ['远程维保','车辆告警明细面板']);
	}else if(entityType == 'elecve.charger_stub'){
		parent.showNavTab('<%=basePath%>charger_stub_alarm_detail.jsp?aid=' + alarmId +'&chargerStubId=' + entityId + '&alarmRaisedTime=' + alarmRaisedTime, '充电桩告警明细面板', ['远程维保','充电桩告警明细面板']);
	}	
}

function initConditionWithParam(params) {
	var entityId = getUrlParam(params, "entityId");
	var entityName = getUrlParam(params, "entityName");
	var moc = getUrlParam(params, "moc");
	var entityTypeName = getUrlParam(params, "entityTypeName");
	
	setSearchEntityType(moc, entityTypeName);
	
	var selectedEntityRows = [{
		id: entityId,
		name: entityName,
		type: moc,
		typeName: entityTypeName
	}]
	addToSelectedEntityDataGrid(selectedEntityRows);
	
	var alarmLevel = getUrlParam(params, "alarmLevel");
	$("#alarmLevel").val(alarmLevel);
	
	var startDate = getUrlParam(params, "startDate");
	if (startDate != "") {
		var momentStart = moment(parseInt(startDate));
		$('#txtStartDate').data('daterangepicker').setStartDate(momentStart.format('YYYY-MM-DD'));
	}
	
	var endDate = getUrlParam(params, "endDate");
	if (endDate != "") {
		var momentEnd = moment(parseInt(endDate));
		$('#txtEndDate').data('daterangepicker').setStartDate(momentEnd.format('YYYY-MM-DD'));
	}
}

function initDateField(id) {
	//设置回放日期
	var playDate = moment();
	//$(id).val(playDate.format('YYYY-MM-DD'));
	$(id).daterangepicker({
		singleDatePicker: true,
		showDropdowns: true,
		startDate: playDate,
		timePicker:true,
		/* timePickerSeconds:true, */
		format: 'YYYY-MM-DD hh:mm'
	}, function(start, end, label) {
	});
}

var globalAlarmCauseTree = null;
function initAlarmCauseTree() {
	globalAlarmCauseTree = null;
	$.post("monitor/getMonitorInfoTree", "", function(data) {
		if (data.commonMessage.success) {
			var causeTree = data.monitorInfoTree;
			var zTreeSettingCheck = {
				check: {
					enable: true
				},
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "pid"
					}
				}
			};
			globalAlarmCauseTree = $.fn.zTree.init($("#alarmCauseTree"), zTreeSettingCheck, causeTree);
		}
	});
}

function extractCheckedAlarmCauseIdAnNames(treeNodes, nodeType) {
	if (treeNodes.length == 0) {
		return "";
	}

	var v = "";
	var vName = "";
	var tmp = null;
	for (var i = 0, len = treeNodes.length; i < len; i++) {
		tmp = treeNodes[i];
		if (tmp.type == nodeType) {
			v += tmp.data.alarmCauseId + ",";
			vName += tmp.name + ",";
		}
	}
	
	if (v.length > 0 ) { 
		v = v.substring(0, v.length-1)
	} else {
		v = "-1";
	};
	if (vName.length > 0 ) vName = vName.substring(0, vName.length-1);
	return [v, vName];
}

function showAlarmCauseTree() {
	showMenu("alarmCauseIds", "divAlarmCauseTreeWrapper");
	$("body").bind("mousedown", onBodyDownAlarmCause);
}

function showMenu(id, wrapperId) {
	var textfieldObj = $("#" + id);
	var offset = $("#" + id).offset();
	$("#" + wrapperId).css({left:offset.left + "px", top:offset.top + textfieldObj.outerHeight() + "px"}).show();//slideDown("fast");
}

function hideMenuAlarmCause() {
	var alarmCauseNodes = globalAlarmCauseTree.getCheckedNodes(true);
	var idAndNames = extractCheckedAlarmCauseIdAnNames(alarmCauseNodes, "monitor");
		
	$("#alarmCauseIds").val(idAndNames[1]);
	$("#hiddenAlarmCauseIds").val(idAndNames[0]);
		
	$("#divAlarmCauseTreeWrapper").hide();//fadeOut("fast");
	$("body").unbind("mousedown", onBodyDownAlarmCause);
}

function onBodyDownAlarmCause(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "divAlarmCauseTreeWrapper" || $(event.target).parents("#divAlarmCauseTreeWrapper").length>0)) {
		hideMenuAlarmCause();
	}
}

var rowNum = -1;
function queryAlarm(start, countPerPage) {
	start = start || 0;
	countPerPage = countPerPage || $("#pagebar").pageHelper('getLength');
	var param = {};
	
	var entityIds = getSelectedEntityIds();

	param["start"] = start;
	param["countPerPage"] = countPerPage;
	
	var startCreateDate = $("#txtStartDate").val();
	if (startCreateDate != "") {
		param["startCreateDate"] = startCreateDate;
	}
	
	
	var endCreateDate = $("#txtEndDate").val();
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
	var requestData = $.param(param, true);
	
	//////////
	$("#alarmList").DataTable().clear().draw();
	$("#pagebar").pageHelper("displayEmpty");
	$.post('alarmLog/queryLogAlarm', requestData, function(data) {
		var alarms = data.alarms;
		var page = data.page;
		
		var rowStart = page.start + 1;
		var rowEnd = rowStart + page.limit - 1;
		var count = page.count;
		rowStart = Math.min(rowStart, count);
		rowEnd = Math.min(rowEnd, count);
		rowNum = rowStart;
		
		$("#pagebar").pageHelper("update", {
			start:rowStart, end:rowEnd, total:count, currentPageIndex:page.currentPage, totalPage:page.totalPage
		});
		
		$("#alarmList").DataTable().rows.add(alarms).draw();
	});
}

function contrastTime(start) {
	var evalue = $(start).val();
	var dB = new Date(evalue.replace(/-/g, "/"));//获取当前选择日期  
	var d = new Date();
	var str = d.getFullYear() + "-"
			+ (d.getMonth() + 1) + "-" + (d.getDate()+1);//获取当前实际日期  
	if (Date.parse(str) > Date.parse(dB)) {//时间戳对比  
		return 1;
	}
	return 0;
}
function  exportshow(){
	$('#dlgConfirmexport').modal('show');
}
function exportAlarm() {
	var form = $("<form>");	//定义一个form表单
	form.attr("style", "display:none");
	form.attr("target", "");
	form.attr("method", "post");
	form.attr("action", <%=basePath%> + "DownloadAlarmQuery");
    
 	var entityIds = getSelectedEntityIds();
	var input = $("<input>");
	input.attr("type", "hidden");
	input.attr("name", "entityIds");
	input.attr("value", entityIds);
	form.append(input); 
		
	var entityType = $("#hiddenSearchEntityType").val();
	if (entityType != "") {
		input = $("<input>");
		input.attr("type", "hidden");
		input.attr("name", "entityType");
		input.attr("value", entityType);
		form.append(input);
	}
	
	var alarmCauseIds = $("#hiddenAlarmCauseIds").val();
	if (alarmCauseIds != "") {
		input = $("<input>");
		input.attr("type", "hidden");
		input.attr("name", "alarmCauseIds");
		input.attr("value", alarmCauseIds);
		form.append(input);
	}
		
	var alarmLevel = $("#alarmLevel").val();
	if (alarmLevel != "") {
		input = $("<input>");
		input.attr("type", "hidden");
		input.attr("name", "alarmLevel");
		input.attr("value", alarmLevel);
		form.append(input);
	}
		
	var startDate = $("#txtStartDate").val();
	if (startDate != "") {
		input = $("<input>");
		input.attr("type", "hidden");
		input.attr("name", "startDate");
		input.attr("value", startDate);
		form.append(input);
	}
		
	var endDate = $("#txtEndDate").val();
	if (endDate != "") {
		input = $("<input>");
		input.attr("type", "hidden");
		input.attr("name", "endDate");
		input.attr("value", endDate);
		form.append(input);
	}
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
function toPage(pageIndex, countPerPage) {
	countPerPage = countPerPage || 10;
	var start = pageIndex * countPerPage;
	queryAlarm(start, countPerPage);
}
</script>
</head>
<body>
	<div id="container" style="width:100%;">
		<div id="content">
			<div class="container">
				<div class="p-t-10"></div>
				
				<div>
					<form class="form-inline" role="form">
						<!-- <div class="form-group">
							<label class="control-label">报警实体: </label>
						</div> 
						<a id="btnToggleSearchPanel" class="btn btn-info" href="javascript:void(0);">选择 (<span class="spSelectedEntityCount">0</span> 个) <span class="caret"></span></a>
						-->
						<div class="form-group" style="margin-left:10px; float: right;">
							<!-- <label class="control-label">报警发生时间:</label> -->
							<input  type="text" class="form-control" style="width:auto;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtStartDate" name="txtStartDate" placeholder="告警开始时间">
							-
							<input type="text" class="form-control" style="width:auto;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtEndDate" name="txtEndDate" placeholder="告警结束时间">
						<button id="btnQueryAlarm" class="btn btn-primary" type="button" >搜索</button>
						<button id="btnResetTerminal" class="btn btn-primary"
								type="button">重置</button>
						</div>
						<script type="text/javascript">
						$("#btnResetTerminal").click(function (){
							$("#txtStartDate").val("");
							$("#txtEndDate").val("");
							queryAlarm(0);
						})
						</script>
						<!-- <div class="form-group" style="margin-left:10px;">
							<label class="control-label" for="alarmLevel">报警等级:</label>
							<select id="alarmLevel" name="alarmLevel" class="form-control" style="color:black;width:90px;">
								<option value="" selected>全部</option>
								<option value="1">一级报警</option>
								<option value="2">二级报警</option>
								<option value="3">三级报警</option>
								<option value="4">四级报警</option>
							</select>
						</div> -->
						<!-- <div class="form-group">
							<label class="control-label">机务类型:</label>
							<input type="hidden" id="hiddenAlarmCauseIds" value="" />
							<input id="alarmCauseIds" name="alarmCauseIds" type="text" class="form-control" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
						</div> -->
						<button id="btnOutPut" class="btn btn-primary" type="button" style="" onclick="javascript:exportshow();">导出</button>
					</form>
				</div>
				<%-- 
				<%@ include file="/alarm-includes/alarm-adv-panel.jsp"%> --%>
					<div class="col-md-12">
						<table id="alarmList" class="table table-highlight-head table-bordered table-condensed datatable" data-scroll-y="true">
							<thead>
								<tr>
									<th class="align-center">#</th>
									<th class="align-center">发生时间</th>
									<th class="align-center">设备类型</th>
									<th class="align-center">事件名称</th>
									<th class="align-center">告警值</th>
									<th class="align-center">报警等级</th>
									<th class="align-center">设备名称</th>
									<th class="align-center">组织架构</th>
									<!-- <th class="align-center">客户名称</th> -->
									<th class="align-center ">报警或解除</th>
									<th class="align-center">是否升级报警</th>
									<th class="align-center ">是否送达</th>
									<th class="align-center">报警方式</th>
									<th class="align-center">报警信息</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div  id="pagebar">
				</div>
			</div>
		</div>
	
<div id="divAlarmCauseTreeWrapper" class="col-md-3" style="height:320px;border:1px solid #686868;background-color:#fff;display:none; position:absolute;overflow-y:auto;z-index:10000;">
	<ul id="alarmCauseTree" class="ztree"></ul>
</div>
<div id="divResourceTypeTreeWrapper" class="col-md-3" style="height:340px;border:1px solid #686868;background-color:#fff;display:none; position:absolute;overflow-y:auto">
	<ul id="resourceTypeTree" class="ztree ztree-resource"></ul>
	<div style="float:right;margin-top:3px; margin-bottom:3px;">
		<button class="btn btn-sm btn-primary" onclick="javascript:onClickSelectResourceType();">确定</button>
		<button class="btn btn-sm" onclick="javascript:onClickCancelSelectResourceType();">取消</button>
	</div>
</div>
<div id="dlgConfirmexport" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">导出报警日志</h4>
      </div>
      <div class="modal-body">
        <p>您确定要导出报警日志吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmexport" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelexport" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>