<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>报警条件</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" type="text/css">
<!--[if IE 7]>
<link href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css" rel="stylesheet">
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->
<link href="<%=basePath%>plugins/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
<style>
table.dataTable tbody tr.selected {
	background-color: #0081c2;
	color: white;
}

.required {
	color:red;
	margin-left:15px;
}

div.form-group {
	margin-bottom: 5px;
}
label.help-block.has-error {
	margin-top: 2px;
	margin-bottom: 0px;
}
#dlgEditForm .modal-footer {
	padding-top: 6px;
	padding-bottom: 6px;
	margin-top: 0;
}
#dlgEditForm .modal-body {
	padding: 2px 20px;
}
#dlgEditForm .modal-header {
	padding: 8px 15px;
}
#dlgEditForm .widget {
	margin-bottom: 5px;
}
#dlgEditForm .widget .widget-header{
	margin-bottom: 8px;
}
#dlgEditForm h5 {
	font-size:13px;
	font-weight:bold;
	margin-top:5px;
	margin-bottom:5px;
}

select{
	width:100%;
	border: 1px solid #ccc;
	height:32px;
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	margin-left: 15px;
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
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>
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
<script type="text/javascript" src="<%=basePath%>plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/validation/messages_zh.js"></script>
	
<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>js/car.plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/zTree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>js/noty-helper.js"></script>
<script>
	$(document).ready(function() {
		moment.lang('zh-cn');
		initInfoTable();
		App.init();
		try{
			
			Plugins.init();
			CarFormComponents.init();
		}catch(err){
			console.error(err.message);
		}
			queryRole();
	
		$("#btnSearch").click(onSearchButtonClick);
		$("#editBtn").click(update);
		$("#btnConfirmDelete").click(requestRmInfo);//设置确认删除按钮的点击事件
		$("#btnConfirm").click(requestDelete);//批量删除
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		//点击新增按钮
		$("#addBtn").click(function() {
			$("#dlgAddForm").modal({backdrop: 'static'});
			$("#dlgAddForm").modal("show");
			$("#judgeRule").change(function(){
		 		var val = $("#judgeRule option:selected").val();
		 		if(val==3 || val ==4 || val==5 || val==6){
					$("#judgeJuniorValue").val("");
					$("#judgeJuniorValue").attr("disabled","disabled");
		 		}else{
		 			$("#judgeJuniorValue").removeAttr("disabled");
		 		}
		 	})
			$("#ifAutoPromote").change(function(){
		 		var val = $("#ifAutoPromote option:selected").val();
		 		if(val==0){
					$("#promoteValue").val("");
					$("#promoteValue").attr("disabled","disabled");
		 		}else{
		 			$("#promoteValue").removeAttr("disabled");
		 		}
		 	})
		 	
		});
		
		$("#btnConfirmEditForm").click(requestSaveInfo);	//提交添加、修改表单
		$("#deleteBtn").click(onDeleteSelectedBtnClick);	//"删除选中"按钮点击事件
		$("#deleteSomeBtn").click(deleteSome);//批量删除
		$('#dlgEditForm').on('hidden.bs.modal', function (e) {
			//清空表单输入
			$("#preprocessorForm")[0].reset();
			$("#preprocessorForm").validate().resetForm();
			
		});
		
		//界面框架初始化 -- 开始
		
		//界面框架初始化 -- 结束
		
		initAddDeviceClass();
		initUpdateDeviceClass();
	});
	
	var selectedId;
	function update(){
	    var x = $("#preprocessorList tbody tr td.checkbox-column :checkbox:checked"); 
			if (x != undefined && x.length == 1) {
			for (var i = 0; i < x.length; i++) {
				selectedId=parseInt(x[i].value);
				updateCondition(selectedId);
				$("#dlgUpdateForm").modal("show");
		    }
		} else {
			 showNoty("请选择单个条件来进行修改！", "error", false, "top"); 
		}
	
	}

	function updateCondition(selectedId){
		var valid = $("#preprocessorForm").validate().form();
 		if (!valid) return;
		var param={conditionId:selectedId};
		var requestData=$.param(param,true);
		$.post("alarmCondition/getAlarmConditionById",requestData,function(data){
			$("#UconditionName").val(data.alarms.conditionName);
		    $("#UinitialAlarmLevelId").val(data.alarms.initialAlarmLevelId);
			$("#Udevice-class").val(data.alarms.deviceClassId);
			var value = $("#Udevice-class").val();
	    	 var requestData = $.param({"deviceClassId":value}, true);
	    	 var p = data.alarms.deviceProperityId;
	    	  $.post("deviceProperity/getAllDeviceProperity", requestData, function(data) {
	  			var dp = data.deviceProperity;//所有数据
	  			$("#device-properity").find("option").remove();
	  			 for(i=0;i<dp.length;i++){
	  	             $("#Udevice-properity").append($('<option value='+dp[i].deviceProperityId+'>'+dp[i].name+'</option>'));      
	  			 }
	  			$("#Udevice-properity").val(p);
	  		});
			$("#UifAutoPromote").val(data.alarms.ifAutoPromote);
			$("#UpromoteValue").val(data.alarms.promoteValue);
			$("#UjudgeRule").val(data.alarms.judgeRule);
			$("#UjudgeJuniorValue").val(data.alarms.judgeJuniorValue);
			$("#UjudgeSeniorValue").val(data.alarms.judgeSeniorValue);
			$("#UtriggerDuration").val(data.alarms.triggerDuration);
			$("#UrelieveDuration").val(data.alarms.relieveDuration);
			$("#UrepeatTime").val(data.alarms.repeatTime);
			$("#UifRelieveNotice").val(data.alarms.ifRelieveNotice);	
			$("#UifActive").val(data.alarms.ifActive);	
			$("#Unote").val(data.alarms.note);	
			 var val = $("#UjudgeRule option:selected").val();
				$("#UjudgeJuniorValue").removeAttr("disabled");
				if(val==3 || val ==4 || val==5 || val==6){
					$("#UjudgeJuniorValue").attr("disabled","disabled");
				}
			var pValue=$("#UifAutoPromote option:selected").val();
			$("#UpromoteValue").removeAttr("disabled");
			if(pValue == 0){
				$("#UpromoteValue").attr("disabled","disabled");
			}
				$("#UjudgeRule").change(function(){	
					var val = $("#UjudgeRule option:selected").val();
			 		if(val==3 || val ==4 || val==5 || val==6){
						$("#UjudgeJuniorValue").attr("disabled","disabled");
						$("#UjudgeJuniorValue").val("");
			 		}else{
			 			$("#UjudgeJuniorValue").removeAttr("disabled");
			 		}
					
				})
				$("#UifAutoPromote").change(function(){	
					var val = $("#UifAutoPromote option:selected").val();
			 		if(val==0){
						$("#UpromoteValue").attr("disabled","disabled");
						$("#UpromoteValue").val("");
			 		}else{
			 			$("#UpromoteValue").removeAttr("disabled");
			 		}
					
				})
		});
		$("#btnConfirmUpdateForm").click(saveUpdate);
		$("#dlgUpdateForm").modal("hide");
	}
	function saveUpdate(){
		var valid = $("#preprocessorForm_u").validate().form();
 		if (!valid) return;
 		var requestData = {};
		var conditionName = $("#UconditionName").val();
 		var initialAlarmLevelId  = $("#UinitialAlarmLevelId option:selected").val();
 		var deviceClassId  = $("#Udevice-class option:selected").val();
 		var deviceProperityId  = $("#Udevice-properity option:selected").val();
 		if(!deviceProperityId || deviceProperityId == ""){
			showNoty("请选择设备属性！", "error", false, "top");
			return;
		}
 		var ifAutoPromote  = $("#UifAutoPromote option:selected").val();
 		var promoteValue  = $("#UpromoteValue").val();
 		var judgeRule  = $("#UjudgeRule option:selected").val();
 		var judgeSeniorValue  = $("#UjudgeSeniorValue").val();
 		var judgeJuniorValue  = $("#UjudgeJuniorValue").val();
 		var triggerDuration  = $("#UtriggerDuration").val();	
 		var relieveDuration  = $("#UrelieveDuration").val();
 		var repeatTime = $("#UrepeatTime").val();
 		var ifRelieveNotice  = $("#UifRelieveNotice option:selected").val();
 		var ifActive  = $("#UifActive option:selected").val();
 		var note  = $("#Unote").val();
	 		var alarmCondition={
	 			"alarmConditionId" : selectedId,
	 			"conditionName" : conditionName,
	 			"initialAlarmLevelId" : initialAlarmLevelId,
	 			"deviceClassId" : deviceClassId,
	 			"deviceProperityId" : deviceProperityId,
	 			"ifAutoPromote" : ifAutoPromote,
	 			"promoteValue" : promoteValue,
	 			"judgeRule" : judgeRule,
	 			"judgeSeniorValue" : judgeSeniorValue,
	 			"judgeJuniorValue" : judgeJuniorValue,
	 			"triggerDuration" : triggerDuration,
	 			"relieveDuration" : relieveDuration,
	 			"repeatTime" : repeatTime,
	 			"ifRelieveNotice" : ifRelieveNotice,
	 			"ifActive" : ifActive,
	 			"note" : note,
	 		}
	 		if(judgeJuniorValue==""||eval(judgeJuniorValue) < eval(judgeSeniorValue)){
	 			$.ajax({
		 			url: "alarmCondition/create",
		 			type: "POST",
		 			dataType : "json",
		 			data: alarmCondition, 
		 			success: function(data){
		 					showNoty("修改成功!", "success", false, "top");
		 					window.location.reload(); 
		 					$("#dlgUpdateForm").modal("hide");
		 			},
					error: function() {
						
						showNoty("您无权限进行操作", "error", true, 'top');
						$("#dlgUpdateForm").modal("hide");
						//window.location.reload(); 
					}
		 		});
 			}else{
 				showNoty("阈值L不能大于阈值R", "error", false, "top");
 		}
	}
	
	
	
	//初始添加页面的设备类别
	function initAddDeviceClass(){
		$.post("deviceClass/getDeviceClass", "", function(data) {
			var dc = data.deviceClass;//所有数据
			var dcId = [];
			 for(i=0;i<dc.length;i++){
	             $("#device-class").append($('<option value='+dc[i].deviceClassId+'>'+dc[i].name+'</option>'));  
	           
	         }
		});
	}
		
	//根据设备类别联动查询设备属性
	     function getAddDeviceProperity(deviceClassId){
	    	 var value = $("#device-class").val();
	    	 var requestData = $.param({"deviceClassId":value}, true);
	    	  $.post("deviceProperity/getAllDeviceProperity", requestData, function(data) {
	  			var dp = data.deviceProperity;//所有数据
	  			$("#device-properity").find("option").remove();
	  			 for(i=0;i<dp.length;i++){
	  	             $("#device-properity").append($('<option value='+dp[i].deviceProperityId+'>'+dp[i].name+'</option>'));      
	  	         }
	  		});
	     }      
	     
	    //初始修改页面的设备类别
		 	function initUpdateDeviceClass(){
		 		$.post("deviceClass/getDeviceClass", "", function(data) {
		 			var dc = data.deviceClass;//所有数据
		 			var dcId = [];
		 			 for(i=0;i<dc.length;i++){
		 	             $("#Udevice-class").append($('<option value='+dc[i].deviceClassId+'>'+dc[i].name+'</option>'));  
		 	           
		 	         }
		 		});
		 	}
		 		
		 	//根据设备类别联动查询设备属性
		 	      function getUpdateDeviceProperity(deviceClassId){
		 	    	 var value = $("#Udevice-class").val();
		 	    	 var requestData = $.param({"deviceClassId":value}, true);
		 	    	  $.post("deviceProperity/getAllDeviceProperity", requestData, function(data) {
		 	  			var dp = data.deviceProperity;//所有数据
		 	  			$("#Udevice-properity").find("option").remove();
		 	  			 for(i=0;i<dp.length;i++){
		 	  	             $("#Udevice-properity").append($('<option value='+dp[i].deviceProperityId+'>'+dp[i].name+'</option>'));      
		 	  	         }
		 	  		});
		 	     } 

	 	//保存信息
	 	function requestSaveInfo() {
	 		var valid = $("#preprocessorForm").validate().form();
	 		if (!valid) return;
 			var conditionName = $("#conditionName").val();
	 		var initialAlarmLevelId  = $("#initialAlarmLevelId option:selected").val();
	 		var deviceClassId  = $("#device-class option:selected").val();
	 		var deviceProperityId  = $("#device-properity option:selected").val();
	 		if(!deviceProperityId || deviceProperityId == ""){
				showNoty("请选择设备属性！", "error", false, "top");
				return;
			}
	 		var ifAutoPromote  = $("#ifAutoPromote option:selected").val();
	 		var promoteValue  = $("#promoteValue").val();
	 		var judgeRule  = $("#judgeRule option:selected").val();
	 		var judgeSeniorValue  = $("#judgeSeniorValue").val();
	 		var judgeJuniorValue  = $("#judgeJuniorValue").val();
	 		var triggerDuration  = $("#triggerDuration").val();	
	 		var relieveDuration  = $("#relieveDuration").val();
	 		var repeatTime = $("#repeatTime").val();
	 		var ifRelieveNotice  = $("#ifRelieveNotice option:selected").val();
	 		var ifActive  = $("#ifActive option:selected").val();
	 		var note  = $("#note").val();
	 		var alarmCondition={
	 	 		"conditionName" : conditionName,
	 			"initialAlarmLevelId" : initialAlarmLevelId,
	 			"deviceClassId" : deviceClassId,
	 			"deviceProperityId" : deviceProperityId,
	 			"ifAutoPromote" : ifAutoPromote,
	 			"promoteValue" : promoteValue,
	 			"judgeRule" : judgeRule,
	 			"judgeSeniorValue" : judgeSeniorValue,
	 			"judgeJuniorValue" : judgeJuniorValue,
	 			"triggerDuration" : triggerDuration,
	 			"relieveDuration" : relieveDuration,
	 			"repeatTime":repeatTime,
	 			"ifRelieveNotice" : ifRelieveNotice,
	 			"ifActive" : ifActive,
	 			"note" : note,
	 		}
	 		/*  alert("左：" + judgeJuniorValue + "右：" + judgeSeniorValue)  */
	 		if(judgeJuniorValue==""||eval(judgeJuniorValue) < eval(judgeSeniorValue)){
		 		$.ajax({
		 			url: "alarmCondition/create",
		 			type: "POST",
		 			dataType : "json",
		 			data: alarmCondition, 
		 			success: function(data){
		 				    window.location.reload(); 
		 					showNoty("新增成功!", "success", false, "top"); 
		 					$("#dlgAddForm").modal("hide");
		 			},
					error: function() {
						showNoty("您无权限进行操作", "error", true, 'top');
						$("#dlgAddForm").modal("hide");
						$("#preprocessorForm")[0].reset();
					}
		 		});
	 		}else{
	 			showNoty("阈值L不能大于阈值R", "error", false, "top");
	 		}
	 	}
		
	 	var gStart = 0;
	 	var gEnd = 0;
	 	var rowNum = -1;
	 	function queryRole(start) {
	 		start = start || 0;
	 		var param = {};
	 		param["start"] = start;
	 		param["countPerPage"] = 10;
	 		
	 		var requestData = $.param(param, true);
	 		
	 		$("#preprocessorList").DataTable().clear().draw();
	 		drawPageInfo(0, 0, 0);
	 			
	 		var emptyPager = '<ul class="pagination">' + 
	 					'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
	 					'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
	 				'</ul>';
	 		$("#divPager").empty().append(emptyPager);
	 		
	 		$.post('alarmCondition/queryConditionAlarm', requestData, function(data) {
	 			var alarms = data.alarms;
	 	
	 			var page = data.page;
	 			
	 			gStart = page.start + 1;
	 			gEnd = gStart + page.limit - 1;
	 			var count = page.count;
	 			gStart = Math.min(gStart, count);
	 			gEnd = Math.min(gEnd, count);
	 			
	 			rowNum = gStart;
	 			
	 			$("#preprocessorList").DataTable().rows.add( alarms ).draw();
	 			drawPageInfo(gStart, gEnd, count);
	 			//由于前台页面始终报getPagerHtml未定义的错，所以导致分页的页码以及上下页无法显示出来
	 			var pager = getPagerHtml(page.currentPage, page.totalPage, "toPage");
	 			$("#divPager").empty().append(pager);
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
	 		queryRole(start);
	 	}
	 		
	function initInfoTable() {
		$("#preprocessorList").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			searching: false,
			info: false,
			//scrollX: true,
			//scrollY: "400px",
			scrollCollapse: false,
			
			"columnDefs": [{
				"className": "align-center",
				"targets": 0,
				"data": null,
				"render": function ( data, type, full, meta) {
				  return "<input value=\"" + data.alarmConditionId + "\" type=\"checkbox\" class=\"uniform\">";
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('checkbox-column');
				}
			}, {
				"targets": 1,
				"className": "align-center",
				"data": "conditionName"
			}, {
				"className": "align-center",
				"targets": 2,
				"data":null,
					"render": function ( data, type, full, meta) {
						var iF = data.initialAlarmLevelId;
						showIf = '未知';
						if(iF=="1"){
							showIf = '初级报警';
						}else if(iF=="2"){
							showIf = '中级报警';
						}else if(iF=="3"){
							showIf = '高级报警';
						}else if(iF=="4"){
							showIf = '紧级报警';
						}
						return '<span>'+ showIf + '</span>';
				},		
			}, {
				"className": "align-center",
				"targets": 3,
				"data": "deviceClassName"
			}, {
				"className": "align-center",
				"targets": 4,
				"data": "deviceProperityName"
			}, {
				"className": "align-center",
				"targets": 5,
				"data":null,
				"render": function ( data, type, full, meta) {
					var iF = data.judgeRule;
					if(iF=="1"){
						showIf = '不在区间';
					}else if(iF=="2"){
						showIf = '在区间';
					}else if(iF=="3"){
						showIf = '等于';
					}else if(iF=="4"){
						showIf = '不等于';
					}else if(iF=="5"){
						showIf = '大于';
					}else if(iF=="6"){
						showIf = '小于';
					}
					return '<span>'+ showIf + '</span>';
				},		
			}, {
				"className": "align-center",
				"targets": 6,
				"data": "judgeJuniorValue"
			},{
				"className": "align-center",
				"targets": 7,
				"data": "judgeSeniorValue"
			}, {
				"className": "align-center",
				"targets": 8,
				"data": "triggerDuration"
			}, {
				"className": "align-center",
				"targets": 9,
				"data": "relieveDuration"
			}, {
				"className": "align-center",
				"targets": 10,
				"data": null,
				"render": function ( data, type, full, meta) {
						var iF = data.ifAutoPromote;
						var labelClass = 'label-warning';
						showIf = '未知';
						if(iF=="1"){
							labelClass = 'label-success';
							showIf = '是';
						}else if(iF=="0"){
							labelClass = 'label-danger';
							showIf = '否';
						}
						return '<span class="label ' + labelClass + '">' + showIf + '</span>';
				},		
				
			}, {
				"className": "align-center",
				"targets": 11,
				"data": "promoteValue"
			}, {
				"className": "align-center",
				"targets": 12,
				"data": "repeatTime"
			}, {
				"className": "align-center",
				"targets": 13,
				"data": null,
				"render": function ( data, type, full, meta) {
					var iF = data.ifRelieveNotice;
					var labelClass = 'label-warning';
					showIf = '未知';
					if(iF=="1"){
						labelClass = 'label-success';
						showIf = '是';
					}else if(iF=="0"){
						labelClass = 'label-danger';
						showIf = '否';
					}
					return '<span class="label ' + labelClass + '">' + showIf + '</span>';
				},
			}, {
				"className": "align-center",
				"targets": 14,
				"data": null,
				"render": function ( data, type, full, meta) {
					var iF = data.ifActive;
					var labelClass = 'label-warning';
					showIf = '未知';
					if(iF=="1"){
						labelClass = 'label-success';
						showIf = '是';
					}else if(iF=="0"){
						labelClass = 'label-danger';
						showIf = '否';
					}
					return '<span class="label ' + labelClass + '">' + showIf + '</span>';
				},
			},{
				"className": "align-center",
				"targets": 15,
				"data": "note"
			}]
		});
 		 $('#preprocessorList').on('draw.dt', function () {
			$('#preprocessorList').find(".bs-tooltip").tooltip({
				container: "body"
			});
		});
	}
	
	function onDeleteSelectedBtnClick() {
		//"删除选中"按钮点击事件
		var x = $("#preprocessorList tbody tr td.checkbox-column :checkbox:checked");
		var selectedIds = [];
		if (x != undefined && x.length > 0) {
			for (var i = 0; i < x.length; i++) {
				selectedIds.push(parseInt(x[i].value));
			}
			rmSingleInfo(selectedIds);
		} else {
			showNoty("请选择要删除的预处理！", "error", false, "top");
		}
		
	}
	
	function deleteSome(){
		var x = $("#preprocessorList tbody tr td.checkbox-column :checkbox:checked");
		var choseIds = new Array();
		choseIds = [];
		if (x != undefined && x.length > 0) {
			for (var i = 0; i < x.length; i++) {
				choseIds.push(parseInt(x[i].value));
				
			}
			rmSelectedInfos(choseIds);
		} else {
			showNoty("请选择要删除的预处理！", "error", false, "top");
		}
	}
	
	
	//删除选中的多个参数设置
	function rmSelectedInfos(choseIds) {
		$('#dlSomeConfirm').data('ids', [choseIds]);
		$('#dlSomeConfirm').modal('show');
	} 
	//删除单个
	function rmSingleInfo(conditionId) {
		$('#dlgConfirmDelete').data('infoIds', conditionId);
		$('#dlgConfirmDelete').modal('show');
	}
	
	//批量删除
	function requestDelete(){
		var ids = $('#dlSomeConfirm').data('ids');
		
		if (ids == undefined) {
			return;
		}

		$("#btnCancel").attr("disabled", "disabled");
		var requestData = $.param({"ids":ids}, true);
		$.ajax({
			type: "POST",
			url: "alarmCondition/batchDelete",
			data: requestData,
			dataType: "json",
			success: function(data) {
				if (data.success == true) {
					showNoty("删除成功!", "success", false, "top");
				} else {
					showNoty(data.errorMessage, "error", false, "top");
				}		
			},
			error: function() {
				showNoty("您无权限进行操作", "error", true, 'top');
			}
		}).always(function() {
			resetDelDlgBtns();
		});
		window.location.reload(); 
	}
	
	//发送删除请求
	function requestRmInfo() {
		var infoIds = $('#dlgConfirmDelete').data('infoIds');
			
		if (infoIds == undefined) {
			return;
		}
		
		$("#btnCancelDelete").attr("disabled", "disabled");
			
		var requestData = $.param({"conditionId":infoIds}, true);
		$.ajax({
			type: "POST",
			url: "alarmCondition/deleteCondition",
			data: requestData,
			dataType: "json",
			success: function(data) {
				if (data.success == true) {
					showNoty("删除成功!", "success", false, "top");
					//searchInfos();	
				} else {
					showNoty(data.errorMessage, "error", false, "top");
				}		
			},
			error: function() {
				showNoty("您无权限操作", "error", true, 'top');
			}
		}).always(function() {
			resetDelDlgBtns();
		});
		//window.location.reload(); 
	}
	
	//重置删除确认对话框中按钮的文字和状态
	function resetDelDlgBtns() {
		$("#dlgConfirmDelete").modal("hide");
		$('#dlgConfirmDelete').removeData('infoIds');
		
		$("#btnConfirmDelete").button("reset");
		$("#btnCancelDelete").removeAttr("disabled", "disabled");
	}
	

	
	
	//获取车辆信息，并弹出修改对话框
	function getInfo(id) {
		var requestData = "id=" + id;
		$.post("preprocessor/getById", requestData, function(data) {
			if (data.commonMessage.success) {
				var preprocessorInfo = data.info;
				
				$("#hiddenPreprocessorTemplateId").val(preprocessorInfo.templateId);
				$("#preprocessorTemplateId").val(cacheTemplateData[preprocessorInfo.templateId].name);
				initFormByTemplate(cacheTemplateData[preprocessorInfo.templateId]);
				
				$("#preprocessorInfoId").val(preprocessorInfo.id);
				$("#name").val(preprocessorInfo.name);
				$("#triggerTimeWindow").val(preprocessorInfo.triggerTimeWindow);
				
				popTextFieldWithParams(preprocessorInfo.triggerParamsList, "trig");
				
				//弹出对话框
				$("#btnConfirmEditForm").text("修改");
				$("#dlgEditForm").modal("show");
			} else {
				showNoty(data.commonMessage.errorMessage, "error", false, "top");
			}
		});
	}

	function popTextFieldWithParams(params, prefix) {
		for (var i = 0; i < params.length; i++) {
			var tmpParam = params[i];
			var textfield = document.getElementById(prefix + "_" + tmpParam.name);
			if (textfield) {
				textfield.value = tmpParam.value;
			}
		}
	}
	
	
	var cacheTemplateData;
	function cacheTemplates(preprocessorTemplates) {
		cacheTemplateData = {};
		for(var i = 0; i < preprocessorTemplates.length; i++) {
			var tmpl = preprocessorTemplates[i];
			cacheTemplateData[tmpl.id] = tmpl;
		}
	}
	
	function onSearchButtonClick() {
		//searchInfos();
	}

	
	function getInfosByTemplateId(templateId, searchName) {
		var requestData = $.param({"templateId":templateId, "name": searchName}, true);
		$.ajax({
			type: "POST",
			url: "preprocessor/getByTemplateId",
			data: requestData,
			dataType: "json",
			success: function(data) {
				if (data.commonMessage.success == true) {
					drawInfoTable(data.infos);
				} else {
					showNoty(data.commonMessage.errorMessage, "error", false, "top");
				}
			}
		});
	}
	
	 function drawInfoTable(data) {
		$("#preprocessorList").DataTable().rows.add( data ).draw();
	}
	
	function clearInfoTable() {
		$("#preprocessorList").DataTable().clear().draw();
	}
	
	function initFormByTemplate(template) {
		$("#triggerConditionDescSpan").text(template.triggerConditionDesc);
		
		var triggerParamHtmlStr = getParamHtml(template.triggerParam, 'triggerParamPanel', 'trig');
		
		$(triggerParamHtmlStr).replaceAll($("#triggerParamPanel"));
		
		$("#triggerConditionDesc").val(template.triggerConditionDesc);
		$("#description").val(template.description);
	}
	
	function getParamHtml(params, paramDivId, inputPrefix) {
		var triggerParamHtml = [];
		triggerParamHtml.push('<div id="' + paramDivId + '">');
		for (var i = 0; i < params.length; i++) {
			var tmpParam = params[i];
			
			var validateClass = getValidateClasByParamType(tmpParam.type);
			
			triggerParamHtml.push('<div class="row form-group" style="padding-top:2px;"><label class="col-xs-2 control-label">');
			triggerParamHtml.push(tmpParam.displayName + ' <span class="required">*</span> ');
			triggerParamHtml.push('</label><div class="col-xs-4">');
			triggerParamHtml.push('<input type="text" id="' + inputPrefix + '_' + tmpParam.name + '" name="' + inputPrefix + '_' + tmpParam.name + '" class="form-control input-sm required ' + validateClass + '" maxlength="7">');
			triggerParamHtml.push('</div></div>');
		}
		triggerParamHtml.push('</div>');
		return triggerParamHtml.join('');
	}
	
	function getValidateClasByParamType(paramType) {
		if (paramType == "INTEGER") {
			return "digits number";
		} else if (paramType == "DOUBLE") {
			return "number";
		} else if (paramType == "STRING") {
			return "";
		}
		
		return "";
	}
</script>
<script>
$(document).ready(function(){
	$("#btnCancelConfirm").click(resetForm);
});
function resetForm() {
	//$("#preprocessorForm")[0].reset();
	window.location.reload(); 
	
}

</script>
</head>
<body>
	<div id="container" style="width:100%;">
		<div id="content" style="height:100%">
			<div class="container" style="height:100%;padding:0 0;">
			

				<div class="col-md-10" style="width:100%;height:100%;">
					<div style="padding-top:5px;">
						<div class="col-md-6">
						<button id="addBtn" class="btn btn-sm btn-primary">新增</button>
						<button id="editBtn" class="btn btn-sm btn-primary">修改</button>
						<button id="deleteBtn" class="btn btn-sm btn-primary">删除</button>
						<button id="deleteSomeBtn" class="btn btn-sm btn-primary">批量删除</button>
						</div>
						
						
					</div>
						<div class="col-md-12">
							<table id="preprocessorList" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">
								<thead>
									<tr>
										<th class="col-md-1 checkbox-column" style="width:44px">
											<input type="checkbox" class="uniform">
										</th>
									<th class="align-center col-md-1">名称</th>
									<th class="align-center col-md-1">报警等级</th>
									<th class="align-center col-md-1">设备类别</th>
									<th class="align-center col-md-1">设备属性</th>
									<th class="align-center col-md-1">判断规则</th>
									<th class="align-center">阈值（左）</th>
									<th class="align-center">阈值（右）</th>
									<th class="align-center">触发持续时间（分钟）</th>
									<th class="align-center">解除持续时间（分钟）</th>							
									<th class="align-center">允许升级</th>
									<th class="align-center">升级条件（小时）</th>
									<th class="align-center">提醒次数</th>
									<th class="align-center">是否通知</th>							
									<th class="align-center">是否启用</th>
									<th class="align-center col-md-1">备注</th>
									</tr>
								</thead>
							</table>
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
	</div>	
	
<div id="dlgConfirmDelete" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button id="btnCloseConfirmDelete" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">删除预处理</h4>
			</div>
			<div class="modal-body">
				<p>您确定要删除预处理信息吗?</p>
			</div>
			<div class="modal-footer">
				<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	

<div id="dlSomeConfirm" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button id="btnCloseConfirmDelete" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">删除预处理</h4>
			</div>
			<div class="modal-body">
				<p>您确定要删除多条信息吗?</p>
			</div>
			<div class="modal-footer">
				<button id="btnConfirm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button id="btnCancel" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	

<div id="dlgAddForm" class="modal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"><i class="icon-reorder"></i>添加报警条件</h4>
			</div>
			<div class="modal-body">
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
						<form id="preprocessorForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-md-2 control-label">条件名称:</label>
									<div class="col-md-3">
										<input type="text" id="conditionName" name="conditionName" class="form-control input-sm required" maxlength="60">
									</div>
									<label class="col-md-2 control-label">阈  值(L):</label>
									<div class="col-md-3">
										<input type="text" id="judgeJuniorValue" name="judgeJuniorValue" class="form-control input-sm required" maxlength="60">
									<script type="text/javascript">
												var text = document.getElementById("judgeJuniorValue")
												text.onkeyup = function(){
													if(isNaN(text.value)||text.value>500||text.value<0){
													  $("#junior").css("display","block")
													  text.value = "";
													}else{
													  $("#junior").css("display","none")
													}
												}
									</script>
									</div>
									<label id="junior"  class="col-md-1 control-label" style="color: crimson;display:none;">非法数字</label>
									
							    </div>
								<div class="form-group">
									<label class="col-md-2 control-label">设备类别:</label>
									<div class="col-md-3">
										<select id="device-class" onchange="getAddDeviceProperity();">
										  <option value ="">---请选择---</option>
										</select>
									</div>
									<label class="col-md-2 control-label">阈  值(R):</label>
									<div class="col-md-3">
										<input type="text" id="judgeSeniorValue" name="judgeSeniorValue" class="form-control input-sm required" maxlength="60">
									    	<script type="text/javascript">
												var check = document.getElementById("judgeSeniorValue")
												check.onkeyup = function(){
													if(isNaN(check.value)||check.value>500||check.value<0){
													  $("#senior").css("display","block")
													  check.value = "";
													}else{
													  $("#senior").css("display","none")
													}
												}
									</script>
									</div>
									<label id="senior"  class="col-md-1 control-label" style="color: crimson;display:none;">非法数字</label>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">设备属性:</label>
									<div class="col-md-3">
										<select id="device-properity" onchange="getAddDeviceProperityId();">
										<option value ="">---请选择---</option>
										</select>
									</div>
							
									<label class="col-md-2 control-label">升级条件(小时):</label>
									<div class="col-md-3">
										<input type="text" id="promoteValue" class="form-control input-sm required" maxlength="60">
										<script type="text/javascript">
										var promoteValue = document.getElementById("promoteValue")
										var reg = new RegExp("^-?\\d+$"); 
										promoteValue.onkeyup = function(){
											if(!reg.test(promoteValue.value)||promoteValue.value>10||promoteValue.value<0){
											  $("#promote").css("display","block")
											  promoteValue.value = "";
											}else{
											  $("#promote").css("display","none")
											}
										}
										</script>
									
									</div>
									<label id="promote"  class="col-md-1 control-label" style="color: crimson;display:none;padding:0;">0~10整数</label>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">判断规则 :</label>
									<div class="col-md-3">
										<select id="judgeRule">
										<option value ="">---请选择---</option>
										 <option value ="1">不在区间</option>
										 <option value ="2">在区间</option>
										 <option value ="3">等于</option>
										 <option value ="4">不等于</option>
										 <option value ="5">大于</option>
										 <option value ="6">小于</option>
										</select>
									</div>
								<label class="col-md-2 control-label">持续时间(解除):</label>
								<div class="col-md-3">
									<input type="text" id="relieveDuration" name="relieveDuration" class="form-control input-sm required" maxlength="60">
								<script type="text/javascript">
										var relieveDuration = document.getElementById("relieveDuration")
										var reg = new RegExp("^-?\\d+$"); 
										relieveDuration.onkeyup = function(){
											if(!reg.test(relieveDuration.value)||relieveDuration.value>60||relieveDuration.value<0){
											  $("#relieve").css("display","block")
											  relieveDuration.value = "";
											}else{
											  $("#relieve").css("display","none")
											}
										}
										</script>
								</div>
								<label id="relieve"  class="col-md-1 control-label" style="color: crimson;display:none;padding:0;">0~60整数</label>
								
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">报警等级:</label>
									<div class="col-md-3">
										<select id="initialAlarmLevelId">
										  <option value ="1">初级报警</option>
										  <option value ="2">中级报警</option>
										  <option value ="3">高级报警</option>
										  <option value ="4">紧急报警</option>
										</select>
									</div>
						
								<label class="col-md-2 control-label">持续时间(触发):</label>
								<div class="col-md-3">
									<input type="text" id="triggerDuration" name="triggerDuration" class="form-control input-sm required" maxlength="60">
								<script type="text/javascript">
										var triggerDuration = document.getElementById("triggerDuration")
										var reg = new RegExp("^-?\\d+$"); 
										triggerDuration.onkeyup = function(){
											if(!reg.test(triggerDuration.value)||triggerDuration.value>60||triggerDuration.value<0){
											  $("#trigger").css("display","block")
											  triggerDuration.value = "";
											}else{
											  $("#trigger").css("display","none")
											}
										}
										</script>
								</div>
								<label id="trigger"  class="col-md-1 control-label" style="color: crimson;display:none;padding:0;">0~60整数</label>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">是否升级 :</label>
									<div class="col-md-3">
										<select id="ifAutoPromote">
										 <option value ="1">是</option>
										 <option value ="0">否</option>
										</select>
									</div>
						
								<label class="col-md-2 control-label">解除通知:</label>
								<div class="col-md-3">
									<select id="ifRelieveNotice">
									 <option value ="1">是</option>
									  <option value ="0">否</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">是否启用 :</label>
								<div class="col-md-3">
									<select id="ifActive">
									 <option value ="1">是</option>
									 <option value ="0">否</option>
									</select>
								</div>
								<label class="col-md-2 control-label">提醒次数:</label>
								<div class="col-md-3">
									<input type="text" id="repeatTime" name="repeatTime" class="form-control input-sm required" maxlength="60">
								 <script type="text/javascript">
												var checkTime = document.getElementById("repeatTime")
												var reg = new RegExp("^-?\\d+$"); 
												checkTime.onkeyup = function(){
													if(!reg.test(checkTime.value)||checkTime.value>10||checkTime.value<0){
													  $("#showNotice").css("display","block")
													  checkTime.value = "";
													}else{
													  $("#showNotice").css("display","none")
													}
												}
									</script>
								
								</div>
								<label id="showNotice"  class="col-md-1 control-label" style="color: crimson;display:none;padding:0">0~10整数</label>
							</div>
							<div class="form-group">
							<label class="col-md-2 control-label">备  注:</label>
								<div class="col-md-3">
									<input type="text" id="note" name="note" style="margin-left:15px;" class="form-control input-sm" maxlength="60">
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- end -->
			</div>
	  
			<div class="modal-footer">
				<button id="btnConfirmEditForm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button id="btnCancelConfirm" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgUpdateForm" class="modal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"><i class="icon-reorder"></i>修改报警条件</h4>
			</div>
			<div class="modal-body">
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
						<form id="preprocessorForm_u" class="form-horizontal">
								<div class="form-group">
									<label class="col-md-2 control-label">条件名称:</label>
									<div class="col-md-3">
										<input type="text" id="UconditionName" name="conditionName" class="form-control input-sm required" maxlength="60">
									</div>
								<label class="col-md-2 control-label">阈  值(L):</label>
								<div class="col-md-3">
									<input type="text" id="UjudgeJuniorValue" name="judgeSeniorValue" class="form-control input-sm required" maxlength="60">
								<script type="text/javascript">
												var ujunior = document.getElementById("UjudgeJuniorValue")
												ujunior.onkeyup = function(){
													if(isNaN(ujunior.value)||ujunior.value>500||ujunior.value<0){
													  $("#Ujunior").css("display","block")
													  ujunior.value = "";
													}else{
													  $("#Ujunior").css("display","none")
													}
												}
									</script>
								</div>
								<label id="Ujunior"  class="col-md-1 control-label" style="color: crimson;display:none;">非法数字</label>
							    </div>
								<div class="form-group">
									<label class="col-md-2 control-label">设备类别:</label>
									<div class="col-md-3">
										<select id="Udevice-class" onchange="getUpdateDeviceProperity();">
										  <option value ="">---请选择---</option>
										</select>
									</div>
									<label class="col-md-2 control-label">阈  值(R):</label>
								<div class="col-md-3">
									<input type="text" id="UjudgeSeniorValue" name="judgeJuniorValue" class="form-control input-sm required" maxlength="60">
								
								<script type="text/javascript">
												var usenior = document.getElementById("UjudgeSeniorValue")
												usenior.onkeyup = function(){
													if(isNaN(usenior.value)||usenior.value>500||usenior.value<0){
													  $("#Usenior").css("display","block")
													  usenior.value = "";
													}else{
													  $("#Usenior").css("display","none")
													}
												}
									</script>
								</div>
								<label id="Usenior"  class="col-md-1 control-label" style="color: crimson;display:none;">非法数字</label>
									
									
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">设备属性:</label>
									<div class="col-md-3">
										<select id="Udevice-properity" onchange="getUpdateDeviceProperityId();">
										<option value ="">---请选择---</option>
										</select>
									</div>
							
									<label class="col-md-2 control-label">升级条件(小时):</label>
									<div class="col-md-3">
										<input type="text" id="UpromoteValue" class="form-control input-sm required" maxlength="60">
									<script type="text/javascript">
										var UpromoteValue = document.getElementById("UpromoteValue")
										var reg = new RegExp("^-?\\d+$"); 
										UpromoteValue.onkeyup = function(){
											if(!reg.test(UpromoteValue.value)||UpromoteValue.value>10||UpromoteValue.value<0){
											  $("#Upromote").css("display","block")
											  UpromoteValue.value = "";
											}else{
											  $("#Upromote").css("display","none")
											}
										}
										</script>
									</div>
									<label id="Upromote"  class="col-md-1 control-label" style="color: crimson;display:none;padding:0;">0~10整数</label>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">判断规则 :</label>
									<div class="col-md-3">
										<select id="UjudgeRule">
										 <option value ="">---请选择---</option>
										 <option value ="1">不在区间</option>
										 <option value ="2">在区间</option>
										 <option value ="3">等于</option>
										 <option value ="4">不等于</option>
										 <option value ="5">大于</option>
										 <option value ="6">小于</option>
										</select>
									</div>
							
								<label class="col-md-2 control-label">持续时间(解除):</label>
								<div class="col-md-3">
									<input type="text" id="UrelieveDuration" name="relieveDuration" class="form-control input-sm required" maxlength="60">
								   <script type="text/javascript">
										var UrelieveDuration = document.getElementById("UrelieveDuration")
										var reg = new RegExp("^-?\\d+$"); 
										UrelieveDuration.onkeyup = function(){
											if(!reg.test(UrelieveDuration.value)||UrelieveDuration.value>60||UrelieveDuration.value<0){
											  $("#Urelieve").css("display","block")
											  UrelieveDuration.value = "";
											}else{
											  $("#Urelieve").css("display","none")
											}
										}
										</script>
								</div>
								<label id="Urelieve"  class="col-md-1 control-label" style="color: crimson;display:none;padding:0;">0~60整数</label>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">报警等级:</label>
									<div class="col-md-3">
										<select id="UinitialAlarmLevelId">
										  <option value ="1">初级报警</option>
										  <option value ="2">中级报警</option>
										  <option value ="3">高级报警</option>
										  <option value ="4">紧急报警</option>
										</select>
									</div>
						
								<label class="col-md-2 control-label">持续时间(触发):</label>
								<div class="col-md-3">
									<input type="text" id="UtriggerDuration" name="triggerDuration" class="form-control input-sm required" maxlength="60">
								<script type="text/javascript">
										var UtriggerDuration = document.getElementById("UtriggerDuration")
										var reg = new RegExp("^-?\\d+$"); 
										UtriggerDuration.onkeyup = function(){
											if(!reg.test(UtriggerDuration.value)||UtriggerDuration.value>60||UtriggerDuration.value<0){
											  $("#Utrigger").css("display","block")
											  UtriggerDuration.value = "";
											}else{
											  $("#Utrigger").css("display","none")
											}
										}
										</script>
								</div>
								<label id="Utrigger"  class="col-md-1 control-label" style="color: crimson;display:none;padding:0;">0~60整数</label>
								
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">是否升级 :</label>
									<div class="col-md-3">
										<select id="UifAutoPromote">
										 <option value ="1">是</option>
										 <option value ="0">否</option>
										</select>
									</div>
					
								<label class="col-md-2 control-label">解除通知:</label>
								<div class="col-md-3">
									<select id="UifRelieveNotice">
									 <option value ="1">是</option>
									  <option value ="0">否</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">是否启用 :</label>
								<div class="col-md-3">
									<select id="UifActive">
									 <option value ="1">是</option>
									 <option value ="0">否</option>
									</select>
								</div>
								<label class="col-md-2 control-label">提醒次数:</label>
								<div class="col-md-3">
									<input type="text" id="UrepeatTime" name="UrepeatTime" class="form-control input-sm required" maxlength="60">
								 <script type="text/javascript">
												var checkTimes = document.getElementById("UrepeatTime");
												var reg = new RegExp("^-?\\d+$"); 
												checkTimes.onkeyup = function(){
													if(!reg.test(checkTimes.value)||checkTimes.value>10||checkTimes.value<0){
													  $("#UshowNotice").css("display","block")
													  checkTimes.value = "";
													}else{
													  $("#UshowNotice").css("display","none")
													}
												}
												
									</script>
								
								</div>
								<label id="UshowNotice"  class="col-md-1 control-label" style="color: crimson;display:none;padding: 0;">0~10整数</label>
							</div>
							<div class="form-group">
							<label class="col-md-2 control-label">备  注:</label>
								<div class="col-md-3">
									<input type="text" style="margin-left:15px;" id="Unote" name="Unote" class="form-control input-sm" maxlength="60">
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- end -->
			</div>
	  
			<div class="modal-footer">
				<button id="btnConfirmUpdateForm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>