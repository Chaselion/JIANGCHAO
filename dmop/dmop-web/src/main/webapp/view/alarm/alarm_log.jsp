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
<title>报警查询</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
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
		queryAlarm(0);
		
	});
	
	
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
			"targets": 0,
			"data": null,
			"render": function ( data, type, full, meta) {
				return rowNum++;
				}
			}, {
				"targets": 1,
				"data": "alarmLogId"
			}, {
				"className": "align-left",
				"targets": 2,
				"data": "alarmConditionId"
			}, {
				"className": "align-center",
				"targets": 3,
				"data": "currentAlarmLevelId",
			}, {
				"className": "align-center",
				"targets": 4,
				"data": "customId"
			}, {
				"targets": 5,
				"data": "deviceClassId"
			}, {
				"targets": 6,
				"data": "deviceId"
			}, {
				"className": "align-center",
				"targets": 7,
				"data": "isPromote",
				
			}, {
				"className": "align-center",
				"targets": 8,
				"data": "isRelieve"
			}, {
				"targets": 9,
				"data": "isSuccessSend"
			},{
				"targets": 10,
				"data": "originalAlarmLogId"
			},{
				"targets": 11,
				"data": "terminalId"
			},{
				"targets": 12,
				"data": "currentAlarmProperityValue"
			
			},{
				"targets": 13,
				"data": "createDateTime"
			},{
				"targets": 14,
				"data": "modifyDateTime"
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
	$(id).val(playDate.format('YYYY-MM-DD'));
	$(id).daterangepicker({
		singleDatePicker: true,
		showDropdowns: true,
		startDate: playDate,
		format: 'YYYY-MM-DD'
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
	
	var requestData = $.param(param, true);
	
	//////////
	$("#alarmList").DataTable().clear().draw();
	$("#pagebar").pageHelper("displayEmpty");
	$.post('alarm/queryAlarm', requestData, function(data) {
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
	alert("结束");
}

function toPage(pageIndex, countPerPage) {
	countPerPage = countPerPage || 10;
	var start = pageIndex * countPerPage;
	queryAlarm(start, countPerPage);
}
</script>
</head>
<body>
	<div id="container">
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
						<div class="form-group" style="margin-left:10px;">
							<label class="control-label">报警发生时间:</label>
							<input type="text" class="form-control" style="width:95px;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtStartDate" name="txtStartDate" placeholder="告警发生时间">
							-
							<input type="text" class="form-control" style="width:95px;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtEndDate" name="txtEndDate" placeholder="告警发生时间">
						</div>
						<div class="form-group" style="margin-left:10px;">
							<label class="control-label" for="alarmLevel">报警等级:</label>
							<select id="alarmLevel" name="alarmLevel" class="form-control" style="color:black;width:90px;">
								<option value="" selected>全部</option>
								<option value="1">一级报警</option>
								<option value="2">二级报警</option>
								<option value="3">三级报警</option>
								<option value="4">四级报警</option>
							</select>
						</div>
						<!-- <div class="form-group">
							<label class="control-label">机务类型:</label>
							<input type="hidden" id="hiddenAlarmCauseIds" value="" />
							<input id="alarmCauseIds" name="alarmCauseIds" type="text" class="form-control" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
						</div> -->
						<button id="btnQueryAlarm" class="btn btn-primary" type="button" >查询</button>
						<button id="btnOutPut" class="btn btn-primary" type="button" style="background:crimson;" onclick="javascript:exportAlarm();">导出</button>
					</form>
				</div>
				
				<%@ include file="/view/alarm-includes/alarm-adv-panel.jsp"%>
				
				<div class="row">
					<div class="col-md-12">
						<table id="alarmList" class="table table-highlight-head table-bordered table-condensed datatable" data-scroll-y="true">
							<thead>
								<tr>
									<th class="align-center">序号</th>
									<th class="align-center">报警条件序号</th>
									<th class="align-center">目前报警等级</th>
									<th class="align-center">客户序号</th>
									<th class="align-center">设备类型id</th>
									<th class="align-center">设备id</th>
									<th class="align-center">是否由升级动作产生</th>
									<th class="align-center">是否由解除动作产生</th>
									<th class="align-center">是否成功发送</th>
									<th class="align-center">从哪条报警产生</th>
									<th class="align-center">终端id</th>
									<th class="align-center">告警的值</th>
									<th class="align-center">发生时间</th>
									<th class="align-center">发生时间</th>
									<th class="align-center">更新时间</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div class="row" id="pagebar">
				</div>
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

</body>
</html>