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
<title>报警方式</title>
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
	background-color:#0081c2;
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
		
		initAlarmMethodTable();
		App.init();
		try{
			
			Plugins.init();
			CarFormComponents.init();
		}catch(err){
			console.error(err.message);
		}
			queryRole();
			
		
		$("#btnSearch").click(onSearchButtonClick);
		$("#btnConfirmDelete").click(requestRmInfo);	//设置确认删除按钮的点击事件
		$("#deleteSomeBtn").click(deleteSome);//批量删除
		
		$("#testBtn").click(testFunction);//测试
		$('#btnCloseConfirmTest').click(resetDlgBtns('test'));
		$("#btnConfirmTest").click(requestTestInfo);
		
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		$("#btnConfirm").click(requestDelete);//批量删除
		$("#editBtn").click(update);
		//点击新增按钮
		$("#addBtn").click(function() {
			$("#dlgAddForm").modal({backdrop: 'static'});
			$("#dlgAddForm").modal("show");
		});
		$("#btnConfirmEditForm").click(requestSaveInfo);	//提交添加、修改表单
		$("#deleteBtn").click(onDeleteSelectedBtnClick);	//"删除选中"按钮点击事件
		
		$('#dlgEditForm').on('hidden.bs.modal', function (e) {
			//清空表单输入
			$("#preprocessorForm")[0].reset();
			$("#preprocessorForm").validate().resetForm();
		});
		
	
		$('#alarmMethodList tbody').on( 'click', 'td', function () {
			var childHasCheckBox =$(this).find("input");
			if(childHasCheckBox.length==0){
				if ( $(this).parent().hasClass('selected') ) {
					$(this).parent().removeClass('selected');
					var tr = $(this).parent();
					var checkboxDOM = tr[0].children[0].children[0].children[0].children[0];
					$(checkboxDOM).click();
				}
				else {
					$("#alarmMethodList").DataTable().$('tr.selected').removeClass('selected');
					$(this).parent().addClass('selected');
					var tr = $(this).parent();
					var checkboxDOM = tr[0].children[0].children[0].children[0].children[0];
					$(checkboxDOM).click();
				}
			}
		});
		
		
		//全选
		$('#alarmMethodList th input[type="checkbox"]').on('click',function(){
			if($(this).is(':checked')){
				$('#alarmMethodList td input[type="checkbox"]').each(function(){
					$(this).click();
				});
			}else{
				$('#alarmMethodList td input[type="checkbox"]').each(function(){
					$(this).click();
				});
			}
		})
	
		initAlarmWay();
	});
	

	
	
	function initAlarmWay(){
		$.post("alarmMeasure/getAlarmWay", "", function(data) {
 			var aw_dc = data.alarmWay;//所有数据
 			for(i=0;i<aw_dc.length;i++){
	            $("#alarm-method").append($('<option value='+aw_dc[i].id+' name='+aw_dc[i].format+'>'+aw_dc[i].name+'</option>'));
	            $("#Ualarm-method").append($('<option value='+aw_dc[i].id+' name='+aw_dc[i].format+'>'+aw_dc[i].name+'</option>'));
	        } 
 		});
	}
	
	
	
	function changFormat(type){
		if('save' == type){
			$('#format').val($("#alarm-method option:selected").attr('name'));
		}else{
			$('#Uformat').val($("#Ualarm-method option:selected").attr('name'));
		}
	}
	
	var selectedId;
	function update(){
		var x = $("#alarmMethodList tbody tr td.checkbox-column :checkbox:checked");
		
		if (x != undefined && x.length == 1) {
			for (var i = 0; i < x.length; i++) {
				selectedId = parseInt(x[i].value);
			 	updateMeasure(selectedId);
				$("#dlgUpdateForm").modal("show");
				$("#dlgUpdateForm").modal({backdrop: 'static'});
			}

		} else {
			showNoty("请选择单个方式来进行修改！", "error", false, "top");
		}

	}
	
	function updateMeasure(selectedId){
		var param={id:selectedId};
		console.log(selectedId)
		var requestData=$.param(param,true);
		$.post("alarmMeasure/getMeasure",requestData,function(data){
			console.log(data)
			$("#Uname").val(data.alarmMeasure.name);
		    $("#Ualarm-method").val(data.alarmMeasure.typeID);
			$("#UwhenRelieve").val(data.alarmMeasure.whenRelieve);
			$("#UwhenTrigger").val(data.alarmMeasure.whenTrigger);
			$("#UifActive").val(data.alarmMeasure.ifActive);
			$("#Unote").val(data.alarmMeasure.note);
			$("#Uformat").val(data.alarmMeasure.format);
		});
		$("#btnConfirmUpdateForm").click(saveUpdate);
		$("#dlgUpdateForm").modal("hide"); 
	}
	
	function saveUpdate(){
		var valid = $("#preprocessorForm").validate().form();
 		if (!valid) return;
 		var requestData = {};
		var name = $("#Uname").val();
 		var whenRelieve  = $("#UwhenRelieve option:selected").val();
 		var whenTrigger  = $("#UwhenTrigger option:selected").val();
 		var ifActive  = $("#UifActive option:selected").val();
		var note = $("#Unote").val();
		var format = $("#Uformat").val();
		var typeID=$("#Ualarm-method option:selected").val();	
		if(typeID == ""){
			showNoty("请选择报警方式!", "error", false, "top");
			return;
		}
	 		var measure={
	 			"alarmMeasureId" : selectedId,
	 			"name" : name,
	 			"whenRelieve" : whenRelieve,
	 			"whenTrigger" : whenTrigger,
	 			"ifActive" : ifActive,
	 			"note" : note,
	 			"format" : format,
	 			"typeID" : typeID
	 		}
	 		var requestParam = {
	 				"alarmMeasure" : measure,
	 			}
	 		
	 		$.ajax({
	 			url: "alarmMeasure/update",
	 			type: "POST",
	 			contentType: "application/json",
	 			dataType:"json",
	 			data: JSON.stringify(requestParam), 
	 			success: function(data){
	 				if (data.success) {
	 					showNoty("保存成功!", "success", false, "top");
	 					window.location.reload(); 
	 					$("#dlgUpdateForm").modal("hide");
	 					//searchInfos();
	 				} else {
	 					showNoty(data.errorMessage, "error", false, "top");
	 				}
	 			}
	 		});
		
	}

	  
/* 	//初始添加页面的设备类别
	function initDeviceClass(){
		$.post("alarmMeasure/queryMeasurePage", "", function(data) {
			var dc = data.alarms;//所有数据
			var dcId = [];
			 for(i=0;i<dc.length;i++){
	             $("#alarm-method").append($('<option value='+dc[i].alarmMeasureId+'>'+dc[i].email+'</option>'));  
	           
	         }
		});
	} */
	
	var gStart = 0;
 	var gEnd = 0;
 	var rowNum = -1;
 	function queryRole(start) {
 		start = start || 0;
 		
/*  		var text = $("#txtSearchName").val(); */
 		
 		var param = {};
 		/* param["text"] = text; */
 		param["start"] = start;
 		param["countPerPage"] = 10;
 		
 		var requestData = $.param(param, true);
 		
 		$("#alarmMethodList").DataTable().clear().draw();
 		drawPageInfo(0, 0, 0);
 			
 		var emptyPager = '<ul class="pagination">' + 
 					'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
 					'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
 				'</ul>';
 		$("#divPager").empty().append(emptyPager);
 		
 		$.post('alarmMeasure/queryMeasurePage', requestData, function(data) {
 			var alarms = data.alarms;
 	
 			var page = data.page;
 			
 			gStart = page.start + 1;
 			gEnd = gStart + page.limit - 1;
 			var count = page.count;
 			gStart = Math.min(gStart, count);
 			gEnd = Math.min(gEnd, count);
 			
 			rowNum = gStart;
 			
 			$("#alarmMethodList").DataTable().rows.add( alarms ).draw();
 			drawPageInfo(gStart, gEnd, count);
 			
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
 	
	function initAlarmMethodTable() {
		$("#alarmMethodList").data("datatable", {
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
				"targets": 0,
				"data": null,
				"render": function ( data, type, full, meta) {
				  return "<input value=\"" + data.alarmMeasureId + "\" type=\"checkbox\" class=\"uniform\">";
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('checkbox-column');
				}
			}, {
				"targets": 1,
				"className": "align-center",
				"data": "name"
			}, {
				"className": "align-center",
				"targets": 2,
				"data":null,
					"render": function ( data, type, full, meta) {
						var iF = data.typeID;
						if(iF=="1"){
							showIf = '短信';
						}else{
							showIf = "其他";
						}
						return '<span>'+ showIf + '</span>';
				},	
			}, {
				"className": "align-center",
				"targets": 3,
					"data": null,
					"render": function ( data, type, full, meta) {
							var iF = data.whenTrigger;
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
				"targets": 4,
					"data": null,
					"render": function ( data, type, full, meta) {
							var iF = data.whenRelieve;
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
				"targets": 5,
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
				"targets": 6,
				"className": "align-center",
				"data": "note"
			}]
		});
		
		$('#alarmMethodList').on('draw.dt', function () {
			$('#alarmMethodList').find(".bs-tooltip").tooltip({
				container: "body"
			});
		});
	}
	
	   
	
	function requestSaveInfo() {
		var valid = $("#preprocessorForm").validate().form();
		if (!valid) return;
		
		/* var preprocessorId = $("#preprocessorInfoId").val(); */
			
		var requestData = {};
		var name=$("#name").val();	
		var email=$("#alarm-method option:selected").val();	
		if(email == ""){
			showNoty("请选择报警方式!", "error", false, "top");
			return;
		}
		var whenRelieve=$("#whenRelieve option:selected").val();	
		var whenTrigger=$("#whenTrigger option:selected").val();	
		var ifActive=$("#ifActive option:selected").val();
		var note = $("#note").val();
		var format = $("#format").val();
		console.log(requestData)
		var measure={
	 			"name" : name,
	 			"email" : email,
	 			"whenRelieve" : whenRelieve,
	 			"whenTrigger" : whenTrigger,
	 			"ifActive" : ifActive,
	 			"note" : note,
	 			"format" : format
	 		}
	 		var requestParam = {
	 				"measure" : measure,
	 			//"roles": roleIds
	 			}
		$.ajax({
			url: "alarmMeasure/createMeasure",
			type: "POST",
			contentType: "application/json",
			dataType:"json",
			data: JSON.stringify(requestParam), 
			success: function(data){
				if (data.success) {
					showNoty("保存成功!", "success", false, "top");
					window.location.reload(); 
					$("#dlgEditForm").modal("hide");
					searchInfos();
				} else {
					showNoty(data.errorMessage, "error", false, "top");
				}
			}
		});
	}
	
	function getTriggerParamInput() {
		var requestParam = {};
	
		var selectTemplateId = $("#hiddenPreprocessorTemplateId").val();
		var template = cacheTemplateData[selectTemplateId];
		var triggerParams = template.triggerParam;
		for (var i = 0; i < triggerParams.length; i++) {
			var param = triggerParams[i];
			var inputVals = document.getElementById("trig_" + param.name).value;
			
			requestParam[param.name] = inputVals;
		}
		
		return requestParam;
	}
	
	function onDeleteSelectedBtnClick() {
		//"删除选中"按钮点击事件
		var x = $("#alarmMethodList tbody tr td.checkbox-column :checkbox:checked");
		var selectedIds = [];
		if (x != undefined && x.length > 0) {
			for (var i = 0; i < x.length; i++) {
				selectedIds.push(parseInt(x[i].value));
			}
			rmSingleInfo(selectedIds);
		} else {
			showNoty("请选择要删除的报警方式！", "error", false, "top");
		}
	}
	

	function deleteSome(){
		var x = $("#alarmMethodList tbody tr td.checkbox-column :checkbox:checked");
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
	//删除单个车辆
	function rmSingleInfo(measureId) {
		$('#dlgConfirmDelete').data('infoIds', [measureId]);
		$('#dlgConfirmDelete').modal('show');
	}
	
	
	function testFunction(){
		//"删除选中"按钮点击事件
		var x = $("#alarmMethodList tbody tr td.checkbox-column :checkbox:checked");
		var selectedIds = [];
		if (x != undefined && x.length == 1) {
			$('#dlgConfirmTest').data('infoIds', [x[0].value]);
			$('#dlgConfirmTest').modal('show');
		} else {
			showNoty("请选择一条要测试的报警方式！", "error", false, "top");
		}
	}
	
	//批量删除
	function requestDelete(){
		var ids = $('#dlSomeConfirm').data('ids');
		console.warn("@@@@@" + ids);
		if (ids == undefined) {
			return;
		}
		$("#btnCancel").attr("disabled", "disabled");
		var requestData = $.param({"ids":ids}, true);
		$.ajax({
			type: "POST",
			url: "alarmMeasure/batchDelete",
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
			
		var requestData = $.param({"measureId":infoIds}, true);
		$.ajax({
			type: "POST",
			url: "alarmMeasure/deleteMeasure",
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
			}
		}).always(function() {
			resetDelDlgBtns();
		});
		window.location.reload(); 
	}
	
	//发送测试请求
	function requestTestInfo() {
		var valid = $("#preprocessorTestForm").validate().form();
		if (!valid) return;
		var infoIds = $('#dlgConfirmTest').data('infoIds');
		if (infoIds == undefined) {
			return;
		}
		var add=$("#testAdd").val();
		$("#btnCancelTest").attr("disabled", "disabled");
		var requestData = $.param({"measureId":infoIds,"add":add}, true);
		$.ajax({
			type: "POST",
			url: "alarmMeasure/testMeasure",
			data: requestData,
			dataType: "json",
			success: function(data) {
				if (data.success == true) {
					showNoty("测试成功!", "success", false, "top");
					//searchInfos();	
				} else {
					showNoty(data.errorMessage, "error", false, "top");
				}		
			},
			error: function() {
			}
		}).always(function() {
			resetDlgBtns('Test');
		});
	}
	
	//重置删除确认对话框中按钮的文字和状态
	function resetDelDlgBtns() {
		$("#dlgConfirmDelete").modal("hide");
		$('#dlgConfirmDelete').removeData('infoIds');
		
		$("#btnConfirmDelete").button("reset");
		$("#btnCancelDelete").removeAttr("disabled", "disabled");
	}
	
	function resetDlgBtns(name){
		$("#dlgConfirm"+name).modal("hide");
		$('#dlgConfirm'+name).removeData('infoIds');
		$("#btnConfirm"+name).button("reset");
		$("#btnCancel"+name).removeAttr("disabled", "disabled");
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
	
	
	function onSearchButtonClick() {
		searchInfos();
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
	$("#resetFormBtn").click(resetForm);
});
function resetForm() {
	$("#preprocessorForm")[0].reset();
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
						<button id="addBtn" class="btn btn-sm btn-primary">添加</button>
						<button id="editBtn" class="btn btn-sm btn-primary">修改</button>
						<button id="deleteBtn" class="btn btn-sm btn-primary">删除</button>
						<button id="deleteSomeBtn" class="btn btn-sm btn-primary">批量删除</button>
						<button id="testBtn" class="btn btn-sm btn-primary">测试</button>
						</div>
						
						
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<table id="alarmMethodList" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">
								<thead>
									<tr>
										<th class="col-md-1 checkbox-column" style="width:44px">
											<input type="checkbox" class="uniform">
										</th>
										<th class="align-center">名称</th>
									<th class="align-center">报警方式</th>
									<th class="align-center">报警解决通知</th>
									<th class="align-center">报警发生通知</th>
									<th class="align-center">是否启用</th>
									<th class="align-center col-md-2">备注</th>
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
	</div>	

<div id="dlgConfirmTest" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button id="btnCloseConfirmTest" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">测试报警方式</h4>
			</div>
			<div class="modal-body">
				<p>您确定要测试该条报警方式吗?</p>
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
						<form id="preprocessorTestForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-md-2 control-label">测试地址:</label>
									<div class="col-md-3" style="width:70%;">
										<input type="text" id="testAdd" name="testAdd" class="form-control input-sm required" maxlength="100">
									</div>
								</div>
						</form>
					</div>
			</div>
			<div>
				
			</div>
			<div class="modal-footer">
				<button id="btnConfirmTest" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button id="btnCancelTest" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	</div>
</div>
	
<div id="dlgConfirmDelete" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button id="btnCloseConfirmDelete" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">删除报警方式</h4>
			</div>
			<div class="modal-body">
				<p>您确定要删除该条报警方式吗?</p>
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
				<h4 class="modal-title"><i class="icon-reorder"></i>添加报警方式</h4>
			</div>
			<div class="modal-body">
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
						<form id="preprocessorForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-md-2 control-label">名称:</label>
									<div class="col-md-3">
										<input type="text" id="name" name="name" class="form-control input-sm required" maxlength="60">
									</div>
						
									<label class="col-md-2 control-label">报警方式:</label>
									<div class="col-md-3">
										<select id="alarm-method" onchange="changFormat('save');">
											<option value ="">---请选择---</option>
										</select>
									</div>
							    </div>
								<div class="form-group">
									<label class="col-md-2 control-label">报警发生通知:</label>
									<div class="col-md-3">
										<select id="whenRelieve">
										 <option value ="1">是</option>
										 <option value ="0">否</option>
										</select>
									</div>
									<label class="col-md-2 control-label">报警解决通知:</label>
									<div class="col-md-3">
										<select id="whenTrigger">
										 <option value ="1">是</option>
										 <option value ="0">否</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">是否启用:</label>
									<div class="col-md-3">
										<select id="ifActive">
										 <option value ="1">是</option>
										 <option value ="0">否</option>
										</select>
									</div>
									<label class="col-md-2 control-label">备注:</label>
									<div class="col-md-3">
										<input type="text" id="note" name="note" style="margin-left: 15px;" class="form-control" maxlength="60">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">构造体:</label>
									<div class="col-md-10">
										<textarea style="margin-left:15px;width:79.5%;resize:none;" id="format" name="format" class="form-control required" rows="3" cols="20"></textarea>
									</div>
								</div>
						</form>
					</div>
				</div>
				<!-- end -->
			</div>
	  
			<div class="modal-footer">
				<button id="btnConfirmEditForm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button id="resetFormBtn" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgUpdateForm" class="modal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"><i class="icon-reorder"></i>修改报警方式</h4>
			</div>
			<div class="modal-body">
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
						<form id="preprocessorForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-md-2 control-label">名称:</label>
									<div class="col-md-3">
										<input type="text" id="Uname" name="name" class="form-control input-sm required" maxlength="60">
									</div>
								
									<label class="col-md-2 control-label">报警方式:</label>
									<div class="col-md-3">
										<select id="Ualarm-method" onchange="changFormat('update');">
											<option value ="">---请选择---</option>
										</select>
									</div>
							    </div>
								<div class="form-group">
									<label class="col-md-2 control-label">报警发生通知:</label>
									<div class="col-md-3">
										<select id="UwhenRelieve">
										 <option value ="1">是</option>
										 <option value ="0">否</option>
										</select>
									</div>
									<label class="col-md-2 control-label">报警解决通知:</label>
									<div class="col-md-3">
										<select id="UwhenTrigger">
										 <option value ="1">是</option>
										 <option value ="0">否</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">是否启用:</label>
									<div class="col-md-3">
										<select id="UifActive">
										 <option value ="1">是</option>
										 <option value ="0">否</option>
										</select>
									</div>
									<label class="col-md-2 control-label">备注:</label>
									<div class="col-md-3">
										<input style="margin-left:15px;" type="text" id="Unote" name="Unote" class="form-control input-sm" maxlength="60">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label">构造体:</label>
									<div class="col-md-10">
										<textarea style="margin-left:15px;width:79.5%;resize:none;" id="Uformat" name="Uformat" class="form-control required" rows="3" cols="20"></textarea>
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