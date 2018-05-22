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
<title>报警等级</title>
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
<style>
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
	width:50%;
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
		
		$("#btnSearch").click(onSearchButtonClick);
		$("#btnConfirmDelete").click(requestRmInfo);	//设置确认删除按钮的点击事件
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		//点击新增按钮
		$("#addBtn").click(function() {
			$("#dlgAddForm").modal("show");
		});
		$("#btnConfirmEditForm").click(requestSaveInfo);	//提交添加、修改表单
		$("#delSelectedBtn").click(onDeleteSelectedBtnClick);	//"删除选中"按钮点击事件
		
		$('#dlgEditForm').on('hidden.bs.modal', function (e) {
			//清空表单输入
			$("#preprocessorForm")[0].reset();
			$("#preprocessorForm").validate().resetForm();
		});
		
		//界面框架初始化 -- 开始
		App.init();
		Plugins.init();
		CarFormComponents.init();
		//界面框架初始化 -- 结束
	});
	
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
			scrollY: "400px",
			scrollCollapse: false,
			
			"columnDefs": [{
				"targets": 0,
				"data": null,
				"render": function ( data, type, full, meta) {
				  return "<input value=\"" + data.id + "\" type=\"checkbox\" class=\"uniform\">";
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('checkbox-column');
				}
			}, {
				"targets": 1,
				"className": "align-center",
				"data": "name"
			}, {
				"className": "align-left",
				"targets": 2,
				"data": "triggerCondDisplay"
			}, {
				"className": "align-center",
				"targets": 3,
				"data": "description"
			}]
		});
		
		$('#preprocessorList').on('draw.dt', function () {
			$('#preprocessorList').find(".bs-tooltip").tooltip({
				container: "body"
			});
		});
	}
	
	
	function requestSaveInfo() {
		var valid = $("#preprocessorForm").validate().form();
		if (!valid) return;
		
		var preprocessorId = $("#preprocessorInfoId").val();
		var url = preprocessorId == "-1" ? "preprocessor/add" : "preprocessor/update";
			
		var requestData = {};
		var requestTriggerParam = getTriggerParamInput();
			
		requestData["triggerParams"] = requestTriggerParam;
		requestData["id"] = preprocessorId;
		requestData["templateId"] = $("#hiddenPreprocessorTemplateId").val();
		requestData["name"] = $("#name").val();
		requestData["triggerTimeWindow"] = $("#triggerTimeWindow").val();
			
		$.ajax({
			url: url,
			type: "POST",
			contentType: "application/json",
			dataType:"json",
			data: JSON.stringify(requestData), 
			success: function(data){
				if (data.success) {
					showNoty("保存成功!", "success", false, "top");
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
		var x = $("#preprocessorList tbody tr td.checkbox-column :checkbox:checked");
		var selectedIds = [];
		if (x != undefined && x.length > 0) {
			for (var i = 0; i < x.length; i++) {
				selectedIds.push(parseInt(x[i].value));
			}
			rmSelectedInfos(selectedIds);
		} else {
			showNoty("请选择要删除的预处理！", "error", false, "top");
		}
	}
	//删除选中的多个参数设置
	function rmSelectedInfos(ids) {
		$('#dlgConfirmDelete').data('infoIds', ids);
		$('#dlgConfirmDelete').modal('show');
	}
	//删除单个车辆
	function rmSingleInfo(id) {
		$('#dlgConfirmDelete').data('infoIds', [id]);
		$('#dlgConfirmDelete').modal('show');
	}
	//发送删除请求
	function requestRmInfo() {
		var infoIds = $('#dlgConfirmDelete').data('infoIds');
			
		if (infoIds == undefined) {
			return;
		}
		
		$("#btnCancelDelete").attr("disabled", "disabled");
			
		var requestData = $.param({"ids":infoIds}, true);
		$.ajax({
			type: "POST",
			url: "preprocessor/delete",
			data: requestData,
			dataType: "json",
			success: function(data) {
				if (data.success == true) {
					showNoty("删除成功!", "success", false, "top");
					searchInfos();	
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
</head>
<body>
	<div id="container">
		<div id="content" style="height:100%">
			<div class="container" style="height:100%;padding:0 0;">
			

				<div class="col-md-10" style="width:100%;height:100%;">
					<div style="padding-top:5px;">
						<div class="col-md-6">
						<button id="addBtn" class="btn btn-sm btn-primary">新增</button>
						<button id="editBtn" class="btn btn-sm btn-primary">修改</button>
						<button id="deleteBtn" class="btn btn-sm btn-primary">删除</button>
						</div>
						
						
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<table id="alarmMethodList" class="table table-highlight-head table-condensed table-striped table-bordered table-hover table-checkable datatable" data-scroll-y="true">
								<thead>
									<tr>
										<th class="col-md-1 checkbox-column" style="width:44px">
											<input type="checkbox" class="uniform">
										</th>
										<th class="align-center col-md-3">当前等级</th>
									<th class="align-center col-md-3">升级条件</th>
									<th class="align-center col-md-3">下一等级</th>						
									<th class="align-center col-md-3">是否启用</th>
									</tr>
								</thead>
							</table>
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
				<h4 class="modal-title">删除报警等级</h4>
			</div>
			<div class="modal-body">
				<p>您确定要删除该报警等级信息吗?</p>
			</div>
			<div class="modal-footer">
				<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
				<button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	

<div id="dlgAddForm" class="modal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"><i class="icon-reorder"></i>添加报警等级</h4>
			</div>
			<div class="modal-body">
				<!-- start -->
				<div class="row">
					<div class="col-md-12">
						<form id="preprocessorForm" class="form-horizontal">
								<div class="form-group">
									<label class="col-md-3 control-label">当前等级:</label>
									<div class="col-md-6">
										<select>
										 <option value ="primary">初级报警</option>
										 <option value ="middle">中级报警</option>
										 <option value ="high">高级报警</option>
										 <option value ="emergency">紧级报警</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">升级条件:</label>
										<div class="col-md-6">
										<select>
										 <option value ="primary">1小时</option>
										 <option value ="middle">2小时</option>
										 <option value ="high">3小时</option>
										 <option value ="emergency">4小时</option>
										</select>
									</div>
							    </div>
								<div class="form-group">
									<label class="col-md-3 control-label">下一等级:</label>
									<div class="col-md-6">
										<select>
										 <option value ="yes">是</option>
										  <option value ="no">否</option>
										</select>
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
</body>
</html>