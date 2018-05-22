<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page session="false"%>
<%
    /*HttpSession session = request.getSession(false);*/
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>sim管理</title>
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
<link rel="stylesheet" href="<%=basePath%>plugins/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<style>
.row {
	margin-left: 0;
	margin-right: 0;
}

.r2{
	background-color:#FFF38F;
}

td.success{
	background-color:#00FF00;
}

td.faile{
	background-color:#CD5C5C;
}

div.form-group {
	margin-bottom: 5px;
}
label.help-block.has-error {
	margin-top: 2px;
	margin-bottom: 0px;
}
#dlgCarForm .modal-footer {
	padding-top: 6px;
	padding-bottom: 6px;
	margin-top: 0;
}
#dlgCarForm .modal-body {
	padding: 2px 20px;
}
#dlgCarForm .modal-header {
	padding: 8px 15px;
}
#dlgCarForm .widget {
	margin-bottom: 5px;
}
#dlgCarForm .widget .widget-header{
	margin-bottom: 8px;
}
#dlgCarForm h5 {
	font-size:13px;
	font-weight:bold;
	margin-top:5px;
	margin-bottom:5px;
}
#red {
color:red;
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
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/car.plugins.form-components.js"></script>
<script>
var deleteSimCardId;
var packageIdSel;
var packageNameSel;
var selOrAdd;
var addOrUpdate;
$(document).ready(function(){	
	$("#packageNameMain").focus(chooseSimPackage);
	$("#addOrUpdatePackageName").focus(addOrUpdateChooseSimPackage);
	
	$("#addOrUpdateTerminalName").click(addOrUpdateChooseTerminal);
	
	$("#btnSearchSimCard").click(function(){
	    reloadSimCard();
	});
	$("#btnResetSimCard").click(function(){
		$("#hiddenPackageId").val("");
		$("#packageNameMain").val("");
		$("#formSearch")[0].reset();
		reloadSimCard(0);
	});
	
	$("#btnAddSimCard").click(function(){
		addOrUpdate="add";
		$("#addOrUpdateCardId").val("");
		$("#addOrUpdateHiddenPackageId").val("");
		$("#addOrUpdatePackageName").val("");
		//终端号
		//$("#addOrUpdateHiddenTerminalId").val("");
		$("#addOrUpdateTerminalName").val("");
//		$("#balance").val("");
		$('#addOrUpdateSimCardForm').modal('show');
	});
	$("#addOrUpdateConfirmBtn").click(function(){
		addOrUpdateSimCard();
	});
/* 	$("#RechargeConfirmBtn").click(function(){
		recharge();
	}); */
		
	$("#btnSearchSimPackage").click(function(){
	    reloadSimPackage();
	});
	$("#btnSearchTerminal").click(function(){
	    reloadTerminal();
	});
	
	$("#btnResetSimPackage").click(function(){
		$("#selectOperatorsType").select2("val", "");
		$("#typeForm")[0].reset();
		reloadSimPackage(0);
		
	});
	$("#btnResetTerminal").click(function(){
		$("#terminalForm")[0].reset();
		reloadTerminal(0);
	});
	$("#packageTypeConfirmBtn").click(function(){
		$('#packageTypeForm').modal('hide');
		if(selOrAdd==1){
			$("#hiddenPackageId").val(packageIdSel);
			$("#packageNameMain").val(packageNameSel);
		}
		if(selOrAdd==2){
			$("#addOrUpdateHiddenPackageId").val(packageIdSel);
			$("#addOrUpdatePackageName").val(packageNameSel);
			$('#addOrUpdateSimCardForm').modal('show');
		}
    	/* packageIdSel="";
    	packageNameSel=""; */
	});
	$("#terminalTypeConfirmBtn").click(function(){
		$('#terminalTypeForm').modal('hide');
		
			$("#addOrUpdateHiddenTerminalId").val(terminalNameSel);
			$("#addOrUpdateTerminalName").val(terminalNumSel);
			$('#addOrUpdateSimCardForm').modal('show');
	});
	
	$("#packageTypeCancenlBtn").click(function(){
		$("#selectOperatorsType").select2("val", "");
	//	$("#packageNameMain").val("");
		$("#typeForm")[0].reset();
		if(selOrAdd==2){
			$('#addOrUpdateSimCardForm').modal('show');
		}
	});
	
	$("#terminalTypeCancenlBtn").click(function(){
		$("#selectOperatorsType").select2("val", "");
	//	$("#packageNameMain").val("");
		$("#typeForm")[0].reset();
		$("#addOrUpdateSimCardForm").modal('show');
	});

	$("#btnConfirmDelete").click(function(){
		var param={id:deleteSimCardId};
		var requestData=$.param(param,true);
		//alert("即将进入post方法")
		$.post("simCard/delSimCardById",requestData,function(data){
			$("#dlgConfirmDelete").modal("hide");
				window.location.reload();
		})
	});
	
	$("#btnUsedConfirmDelete").click(function(){
		var param={id:deleteSimCardId};
		var requestData=$.param(param,true);
		$.post("simCard/delSimCardById",requestData,function(data){
			$("#dlgUsedConfirmDelete").modal("hide");
			if (data.commonMsg.success) {
				reloadSimCard();
			}else{
				showNoty(data.commonMsg.errorMessage,"error",false,"top");
			}
		})
	});
	
	$("#simCardList").data("datatable",{
		language: dt_lang,	//加载国际化语言
		processing: true,
		serverSide: false,
		ordering: false,
		paging: false,
		info: false,
		searching: false,
		autoWidth: false,
		"columnDefs":[
		{
			"targets":0,
			"className": "align-center",
			"data":"simCardId"
		},{
			"targets":1,
			"className": "align-center",
			"data":"packageName"
		},{
			"targets":2,
			"className": "align-center",
			"data":"terminalNum"
			/* "render": function ( data, type, full, meta ) {
				if(data.arrearsState==0){
					return '<span class="label label-success">'+getArrearsStateName(data.arrearsState)+'</span>';
				}
				if(data.arrearsState==1){
					return '<span class="label label-danger">'+getArrearsStateName(data.arrearsState)+'</span>';
				}
				if(data.arrearsState==2){
					return '<span class="label label-warning">'+getArrearsStateName(data.arrearsState)+'</span>';
				}
			},
			"createdCell": function (td, cellData, rowData, row, col) {
				$(td).addClass('align-center');
			} */
		},{
			"targets":3,
			"className": "align-center",
			"data":null,
				"render": function (data, type, full, meta) {
					var day = moment(data.createDateTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
		},{
			"targets":4,
			"className": "align-center",
			"data":null,
				"render": function (data, type, full, meta) {
					var day = moment(data.modifyDateTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
		},{
			"targets":5,
			"data":null,
			"render": function ( data, type, full, meta ) {
					var html = '<a href="javascript:toUpdate(' + data.simCardId + ');" class="btn btn-xs" title="修改"><i class="icon-pencil"></i></a> <a href="javascript:remove(' + data.simCardId+','+data.usedStatus + ');" class="btn btn-xs" title="删除"><i class="icon-trash"></i></a> ';
				    return html;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
		}]
	});
	
	$("#simPackageList").data("datatable",{
		language: dt_lang,	//加载国际化语言
		processing: true,
		serverSide: false,
		ordering: false,
		paging: false,
		info: false,
		searching: false,
		autoWidth: false,
		"columnDefs":[{
			"targets":0,
			"className": "align-center",
			"data":"packageName"
		},{
			"targets":1,
			"className": "align-center",
			"data":"operatorName"
		},{
			"targets":2,
			"className": "align-center",
			"data":"description"
				
		},{
			"targets":3,
			"className": "align-center",
			"data":"price",
		},{
			"targets":4,
			"className": "align-center",
			"data":"flow"
		}]
	});
	//加载终端号列表
	$("#terminalList").data("datatable",{
		language: dt_lang,	//加载国际化语言
		processing: true,
		serverSide: false,
		ordering: false,
		paging: false,
		info: false,
		searching: false,
		autoWidth: false,
		"columnDefs":[{
			"targets":0,
			"className": "align-center",
			"data":"terminalNum"
		},{
			"targets":1,
			"className": "align-center",
			"data":"terminalName"
		},{
			"targets":2,
			"className": "align-center",
			"data":"terminalModelId"
				
		},{
			"targets":3,
			"className": "align-center",
			"data":"firewareVersion",
		}]
	});
	
	App.init();Plugins.init();CarFormComponents.init();
	reloadSimCard();
	//getSimRechargeWayList();
});

function remove(cardId,usedStatus){
	deleteSimCardId=cardId;
	//alert(deleteSimCardId+"===deleteSimCardId");
	 if(usedStatus){
		initDeleteDialogRelativeInfo(cardId);
		$('#dlgUsedConfirmDelete').modal('show');
	}else{
	$('#dlgConfirmDelete').modal('show');
	}
}

function initDeleteDialogRelativeInfo(cardId){
	var param={id:cardId};
	var requestData=$.param(param,true);
	$.post("simCard/getRelativeCarNameByCarId",requestData,function(data){
		$("#carlisence").html(data);
	});
}

function toUpdate(cardId){
	addOrUpdate="update";
	initSimCardUpdateForm(cardId);
	$('#addOrUpdateSimCardForm').modal('show');
}



function initSimCardUpdateForm(cardId){
	var param={id:cardId};
	var requestData=$.param(param,true);
	$.post("simCard/getSimCardById",requestData,function(data){
		$("#addOrUpdateCardId").val(data.simCardId);
		$("#oldCardId").val(data.cardId);
		$("#addOrUpdateTerminalName").val(data.terminalNum);
		$("#addOrUpdatePackageName").val(data.packageName);
		$("#addOrUpdateHiddenPackageId").val(data.simPackageId);
//		$("#balance").val(data.balance);
	});
}
function simCardNumberRight(cardId){
	var regx=new RegExp("1[0-9]{10}$");
	var rs=regx.exec(cardId);
	return rs;
}
function addOrUpdateSimCard(){
	var cardId=$("#addOrUpdateCardId").val();
	var oldCardId=$("#oldCardId").val();
	var terminalNum=$("#addOrUpdateTerminalName").val();
	var balance=$("#balance").val();
	var packageType=$("#addOrUpdateHiddenPackageId").val();
	//alert("cardId=="+cardId);
	//alert("terminalNum=="+terminalNum);
	//alert("balance=="+balance);
	//alert("packageType=="+packageType);
	var valid = $("#addOrUpadteSimCardForm").validate().form();
	if(cardId!=""){
		if(!simCardNumberRight(cardId)){
			$("#lableParentCardId").addClass("has-error");
			$("#parentCardIdErrorMSG").addClass("has-error help-block");
			valid=false;
		}else{
			$("#lableParentCardId").removeClass("has-error").addClass("has-success");
			$("#parentCardIdErrorMSG").removeClass("has-error help-block");
		}	
	}
	if (!valid) return;

	
	var param={
			cardId:cardId,
			oldCardId:oldCardId,
			terminalNum:terminalNum,
			packageType:packageType,
			balance:balance
	};
	var requestData=$.param(param,true);
	var url="";
	if(addOrUpdate=="add"){
		url="simCard/insertSimCard";
	}
	if(addOrUpdate=="update"){
		url="simCard/updateSimCard";
	}
	
	$.post(url,requestData,function(data){
		$('#addOrUpdateSimCardForm').modal('hide');
		if (data.commonMsg.success) {
			reloadSimCard();
		}else{
			showNoty(data.commonMsg.errorMessage,"error",false,"top");
		}
	});
	
}

function chooseSimPackage() {
	selOrAdd=1;
	$('#packageTypeForm').modal('show');
	reloadSimPackage();
	getSimCardOperatorList();
}

function addOrUpdateChooseSimPackage(){
	selOrAdd=2;
	$('#addOrUpdateSimCardForm').modal('hide');
	$('#packageTypeForm').modal('show');
	//alert("加载sim包相关信息");
	reloadSimPackage();
	getSimCardOperatorList();
}
function addOrUpdateChooseTerminal(){
	selOrAdd=2;
	$('#addOrUpdateSimCardForm').modal('hide');
	$('#terminalTypeForm').modal('show');
	//alert("加载terminal相关信息");
	reloadTerminal();
}

function getArrearsStateName(state){
	if(state==0)
		return "未欠费";
	if(state==1)
		return "欠费";
	if(state==2)
		return "余额不足";
}

function getUsedStateName(state){
	if(state==0)
		return "未关联";
	if(state==1)
		return "已关联";
}
//simCardQuery
function reloadSimCard(){
	var packageType=$("#hiddenPackageId").val();
	var arrearsState=$("#selectArrearsStatus").val();
	var usedStatus=$("#selectUsedStatus").val();
	var cardId=$("#cardId").val();
	var countPerPage = 10;
	var start = 0;
	var param={
			simCardId:cardId,
			packageType:packageType,
			arrearsState:arrearsState,
			start: start,
			usedStatus:usedStatus,
			countPerPage: countPerPage
	};
	var requestData=$.param(param,true);
	//alert("加载sim卡列表");
	loadSimCardList(requestData);
}

function loadSimCardList(requestData){
	$("#simCardList").DataTable().clear().draw();
	var emptyPageInfo = '<div style="float:left;margin-top:20px;">' + 
	'显示第 0 至 0  项结果，共 0  项' + 
	'</div>';
	$("#divPageInfo").empty().append(emptyPageInfo);
	
	var emptyPager = '<ul class="pagination">' + 
				'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
				'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
			'</ul>';
	$("#divPager").empty().append(emptyPager);
	
	$.post("simCard/getSimCardPage", requestData, function(data) {
		//alert("查询sim分页");
		var simCards = data.simCards;
		var dtPage = data.page;
		$("#simCardList").DataTable().rows.add( simCards ).draw();
		
		//
		var rowStart = dtPage.start + 1;
		var rowEnd = rowStart + dtPage.limit - 1;
		var count = dtPage.count;
		rowStart = Math.min(rowStart, count);
		rowEnd = Math.min(rowEnd, count);
		var pageInfo = '<div style="float:left;margin-top:20px;">' + 
				'显示第 ' + rowStart + ' 至 ' + rowEnd + '  项结果，共 ' + count + '  项'  + 
			'</div>';
		$("#divPageInfo").empty().append(pageInfo);
		var pager = getPagerHtml(dtPage.currentPage, dtPage.totalPage, "toSimCardPage");
		$("#divPager").empty().append(pager);
		
	});
}

function toSimCardPage(pageIndex){
	var packageType=$("#hiddenPackageId").val();
	var arrearsState=$("#selectArrearsStatus").val();
	var usedStatus=$("#selectUsedStatus").val();
	var cardId=$("#cardId").val();
	var countPerPage = 10;
	var start = pageIndex * countPerPage;
	
	var param={
			cardId:cardId,
			packageType:packageType,
			arrearsState:arrearsState,
			usedStatus:usedStatus,
			start: start,
			countPerPage: countPerPage
	};
	var requestData=$.param(param,true);
	loadSimCardList(requestData);
}

//simPackageQuery
function reloadSimPackage(){
	var packageName=$("#packageName").val();
	var operatorsType=$("#selectOperatorsType").val();
	var packageGroupType=$("#SelectPackageGroupType").val();
	var countPerPage = 10;
	var start = 0;
	
	var param={
			packageName:packageName,
			operatorsType:operatorsType,
			packageGroupType:packageGroupType,
			start: start,
			countPerPage: countPerPage
	};
	var requestData=$.param(param,true);
	loadSimPackageList(requestData);
}
//终端分页查询列表
function reloadTerminal(){
	var terminalNum=$("#terminalNum").val();
	var terminalModelId=$("#terminalModelId").val();
	var countPerPage = 10;
	var start = 0;
	
	var param={
			terminalNum:terminalNum,
			terminalModelId:terminalModelId,
			start: start,
			countPerPage: countPerPage
	};
	var requestData=$.param(param,true);
	loadTerminalList(requestData);
}
//加载套餐类型方法
function loadSimPackageList(requestData){
	$("#simPackageList").DataTable().clear().draw();
	var emptyPageInfo = '<div style="float:left;margin-top:20px;">' + 
	'显示第 0 至 0  项结果，共 0  项' + 
	'</div>';
	$("#simPackageDivPageInfo").empty().append(emptyPageInfo);
	
	var emptyPager = '<ul class="pagination">' + 
				'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
				'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
			'</ul>';
	$("#simPackageDivPager").empty().append(emptyPager);
	
	$.post("simPackage/getSimPackagePage", requestData, function(data) {
		
		var simPackages = data.simPackages;
		var dtPage = data.dtPage;
		
		$("#simPackageList").DataTable().rows.add( simPackages ).draw();
		
		//
		var start = dtPage.start + 1;
		var end = start + dtPage.length - 1;
		var recordsFiltered = dtPage.recordsFiltered;
		start = Math.min(start, recordsFiltered);
		end = Math.min(end, recordsFiltered);
		var recordsTotal = dtPage.recordsTotal;
		var pageInfo = '<div style="float:left;margin-top:20px;">' + 
				'显示第 ' + start + ' 至 ' + end + '  项结果，共 ' + recordsFiltered + '  项' + 
			'</div>';
		$("#simPackageDivPageInfo").empty().append(pageInfo);
		var pager = getPagerHtml(dtPage.currentPage, dtPage.totalPage, "toSimPackagePage");
		$("#simPackageDivPager").empty().append(pager);
	    $('#simPackageList tbody').on( 'click', 'tr', function () {
	    	var simData = $('#simPackageList').DataTable().row(this).data();
			if (simData != null) {
		    	packageIdSel=simData.simPackageId;
		    	//alert("packageIdSel===="+packageIdSel)
		    	packageNameSel=simData.packageName;
			}
			$("tr.r2").removeClass('r2');
			$(this).addClass('r2');
	    } );
	});
}
//加载终端号方法
function loadTerminalList(requestData){
	$("#terminalList").DataTable().clear().draw();
	var emptyPageInfo = '<div style="float:left;margin-top:20px;">' + 
	'显示第 0 至 0  项结果，共 0  项' + 
	'</div>';
	$("#terminalDivPageInfo").empty().append(emptyPageInfo);
	
	var emptyPager = '<ul class="pagination">' + 
				'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
				'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
			'</ul>';
	$("#terminalDivPager").empty().append(emptyPager);
	$.post("terminal/getTerminalPage", requestData, function(data) {
		
		var simPackages = data.terminal;
		
		var dtPage = data.page;
		$("#terminalList").DataTable().rows.add( simPackages ).draw();
		
		//
		var rowStart = dtPage.start + 1;
		var rowEnd = rowStart + dtPage.limit - 1;
		var count = dtPage.count;
		rowStart = Math.min(rowStart, count);
		rowEnd = Math.min(rowEnd, count);
		
		var pageInfo = '<div style="float:left;margin-top:20px;">' + 
				'显示第 ' + rowStart + ' 至 ' + rowEnd + '  项结果，共 ' + count + '  项 ' + 
			'</div>';
		$("#terminalDivPageInfo").empty().append(pageInfo);
		var pager = getPagerHtml(dtPage.currentPage, dtPage.totalPage, "toTerminalPage");
		$("#terminalDivPager").empty().append(pager);
	    $('#terminalList tbody').on( 'click', 'tr', function () {
	    	var terData = $('#terminalList').DataTable().row(this).data();
			if (terData != null) {
		    	terminalNumSel=terData.terminalNum;
		    	//alert("terminalNum===="+terminalNum)
		    	terminalNameSel=terData.terminalName;
			}
			$("tr.r2").removeClass('r2');
			$(this).addClass('r2');
	    } );
	});
}

function toSimPackagePage(pageIndex){
	var packageName=$("#packageName").val();
	var operatorsType=$("#selectOperatorsType").val();
	var packageGroupType=$("#SelectPackageGroupType").val();
	var countPerPage = 10;
	var start = pageIndex * countPerPage;
	
	var param={
			packageName:packageName,
			operatorsType:operatorsType,
			packageGroupType:packageGroupType,
			start: start,
			countPerPage: countPerPage
	};
	var requestData=$.param(param,true);
	loadSimPackageList(requestData);
}

function toTerminalPage(pageIndex){
	var terminalNum=$("#terminalNum").val();
	var termianModelId=$("#termianModelId").val();
	var countPerPage = 10;
	var start = pageIndex * countPerPage;
	
	var param={
			terminalNum:terminalNum,
			termianModelId:termianModelId,
			start: start,
			countPerPage: countPerPage
	};
	var requestData=$.param(param,true);
	loadTerminalList(requestData);
}

//运营商查询
//获取pointType列表	
function getSimCardOperatorList(){
		$.ajax({
		type:'post',
		url:'simCardOperator/getsimCardOperatorList',
		data:'',
		dataType:'json',
		success:function(data){
			$("#selectOperatorsType").html("");
			var simCardOperators  = data.simCardOperators;
			$("#selectOperatorsType").append('<option value="">全部</option>');
				for(var i = 0 ;i< simCardOperators.length ; i++)
				{
					$("#selectOperatorsType").append("<option value='" + simCardOperators[i].simCardOperatorId + "'>" + simCardOperators[i].operatorName + "</option>");
				}
				$("#selectOperatorsType").select2();
				$("#selectOperatorsType").select2("val", "");
			},
		error:function(){     
		}
	});
}	
//运营商查询
//获取pointType列表	
function getSimRechargeWayList(){
		$.ajax({
		type:'post',
		url:'simCardReChargeWay/getsimCardReChargeWayList',
		data:'',
		dataType:'json',
		success:function(data){
			$("#selectReChargeWay").html("");
			var simCardReChargeWays  = data.simCardReChargeWays;
				for(var i = 0 ;i< simCardReChargeWays.length ; i++)
				{
					$("#selectReChargeWay").append("<option value='" + simCardReChargeWays[i].id + "'>" + simCardReChargeWays[i].rechargeName + "</option>");
				}
				$("#selectReChargeWay").select2();
				$("#selectReChargeWay").select2("val", "");
			},
		error:function(){     
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
			timeout: 500
		});
}
////////
</script>
</head>
<body>
	<div id="container" style="width:100%;">
		<div id="content">
			<div class="container">
				<div style="padding-top: 5px;"></div>
				<div class="row">
					<form id="formSearch" class="form-inline" role="form">
					<button id="btnAddSimCard" class="btn btn-success" type="button"> 新增 </button>
					<div class="form-group" style="margin-left:10px;float: right;">
						<input id="cardId" name="cardId" type="text" placeholder="输入SIM卡号进行过滤" class="form-control" style="width:250px;color:#555;background-color:#fff;">
						<button id="btnSearchSimCard" class="btn btn-primary" type="button">搜索 </button>
						<button id="btnResetSimCard" class="btn btn-default" type="button" style="background-color: #3968c6;color:white;"> 重置 </button>
					</div>
					<!-- <div class="form-group">
						<label class="control-label" for="input18">套餐类型:</label>
						<input type="hidden" id="hiddenPackageId" name="hiddenPackageId" value="" />
						<input id="packageNameMain" name="packageNameMain" type="text" class="form-control" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
					</div> 
					<div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="selectArrearsStatus">欠费状态:</label>
						<select id="selectArrearsStatus" name="selectArrearsStatus" class="form-control" style="color:black;width:100px;">
							<option value="" selected>全部</option>
							<option value=0>未欠费</option>
							<option value=1>欠费</option>
							<option value=2>余额不足</option>
						</select>
					</div>
					<div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="selectUsedStatus">关联状态:</label>
						<select id="selectUsedStatus" name="selectUsedStatus" style="color:black;width:80px;height:30px" >
							<option value="" selected>全部</option>
							<option value=0>未关联</option>
							<option value=1>已关联</option>
						</select>
					</div>-->
					
					
					</form>
				</div>
				

				<div class="row">
					<div class="col-md-12">
						<!--table id="driverList" class="table table-striped table-bordered table-checkable table-highlight-head table-no-inner-border table-hover datatable"-->
						<table id="simCardList"
							class="table table-condensed table-bordered table-checkable datatable"
							data-scroll-y="true">
							<thead style="background-color: #f5f5f5;">
								<tr>
									<th class="align-center">sim卡号</th>
									<th class="align-center">套餐名称</th>
									<th class="align-center">所属终端</th>
									<th class="align-center">添加时间</th>
									<th class="align-center">修改时间</th>
									<th class="align-center">操作</th>
								</tr>
							</thead>

						</table>
					</div>
				</div>
				<div class="row">
					<div id="divPageInfo" class="col-md-6">
						<div style="float: left; margin-top: 20px;">显示第 0 至 0 项结果，共 0
							项 </div>
					</div>
					<div class="col-md-6">
						<div id="divPager" style="float: right;">
							<ul class="pagination">
								<li class="disabled"><a href="javascript:void(0);">&laquo;
										上一页</a></li>
								<li class="disabled"><a href="javascript:void(0);">下一页
										&raquo;</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
		</div>

	</div>
<div id=terminalTypeForm class="modal">
  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
		  		<button id="btnClose" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		  		<h4 class="modal-title">终端类型选择</h4>
		  </div>
		  <div class="modal-body">
				<form id="terminalForm" class="form-inline" style="margin-left:0px;">
					<div class="form-group">
						<label class="control-label" for="input18">终端号:</label>
						<input id="terminalNum" name="packageName" type="text" class="form-control" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
					</div>
					<!-- <div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="selectArrearsStatus">终端型号:</label>
						<input id="terminalModelId" name="packageName" type="text" class="form-control" style="width:100px;color:#555;background-color:#fff;cursor: pointer;">
						</select>
					</div> -->
					<button id="btnSearchTerminal" class="btn btn-primary" type="button" > 搜索 </button>
					<button id="btnResetTerminal" class="btn btn-default" type="button" style="color:white;background-color:#4d77cc"> 重置 </button>						
			 	</form >
			 	<div class="row">
					<div class="col-md-12">
						<table id="terminalList"
							class="table table-condensed table-bordered table-checkable datatable"
							data-scroll-y="true">
							<thead>
								<tr>
									<th class="align-center">终端号</th>
									<th class="align-center">终端名称</th>
									<th class="align-center">终端型号</th>
									<th class="align-center">固件版本</th>
									
								</tr>
							</thead>

						</table>
					</div>
				</div>
				<div class="row">
					<div id="terminalDivPageInfo" class="col-md-6">
						<div style="float: left; margin-top: 20px;">显示第 0 至 0 项结果，共 0
							项 </div>
					</div>
					<div class="col-md-6">
						<div id="terminalDivPager" style="float: right;">
							<ul class="pagination">
								<li class="disabled"><a href="javascript:void(0);">&laquo;
										上一页</a></li>
								<li class="disabled"><a href="javascript:void(0);">下一页
										&raquo;</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			 	<div class="modal-footer">
				 	<div class="form-group">
						  <div style="float:right">
						  <button id="terminalTypeConfirmBtn" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
						  <button id="terminalTypeCancenlBtn"  type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						  </div>
					</div>
				</div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div>	
<div id="packageTypeForm" class="modal">
  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
		  		<button id="btnClose" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		  		<h4 class="modal-title">套餐类型选择</h4>
		  </div>
		  <div class="modal-body">
				<form id="typeForm" class="form-inline" style="margin-left:0px;">
					<div class="form-group">
						<label class="control-label" for="input18">套餐名:</label>
						<input id="packageName" name="packageName" type="text" class="form-control" style="width:100px;color:#555;background-color:#fff;cursor: pointer;">
					</div>
					<div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="selectArrearsStatus">运营商:</label>
						<select id="selectOperatorsType" name="selectOperatorsType" style="color:black;width:80px;height:30px" >
						</select>
					</div>
					<button id="btnSearchSimPackage" class="btn btn-primary" type="button" > 搜索 </button>
					<button id="btnResetSimPackage" class="btn btn-default" type="button" style="color:white;background-color:#4d77cc"> 重置 </button>						
			 	</form >
			 	<div class="row">
					<div class="col-md-12">
						<!--table id="driverList" class="table table-striped table-bordered table-checkable table-highlight-head table-no-inner-border table-hover datatable"-->
						<table id="simPackageList"
							class="table table-condensed table-bordered table-checkable datatable"
							data-scroll-y="true">
							<thead>
								<tr>
									<th class="align-center">套餐名</th>
									<th class="align-center">运营商</th>
									<th class="align-center">描述</th>
									<th class="align-center">月租(元)</th>
									<th class="align-center">流量(M)</th>
								</tr>
							</thead>

						</table>
					</div>
				</div>
				<div class="row">
					<div id="simPackageDivPageInfo" class="col-md-6">
						<div style="float: left; margin-top: 20px;">显示第 0 至 0 项结果，共 0
							项 </div>
					</div>
					<div class="col-md-6">
						<div id="simPackageDivPager" style="float: right;">
							<ul class="pagination">
								<li class="disabled"><a href="javascript:void(0);">&laquo;
										上一页</a></li>
								<li class="disabled"><a href="javascript:void(0);">下一页
										&raquo;</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			 	<div class="modal-footer">
				 	<div class="form-group">
						  <div style="float:right">
						  <button id="packageTypeConfirmBtn" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
						  <button id="packageTypeCancenlBtn"  type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						  </div>
					</div>
				</div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
	
	
	<div id="dlgConfirmDelete" class="modal">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button id="btnCloseConfirmDelete" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title">删除sim卡</h4>
		  </div>
		  <div class="modal-body">
			<p>您确定要删除该sim卡吗?</p>
		  </div>
		  <div class="modal-footer">
			<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
			<button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
<!-- 	
	<div id="dlgUsedConfirmDelete" class="modal">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button id="btnCloseConfirmDelete" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title">删除sim卡</h4>
		  </div>
		  <div class="modal-body">
			<p><span id="red">该sim卡已被关联到车牌号:<h id="carlisence"></h></span></p>
			<p>您确定要删除该sim卡吗?</p>
		  </div>
		  <div class="modal-footer">
			<button id="btnUsedConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
			<button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		  </div>
		</div>/.modal-content
	  </div>/.modal-dialog
	</div>/.modal -->
	
	<div id="addOrUpdateSimCardForm" class="modal">
	  <div class="modal-dialog" style="width: 550px;">
			<div class="modal-content">
			  <div class="modal-header">
			  		<button id="btnClose" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			  		<h4 class="modal-title">sim卡信息</h4>
			  </div>
			  <!--新增sim卡号-->
			  <div class="modal-body">
					<div class="widget-content" style="padding-top:5px;">
					<form id="addOrUpadteSimCardForm" class="form-horizontal" style="margin-left:10px;">
						<!--新增sim卡号-->
						<div id="lableParentCardId" class="form-group">
							<label class="control-label col-md-4" for="input18">sim卡号<span class="required">*</span>:</label>
					 	<div class="col-md-4">
						       <input id="oldCardId" name="oldCardId" type="hidden" class="form-control digits " style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
								<input id="addOrUpdateCardId" name="CardId" type="text" class="form-control required digits " style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
							</div> 							
							<label id="parentCardIdErrorMSG" for="cardId" style="display:none">sim卡号非法</label>
						</div>
						<!--选择终端类型-->
						<div class="form-group">
							<label class="control-label  col-md-4" for="input18">选择终端<span class="required"></span>:</label>
							<input type="hidden" id="addOrUpdateHiddenTerminalId" name="addOrUpdateHiddenTerminalId" value="" />
							<div class="col-md-4">
								<input id="addOrUpdateTerminalName" name="addOrUpdateTerminalName" type="text" class="form-control required" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
							</div>
						</div>
						<!--选择卡包类型-->
						<div class="form-group">
							<label class="control-label  col-md-4" for="input18">选择套餐<span class="required"></span>:</label>
							<input type="hidden" id="addOrUpdateHiddenPackageId" name="addOrUpdateHiddenPackageId" value="" />
							<div class="col-md-4">
								<input id="addOrUpdatePackageName" name="addOrUpdatePackageName" type="text" class="form-control required" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
							</div>
						</div>
						<!-- <div id="lableParentRechargeBalance" class="form-group" style="margin-left:20px;">
							<label class="control-label col-md-3" for="input18">备注<span class="required">*</span>:</label>
							<div class="col-md-6">
								<input id="balance" name="balance" type="text" class="form-control required " style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
							</div>
							<label id="parentRechargeBalanceErrorMSG" for="balance" class="" style="display:none">必须为数字</label>
						</div> -->
						<!--卡内余额-->
						<!-- <div id="lableParentRechargeBalance" class="form-group" style="margin-left:20px;">
							<label class="control-label col-md-3" for="input18">余额<span class="required">*</span>:</label>
							<div class="col-md-6">
								<input id="balance" name="balance" type="text" class="form-control required " style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
							</div>
							<label id="parentRechargeBalanceErrorMSG" for="balance" class="" style="display:none">必须为数字</label>
						</div>	 -->
						<!--客户id--> 				
				 	</form >
				 	</div>
				</div>
				 	<div class="modal-footer">
					 	<div class="form-group">
							  <div style="float:right">
							  <button id="addOrUpdateConfirmBtn" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
							  <button id="addOrUpdateCancenlBtn"  type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							  </div>
						</div>
					</div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
<!-- /.modal -->
</body>
</html>

