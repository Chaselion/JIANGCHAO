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
<title>历史管理</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>bootstrap/css/select2.min.css" rel="stylesheet" type="text/css">
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
<link href="<%=basePath%>css/jquery-regionpick.css" rel="stylesheet" type="text/css">
<style>
/* 覆盖bootstrap中row的定义 */
.row {
	margin-left: 0;
	margin-right: 0;
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
.r2{
	background-color:#FFF38F;
}
td.success{
	background-color:#00FF00;
}

td.faile{
	background-color:#CD5C5C;
}
</style>
<script type="text/javascript" src="<%=basePath%>assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/select2.js"></script>
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
<script type="text/javascript" src="<%=basePath%>js/jquery-pagehelper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-regionpick.js"></script>
<script>
	var pageSubtenantProvider;
	
	var pageInStockCar;
	var pageSoldCar;
	var pageRentCar;
	var cardIdSel;
	var selCard;
	var isCardUsed;
	
	$(document).ready(function() {
		moment.lang('zh-cn');
		
		$("#region").regionpick({});
		
		//设置确认删除车辆按钮的点击事件
		$("#btnConfirmDelete").click(requestRmCar);
		//
		$('#btnCloseConfirmDelete').click(function () {
			resetDelDlgBtns();
		});
		$("#simCard").focus(chooseSimCard);
		
		$("#btnConfirmSelectSimCard").click(function(){
			if(isCardUsed){
				showNoty("该sim卡已被关联请重新选择","error",false,"top");
				return;
			}
			$("#simCard").val(cardIdSel);
			$("#formSearch")[0].reset();
			$('#dlgCarForm').modal('show');
			$('#dlgChooseSimCard').modal('hide');
		});
		
		$("#btnSearchSimCard").click(function(){
		    reloadSimCard();
		});
		$("#btnResetSimCard").click(function(){
			$("#hiddenPackageId").val("");
			$("#formSearch")[0].reset();
		});
		$("#btnCancelSelectSimCard").click(function(){
			$("#hiddenPackageId").val("");
			$("#formSearch")[0].reset();
			$('#dlgCarForm').modal('show');
		});
		$("#btnReset").click(resetSearchCondition);
		//是否租售车辆checkbox变化事件
		$("#isAssign").click(onIsAssignChanged);
		$("#btnConfirmexport").click(exportAlarm);
		$("#btnCancelexport").click(function(){
			resetexportDlgBtns();
		});
		//提交添加、修改车辆表单
		$("#btnConfirmCarForm").click(addOrUpdateInStock);
// 		$("#btnConfirmCarForm1").click(addOrUpdateInStock1);
		
		
		$('#dlgCarForm').on('hidden.bs.modal', function (e) {
			if(selCard){
				selCard=false;
				return;
			}
			//清空表单输入
			$("#isAssign").prop("checked", false);
			$("#assignType").attr("disabled", true);
			$("#assignToSubtenant").attr("disabled", true);
			
			$("#carForm")[0].reset();
			$("#carForm").validate().resetForm();
			cardIdSel="";

		});
		
		$("#businessDate").daterangepicker({
			singleDatePicker: true,
			showDropdowns: true,
			startDate: new Date(),
			format: 'YYYY-MM-DD'
		});
		$("div[class='daterangepicker dropdown-menu opensright']")[0].style.zIndex = 1000000;
		
		pageSubtenantProvider = new SubtenantProvider();
		
		pageInStockCar = new InStockCar({ID:"pageInStockCar"});
		pageSoldCar = new SoldCar({ID:"pageSoldCar"});
		pageRentCar = new RentCar({ID:"pageRentCar"});
		
		pageSubtenantProvider.registListenerOnDataLoad(pageSoldCar.populateSubtenantSelect);
		pageSubtenantProvider.registListenerOnDataLoad(pageRentCar.populateSubtenantSelect);
		pageSubtenantProvider.registListenerOnDataLoad(populateCarFormSubtenantList);
		pageSubtenantProvider.getSubtenant();
		
		pageInStockCar.initInStockCarList();
		pageSoldCar.initSoldCarList();
		pageRentCar.initRentCarList();
		pageSoldCar.initSubtenantList();
		pageRentCar.initSubtenantList();
		initSimCardTable();
		
		//界面框架初始化 -- 开始
		App.init();
		Plugins.init();
		CarFormComponents.init();
		//界面框架初始化 -- 结束
		getFreeTerminal();
		getFreeDriverId();
		//各个添加按钮的点击事件
		$("#addCarBtn").click(function() {
			$("#terminalDiv").show();
			$("#id").val("-1");
			$("#carClassify").val("装");
			$("#btnConfirmCarForm").text("添加");
			$("#dlgCarForm").modal("show");
		});
		$("#addCarBtn1").click(function() {
			$("#id").val("-1");
			$("#carClassify").val("干");
			$("#btnConfirmCarForm").text("添加");
			$("#dlgCarForm").modal("show");
		});
		initDateField("#txtStartDate");
		initDateField("#txtEndDate");
		pageInStockCar.queryInStockCar();
		pageRentCar.queryRentCar();
	});
	function resetSearchCondition() {
		$("#txtSearchInStock").val("");
		pageInStockCar.queryInStockCar();
	}
	function chooseSimPackage(){
		$('#dlgChooseSimCard').modal('hide');
		$('#packageTypeForm').modal('show');
		reloadSimPackage();
		getSimCardOperatorList();
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
	//初始化sim模态框
	function initSimCardTable(){
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
				"data":"cardId"
			},{
				"targets":1,
				"className": "align-center",
				"data":"packageName"
			},{
				"targets":2,
				"className": "align-center",
				"data":null,
				"render": function ( data, type, full, meta ) {
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
				}
			},{
				"targets":3,
				"className": "align-center",
				"data":"balance"
			},{
				"targets":4,
				"className": "align-center",
				"data":null,
				"render": function ( data, type, full, meta ) {
					if(data.usedStatus==0){
						return '<span class="label label-warning">'+getUsedStateName(data.usedStatus)+'</span>';
					}
					if(data.usedStatus==1){
						return '<span class="label label-success">'+getUsedStateName(data.usedStatus)+'</span>';
					}
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
			}]
		});
	}
	//终端查询
	function getFreeTerminal(){
		$.ajax({
			type:'post',
			url:'terminal/getFree',
			data:'',
			dataType:'json',
			success:function(data){
				var terminal = data.terminal;
				$("#terminal_id").empty();
				$("#terminal_id").append("<option value='-1'  >"+ "请选择" +"</option>");
				for(var i = 0;i<terminal.length;i++){
					$("#terminal_id").append("<option value='"+ terminal[i].terminal_id +"'>"+ terminal[i].terminal_id +"</option>");
				}
				$("#terminal_id").select2({
					placeholderOption: 'first'
				});
			}
		});
	}
	function getFreeDriverId(){
		$.ajax({
			type:'post',
			url:'driver/getFreeDriver',
			data:'',
			dataType:'json',
			success:function(data){
				var driver = data.driver;
				$("#driverName").empty();
// 				$("#driverName").append("<option value='-1'  >"+ "请选择" +"</option>");
				for(var i = 0;i<driver.length;i++){
					$("#driverName").append("<option value='"+ driver[i].driverId +"'>"+ driver[i].driverId +"</option>");
				}
// 				$("#driverName").select2({
// 					placeholderOption: 'first'
// 				});
			}
		});
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
						$("#selectOperatorsType").append("<option value='" + simCardOperators[i].operatorId + "'>" + simCardOperators[i].operatorName + "</option>");
					}
					$("#selectOperatorsType").select2();
					$("#selectOperatorsType").select2("val", "");
				},
			error:function(){     
			}
		});
	}	
	
	function chooseSimCard(){
		selCard=true;
		$('#dlgCarForm').modal('hide');
		reloadSimCard();
		$('#dlgChooseSimCard').modal('show');
	}
	
	function getArrearsStateName(state){
		if(state==0)
			return "未欠费";
		if(state==1)
			return "欠费";
		if(state==2)
			return "余额不足";
	}
	function getshutDownState(state){
		if(state==0)
			return "未关机";
		if(state==1)
			return "已关机";
	}
	function getTestYOrN(state){
		if(state==0)
			return "未测试";
		if(state==1)
			return "已测试";
	}
	function getWorkingState(state){
		if(state==0)
			return "正常";
		if(state==1)
			return "异常";
	}
	function getBuzzer(state){
		if(state==0)
			return "关闭";
		if(state==1)
			return "开启";
	}
		
	//simCardQuery
	function reloadSimCard(){
		var arrearsState=$("#selectArrearsStatus").val();
		var cardId=$("#cardId").val();
		var usedStatus=$("#selectUsedStatus").val();
		var countPerPage = 10;
		var start = 0;
		
		var param={
				cardId:cardId,
				usedStatus:usedStatus,
				arrearsState:arrearsState,
				start: start,
				countPerPage: countPerPage
		};
		var requestData=$.param(param,true);
		loadSimCardList(requestData);
	}
	
	function getUsedStateName(state){
		if(state==0)
			return "未关联";
		if(state==1)
			return "已关联";
	}

//初始化sim表
	function loadSimCardList(requestData){
		$("#simCardList").DataTable().clear().draw();
		var emptyPageInfo = '<div style="float:left;margin-top:20px;">' + 
		'显示第 0 至 0  项结果，共 0  项 (由 0  项结果过滤)' + 
		'</div>';
		$("#divPageInfo").empty().append(emptyPageInfo);
		
		var emptyPager = '<ul class="pagination">' + 
					'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
					'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
				'</ul>';
		$("#divPager").empty().append(emptyPager);
		
		$.post("simCard/getSimCardPage", requestData, function(data) {
			var simCards = data.simCards;
			var dtPage = data.dtPage;
			
			$("#simCardList").DataTable().rows.add( simCards ).draw();
			
			//
			var start = dtPage.start + 1;
			var end = start + dtPage.length - 1;
			var recordsFiltered = dtPage.recordsFiltered;
			start = Math.min(start, recordsFiltered);
			end = Math.min(end, recordsFiltered);
			var recordsTotal = dtPage.recordsTotal;
			var pageInfo = '<div style="float:left;margin-top:20px;">' + 
					'显示第 ' + start + ' 至 ' + end + '  项结果，共 ' + recordsFiltered + '  项 (由 ' + recordsTotal + '  项结果过滤)' + 
				'</div>';
			$("#divPageInfo").empty().append(pageInfo);
			var pager = getPagerHtml(dtPage.currentPage, dtPage.totalPage, "toSimCardPage");
			$("#divPager").empty().append(pager);
		    $('#simCardList tbody').on( 'click', 'tr', function () {
		    	var simData = $('#simCardList').DataTable().row(this).data();
				$("tr.r2").removeClass('r2');
				$(this).addClass('r2');
		    	if(simData != null){
					if(simData.usedStatus==1){
						isCardUsed=1;
					}else{
					}
			    	cardIdSel=simData.cardId;
				}
		    	//packageNameSel=this.childNodes[1].innerHTML;
		    } );
		});
	}

	function toSimCardPage(pageIndex){
		var arrearsState=$("#selectArrearsStatus").val();
		var cardId=$("#cardId").val();
		var usedStatus=$("#selectUsedStatus").val();
		var countPerPage = 10;
		var start = pageIndex * countPerPage;
		
		var param={
				cardId:cardId,
				usedStatus:usedStatus,
				arrearsState:arrearsState,
				start: start,
				countPerPage: countPerPage
		};
		var requestData=$.param(param,true);
		loadSimCardList(requestData);
	}
	
	var emptyPager = '<ul class="pagination">' + 
					'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
					'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
				'</ul>';
				
	function populateCarFormSubtenantList(subtenants) {
		var jqSubtenantList = $("#assignToSubtenant");
		for (var i = 0; i < subtenants.length; i++) {
			var tmp = subtenants[i];
			jqSubtenantList.append('<option value="' + tmp.id + '">' + tmp.name + '</option>');
		}
	}
	
	function onIsAssignChanged() {
		var isChecked = $("#isAssign").prop("checked");
		if (isChecked) {
			$("#assignType").attr("disabled", false);
			$("#assignToSubtenant").attr("disabled", false);
		} else {
			$("#assignType").attr("disabled", true);
			$("#assignToSubtenant").attr("disabled", true);
		}
	}
		function addOrUpdateInStock() {
			var valid = $("#carForm").validate().form();
			$("#carLicense").attr("readyonly",false);
			if (!valid) return;
		
			var sysId = $("#id").val();
			var url = "";
			var regionId = "";
			if (sysId == "-1") {
				url = "lorrycar/add";
			} else {
				url = "lorrycar/update";
			}
// 			var driverId;
// 			driverName=$("#driverName").val();
// 			params={
// 					name:driverName
// 			}
// 			$.post("driver/search", params, function(data) {
// 				if(null==data.driver[0].driverId){	
// 					showNoty("无该司机姓名", "error", false, "top", 6000);
// 				}
// 				driverId=data.driver[0].driverId;
// 			});
			var param = {
				id:$("#id").val(),
			    carClassify:$("#carClassify").val(),
				carLicense : $("#carLicense").val(),
				driverId:$("#driverName").val(),
				model : $("#carModel").val(),
				color : $("#color").val(),
				businessDate : $("#businessDate").val(),
				volume : $("#volume").val(),
				accurateLoad : $("#weight").val(),
				terminal_id : $("#terminal_id").val(),
				simCard : $("#simCard").val(),
			   municipal_id : $("#region").regionpick("getRegionId"),
			
			};
			saveOrUpdate(url,param);
                 
// 				params.carClassify = $("#carClassify").val();
// 				params.carLicense = $("#carLicense").val();
// 				params.carModel = $("#carModel").val();
// 				params.shape = $("#shape").val();
// 				params.color = $("#color").val();
// 				params.businessDatetime = $("#businessDate").val();
// 				params.volume =	$("#volume").val();
// 				params.weight =	$("#weight").val();
// 				params.terminal_id = $("#terminal_id").val();
// 				params.simCard = $("#simCard").val();
// 			    params.municipal_id = $("#region").regionpick("getRegionId");
			
// 			$.ajax({
// 				url: url,
// 				type: "POST",
// 				contentType: "application/json",
// 				dataType:"json",
// 				data : JSON.stringify(params),
// 				success: function(data) {
// 					if (data.success) {
// 						showNoty("保存成功!", "success", false, "top");
						
// 						pageInStockCar.queryInStockCar(pageInStockCar.gStart);
// 						pageSoldCar.querySoldCar(pageSoldCar.gStart);
// 						pageRentCar.queryRentCar(pageRentCar.gStart);
						
// 						$("#dlgCarForm").modal("hide");
// 					} else {
// 						showNoty(data.errorMessage, "error", false, "top", 6000);
// 					}
// 				}
// 			});
	};	
		
/* 	function saveOrUpdate(url,param){

     $.post(url, param, function(data) {
			var notyParams = {
				dismissQueue: true,
				modal: false,
				layout: 'top',
				theme: 'defaultTheme'
			};
			if (data.commonMessage.success) {
				notyParams.text = "操作成功!";
				notyParams.type = "success";
				notyParams.timeout = 2000;
				//没执行
				pageInStockCar.queryInStockCar(0);
				pageSoldCar.querySoldCar(0);
				pageRentCar.queryRentCar(0);
				
			} else {
				notyParams.text = data.commonMessage.errorMessage;
				notyParams.type = "error";
				notyParams.timeout = 3000;
			}
// 			loadManufacturer();	
			noty(notyParams);
	});
	$("#dlgCarForm").modal("hide");
	$("#id").val("");

}	 */
		
		
// 	function addOrUpdateInStock1() {
// 			var valid = $("#carForm").validate().form();
// 			if (!valid) return;
		
// 			var sysId = $("#id").val();
// 			var url = "";
// 			if (sysId == "-1") {
// 				url = "trailer/add";
// 			} else {
// 				url = "trailer/update";
// 			}
			
// 			var params = {};
// 			params.trailerId = $("#trailerId").val();
// 			params.trailerLicense = $("#trailerLicense").val();
// 			params.cICCardId = $("#cICCardId").val();
			
// 			$.ajax({
// 				url: url,
// 				type: "POST",
// 				contentType: "application/json",
// 				dataType:"json",
// 				data : JSON.stringify(params),
// 				success: function(data) {
// 					if (data.success) {
// 						showNoty("保存成功!", "success", false, "top");
						
// 						pageInStockCar.queryInStockCar(pageInStockCar.gStart);
// 						pageSoldCar.querySoldCar(pageSoldCar.gStart);
// 						pageRentCar.queryRentCar(pageRentCar.gStart);
						
// 						$("#dlgCarForm").modal("hide");
// 					} else {
// 						showNoty(data.errorMessage, "error", false, "top", 6000);
// 					}
// 				}
// 			});
// 	};
	
	//次级租户查询
	var SubtenantProvider = function() {
		this.onDataLoadCallbacks = [];
	};
	SubtenantProvider.prototype.registListenerOnDataLoad = function(callback) {
		this.onDataLoadCallbacks.push(callback);
	};
	SubtenantProvider.prototype.getSubtenant = function() {
		var that = this;
		$.post("tenant/getSubtenantOfTenant", "", function(data) {
			if (data.commonMessage.success) {
				//that.populateSubtenantSelect(data.subtenants);
				
				var callbacks = that.onDataLoadCallbacks;
				var len = callbacks.length;
				for (var i = 0; i < len; i++) {
					callbacks[i](data.subtenants);
				}
			} else {
				showNoty(data.commonMessage.errorMessage, "error", false, "top");
			}
		});
	};
	
	// 在库车辆相关 start
	var InStockCar = function(options) {
		this.ID = options.ID;
	};
	
	InStockCar.prototype.initInStockCarList = function () {
		var that = this;
		$("#instockCarList").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			info: false,
			searching: false,
			scrollCollapse: false,
			"columnDefs": [{
				"targets": 0,
				"data": null,
				"render": function ( data, type, full, meta) {
				  return that.rowNum++;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
			}, {
				"className": "align-center",
				"targets": 1,
				"data": "cname"
			},{
				"className": "align-center",
				"targets": 2,
				"data": "terminal_name"
			},{
				"className": "align-center",
				"targets": 3,
				"data": "terminalId"
			},{
				"className": "align-center",
				"targets": 4,
				"data": "dumpEnergy"
			},{
				"className": "align-center",
				"targets": 5,
				"data": "innerTemperature"
			},{
				"className": "align-center",
				"targets": 6,
				"data": "inputFrequency"
			},{
				"className": "align-center",
				"targets": 7,
				"data": "inputVoltage"
			},{
				"className": "align-center",
				"targets": 8,
				"data": "outputVoltage"
			},{
				"className": "align-center",
				"targets": 9,
				"data": null,
				"render":function(data,type,full,meta){
					var workLoad = data.workLoad;
					return workLoad*100 + "%";
				}
			},/* {
				"className": "align-center",
				"targets": 10,
				"data": "upsFactoryInfo"
			}, */{
				"className": "align-center",
				"targets": 10,
				"data": null,
					"render": function (data, type, full, meta) {
						var day = moment(data.logTime);
						return day.format('YYYY-MM-DD HH:mm:ss');
					}
			}]
		});
		$('#instockCarList').on('draw.dt', function () {
			$('#instockCarList').find(".bs-tooltip").tooltip({
				container: "body"
			});
		});
		
		var that = this;
		$("#btnSearchInStock").click(function () {
			that.queryInStockCar(0);
		});
		
		$("#pagebar_InStock").pageHelper({toPage: that.toPage, toPageCtx: that});
	};
	
	InStockCar.prototype.afterAppInit = function() {
		//在tab中的datatable初始化时，标题行宽度不正确。通过事件来重绘一下
		$('#link_tab_1_instock').on('shown.bs.tab', function (e) {
			$("#carClassify").val("装");
			$("#instockCarList").DataTable().draw();
		});
	};
	//装车信息显示
	InStockCar.prototype.queryInStockCar = function(start, countPerPage) {
		start = start || 0;
		countPerPage = countPerPage || $("#pagebar_InStock").pageHelper('getLength');
		
		var carLicense = $("#txtSearchInStock").val();
		var param = {"terminalName" : carLicense};
		param["start"] = start;
		param["countPerPage"] = countPerPage;
		
		var requestData = $.param(param, true);
		
		$("#instockCarList").DataTable().clear().draw();
		$("#pagebar_InStock").pageHelper("displayEmpty");
		
		var that = this;
		$.post('historyDataLog/pageQueryHistoryDataVO', requestData, function(data) {
			var cars = data.historyDatas;
			var page = data.page;
			
			that.gStart = page.start;
			var rowStart = page.start + 1;
			var rowEnd = rowStart + page.limit - 1;
			var count = page.count;
			rowStart = Math.min(rowStart, count);
			rowEnd = Math.min(rowEnd, count);
			
			that.rowNum = rowStart;
			
			$("#pagebar_InStock").pageHelper("update", {
				start:rowStart, end:rowEnd, total:count, currentPageIndex:page.currentPage, totalPage:page.totalPage
			});
			
			$("#instockCarList").DataTable().rows.add( cars ).draw();
		});
	};
	
	InStockCar.prototype.toPage = function(pageIndex, countPerPage) {
		var countPerPage = countPerPage || 10;
		var start = pageIndex * countPerPage;
		this.queryInStockCar(start, countPerPage);
	};
	
	// 在库车辆相关 end
	
	// 已售车辆 start
	var SoldCar = function(options) {
		this.ID = options.ID;
	};
	//挂车信息
	SoldCar.prototype.initSoldCarList = function () {
		var that = this;
		$("#SoldCarList").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			info: false,
			searching: false,
			//scrollY: "400px",
			scrollCollapse: false,
			"columnDefs": [{
				"targets": 0,
				"data": null,
				"render": function ( data, type, full, meta) {
				  //return "<input value=\"" + data.id + "\" type=\"checkbox\" class=\"uniform\">";
				  return that.rowNum++;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
				/*
				,
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('checkbox-column');
				}*/
			}, {
				"targets": 1,
				"className": "align-center",
				"data": "trailerId"
			}, {
				"className": "align-center",
				"targets": 2,
				"data": "trailerLicense"
			}, {
				"className": "align-center",
				"targets": 3,
				"data": "cICCardId",
			}, 
			{
				"className": "align-center",
				"targets": 4,
				"data": null,
			}, {
				"targets": 5,
				"data": null,
				"render": function ( data, type, full, meta ) {
					//return "<span class=\"btn-group\"> <a href=\"javascript:getCar(" + data.id + ");\" class=\"btn btn-xs bs-tooltip\" title=\"修改\"><i class=\"icon-pencil\"></i></a> <a href=\"javascript:rmSingleCar(" + data.id + ");\" class=\"btn btn-xs bs-tooltip\" title=\"租户分配\"><i class=\"icon-share-alt\"></i></a> </span>";
					return '<ul class="table-controls"> <li><a href="javascript:getCar(' + data.trailerId + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li> <li><a href="javascript:rmSingleCar(' + data.id + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li> </ul>';
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
			}]
		});
		$('#SoldCarList').on('draw.dt', function () {
			$('#SoldCarList').find(".bs-tooltip").tooltip({
				container: "body"
			});
		});
		
		var that = this;
		$("#btnSearchSold").click(function () {
			that.querySoldCar(0);
		});
		
		$("#pagebar_Sold").pageHelper({toPage: that.toPage, toPageCtx: that});
	};
	
	SoldCar.prototype.afterAppInit = function() {
		//在tab中的datatable初始化时，标题行宽度不正确。通过事件来重绘一下
		$('#link_tab_2_sold').on('shown.bs.tab', function (e) {
			$("#SoldCarList").DataTable().draw();
		});
	};
	
	SoldCar.prototype.initSubtenantList = function() {
		var that = this;
		$("#subtenantId").select2();
		$("#subtenantId").change(function () {
			that.querySoldCar(0);
		});
	};
	
	SoldCar.prototype.populateSubtenantSelect = function(subtenants) {
		var jqSubtenantList = $("#subtenantId");
		for (var i = 0; i < subtenants.length; i++) {
			var subtenant= subtenants[i];
			jqSubtenantList.append('<option value="' + subtenant.id + '">' + subtenant.name + '</option>');
		}
		
		$("#subtenantId").select2();
		$("#subtenantId").select2("val", "");
	};
	SoldCar.prototype.querySoldCar = function(start, countPerPage) {
		start = start || 0;
		countPerPage = countPerPage || $("#pagebar_Sold").pageHelper('getLength');
		
		var carLicense = $("#txtSearchSold").val();
		var param = {"carLicense" : carLicense};
		
		var subtenantId = $("#subtenantId").val();
		if (subtenantId != "") {
			param["subtenantId"] = subtenantId;
		}
		
		param["start"] = start;
		param["countPerPage"] = countPerPage;
		
		var requestData = $.param(param, true);
		
		$("#SoldCarList").DataTable().clear().draw();
		$("#pagebar_Sold").pageHelper("displayEmpty");
		
		var that = this;
		$.post('lorrycar/querysoldCar', requestData, function(data) {
			var cars = data.cars;
			var page = data.page;
			
			that.gStart = page.start;
			var rowStart = page.start + 1;
			var rowEnd = rowStart + page.limit - 1;
			var count = page.count;
			rowStart = Math.min(rowStart, count);
			rowEnd = Math.min(rowEnd, count);
			that.rowNum = rowStart;
			
			$("#pagebar_Sold").pageHelper("update", {
				start:rowStart, end:rowEnd, total:count, currentPageIndex:page.currentPage, totalPage:page.totalPage
			});
			
			$("#SoldCarList").DataTable().rows.add( cars ).draw();
		});
	};
	
	SoldCar.prototype.toPage = function(pageIndex, countPerPage) {
		var countPerPage = countPerPage || 10;
		var start = pageIndex * countPerPage;
		this.querySoldCar(start, countPerPage);
	};
	
	// 已售车辆 end
	
	// 已租车辆 start
	var RentCar = function(options) {
		this.ID = options.ID;
	};
	
	RentCar.prototype.initRentCarList = function () {
		var that = this;
		$("#RentCarList").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			info: false,
			searching: false,
			//scrollY: "400px",
			scrollCollapse: false,
			"columnDefs": [{
				"targets": 0,
				"data": null,
				"render": function ( data, type, full, meta) {
				  //return "<input value=\"" + data.id + "\" type=\"checkbox\" class=\"uniform\">";
				  return that.rowNum++;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
				/*
				,
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('checkbox-column');
				}*/
			}, {
				"targets": 1,
				"className": "align-center",
				"data": "carLicense"
			}, {
				"className": "align-center",
				"targets": 2,
				"data": "terminal_id"
			}, {
				"className": "align-center",
				"targets": 3,
				"data": null,
				"render": function(data, type, full, meta) {
					var simCard = data.card_id;
					if (simCard == null || simCard == '') {
						return '<span class="label label-default">未关联</span>';
					} else {
						return simCard;
					}
				}
			}, {
				"className": "align-center",
				"targets": 4,
				"data": "businessDatetime"
			}, {
				"className": "align-center",
				"targets": 5,
				"data": "location"
			},  {
				"className": "align-center",
				"targets": 6,
				"data": "driverId",
// 				render: function(data, type, full, meta) {
// 					var status = data.status;
// 					var labelClass = 'label-warning';
// 					var statusStr = '禁用';
// 					if (status == '启') {
// 						labelClass = 'label-info';
// 						statusStr = '启用';
// 					}
// 					return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
// 				}
			}, {
				"targets": 7,
				"data": null,
				"render": function ( data, type, full, meta ) {
					//return "<span class=\"btn-group\"> <a href=\"javascript:getCar(" + data.id + ");\" class=\"btn btn-xs bs-tooltip\" title=\"修改\"><i class=\"icon-pencil\"></i></a> <a href=\"javascript:rmSingleCar(" + data.id + ");\" class=\"btn btn-xs bs-tooltip\" title=\"租户分配\"><i class=\"icon-share-alt\"></i></a> </span>";
					return '<ul class="table-controls"> <li><a href="javascript:getCar(' + data.id + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li> <li><a href="javascript:rmSingleCar(' + data.id + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li> </ul>';
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
			}]
		});
		$('#RentCarList').on('draw.dt', function () {
			$('#RentCarList').find(".bs-tooltip").tooltip({
				container: "body"
			});
		});
		
		var that = this;
		$("#btnSearchRent").click(function () {
			that.queryRentCar(0);
		});
		
		$("#pagebar_Rent").pageHelper({toPage: that.toPage, toPageCtx: that});
	};
	
	RentCar.prototype.afterAppInit = function() {
		//在tab中的datatable初始化时，标题行宽度不正确。通过事件来重绘一下
		$('#link_tab_3_rent').on('shown.bs.tab', function (e) {
			$("#carClassify").val("干");
			$("#RentCarList").DataTable().draw();
		});
	};
	
	RentCar.prototype.initSubtenantList = function() {
		var that = this;
		$("#rent_subtenantId").select2();
		$("#rent_subtenantId").change(function () {
			that.queryRentCar(0);
		});
	};
	
	RentCar.prototype.populateSubtenantSelect = function(subtenants) {
		var jqSubtenantList = $("#rent_subtenantId");
		for (var i = 0; i < subtenants.length; i++) {
			var subtenant= subtenants[i];
			jqSubtenantList.append('<option value="' + subtenant.id + '">' + subtenant.name + '</option>');
		}
		
		$("#rent_subtenantId").select2();
		$("#rent_subtenantId").select2("val", "");
	};
	//显示牵引车
	RentCar.prototype.queryRentCar = function(start,countPerPage) {
		start = start || 0;
		countPerPage = countPerPage || $("#pagebar_Rent").pageHelper('getLength');
		
		var carLicense = $("#txtSearchRent").val();
		var param = {"carLicense" : carLicense};
		
		var subtenantId = $("#rent_subtenantId").val();
		if (subtenantId != "") {
			param["subtenantId"] = subtenantId;
		}
		
		param["start"] = start;
		param["countPerPage"] = countPerPage;
		
		var requestData = $.param(param, true);
		
		$("#RentCarList").DataTable().clear().draw();
		$("#pagebar_Rent").pageHelper("displayEmpty");
		
		var that = this;
		$.post('lorrycar/queryQCar', requestData, function(data) {
			var cars = data.lorrycar;
			var page = data.page;
			
			that.gStart = page.start;
			var rowStart = page.start + 1;
			var rowEnd = rowStart + page.limit - 1;
			var count = page.count;
			rowStart = Math.min(rowStart, count);
			rowEnd = Math.min(rowEnd, count);
			that.rowNum = rowStart;
			
			$("#pagebar_Rent").pageHelper("update", {
				start:rowStart, end:rowEnd, total:count, currentPageIndex:page.currentPage, totalPage:page.totalPage
			});
			
			$("#RentCarList").DataTable().rows.add( cars ).draw();
		});
	};
	
	RentCar.prototype.toPage = function(pageIndex, countPerPage) {
		var countPerPage = countPerPage || 10;
		var start = pageIndex * countPerPage;
		this.queryRentCar(start, countPerPage);
	};
	// 已租车辆 end
	
	
	//删除选中的多个车辆
	/*
	function rmSelectedCars(sysCarIDs) {
		$('#dlgConfirmDelete').data('sysCarIDs', sysCarIDs);
		$('#dlgConfirmDelete').modal('show');
	}
	*/
	//删除单个车辆
	function rmSingleCar(carId) {
		$('#dlgConfirmDelete').data('carId', carId);
		$("#id").val(carId);
		$('#dlgConfirmDelete').modal('show');
	}
	//发送删除请求
	function requestRmCar() {
		var carId = $('#dlgConfirmDelete').data('carId');
			
		if (carId != undefined) {
			$("#btnCancelDelete").attr("disabled", "disabled");
			
			var requestData = $.param({"id":carId}, true);
			$.ajax({
				type: "POST",
				url: "lorrycar/delete",
				data: requestData,
				dataType: "json",
				success: function(data) {
					if (data.success == true) {
						showNoty("删除成功!", "success", false, "top");
						
						pageInStockCar.queryInStockCar(pageInStockCar.gStart);
						pageRentCar.queryRentCar(pageRentCar.gStart);
						
					} else {
						showNoty(data.errorMessage, "error", false, "top", 6000);
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
		
		$('#dlgConfirmDelete').removeData('sysCarIDs');
		
		$("#btnConfirmDelete").button("reset");
		$("#btnCancelDelete").removeAttr("disabled", "disabled");
		$("#id").val("");
	}
	
	//获取车辆信息，并弹出修改对话框
	function getCar(carId) {
		var requestData = "id=" + carId;
				getFreeDriverId();
		$.post("lorrycar/get", requestData, function(data) {
			if (data.commonMessage.success) {
				var car = data.lorrycar;
				var tenantCar = data.tenantCar;
 				$("#id").val(car.id);
				$("#region").val(car.location);
				$("#region").regionpick("setRegionId", car.municipal_id);
				$("#carLicense").val(car.carLicense);
				$("#carModel").val(car.model);
				$("#color").val(car.color);
				$("#driverName").append("<option value='"+ car.driverId +"' selected='selected' >"+ car.driverId +"</option>");
			
				
				var bDate= dateFormate(car.businessDate);
				$("#businessDate").val(bDate);
				$("#volume").val(car.volume);
				$("#weight").val(car.accurateLoad);
				$("#terminal_id").append("<option value='"+ car.terminal_id +"' selected='selected' >"+ car.terminal_id +"</option>");
				$("#simCard").val(car.card_id);
				
				if (tenantCar) {
					//$("#isAssign").attr("disabled", true);
					$("#isAssign").prop("checked", true);
										
					$("#assignType").prop("disabled", false).val(car.status);
					$("#assignToSubtenant").prop("disabled", false).val(tenantCar.subtenantId);
				}
				
				//弹出对话框
				$("#btnConfirmCarForm").text("修改");
				$("#dlgCarForm").modal("show");
				$("#terminalDiv").hide();
				$("#carLicense").attr("readyonly","readonly");
			} else {
				noty({
					text: data.commonMessage.errorMessage,
					type: "error",
					dismissQueue: true,
					modal: true,
					layout: 'center',
					theme: 'defaultTheme',
					buttons: [{
						addClass: 'btn btn-danger btn-sm', 
						text: '确定', 
						onClick: function($noty) {
							$noty.close();
							$("#instockCarList").DataTable().ajax.reload();
							//noty({dismissQueue: true, force: true, layout: layout, theme: 'defaultTheme', text: 'You clicked "Ok" button', type: 'success'});
						}
					}]
					//timeout: 3000
				});
			}
		});
	}
	//错误提示方法
	function showNoty(text, type, modal, layout, timeout) {
		timeout = timeout || 3000;
		noty({
				text: text,
				type: type,
				dismissQueue: true,
				modal: modal,
				layout: layout,
				theme: 'defaultTheme',
				timeout: timeout
			});
	}
	
	//翻页方法
function getPagerHtml(pageIndex, totalPages, toPageFuncName, opt) {
	opt = opt || {
		lastPageText: "&laquo;上一页",
        nextPageText: "下一页&raquo;"
	};
	var p = [];
	/*
		<ul class="pagination pagination-sm">
		  <li><a href="#">&laquo;</a></li>
		  <li><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li><a href="#">&raquo;</a></li>
		</ul>
	*/
	p.push('<ul class="pagination pagination-sm"');
	if (opt.paginationCondense) {
		p.push('style="margin:5px 0;"');
	}
	p.push(' >');
	var startDrawIndex = 0;
	if (pageIndex > 2) {
		//增加首页
		if(opt.drawFirstPage) {
			p.push('<li><a href="javascript:' + toPageFuncName + '(0)">首页</a></li>');
		}
		startDrawIndex = pageIndex - 2;
	}
		
	//设置上一页
	var disablePre = "";
	var preHref = 'javascript:' + toPageFuncName + '(' + (pageIndex - 1) + ')';
	if (pageIndex == 0) {
		disablePre = ' class="disabled"';
		preHref = 'javascript:void(0)';
	}
	p.push('<li' + disablePre + '><a href="' + preHref + '">' + opt.lastPageText + '</a></li>');
	//单独设置每个页码
	var drawEndPageIndex = Math.min(totalPages, startDrawIndex + 5);
	for (var i = startDrawIndex; i < drawEndPageIndex; i++) {
		if (i == pageIndex) {
			p.push('<li class="active"><a href="javascript:' + toPageFuncName + '(' + i + ')">' + (i + 1) + ' <span class="sr-only">(current)</span></a></li>');
		} else {
			p.push('<li><a href="javascript:' + toPageFuncName + '(' + i + ')">'  + (i + 1) +  '</a></li>');
		}
	}
	//设置下一页
	var disableNext = "";
	var nextHref = 'javascript:' + toPageFuncName + '(' + (pageIndex + 1) + ')';
	if (pageIndex + 1 == totalPages) {
		disableNext = ' class="disabled"';
		nextHref = 'javascript:void(0)';
	}
	p.push('<li' + disableNext + '><a href="' + nextHref + '">' + opt.nextPageText + '</a></li>');
		
	p.push('</ul>');
	return p.join("");
}
	
	
function dateFormate(date){
	function p(s){
		return s<10?"0"+s:s;
	}
	var time = new Date(date);
	var year =  time.getFullYear();
	var month = time.getMonth()+1;
	var day = time.getDate();

	return year+"-"+p(month)+"-"+p(day); 
}

function  exportshow(){
	$("#dlgConfirmexport").modal({backdrop: 'static'});
	$('#dlgConfirmexport').modal('show');
}
//导出数据
function exportAlarm() {
	var startDate = $("#txtStartDate").val();
	var endDate = $("#txtEndDate").val();
	if (contrastTime("#txtStartDate") == 0 && ((startDate != "" && endDate == "") || (startDate !="" && endDate != ""))) {
		showNoty("开始时间不能超过当前日期!", "error", true, 'top');
		return false;
	}
	if (startDate != "" && endDate != "") {
		var startCreateDateObj = moment(
				startDate, 'YYYY-MM-DD');
		var endCreateDateObj = moment(endDate,
				'YYYY-MM-DD');
		if (startCreateDateObj.diff(endCreateDateObj) > 0) {
			//alert("error time! " + startCreateDateObj.diff(endCreateDateObj));
			showNoty("结束时间不应早于开始时间!", "error", false,
					'top');
			return false;
		}
	}
	var form = $("<form>");	//定义一个form表单
	form.attr("style", "display:none");
	form.attr("target", "");
	form.attr("method", "post");
	form.attr("action", <%=basePath%> + "DownloadHistoryData");//*********
	var txtTerminal = $("#txtTerminal").val();
	if (1 == 1) {
		input = $("<input>");
		input.attr("type", "hidden");
		input.attr("name", "txtTerminal");
		input.attr("value", txtTerminal);
		form.append(input);
	}
		
	if (1 == 1) {
		input = $("<input>");
		input.attr("type", "hidden");
		input.attr("name", "startDate");
		input.attr("value", startDate);
		form.append(input);
	}
		
	if (1 == 1) {
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
function contrastTime(start) {
	var evalue = $(start).val();
	var dB = new Date(evalue.replace(/-/g, "/"));//获取当前选择日期  
	var d = new Date();
	var str = d.getFullYear() + "-"
			+ (d.getMonth() + 1) + "-"
			+ (d.getDate() + 1);//获取当前实际日期  
	if (Date.parse(str) > Date.parse(dB)) {//时间戳对比  
		return 1;
	}
	return 0;
}
//重置导出确认对话框中按钮的文字和状态
function resetexportDlgBtns() {
	$("#dlgConfirmexport").modal("hide");
	$("#txtStartDate").val("");
	$("#txtEndDate").val("");
	$("#txtTerminal").val("");
	
	$("#btnConfirmexport").button("reset");
	$("#btnCancelexport").removeAttr("disabled", "disabled");
}
</script>
</head>
<body>
<div id="container" style="width:100%;">
  <div id="content">
    <div class="container">
	  <div style="padding-top:5px;">
      </div>
	
	  <div class="tabbable tabbable-custom">
		<ul class="nav nav-tabs">
			<li class="active"><a id="link_tab_1_instock"  href="#tab_1_instock" data-toggle="tab" >UPS</a></li>
<!-- 			<li><a id="link_tab_2_sold"  href="#tab_2_sold" data-toggle="tab" >挂车</a></li> 
			<li><a id="link_tab_3_rent"  href="#tab_3_rent" data-toggle="tab" >甩挂</a></li>   -->
		</ul>
					
		<div class="tab-content">
			<div class="tab-pane active" id="tab_1_instock">
				<!-- 1. 装卸车辆 start -->
						<input type="hidden" id="carClassify" name="carClassify" value="">
				<div >
					<div class="col-md-6">
						<button id="btnOutPut" class="btn btn-primary" type="button" style="background:crimson;" onclick="javascript:exportshow();">导出</button>
					</div>
					<div class="col-md-6">
						<div style="float:right;display:inline-block;">
							<div class="input-group">
								<input type="text" class="form-control" id="txtSearchInStock" style="width:200px;float:right;margin-right:6px;" placeholder="输入终端编号进行过滤" value="" />
								<span class="input-group-btn">
									<button id="btnSearchInStock" class="btn btn-primary" type="button"> 搜索 </button>
									<button id="btnReset" style="margin-left:6px;" class="btn btn-primary" type="button"> 重置 </button>
								</span> 
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
					  <table id="instockCarList" class="table table-highlight-head table-condensed table-bordered datatable dataTable no-footer" style="width:100%"  data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
							<thead>
							  <tr>
								<th class="align-center">#</th>
                   
					<th class="align-center col-md-1">所属组织</th>
					<th class="align-center col-md-1">终端名称</th>
				
					<th class="align-center col-md-2">终端编号</th>
			
					<th class="align-center col-md-1">剩余电量(%)</th>
					<th class="align-center col-md-1">机内温度(℃)</th>
					<th class="align-center col-md-1">输入频率(Hz)</th>
					
					<th class="align-center col-md-1">输入电压(V)</th>
					 <th class="align-center col-md-1">输出电压(V)</th>
                 
					<th class="align-center col-md-1">负载</th>
					<th class="align-center col-md-2">时间</th>
							  </tr>
							</thead>
					  </table>	  
					</div>
				</div>
				<div id="pagebar_InStock" class="row">
				</div>
				<!-- 1. 装卸车辆 end   -->
			</div>

			
			<div class="tab-pane" id="tab_3_rent">
				<!-- 3. 干线车车辆 start -->
				
				<div >
					<div class="col-md-6">
						<button id="addCarBtn1" class="addCarBtn btn btn-sm btn-success">导出</button>
<!-- 						<input type="hidden" id="carClassify1" name="carClassify1" value="干"> -->
					</div>
					<div class="col-md-6">
						<div style="float:right;display:inline-block;width:200px;">
							<div class="input-group">
								<input type="text" class="form-control" id="txtSearchRent" placeholder="输入车牌号进行过滤" value="" />
								<span class="input-group-btn">
									<button id="btnSearchRent" class="btn btn-primary" type="button"><i class="icon-search"></i> 过滤 </button>
								</span> 
							</div>
						</div>
						<div style="float:right;display:inline-block;">
							<form class="form-inline" role="form">
								<div class="form-group">

								</div>
							</form>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
					  <table id="RentCarList" class="table table-highlight-head table-condensed table-striped table-bordered table-hover table-checkable datatable" style="width:100%" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
							<thead>
							  <tr>
								<th class="col-md-1 align-center">#</th>
								<th class="col-md-1 align-center">车牌号</th>
								<th class="col-md-2 align-center">车载终端ID</th>
								<th class="col-md-1 align-center">SIM卡号</th>
								<th class="col-md-1 align-center">运营日期</th>
								<th class="col-md-2 align-center">所属地</th>
								<th class="col-md-1 align-center">司机编号</th>
								<th class="col-md-1 align-center">操作</th>
							  </tr>
							</thead>
					  </table>	  
					</div>
				</div>
				<div id="pagebar_Rent" class="row">
				</div>
				<!-- 3. 已租车辆 end   -->
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
        <button id="btnCloseConfirmDelete" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">删除车辆信息</h4>
      </div>
      <div class="modal-body">
        <p>您确定要删除车辆信息吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgChooseSimCard" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button id="btnCloseConfirmSelect" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">sim卡信息</h4>
      </div>
      <div class="modal-body">
			<div class="row">
				<form id="formSearch" class="form-inline" role="form">
				<div class="form-group" style="margin-left:10px;">
					<label class="control-label" for="input18">Sim卡卡号:</label>
					<input id="cardId" name="cardId" type="text" class="form-control" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
				</div><!--  
				<div class="form-group">
					<label class="control-label" for="input18">套餐类型:</label>
					<input type="hidden" id="hiddenPackageId" name="hiddenPackageId" value="" />
					<input id="packageNameMain" name="packageNameMain" type="text" class="form-control" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
				</div>-->
				<div class="form-group" style="margin-left:10px;">
					<label class="control-label" for="selectArrearsStatus">欠费状态:</label>
					<select id="selectArrearsStatus" name="selectArrearsStatus" class="form-control" style="color:black;width:80px;">
						<option value="" selected>全部</option>
						<option value=0>未欠费</option>
						<option value=1>欠费</option>
					</select>
				</div>
				<div class="form-group" style="margin-left:10px;">
					<label class="control-label" for="selectUsedStatus">关联状态:</label>
					<select id="selectUsedStatus" name="selectUsedStatus" style="color:black;width:80px;height:30px" >
						<option value="" selected>全部</option>
						<option value=0>未关联</option>
						<option value=1>已关联</option>
					</select>
				</div>
				<button id="btnSearchSimCard" class="btn btn-primary" type="button" > 搜索 </button>
				<button id="btnResetSimCard" class="btn btn-default" type="button"> 重置 </button>
				</form>
			</div>
				

			<div class="row">
				<div class="col-md-12">
					<!--table id="driverList" class="table table-striped table-bordered table-checkable table-highlight-head table-no-inner-border table-hover datatable"-->
					<table id="simCardList"
						class="table table-condensed table-bordered table-checkable datatable"
						data-scroll-y="true">
						<thead>
							<tr>
								<th class="align-center">卡号</th>
								<th class="align-center">套餐</th>
								<th class="align-center">欠费状态</th>
								<th class="align-center">余额</th>
								<th class="align-center">关联状态</th>
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
      <div class="modal-footer">
		<button id="btnConfirmSelectSimCard" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelSelectSimCard" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 新增库存车辆 start -->
<div id="dlgCarForm" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button id="btnCloseDriverForm" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 车辆信息</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
        <div class="row">
			<div class="col-md-12">
			  <form id="carForm" class="form-horizontal">
					<input type="hidden" id="id" name="id" value="-1">
					<!-- --------------------->
					
					<div class="widget">
					<div class="widget-header">
					<h5><i class="icon-angle-right"></i> 车辆信息</h5>
					</div>
					<div class="widget-content">
					
					<div class="form-group">
					  <label class="col-md-3 control-label">所属地 <span class="required">*</span> :</label>
					  <div class="col-md-6">
						<input type="text" id="region" name="region" class="form-control input-sm required" style="color:#555;background-color:#fff;cursor:pointer" readonly >
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-3 control-label">车牌号 <span class="required">*</span> :</label>
					  <div class="col-md-6">
						<input type="text" id="carLicense" name="carLicense" class="form-control input-sm required" maxlength="7">
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-3 control-label">驾驶员编号 <span class="required">*</span> :</label>
<!-- 					  <div class="col-md-6"> -->
<!-- 						<input type="text" id="driverName" name="driverName" class="form-control input-sm required" maxlength="7"> -->
<!-- 					  </div> -->
					   <div class="col-md-6" style="margin-bottom:6px">
					  <select id="driverName" name="driverName" class="form-control">
					  	
					  </select>
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-3 control-label">车型 <span class="required">*</span> :</label>
					  <div class="col-md-6">
						<input type="text" id="carModel" name="carModel" class="form-control input-sm required" maxlength="20">
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-3 control-label">车辆颜色 <span class="required">*</span> :</label>
					  <div class="col-md-6">
						<input type="text" id="color" name="color" class="form-control input-sm required" maxlength="20">
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-3 control-label">运营日期 <span class="required">*</span> :</label>
					  <div class="col-md-6">
						<input type="text" id="businessDate" name="businessDate" class="form-control input-sm required" style="color:#555;background-color:#fff;cursor:text" readonly maxlength="20">
					  </div>
					</div>
					
					<div class="form-group">
					  <label class="col-md-3 control-label">载重体积(立方米) <span class="required">*</span> :</label>
					  <div class="col-md-6">
						<input type="text" id="volume" name="volume" class="form-control input-sm required" range="0, 1000" maxlength="20">
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-3 control-label">载重量(吨) <span class="required">*</span> :</label>
					  <div class="col-md-6">
						<input type="text" id="weight" name="weight" class="form-control input-sm required" range="0, 100" maxlength="20">
					  </div>
					</div>
					
					</div>
					</div>
					
					<!-- --------------------->
					
					<div class="widget" id="terminalDiv">
					<div class="widget-header">
					<h5><i class="icon-angle-right"></i> 车载终端</h5>
					</div>
					<div class="widget-content">
					
					<div class="form-group">
					  <label class="col-md-3 control-label">车载终端ID <span class="required">*</span> :</label>
					 <!--  <div class="col-md-6">
						<input type="text" id="terminal_id" name="terminal_id" class="form-control input-sm required digits" maxlength="18">
					  </div> -->
					  <div class="col-md-6" style="margin-bottom:6px">
					  <select id="terminal_id" name="terminal_id" class="form-control select2">
					  	
					  </select>
					  </div>
					  
					</div>
					<div class="form-group">
					  <label class="col-md-3 control-label">SIM卡号 <span class="required">*</span> :</label>
					  <div class="col-md-6">
						<input type="text" id="simCard" name="simCard" class="form-control input-sm required digits" maxlength="11">
					  </div>
					</div>
					
					</div>
					</div>
		
				  </form>
			</div>
		</div>
		<!-- end -->
	  
      </div>
      <div id="carFormModalFooter" class="modal-footer">
		<button id="btnConfirmCarForm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelCarForm" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 新增库存车辆 end -->
<div id="dlgConfirmexport" class="modal">
  <div class="modal-dialog" style="width:400px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">导出历史数据</h4>
      </div>
      <div class="modal-body">
      <div class="form-group" style="margin-left:10px;">
					 <label class="control-label" for="txtPlayDate">过滤终端:</label>
						<input type="text" class="form-control" id="txtTerminal" style="width:200px;" placeholder="输入终端编号进行过滤" value="" />
						</div>
                    <div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="txtPlayDate">选择日期:</label>
						<input type="text" class="form-control" style="width:200px;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtStartDate" name="txtStartDate" placeholder="开始日期">
						-
						<input type="text" class="form-control" style="width:200px;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtEndDate" name="txtEndDate" placeholder="结束日期">
					</div>
					
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

