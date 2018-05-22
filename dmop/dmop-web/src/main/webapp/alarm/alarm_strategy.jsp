<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%
	String basePath = request.getContextPath() + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<meta HTTP-EQUIV="expires" CONTENT="0"> 
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>报警策略</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css" rel="stylesheet" type="text/css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" type="text/css">
<!--[if IE 7]>
<link href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css" rel="stylesheet" >
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->
<style>
table.dataTable tbody tr.selected {
	background-color:#0081c2;
	color: white;
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
	width: 100%;
    border: 1px solid #ccc;
    height: 32px;
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
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
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>
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
<script type="text/javascript" src="<%=basePath%>js/noty-helper.js"></script>
<script>
	$(document).ready(function() {
	
		moment.lang('zh-cn');
		
		initStrategyTable();
	    initConditionTable(); 
	    initMethodTable();
	    initAddConditionTable();
	    initAddMethodTable();
	    $("#addConditionBtn").click(queryCondition); 
	    $("#addMethodBtn").click(queryMethod); 
	    $("#btnConditionConfirm").click(getConditionIds);
		$("#btnConditionConfirm").click(addChosenConditions);
		$("#btnMethodConfirm").click(getMethodIds);
		$("#btnMethodConfirm").click(addChosenMethods); 
		App.init();
		try{
			
			Plugins.init();
			CarFormComponents.init();
		}catch(err){
			console.error(err.message);
		}
		queryRole();

	    $("#strategyList").click(refreshRealTime)
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		$("#btnConfirmEditForm").click(requestSaveStrategyInfo);	//提交添加、修改车辆表单
		$("#editBtn").click(update);
		//添加按钮的点击事件(策略)
		$("#addBtn").click(function() {
			$("#dlgAddForm").modal("show");
		});

		
		var alarmStrategyId;
		//点击左侧策略右侧显示相应数据
		function refreshRealTime(alarmStrategyId){
			var node = $("#strategyList").DataTable().row('.selected');
			if (node.length == 1) {
				alarmStrategyId = node.data().alarmStrategyId;	
				queryChoseConditions(alarmStrategyId);
			}
		}
		
		function queryChoseConditions(alarmStrategyId){
			var requestConditionData={"strategyId":alarmStrategyId}
			$.post('alarmStrategy/queryConditions', requestConditionData, function(data) {
				var alarmConditions = data.alarmConditions;
				$("#conditionList  tr:not(:first)").empty("");
				$("#conditionList").DataTable().rows.add( alarmConditions ).draw();
			})
			var requestMeasureData={"alarmStrategyId":alarmStrategyId}
			$.post('alarmStrategy/queryMethods', requestMeasureData, function(data) {
				var alarmMeasures = data.alarmMeasures;
				$("#methodList  tr:not(:first)").empty("");
				$("#methodList").DataTable().rows.add( alarmMeasures ).draw();
			})
		}
		//---------结束-------------------
		
		//------------------修改策略------------------
		function update(alarmStrategyId){
			 var node = $("#strategyList").DataTable().row('.selected');
			if (node.length == 1) {
				  alarmStrategyId = node.data().alarmStrategyId;	
				$("#dlgUpdateForm").modal("show");
				updateStrategy(alarmStrategyId);
			}else{
				showNoty("请选择要修改的策略","error", false, "top")
			}  
		}
		
		function updateStrategy(alarmStrategyId){
			var param={id:alarmStrategyId};
			var requestData=$.param(param,true);
			$.post("alarmStrategy/getStrategy",requestData,function(data){
				$("#Uname").val(data.alarmStrategy.name);
			    $("#UifActive").val(data.alarmStrategy.ifActive);
				$("#Unote").val(data.alarmStrategy.note);
			});
			 $("#btnConfirmUpdateForm").click(saveUpdate);
		
		}
		
		 function saveUpdate(){
			 var node = $("#strategyList").DataTable().row('.selected');
				if (node.length == 1) {
					 alarmStrategyId = node.data().alarmStrategyId;	
				}
			var name = $("#Uname").val();
	 		var ifActive  = $("#UifActive option:selected").val();
	 		var note  = $("#Unote").val();
	 		console.log(alarmStrategyId + "," + name + "," + ifActive + "," + note)
	 		var strategy={
		 			"alarmStrategyId" : alarmStrategyId,
		 			"name" : name,
		 			"ifActive" : ifActive,
		 			"note" : note
	 		}
	 		var requestParam = {
	 				"alarmStrategy" : strategy,
	 		}
	 		$.ajax({
	 			url: "alarmStrategy/update",
	 			type: "POST",
	 			contentType: "application/json",
	 			dataType:"json",
	 			data: JSON.stringify(requestParam), 
	 			success: function(data){
	 				if (data.success) {
	 					showNoty("保存成功!", "success", false, "top");
	 					window.location.reload(); 
	 					$("#dlgEditForm").modal("hide");
	 					//searchInfos();
	 				} else {
	 					showNoty(data.errorMessage, "error", false, "top");
	 				}
	 			}
	 		});
	 			$("#dlgUpdateForm").modal("hide"); 
		} 
		//---------------结束-------------------
			//点击左侧策略获取id并显示右侧条件modal，插入已选条件开始
		$("#addConditionBtn").click(function() {
			var node = $("#strategyList").DataTable().row('.selected');
			if (node.length == 1) {
				 alarmStrategyId = node.data().alarmStrategyId;	
			}
			$("#addConditionList tr:not(:first)").empty("");
			$("#dlgConditionForm").modal("show");
			//$("#btnConditionConfirm").click(getConditionIds);
			//$("#btnConditionConfirm").click(addChosenConditions);
		});
		
		
		var selectedIds=new Array()
		var chosenData;
		function getConditionIds(){
			selectedIds=[];
				var x = $("#addConditionList tbody tr td.checkbox-column :checkbox:checked");
				if(x != undefined && x.length > 0) {
					for (var i = 0; i < x.length; i++) {
						selectedIds.push(parseInt(x[i].value));		
					}
					console.log("右侧已选条件id:" + selectedIds);
			}else {
				//showNoty("请选择要添加的条件！", "error", false, "top");
			
			}  
		}

		function addChosenConditions(){
			var node = $("#strategyList").DataTable().row('.selected');
			if (node.length != 1) {
				showNoty("请先选择报警策略再添加！", "error", false, "top");
			}
			var requestData = {
				"alarmStrategyId":alarmStrategyId,
				"alarmConditionId":selectedIds
				}
			console.log("requestParam:" + requestData) 		
			$.ajax({
				type: "POST",
				contentType : "application/json",
				url: "alarmStrategy/addConditionToStrategy",
				data:JSON.stringify(requestData),
				dataType: "json",
				success: function(data) {
					if (data.success == false) {
						showNoty(data.errorMessage, "error", false, "top");	
					} 	
				},
			});
			$("#dlgConditionForm").modal("hide");
			setTimeout(function (){
				$.ajaxSetup ({ 
			           cache: false 
			      }); 
				 refreshRealTime(alarmStrategyId);
			}, 500);
			
		}
		
		//--------------结束-------------
		//点击左侧策略获取id并显示右侧方式modal，插入已选方式开始
		$("#addMethodBtn").click(function() {
			var node = $("#strategyList").DataTable().row('.selected');
			if (node.length == 1) {
				 alarmStrategyId = node.data().alarmStrategyId;	
			}
			console.log("左侧策略已选id" + alarmStrategyId);
			$("#addMethodList tr:not(:first)").empty("");
			$("#dlgMethodForm").modal("show");
		   // $("#btnMethodConfirm").click(getMethodIds);
			//$("#btnMethodConfirm").click(addChosenMethods); 
		});
		
		var selectedMethodIds=new Array();
		function getMethodIds(){
			selectedMethodIds=[];
				var x = $("#addMethodList tbody tr td.checkbox-column :checkbox:checked");
				if(x != undefined && x.length > 0) {
					for (var i = 0; i < x.length; i++) {
						selectedMethodIds.push(parseInt(x[i].value));		
					}
					console.log("右侧已选方式id:" + selectedMethodIds);
			}else {
				showNoty("请选择要添加的方式！", "error", false, "top");
			
			}  
		}
		
		function addChosenMethods(){
			var node = $("#strategyList").DataTable().row('.selected');
			if (node.length != 1) {
				showNoty("请先选择报警策略再添加！", "error", false, "top");
			}
			console.log("======" + selectedMethodIds);
			var requestData = {
				"alarmStrategyId":alarmStrategyId,
				"alarmMethodId":selectedMethodIds
				}
			console.log("requestParam:" + requestData) 		
			$.ajax({
				type: "POST",
				contentType : "application/json",
				url: "alarmStrategy/addMethodToStrategy",
				data:JSON.stringify(requestData),
				dataType: "json",
				success: function(data) {
					if (data.success == false) {
						showNoty(data.errorMessage, "error", false, "top");	
					} 	
				},
			});
			$("#dlgMethodForm").modal("hide");
			setTimeout(function (){
				$.ajaxSetup ({ 
			           cache: false 
			      }); 
				refreshRealTime(alarmStrategyId)
			}, 500);

		}
	
		//-----------结束---------------
		

		$("#delSelectedBtn").click(function(){
			$('#dlgConfirmDelete').modal('show');
		})
		//"删除选中"按钮点击事件
		$("#btnConfirmDelete").click(function(){	
				    var strategyId;
					var node = $("#strategyList").DataTable().row('.selected');
					if (node.length == 1) {
						strategyId = node.data().alarmStrategyId;	
					}else{
						showNoty("请选择删除对象", "error", false, "top");
					$('#dlgConfirmDelete').modal('hide');
					     return;
						}
					var requestData = $.param({"strategyId":strategyId}, true);
					$.ajax({
						type: "POST",
						url: "alarmStrategy/deleteStrategy",
						data: requestData,
						dataType: "json",
						success: function(data) {
							if (data.success == true) {
								showNoty("删除成功!", "success", false, "top");
							} /* else {
								showNoty(data.errorMessage, "error", false, "top");
							}	 */	
						},
					})
					window.location.reload(); 
				});
			//----------------------------		
			
		$("#delMethodBtn").click(function(){
			 var strategyId;
			 var selectedMethodId;
				var node = $("#strategyList").DataTable().row('.selected');
				if (node.length == 1) {
					strategyId = node.data().alarmStrategyId;	
				}else{
					showNoty("请先选择左侧绑定的报警策略再删除", "error", false, "top");
				}
				var x = $("#methodList tbody tr td.checkbox-column :checkbox:checked");
				if(x != undefined && x.length > 0) {
					for (var i = 0; i < x.length; i++) {
					 selectedMethodId=parseInt(x[i].value);		
					}
				}
				var requestData = $.param({"strategyId":strategyId,"measureId":selectedMethodId}, true);
				$.ajax({
					type: "POST",
					url: "alarmStrategy/deleteMeasureStrategy",
					data: requestData,
					dataType: "json",
					success: function(data) {
						if (data.success == true) {
							showNoty("删除成功!", "success", false, "top");
						} /* else {
							showNoty(data.errorMessage, "error", false, "top");
						}	 */	
					},
				})
			setTimeout(function (){
				   $.ajaxSetup ({ 
			           cache: false 
			      }); 
				$("#methodList").load(refreshRealTime());
			}, 300);
				
				
		});
			
		 $("#delConditionBtn").click(function(){
			 var strategyId;
			 var selectedConditionId;
				var node = $("#strategyList").DataTable().row('.selected');
				if (node.length == 1) {
					strategyId = node.data().alarmStrategyId;	
				}else{
					showNoty("请先选择左侧绑定的报警策略再删除", "error", false, "top");
				}
				var x = $("#conditionList tbody tr td.checkbox-column :checkbox:checked");
				if(x != undefined && x.length > 0) {
					for (var i = 0; i < x.length; i++) {
						selectedConditionId=parseInt(x[i].value);		
					}
				}
				var requestData = $.param({"strategyId":strategyId,"conditionId":selectedConditionId}, true);
				$.ajax({
					type: "POST",
					url: "alarmStrategy/deleteConditionStrategy",
					data: requestData,
					dataType: "json",
					success: function(data) {
					 	if (data.success == true) {
							showNoty("删除成功!", "success", false, "top");
					
						}
					},
				}) 
				
				setTimeout(function (){
					$.ajaxSetup ({ 
				           cache: false 
				      }); 
					$("#conditionList").load(refreshRealTime());
				}, 300);
		}); 

	});
	
	var gStart = 0;
 	var gEnd = 0;
 	var rowNum = -1;
 	function queryRole(start) {
 		start = start || 0;
 		
/*  		var text = $("#txtSearchName").val(); */
 		
 		var param = {};
 		/* param["text"] = text; */
 		param["start"] = start;
 		param["countPerPage"] = 15;
 		
 		var requestData = $.param(param, true);
 		
 		$("#strategyList").DataTable().clear().draw();
 		drawPageInfo(0, 0, 0);
 			
 		var emptyPager = '<ul class="pagination">' + 
 					'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
 					'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
 				'</ul>';
 		$("#divPager").empty().append(emptyPager);
 		
 		$.post('alarmStrategy/queryAlarmStrategy', requestData, function(data) {
 			var alarms = data.alarms;
 	
 			var page = data.page;
 			
 			gStart = page.start + 1;
 			gEnd = gStart + page.limit - 1;
 			var count = page.count;
 			gStart = Math.min(gStart, count);
 			gEnd = Math.min(gEnd, count);
 			
 			rowNum = gStart;
 			
 			$("#strategyList").DataTable().rows.add( alarms ).draw();
 			drawPageInfo(gStart, gEnd, count);
 			
 			var pager = getPagerHtml(page.currentPage, page.totalPage, "toPage");
 			$("#divPager").empty().append(pager);
 			
 		});
 	}

 	function drawPageInfo(start, end, total){
 		var pageInfo = '<div style="float:left;margin-top:20px;">' + 
 					'显示第 ' + start + ' 至 ' + end + '  项结果，共 ' + total + '  项' + // (由 ' + recordsTotal + '  项结果过滤)' + 
 				'</div>';
 		$("#divPageInfo").empty().append(pageInfo);
 	}

 	function toPage(pageIndex) {
 		var countPerPage = 15;
 		var start = pageIndex * countPerPage;
 		queryRole(start);
 	}
 		
	//初始策略
	function initStrategyTable() {
		$("#strategyList").data("datatable", {
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
				"className": "align-center",
				"data": "name"
			}, {
				"className": "align-center",
				"targets": 1,
				"data":null,
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
			}, {
				"className": "align-center",
				"targets":2,
				"data": "note"
			}]
		});
		//点击选中一行
		$('#strategyList').on('draw.dt', function () {
			$('#strategyList').find(".bs-tooltip").tooltip({
				container: "body"
			});
			
			$('#strategyList tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
					$(this).removeClass('selected');
				}
				else {
					$("#strategyList").DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			} );
		});
	}
	
	//初始条件
		function initConditionTable() {
			$("#conditionList").data("datatable", {
				language: dt_lang,	//加载国际化语言
				processing: true,
				serverSide: false,
				ordering: false,
				paging: false,
				searching: false,
				info: false,
				//scrollX: true,
				scrollY: "250px",
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
					"data": null,
					render: function(data, type, full, meta) {
						var status = data.ifActive;
						var note = data.note;
						var labelClass = 'label-warning';
						var statusStr = '失效';
						if (status =='0') {
							labelClass = 'label-danger';
							return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
						} else{
							return note;
							
						}
					}
			
				}]
			});
		}
	
		function queryCondition(){
			 var strategyId;
				var node = $("#strategyList").DataTable().row('.selected');
				if (node.length == 1) {
					strategyId = node.data().alarmStrategyId;	
				};
				var requestData = $.param({"strategyId":strategyId}, true);
			$.post('alarmStrategy/getConditionNameByIfActive', requestData, function(data) {
				var alarms = data.alarms;
				$("#addConditionList").DataTable().rows.add( alarms ).draw();
			}); 
		} 
		
		function queryMethod(){
			var strategyId;
			var node = $("#strategyList").DataTable().row('.selected');
			if (node.length == 1) {
				strategyId = node.data().alarmStrategyId;	
			};
			var requestData = $.param({"strategyId":strategyId}, true);
			$.post('alarmStrategy/getMeasureNameByIfActive', requestData, function(data) {
				var alarms = data.alarms;
				$("#addMethodList").DataTable().rows.add( alarms ).draw();
			}); 
		} 
	
	//点击添加条件
	function initAddConditionTable() {
		$("#addConditionList").data("datatable", {
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
				  return "<input value=\"" + data.alarmConditionId + "\" type=\"checkbox\" name=\"checkname\" class=\"uniform\">";
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
				"data": "note"
		
			}]
		});
	}
	
	//添加方式
	function initAddMethodTable() {
		$("#addMethodList").data("datatable", {
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
				  return "<input value=\"" + data.alarmMeasureId + "\" type=\"checkbox\" name=\"checkStyle\" class=\"uniform\">";
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
				"data": "note"
		
			}]
		});
	}
	
		//初始方式
			function initMethodTable() {
				$("#methodList").data("datatable", {
					language: dt_lang,	//加载国际化语言
					processing: true,
					serverSide: false,
					ordering: false,
					paging: false,
					searching: false,
					info: false,
					//scrollX: true,
					scrollY: "250px",
					scrollCollapse: false,
					
					"columnDefs": [{
						"className": "align-center",
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
						"data": null,
						render: function(data, type, full, meta) {
							var status = data.ifActive;
							var note = data.note;
							var labelClass = 'label-warning';
							var statusStr = '失效';
							if (status =='0') {
								labelClass = 'label-danger';
								return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
							} else{
								return note;
								
							}
						}
					}]
				});
			}
		
		
	//插入新策略
	function requestSaveStrategyInfo() {
		var valid = $("#strategyForm").validate().form();
		if (!valid) return;
		
		/* var monitorId = $("#monitorInfoId").val(); */
		//var url = monitorId == "-1" ? "alarmStrategy/createStrategy" : "alarmStrategy/update";
			
		var requestData = {};
		var name = $("#name").val();
		var ifActive  = $("#ifActive option:selected").val();
		var note = $("#note").val();
		var strategy={
				"name":name,
				"ifActive":ifActive,
				"note":note
		}
		console.log(requestData)
		var requestParam = {
 				"strategy" : strategy,
 			//"roles": roleIds
 			}
		$.ajax({
			url: "alarmStrategy/createStrategy",
			type: "POST",
			contentType: "application/json",
			dataType:"json",
			data: JSON.stringify(requestParam), 
			success: function(data){
				if (data.success) {
					showNoty("保存成功!", "success", false, "top");
					window.location.reload(); 
					$("#dlgEditForm").modal("hide");
					//searchMonitorInfos();
				} else {
					showNoty(data.errorMessage, "error", false, "top");
				}
			}
		});
	}
	

	

	
	function onDeleteSelectedBtnClick() {
		var x = $("#strategyList tbody tr td.checkbox-column :checkbox:checked");//.prop("checked");
		var selectedIds = [];
		if (x != undefined && x.length > 0) {
			for (var i = 0; i < x.length; i++) {
				selectedIds.push(parseInt(x[i].value));
			}
			rmSelectedMonitorInfos(selectedIds);
		} else {
			showNoty("请选择要删除的报警参数！", "error", false, "top");
		}
	}
	
	//删除选中的多个参数设置
	function rmSelectedMonitorInfos(ids) {
		$('#dlgConfirmDelete').data('monitorInfoIds', ids);
		$('#dlgConfirmDelete').modal('show');
	}
	//删除单个车辆
	function rmSingleMonitorInfo(id) {
		$('#dlgConfirmDelete').data('monitorInfoIds', [id]);
		$('#dlgConfirmDelete').modal('show');
	}
	//发送删除请求
	function requestRmMonitorInfo() {
		var monitorInfoIds = $('#dlgConfirmDelete').data('monitorInfoIds');
			
		if (monitorInfoIds == undefined) {
			return;
		}
		
		$("#btnCancelDelete").attr("disabled", "disabled");
			
		var requestData = $.param({"ids":monitorInfoIds}, true);
		$.ajax({
			type: "POST",
			url: "monitor/delete",
			data: requestData,
			dataType: "json",
			success: function(data) {
				if (data.success == true) {
					showNoty("删除成功!", "success", false, "top");
					searchMonitorInfos();
				} else {
					showNoty(data.errorMessage, "error", false, "top");
				}		
			},
			error: function() {
			}
		}).always(function() {
			resetDelDlgBtns();
		});
	}
	
	//重置删除确认对话框中按钮的文字和状态
	function resetDelDlgBtns() {
		$("#dlgConfirmDelete").modal("hide");
		$('#dlgConfirmDelete').removeData('monitorInfoIds');
		
		$("#btnConfirmDelete").button("reset");
		$("#btnCancelDelete").removeAttr("disabled", "disabled");
	}
	

	
</script>
</head>
<body>
<div id="container" style="width:100%;">
	<div id="content" style="height:100%">
		<div class="container" style="height:100%;padding:0 0;">
	
			<div class="col-md-10" style="padding-left:5px;height:100%;width:50%">
				<div style="padding-top:5px;">
					<div class="col-md-6" style="margin-bottom:5px">
						<button id="addBtn" class="btn btn-sm btn-success">新增</button>
						<button id="editBtn" class="btn btn-sm btn-primary">修改</button>
						<button id="delSelectedBtn" class="btn btn-sm btn-primary">删除</button>
					</div>
				</div>
				  
					<div class="col-md-12">
						<table id="strategyList" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
							<thead>
								<tr>
									<th class="col-md-2 align-center">策略名称</th>
									<th class="col-md-2 align-center">是否启用</th>
									<th class="col-md-2 align-center">备    注</th>
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
			
<!-- 添加报警策略 -->
<div id="dlgAddForm" class="modal">
	<div class="modal-dialog modal-lg" style="width:500px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"><i class="icon-reorder"></i>添加报警策略</h4>
			</div>
			<div class="modal-body">
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
						<form id="strategyForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-md-4 control-label">策略名称:</label>
									<div class="col-md-5">
										<input type="text" id="name" name="name" class="form-control input-sm required" maxlength="60">
									</div>
								</div>
								<div class="form-group">
								<label class="col-md-4 control-label">是否启用 :</label>
								<div class="col-md-5">
									<select id="ifActive">
									 <option value ="1">是</option>
									 <option value ="0">否</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">备注:</label>
								<div class="col-md-5">
									<input type="text" id="note" name="note" class="form-control" maxlength="60">
								</div>
							</div>
							
						</form>
					</div>
				</div>
				<!-- end -->
			</div>
	  
			<div class="modal-footer">
				<button id="btnConfirmEditForm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
			
<!-- 修改报警策略 -->
<div id="dlgUpdateForm" class="modal">
	<div class="modal-dialog modal-lg" style="width:500px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"><i class="icon-reorder"></i>修改报警策略</h4>
			</div>
			<div class="modal-body">
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
						<form id="strategyUpdateForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-md-4 control-label">策略名称:</label>
									<div class="col-md-5">
										<input type="text" id="Uname" name="name" class="form-control input-sm required" maxlength="60">
									</div>
								</div>
								<div class="form-group">
								<label class="col-md-4 control-label">是否启用 :</label>
								<div class="col-md-5">
									<select id="UifActive">
									 <option value ="1">是</option>
									 <option value ="0">否</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label">备注:</label>
								<div class="col-md-5">
									<input type="text" id="Unote" name="note" class="form-control input-sm required" maxlength="60">
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
			
			<div class="col-md-2" style="padding-left:0;height:100%;border-left:1px solid #d0d0d0;width:50%">
				<div class="col-md-2 up" style="padding-left:0;height:50%;padding:5px;border-bottom:1px solid #d0d0d0;width:100%">
						<div class="col-md-6" style="margin-bottom:5px">
							<button id="addConditionBtn" class="btn btn-sm btn-success">新增</button>
							<button id="delConditionBtn" class="btn btn-sm btn-primary">删除</button>
						</div>
						
						<div class="col-md-12" style="height:80%">
							<table id="conditionList" class="table table-highlight-head table-condensed table-bordered datatable dataTable no-footer">
								<thead>
									<tr>
										<th class="col-md-1 checkbox-column">
											<input type="hidden" class="uniform" autocomplete='off'>
										</th>
										<th class="align-center col-md-2">条件名称</th>
										<th class="align-center col-md-3">备注</th>
									</tr>
								</thead>
							</table>
						</div>
				</div>
				
				<!-- 添加报警条件 -->
	<div id="dlgConditionForm" class="modal">
		<div class="modal-dialog modal-lg" style="width: 700px;">
		<div class="modal-content">
			<div class="modal-header">
				<button  type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"><i class="icon-reorder"></i>添加报警条件</h4>
			</div>
			<div class="modal-body">
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
					 <form id="conditionInfoForm" class="form-horizontal">
						<table id="addConditionList" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">	
						<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
							<thead>
								<tr>
									<th class="col-md-1 checkbox-column">
										<!-- <input type="checkbox" class="uniform" id="checkall"  name="checkname"> -->
									</th>
									<th class="col-md-2 align-center">条件名称</th>
									<th class="col-md-3 align-center">备    注</th>
								</tr>
							</thead>
						</table>
					</form> 
					</div>
					
				</div>
				<!-- end -->
			</div>
	  
			<div class="modal-footer">
				<button id="btnConditionConfirm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button id="cancel" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
				
				<div class="col-md-2 down" style="padding-left:0;height:50%;padding:5px;width:100%">
					<div class="col-md-6" style="margin-bottom:5px">
							<button id="addMethodBtn" class="btn btn-sm btn-success">新增</button>
							<button id="delMethodBtn" class="btn btn-sm btn-primary">删除</button>
					</div>
					<div class="col-md-12" style="height: 87%;">
							<table id="methodList" class="table table-highlight-head table-condensed table-bordered datatable dataTable no-footer">
								<thead>
									<tr>
										<th class="col-md-1 checkbox-column" >
											<input type="checkbox" class="uniform">
										</th>
										<th class="align-center col-md-2">方式名称</th>
										<th class="align-center col-md-3">备注</th>
									</tr>
								</thead>
							</table>
						</div>
				</div>
				
				
	<div id="dlgMethodForm" class="modal">
		<div class="modal-dialog modal-lg" style="width: 700px;">
		<div class="modal-content">
			<div class="modal-header">
				<button  type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"><i class="icon-reorder"></i>添加报警方式</h4>
			</div>
			<div class="modal-body">
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
					 <form id="conditionInfoForm" class="form-horizontal">
						<table id="addMethodList" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
							<thead>
								<tr>
									<th class="col-md-1 checkbox-column">
										<!-- <input type="checkbox" id="checkStyleAll" name="checkStyle" class="uniform"> -->
									</th>
									<th class="col-md-2 align-center">方式名称</th>
									<th class="col-md-2 align-center">备    注</th>
								</tr>
							</thead>
						</table>
					</form> 
					</div>
				</div>
			</div>
	  
			<div class="modal-footer">
				<button id="btnMethodConfirm" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button id="cancel" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
				
			</div>
			</div>
		</div>
	</div>

<div id="dlgConfirmDelete" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button id="btnCloseConfirmDelete" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">删除报警策略</h4>
			</div>
			<div class="modal-body">
				<p>您确定要删除报警策略信息吗?</p>
			</div>
			<div class="modal-footer">
				<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>

	$("#addConditionList th input[type='checkbox']").on('click',function(){
		if($(this).is(':checked')){
			$("#addConditionList td input[type='checkbox']").each(function(){
				$(this).click();
			})
		}else{
			$("#addConditionList td input[type='checkbox']").each(function(){
				$(this).click();
			})
		}
	})
	
	
	$("#addMethodList th input[type='checkbox']").on('click',function(){
		if($(this).is(':checked')){
			$("#addMethodList td input[type='checkbox']").each(function(){
				$(this).click();
			})
		}else{
			$("#addMethodList td input[type='checkbox']").each(function(){
				$(this).click();
			})
		}
	})

</script>
</body>
</html>

