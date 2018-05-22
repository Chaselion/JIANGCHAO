﻿<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	String basePath = request.getContextPath() + "/";
	User loginUser = SessionUtil.getCommonUserFromSession();
/* 	long tenantId = loginUser.getCustomId(); */
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>终端管理</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css">
<link href="<%=basePath%>css/map-tool.css" rel="stylesheet" >
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
.form-control[disabled]{
	cursor: not-allowed;
    background-color: white;
    opacity: 1;
    color: #555;
}

</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&amp;ak=L5rglNsfmEd9D6CQxHGNgTLG"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=bP6WvGH3fMdKMxhEDGlgLox7Nkze4c4R"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" 
	src="<%=basePath%>plugins/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/libs/lodash.compat.min.js"></script>
<!--[if lt IE 9]><script src="<%=basePath%>assets/js/libs/html5shiv.js"></script><![endif]-->
<script type="text/javascript"
	src="<%=basePath%>plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/event.swipe/jquery.event.move.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/event.swipe/jquery.event.swipe.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/libs/breakpoints.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/respond/respond.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/cookie/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/daterangepicker/moment-with-langs.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/jquery.noty.js"></script>
<!-- layouts -->
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/bottom.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/bottomCenter.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/bottomLeft.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/bottomRight.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/center.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/centerLeft.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/centerRight.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/inline.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/top.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/topCenter.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/topLeft.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/layouts/topRight.js"></script>
<!-- themes -->
<script type="text/javascript"
	src="<%=basePath%>plugins/noty/themes/default.js"></script>

<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/tabletools/TableTools.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/colvis/ColVis.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/columnfilter/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/DT_bootstrap.js"></script>
<!-- 加载国际化语言 -->
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/i18n/zh_CN.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/blockui/jquery.blockUI.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/autosize/jquery.autosize.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-pagehelper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/noty-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<!--加载鼠标绘制工具-->
		<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>		
		<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
<script>

var rowNum = -1;
$(document).ready(function() {
	getalarm();
	queryDeviceClass(); 
	$("#chargerStubManufacturerList").data("datatable", {
		language: dt_lang,	//加载国际化语言
		processing: true,
		serverSide: false,
		ordering: false,
		paging: false,
		info: false,
		searching: false,
		autoWidth: false,
		//scrollY: "400px",
		"columnDefs": [{
			"className": "align-center",
			"targets": 0,
			"data": null,
			"render": function ( data, type, full, meta) {
				return rowNum++;
				}
			},{
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
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.modifyDateTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
			},{
			"targets": 3,
			"className": "align-center",
			"data": "terminalNum",
		},{
			"className": "align-center",
			"targets": 4,
			"data": "terminalName",
			
		},{
			"className": "align-center",
			"targets": 5,
			"data": "deviceClassName",
			
		},{
			"className": "align-center",
			"targets": 6,
			"data": "longitude",
			
		},{
			"className": "align-center",
			"targets": 7,
			"data": "latitude",
			
		},{
			"className": "align-center",
			"targets": 8,
			"data": "firewareVersion",
		}, {
			"className": "align-center",
			"targets": 9,
			"data": "name",
		},{
			"className": "align-center",
			"targets": 10,
			"data": "oname",
		}, {
			"targets": 11,
			"data": null,
			"render": function ( data, type, full, meta ) {
				var html = '<ul class="table-controls"> ';
				
					html += '<shiro:hasPermission name="System.TenantMgmt.Tenant.update"><li><a href="javascript:updateManufacturer(' + data.terminalId + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li></shiro:hasPermission> <shiro:hasPermission name="System.TenantMgmt.Tenant.delete"><li><a href="javascript:deleteManufacturer(' + data.terminalNum + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li></shiro:hasPermission> ';
				
				html += ' </ul>'
			  return html;
				return "<a href=\"javascript:updateManufacturer('"+ data.terminalId + "');\" class=\"btn btn-xs bs-tooltip\" title=\"修改\" style='margin-left:5px;' ><i class=\"icon-pencil\"></i></a></span>"
					+"<a href=\"javascript:deleteManufacturer('"+ data.terminalNum+ "');\" class=\"btn btn-xs bs-tooltip\" title=\"删除\" style='margin-left:5px;' ><i class=\"icon-trash\"></i></a></span>";
			},
			"createdCell": function (td, cellData, rowData, row, col) {
				$(td).addClass('align-center');
			}
		}]
	});
	$("#btnConfirmChooseParentOrg").click(chooseOrg);			
	$("#txtParentOrg").click(chooseParentOrg);
	function chooseParentOrg() {
		$('#dlgChooseParentOrg').modal('show');
		initOrgTreeGrid();
	}
	function initOrgTreeGrid() {
		$('#orgTreeGrid').treegrid({
			width : 'auto',
			url : 'organization_ui/ctreegrid',
			idField : 'id',
			treeField : 'name',
			columns : [ [ {
				field : 'name',
				title : '名称',
				width : '40%'
			}, {
				field : 'description',
				title : '描述',
				width : '60%',
				formatter : function(value, row, index) {
					if (row.data) {
						return row.data.description;
					} else {
						return value;
					}
				}
			}] ],
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
			$("#lableParentOrg").removeClass("has-error").addClass(
					"has-success");
			$("#parentOrgErrorMSG").removeClass("has-error help-block");
		}
		$('#dlgChooseParentOrg').modal('hide');
	}
	function getupdate(state){
		if(state!=null&&state!="null"&&state!="")
				return "');\" class=\"btn btn-xs bs-tooltip\" title=\"修改\">修改坐标</a> ";
			else
				return "');\" class=\"btn btn-xs bs-tooltip\" title=\"添加\">添加坐标</a>";
	}
	$("#btnConfirmexport").click(exportTerminal);
	//新增按钮 点击事件
	$("#btnAddManufacturer").click(function() {
		$("#hiddenManufacturerId").val("");
		$("#terminalNum").val("");
		$("#terminalName").val("");
		$("#version").val("");
		$("#longitude").val("");
		$("#latitude").val("");
		$("#note").val("");
		$("#hiddenOrgId").val("");
		$("#txtParentOrg").val("");
		$("#btnConfirmManufacturerForm").attr("disabled", false);
		$("#dlgManufacturerForm").modal("show");
	});
	//导入表格按钮 点击事件
	$("#importExcel").click(function(){
		ajaxFileUpload();
		$("#myPicture").val("");
	});
	
	$("#btnReset").click(function(){
		$("#formSearch")[0].reset();
		loadManufacturer();
	});
	
	
	//添加编号判重
	 $("#terminalNum").change(function(){
//		alert("进入判重");
		var terminal_num = $("#terminalNum").val();
		var id= $("#hiddenManufacturerId").val();
		if(terminal_num==""){
			showNoty("请输入终端号", "error", true, 'top');  
			/* alert("请输入终端号");  */
			return;
		}; 
		$.post("terminal/getIfExist",{id:id,terminal_num:terminal_num},function(data){
			if(data.commonMessage.success){
				showNoty("该终端号已存在", "error", true, 'top');
				$("#btnConfirmManufacturerForm").attr("disabled", true);
				return;
			}else{
				$("#btnConfirmManufacturerForm").attr("disabled", false);
			}
		});
	});  
	
	//删除按钮点击事件
	$("#btnConfirmDelete").click(function() {  
		var terminalNum = $("#hiddenManufacturerId").val();	
		
		$.post("terminal/delete", {terminalNum:terminalNum}, function(data) {
			var notyParams = {
				dismissQueue: true,
				modal: false,
				layout: 'top',
				theme: 'defaultTheme'
			};
			if(data instanceof Object){
				if (data.success) {
					notyParams.text = "删除成功!";
					notyParams.type = "success";
					notyParams.timeout = 2000;
					
				} else {
					notyParams.text = data.errorMessage;
					notyParams.type = "error";
					notyParams.timeout = 3000;
				}
			}else {
				notyParams.text = "您无权限操作!";
				notyParams.type = "error";
				notyParams.timeout = 3000;
			}
			
			loadManufacturer();
			noty(notyParams);
		});
		$("#dlgConfirmDelete").modal("hide");
		$("#hiddenManufacturerId").val("");
		
		
	});
	
	$("#btnSearchManufacturer").click(function(){  
		searchManufacturers();
	});
	
	function checkInputLongitude(longitude){
		var regx=new RegExp("^\\d+(\\.\\d+)?$");
		var rs=regx.exec(longitude);
		return rs; 
	}

	
	//信息模态框确认按钮事件，判断是否有id 选择添加或更新url处理
	$("#btnConfirmManufacturerForm").click(function() {  
		var terminalId=$("#hiddenManufacturerId").val();
		var terminalNum =$("#terminalNum").val();
		var terminalName =$("#terminalName").val();
		var version =$("#version").val();
		var longitude =$("#longitude").val();
		var latitude =$("#latitude").val();
		var deviceClassId =$("#deviceClassId").val();
		var note =$("#note").val();
		var alarmStrategyId =$("#alarmstrategyid option:selected").val();
		var organizationId = $("#hiddenOrgId").val();
		if (terminalName == "") {
			showNoty("请输入终端名称", "error", true, 'top');
			return;
		}

		if (terminalNum == "") {
			showNoty("请输入终端号", "error", true, 'top');
			return;
		}
		if (organizationId == "") {
			showNoty("请填写组织!", "error", false, 'top');
			return;
		}
		 
		 if (terminalId == "") {
			 if(terminalNum==""){
					showNoty("请输入终端号", "error", true, 'top');
					return;
				}
			url = "terminal/add";
			var param = {
				terminalNum : terminalNum,
				terminalName: terminalName,
				firewareVersion:version,
				longitude:longitude,
				latitude:latitude,
				deviceClassId:deviceClassId,
				note:note,
				alarmStrategyId:alarmStrategyId,
				organizationId:organizationId,
			} 
		 } else {
			url = "terminal/update";
			var param = {
					terminalId:terminalId,
					terminalNum : terminalNum,
					terminalName: terminalName,
					firewareVersion:version,
					longitude:longitude,
					latitude:latitude,
					deviceClassId:deviceClassId,
					note:note,
					alarmStrategyId:alarmStrategyId,
					organizationId:organizationId,
			}
		}
		saveOrUpdate(url,param);
		
	});
 	//页码跳转插件
	$("#pagebar").pageHelper({toPage: toPage}); 
	App.init();
	Plugins.init();
	FormComponents.init();
	
	searchManufacturers();
	/* getalarm(); */
	/* queryDeviceClass(); */
	
});
	//导出终端表格
	function exportTerminal() {
		var form = $("<form>");	//定义一个form表单
		form.attr("style", "display:none");
		form.attr("target", "");
		form.attr("method", "post");
		form.attr("action", <%=basePath%> + "DownloadTerminal");//*********
	  
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
//保存或修改
function saveOrUpdate(url,param){
 $.post(url, param, function(data,status) {
			var notyParams = {
				dismissQueue: true,
				modal: false,
				layout: 'top',
				theme: 'defaultTheme'
			};
			if(data instanceof Object){
				if (data.commonMessage.success==true) {
					notyParams.text = "操作成功!";
					notyParams.type = "success";
					notyParams.timeout = 2000;
					
				} else {
					notyParams.text = "操作失败!";
					notyParams.type = "error";
					notyParams.timeout = 3000;
				}
			}else {
				notyParams.text = "您无权限操作!";
				notyParams.type = "error";
				notyParams.timeout = 3000;
			}
			loadManufacturer();	
			noty(notyParams);
	})
	$("#dlgManufacturerForm").modal("hide");
	$("#hiddenManufacturerId").val("");
}

function replaceSpace(obj){
    obj.value = obj.value.replace(/\s/gi,'')
    }
//根据起始位置显示页码 查找数据
function searchManufacturers(start, countPerPage) {
	start = start || 0;
	countPerPage = countPerPage || $("#pagebar").pageHelper('getLength');
	var terminalNum = $("#searchName").val();
	var param = {
		terminalNum:terminalNum,
		start: start,
		countPerPage: countPerPage
	};

	var requestData = $.param(param, true);
	loadManufacturer(requestData);
	// initMap(requestData);
}

function toAdd(id,terminal_id,carLicense,ip,port,state,startTime,longitude,latitude) {
// 	alert(id+"--"+terminal_id+"-"+carLicense+"--"+ip.length);
		window.location.href="ups_update.jsp?id=" + id+"&outletType="+terminal_id+"&outletName="+carLicense+"&outletAddress="+terminal_id+"&ip="+ip+"&port="+port+"&state="+state+"&startTime="+startTime+"&longitude="+longitude+"&latitude="+latitude;
}
function toPage(pageIndex, countPerPage) {
	countPerPage = countPerPage || 10;
	var start = pageIndex * countPerPage;
	searchManufacturers(start, countPerPage);
}

//加载页面数据  按页码查找
function loadManufacturer(requestData) {
	$("#chargerStubManufacturerList").DataTable().clear().draw();
	$("#pagebar").pageHelper("displayEmpty");
	$.post("terminal/query", requestData, function(data) {
		var terminal = data.terminal;
		var page = data.page;
		var location = data.location;
		var rowStart = page.start + 1;
		var rowEnd = rowStart + page.limit - 1;
		var count = page.count;
		rowStart = Math.min(rowStart, count);
		rowEnd = Math.min(rowEnd, count);
	    rowNum = rowStart;
		
		$("#pagebar").pageHelper("update", {
			start:rowStart, end:rowEnd, total:count, currentPageIndex:page.currentPage, totalPage:page.totalPage
		});
		
		$("#chargerStubManufacturerList").DataTable().rows.add( terminal ).draw();
		
		
		var map = null;		//百度地图全局对象
		var lon = null;
		var lat = null;
			map = new BMap.Map("baidumap"); // 创建Map实例
			var point = new BMap.Point(95.421718,47.287587);  // 创建点坐标    
			map.centerAndZoom(location, 12);// 初始化地图，设置中心点坐标和地图级别    
			 map.addEventListener("click",function(e){
				 map.clearOverlays();
				 map.panTo(new BMap.Point(e.point.lng,e.point.lat));// map.panTo方法，把点击的点设置为地图中心点  
				  var point = new BMap.Point(e.point.lng,e.point.lat); //将标注点转化成地图上的点
			        var marker = new BMap.Marker(point); //将点转化成标注点
			        map.addOverlay(marker);  //将标注点添加到地图上	
			        $("#longitude").val(e.point.lng-0.01185);
			        $("#latitude").val(e.point.lat-0.00328);
			 
			 }); 
			map.enableScrollWheelZoom(); //启用滚轮放大缩小
					
			var leftNaviCtrl = new BMap.NavigationControl();
			map.addControl(leftNaviCtrl); //添加默认缩放平移控件
			});
			// map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}))
}

//删除
function deleteManufacturer(id){
	$("#dlgConfirmDelete").modal("show");
	$("#hiddenManufacturerId").val(id);	
}
//修改点击事件，查询该运单的信息显示在页面上
function updateManufacturer(id){
	$("#btnConfirmManufacturerForm").attr("disabled", false);
	$("#alarmstrategyid").attr("disabled",false).css("background-color","");
	$.ajax({
		type:'post',
		url:'terminal/get',
		data:{id:id},
		dataType:'json',
		success:function(data) {
			var terminal  = data.terminal;
			var organization  = data.organization;
			$("#dlgManufacturerForm").modal("show");
			$("#hiddenManufacturerId").val(terminal.terminalId);
			$("#terminalNum").val(terminal.terminalNum)
			$("#terminalName").val(terminal.terminalName);
			$("#version").val(terminal.firewareVersion);
			$("#longitude").val(terminal.longitude);
			$("#latitude").val(terminal.latitude);
			$("#deviceClassId").val(terminal.deviceClassId);
			$("#note").val(terminal.note);
			$("#alarmstrategyid").val(terminal.alarmStrategyId);
			$("#hiddenOrgId").val(organization.organizationId);
			$("#txtParentOrg").val(organization.name);
		},
		error:function(){
		}
	});
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
		showNoty(data.commonMessage.errorMessage, "error", true, 'top');
	}
});
}

//获取设备类型
function queryDeviceClass() {
    $.post("terminal/queryDeviceClass", "", function(data) {
	  if (data.commonMessage.success) {
		var deviceClass = data.deviceClass;
		var jqCompanyList = $("#deviceClassId");
		for (var i = 0; i < deviceClass.length; i++) {
			var tmpCom = deviceClass[i];
			jqCompanyList.append('<option value="' + tmpCom.deviceClassId + '">' + tmpCom.name + '</option>');
		}
	} else {
		showNoty(data.commonMessage.errorMessage, "error", true, 'top');
	}
});
}


function  exportshow(){
	$('#dlgConfirmexport').modal('show');
}
//上传表格
function doExcelUpload(param){
	var fd = new FormData();
	if(param.files[0]){	
		fd.append('fileToUpload',param.files[0]);
		var xhr = new XMLHttpRequest();
		xhr.upload.addEventListener("progress",uploadProgress,false);
		xhr.addEventListener("load", uploadComplete, false);  
	    xhr.addEventListener("error", uploadFailed, false);  
	    xhr.addEventListener("abort", uploadCanceled, false);  
	    xhr.open("POST", "excel/add");//修改成自己的接口  
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
	       searchManufacturers();
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
</script>
</head>
<body>
	<div id="container" style="width:100%;">
		<div id="content">
			<div class="container">
				<div style="padding-top: 5px;"></div>
				
				<input id="hiddenManufacturerId" type="hidden" value="" />
						
					<form id="formSearch" class="form-inline" role="form">
					<div class="col-md-6" style="margin-top: 10px;">
						<shiro:hasPermission name="System.TenantMgmt.Tenant.add">
                <button id="btnAddManufacturer" class="btn btn-success" type="button" style="">添加</button>
                </shiro:hasPermission>
						<shiro:hasPermission name="System.TenantMgmt.Tenant.import">
                <button id="importExcel" class="btn btn-success" onclick="$('#excel').click();return false;" style="">导入</button>
                </shiro:hasPermission>
						<input type="file" id="excel" onchange="doExcelUpload(this);" style="display: none">
						<shiro:hasPermission name="System.TenantMgmt.Tenant.export">
                <button id="btnOutPut" class="btn btn-primary" type="button" onclick="javascript:exportshow();">导出</button>
                </shiro:hasPermission>
						
					</div>
					<div class="col-md-6">
						<div style="float:right;">
						<!-- 	<form class="form-inline" role="form"> -->
								<div class="form-group">
									<input id = "searchName" type="text" class="form-control" placeholder="输入终端号进行过滤" onBlur="replaceSpace(this)"/>
								</div>
								
								<button id="btnSearchManufacturer" class="btn btn-primary" type="button">搜索 </button>
								<button id="btnReset" class="btn btn-default" type="button" style="background-color: #3968c6;color:white;"> 重置 </button>
						
						</div>
					</div>
						</form>
				</div>
		
					<div class="col-md-12">
						<table id="chargerStubManufacturerList"
							class="table table-highlight-head table-condensed table-bordered datatable dataTable no-footer">
							<thead>
								<tr>
								    <th class="align-center">#</th>
								    <th class="align-center " >创建时间</th>
									<th class="align-center " >修改时间</th>
									<th class="align-center " >终端号</th>
									<th class="align-center " >终端名称</th>
									<th class="align-center " >设备类型</th>
									<th class="align-center " >经度</th>
									<th class="align-center " >纬度</th>
									<th class="align-center " >固件版本</th>
									<th class="align-center " >策略</th>
									<th class="align-center " >所属组织</th>
									<th class="align-center " >操作</th>
								</tr>
							</thead>
						</table>
					</div>
					<div id="pagebar">
				</div>
				
				</div>
			</div>
	</div>
	
	<div id="dlgManufacturerForm" class="modal">
		<div class="modal-dialog modal-lg" style="width: 950px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title"><i class="icon-reorder"></i> 终端信息:</h4>
				</div>
				<div class="modal-body" style="height:530px;">
					<div id="baidumap" style="width:500px;height:500px;float: right;"></div>
					<!-- start -->
		<!-- 			<div class="row"> -->
						<div class="col-md-12" style="float:left;width:400px">
							<form id="manufacturerForm" class="form-horizontal">
								<!--<input type="hidden" id="codeId" name="id" value="-1">-->
								<div class="widget">							
									<div class="widget-content">
										<div class="form-group">
											<label class="col-md-3 control-label">终端号<span class="required">*</span> :</label>
											<div class="col-md-6">
												<input id="terminalNum" type="text" class="form-control" />
											</div>
											</div>
										<div class="form-group">
											<label class="col-md-3 control-label">终端名称<span class="required">*</span>:</label>
										<div class="col-md-6">
										<input id="terminalName" type="text" class="form-control" />
										</div>
										
										
										</div>
										 <div class="form-group">
											<label class="col-md-3 control-label">经度<span class="required">*</span> :</label>
											
											<div class="col-md-6">
											<input id="longitude" type="text" class="form-control"/>
											
											</div>
											<label id="longitudeTopic"  class="col-md-1 control-label" style="color: crimson;display:none;">非法数字</label>		
											
										</div>
										<div class="form-group">		
											<label class="col-md-3 control-label">纬度<span class="required">*</span> :</label>
											<div class="col-md-6">
											<input id="latitude" type="text" class="form-control"/>
											</div>
											</div>
										<div class="form-group">
										<label class="col-md-3 control-label">报警策略<span class="required"></span> :</label>
										<div class="col-md-6">
										
										<select id="alarmstrategyid" name="alarmstrategyid" class="form-control input-sm" style="width:100%"></select>
										</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">设备类型<span class="required"></span> :</label>
											<div class="col-md-6">	
											<select id="deviceClassId" name="deviceClassId" class="form-control input-sm" style="width:100%"></select>
											</div>
											</div>
										<div class="form-group">
										<label class="col-md-3 control-label">固件版本:</label>
										<div class="col-md-6">
										<input id="version" type="text" class="form-control" />
										</div>
										</div>
										<div id="lableParentOrg" class="form-group">
											<label class="col-md-3 control-label">组 &nbsp &nbsp织<span class="required">*</span> :</label>
											<div class="col-md-6">
											<input id="txtParentOrg" type="text" class="form-control"
													style="color: #555; background-color: #fff;" readonly
													value=""> <input id="hiddenOrgId" type="hidden"
													value=""> 
											</div>			
											
									</div>
					
										<div class="form-group">
											<label class="col-md-3 control-label">备 &nbsp &nbsp &nbsp注 :</label>
											<div class="col-md-6">
											<input id="note" type="text" class="form-control" />
											</div>	
											</div>
										
										<div class="form-group">
											<label id="latitudeTopic" class="col-md-1 control-label" style="color: crimson;display:none">非法数字</label>
									</div>
										
									</div>
								</div>
							</form>
						</div>
					<!-- </div> -->
					<!-- end -->
				</div><!-- /.modal-body> -->
		 
				<div class="modal-footer">
					<button id="btnConfirmManufacturerForm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
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
					<h4 class="modal-title">删除终端</h4>
				</div>
				<div class="modal-body">
					<p>确定要删除终端么?</p>
				</div>
				<div class="modal-footer">
					<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<div id="dlgConfirmexport" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">导出终端信息</h4>
      </div>
      <div class="modal-body">
        <p>您确定要导出终端信息吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmexport" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelexport" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->








<div id="dlgChooseParentOrg" class="modal">
		<div class="modal-dialog modal-lg" style="width:600px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">
						<i class="icon-reorder"></i> 选择用户所属组织
					</h4>
				</div>
				<div class="modal-body">
					<!-- start -->
					<div class="row">
						<div style="width: 60%"></div>
					</div>
					<table id="orgTreeGrid" >

					</table>
					<!-- end -->
				</div>
				<div class="modal-footer">
					<button id="btnConfirmChooseParentOrg" type="button"
						class="btn btn-primary" data-loading-text="处理中...">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</body>
</html>
