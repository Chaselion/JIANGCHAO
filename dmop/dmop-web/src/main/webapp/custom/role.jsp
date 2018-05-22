<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
<title>客户管理</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" >

<link href="<%=basePath%>css/jquery-regionpick.css" rel="stylesheet" type="text/css">
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css">
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->
<link rel="stylesheet" href="<%=basePath%>plugins/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<style>
table.dataTable tbody tr.selected {
	background-color:#0081c2;
	color: white;
}

#dlgRoleInfo div.form-group {
	margin-bottom: 5px;
}
#dlgRoleInfo .modal-footer {
	padding-top: 6px;
	padding-bottom: 6px;
	margin-top: 0;
}
#dlgRoleInfo .modal-body {
	padding: 2px 20px;
}
#dlgRoleInfo .modal-header {
	padding: 8px 15px;
}
#dlgRoleInfo .widget {
	margin-bottom: 5px;
}
#dlgRoleInfo .widget .widget-header{
	margin-bottom: 8px;
}
#dlgRoleInfo h5 {
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
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/zTree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/zTree/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/daterangepicker/moment-with-langs.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-regionpick.js"></script>
<script>
	$(document).ready(function() {
		
		initRoleList();
		$("#btnSearch").click(function () {
			
			queryRole(0);
		});
		
		$("#btnConfirmDelete").click(requestRemove);
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		initDateField("#expiretime");
		//界面框架初始化 -- 开始
		App.init();
		Plugins.init();
		CarFormComponents.init();
		//界面框架初始化 -- 结束
		FormComponents.init();
		//添加按钮的点击事件
		$("#addBtn").click(function() {
		    //initDateField("#expiretime");
			$("#dlgCustomInfo").modal({backdrop: 'static'});
			$("#dlgCustomInfo").modal("show");
			//window.location.href="custom/role_add.jsp";
		});
		$("#btnReset").click(resetSearchCondition);
		$("#btnConfirmexport").click(exportAlarm);
		//"删除选中"按钮点击事件
		$("#delSelectedBtn").click(function () {
			var node = $("#roleList").DataTable().row('.selected');
			if (node.length == 1) {
				var data = node.data();
				
					remove(data.customId);
				/*  else {
					showNoty("该角色不可删除！", "error", false, 'top');
				} */
			} else {
				showNoty("请选择要删除的客户信息！", "error", false, 'top');
			}
		});
		
		$('#dlgRoleInfo').on('hidden.bs.modal', function (e) {
			//清空表单输入
			$("#roleInfoForm")[0].reset();
		});
		queryRole(0);
	});
	
	function toUpdate(id) {
		$("#dlgCustomInfos").modal({backdrop: 'static'});
		$("#dlgCustomInfos").modal("show");
		getRole(id);
		//window.location.href="custom/role_update.jsp?id=" + id;
	}
	
	function remove(id) {
		$('#dlgConfirmDelete').data('customId', id);
		$('#dlgConfirmDelete').modal('show');
	}
	
	//导出数据
	function exportAlarm() {
		
		var form = $("<form>");	//定义一个form表单
		form.attr("style", "display:none");
		form.attr("target", "");
		form.attr("method", "post");
		form.attr("action", <%=basePath%> + "DownloadCustomQuery");
	  
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
	function resetSearchCondition() {
		$("#txtSearchName").val("");
		queryRole(0);
		$("#hiddenOrgId").val("");
		$("#formAdvanceSearch")[0].reset();
		
	}
	//导入表格按钮 点击事件
	$("#importExcel").click(function(){
		ajaxFileUpload();
		$("#myPicture").val("");
	});
	function  exportshow(){
		$('#dlgConfirmexport').modal('show');
	}
	//上传表格
	function doExcelUpload(param){
		
		var fd = new FormData();
		if(param.files[0]){	
			
			fd.append('fileToUpload',param.files[0]);
			fd.append('table',"custom");
			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener("progress",uploadProgress,false);
			xhr.addEventListener("load", uploadComplete, false);  
		    xhr.addEventListener("error", uploadFailed, false);  
		    xhr.addEventListener("abort", uploadCanceled, false);  
		    xhr.open("POST", "excel/addcustom");//修改成自己的接口  
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
	       queryRole(0);
	       }else{
	    	   showNoty(res.commonMessage.errorMessage, "error", true, 'top');
	       }
		}  
		function uploadFailed(evt) {  
		}  
		function uploadCanceled(evt) {  
		}
		
	//时间插件使用	
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
	//发送删除请求
	function requestRemove() {
		var id = $('#dlgConfirmDelete').data('customId');
		
			
		if (id != undefined) {
			$("#btnCancelDelete").attr("disabled", "disabled");
			
			var requestData = $.param({"id" : id}, true);
			$.ajax({
				type: "POST",
				url: "custom/delete",
				data: requestData,
				dataType: "json",
				success: function(data) {
					if (data.success == true) {
						showNoty("删除成功!", "success", false, 'top');
						
						queryRole(0);
					} else {
						showNoty(data.errorMessage, "error", true, 'top');
					}		
				},
				error: function() {
					showNoty("您无权限操作", "error", true, 'top');
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
				
				$("#dlgRoleInfo").modal("show");
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
				$("#orgTreeGrid").treegrid('reload');
				$("#orgTreeGrid").treegrid('unselectAll');
			}
		});
	}
	
var gStart = 0;
var gEnd = 0;
var rowNum = -1;
function queryRole(start) {
	start = start || 0;
	
	var name = $("#txtSearchName").val();
	
	var param = {};
	param["name"] = name;
	param["start"] = start;
	param["countPerPage"] = 50;
	
	var requestData = $.param(param, true);
	
	$("#roleList").DataTable().clear().draw();
	drawPageInfo(0, 0, 0);
		
	var emptyPager = '<ul class="pagination">' + 
				'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
				'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
			'</ul>';
	$("#divPager").empty().append(emptyPager);
	
	$.post('custom/querypage', requestData, function(data) {
		
		var roles = data.customs;
		var page = data.page;
		
		gStart = page.start + 1;
		gEnd = gStart + page.limit - 1;
		var count = page.count;
		gStart = Math.min(gStart, count);
		gEnd = Math.min(gEnd, count);
		
		rowNum = gStart;
		
		$("#roleList").DataTable().rows.add( roles ).draw();
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
	var countPerPage = 50;
	var start = pageIndex * countPerPage;
	queryRole(start);
}
	
	function initRoleList() {
		$("#roleList").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			searching: false,
			info: false,
			//scrollY: "400px",
			scrollCollapse: false,
			"columnDefs": [{
				"targets": 0,
				"className": "align-center",
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
					"className": "align-center",
					"targets": 3,
					"data": null,
					"render": function (data, type, full, meta) {
						var day = moment(data.expireDateTime);
						return day.format('YYYY-MM-DD');
					}
				},{
				"targets": 4,
				"className": "align-center",
				"data": "name"
			}, {
				"className": "align-center",
				"targets": 5,
				"data": "linkManName"
			},{
				"className": "align-center",
				"targets": 6,
				"data": "linkManPhone"
			},{
				"className": "align-center",
				"targets": 7,
				"data": null,
				render: function(data, type, full, meta) {
					var status = data.type;
					
					var labelClass = 'label-warning';
					var statusStr = '未知';
					if (status =='1') {
						labelClass = 'label-success';
						statusStr = '正式';
					} else if (status == '2') {
						labelClass = 'label-danger';
						statusStr = '试用';
					}
					return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
				}
			},{
				"className": "align-center",
				"targets": 8,
				"data": "location"
			},{
				"className": "align-center",
				"targets": 9,
				"data": null,
				render: function(data, type, full, meta) {
					var status = data.state;
					
					var labelClass = 'label-warning';
					var statusStr = '未知';
					if (status =='1') {
						labelClass = 'label-success';
						statusStr = '可用';
					} else if (status == '2') {
						labelClass = 'label-danger';
						statusStr = '禁用';
					}
					return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
				}
			},{
				"className": "align-center",
				"targets": 10,
				"data": "note"
			},{
				"targets": 11,
				"data": null,
				"render": function ( data, type, full, meta ) {
					
					var html = '<ul class="table-controls"> ';
					//html += '<li><a href="javascript:getDetail(' + data.customId + ');" class="bs-tooltip" title="详情"><i class="icon-search"></i></a></li> ';
					
						html += '<shiro:hasPermission name="System.SecurityMgmt.Role.update"><li><a href="javascript:toUpdate(' + data.customId + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li></shiro:hasPermission> <shiro:hasPermission name="System.SecurityMgmt.Role.delete"><li><a href="javascript:remove(' + data.customId + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li></shiro:hasPermission> ';
					
					html += ' </ul>'
				  return html;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
			}]
		});
		
		$('#roleList').on('draw.dt', function () {
			$('#roleList').find(".bs-tooltip").tooltip({
				container: "body"
			});
			
			$('#roleList tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
					$(this).removeClass('selected');
				}
				else {
					$("#roleList").DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			} );
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
	
	
	var zTreeSettingCheck = {
		check: {
			enable: true,
			chkDisabledInherit: true
		},
		
		data: {
			key: {
				"children": "children",
				"name": "name"
			}
		}
	};

	var globalFuncTree = null;
	
	function getDetail(roleId) {
		$("#dlgRoleInfo").modal("show");
		var requestData = "id=" + roleId;
		$.post("role/getRole", requestData, function(data) {
			if (data.commonMessage.success) {
				var role = data.role;
				
				//$("#roleId").val(role.id);
				$("#roleName").val(role.name);
				$("#roleDescription").val(role.description);
				
				var funcs = data.funcs;
				_.forEach(funcs, function(n, key) {
					n.chkDisabled = true;
				});
				globalFuncTree = $.fn.zTree.init($("#funcTree"), zTreeSettingCheck, funcs);
				globalFuncTree.expandAll(true);
				
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
				//$("#orgTreeGrid").treegrid('reload');
				//$("#orgTreeGrid").treegrid('unselectAll');
			}
		});
	}
</script>
</head>
<body>
<div id="container" style="width:100%;">
  <div id="content">
    <div class="container">
	  <div style="padding-top:5px;">
      </div>
	  <div style="padding-top:5px;">
	 
				<div class="col-md-6">
				<shiro:hasPermission name="System.SecurityMgmt.Role.add">
                <button id="addBtn" class="btn btn-sm btn-success">新增客户</button>
                </shiro:hasPermission>
				<shiro:hasPermission name="System.SecurityMgmt.Role.delete">
                <button id="delSelectedBtn" class="btn btn-sm btn-primary">删除选中</button>
                </shiro:hasPermission>	
				<shiro:hasPermission name="System.SecurityMgmt.Role.export">
                <button id="btnOutPut" class="btn btn-sm btn-primary" type="button"  onclick="javascript:exportshow();">导出</button>
                </shiro:hasPermission>
                <shiro:hasPermission name="System.SecurityMgmt.Role.import">
                <button id="importExcel" class="btn btn-sm btn-primary" onclick="$('#excel').click();return false;">导入</button>
                </shiro:hasPermission>	
					
					
						<input type="file" id="excel" onchange="doExcelUpload(this);" style="display: none">
				</div>
		 <div class="col-md-6" style="float:right;">
					<div class="input-group">
						<input type="text" style="width:200px;float:right;margin-right:6px;" class="form-control" id="txtSearchName" placeholder="输入客户名称进行过滤" value="" />
						<span class="input-group-btn">
							<button id="btnSearch" class="btn btn-primary" type="button">搜索 </button>
							<button id="btnReset" style="margin-left:6px;" class="btn btn-primary" type="button"> 重置 </button>
						</span> 
					</div>
				</div>
				<div class="col-md-6">
					<div style="float:right;display:inline-block;width:270px;">
						<!-- <div class="input-group">
							<input type="text" class="form-control" id="txtSearchName" placeholder="输入角色名称进行过滤" value="" />
							<span class="input-group-btn">
								<button id="btnSearch" class="btn btn-primary" type="button"><i class="icon-search"></i> 过滤 </button>
							</span> 
						</div> -->
					</div>
					
				</div>
			</div>
	  
	  <div class="row">
        <div class="col-md-12">
		  <table id="roleList" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
                <thead>
                  <tr>
                   <th class="align-center">#</th>
                   <th class="align-center">创建时间</th>
				   <th class="align-center">修改时间</th>
					<th class="align-center">到期时间</th>
                    <th class="align-center">客户名称</th>
					<th class="align-center">联系人</th>
					<th class="align-center">联系方式</th>
					<th class="align-center">客户类别</th>
					<th class="align-center">客户地区</th>
					<th class="align-center">状态</th>
					<th class="align-center">备注</th>
					<th class="align-center">操作</th>
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
        <h4 class="modal-title">删除客户信息</h4>
      </div>
      <div class="modal-body">
        <p>您确定要删除客户信息吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmDelete" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelDelete" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<div id="dlgConfirmexport" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">导出客户信息</h4>
      </div>
      <div class="modal-body">
        <p>您确定要导出客户信息吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmexport" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelexport" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- /增加客户 -->
<script>
$(document).ready(function(){

	$("#confirmAddBtn").click(addRole);
	$("#resetFormBtn").click(resetForm);
	$("#backBtn").click(function() {
		$("#dlgCustomInfo").modal('hide');
	});
	//initDateField("#expiretime");
	//添加成功对话框
	$("#type").change(setcustomtime);
	$("#btnSuccessContinue").click(resetForm);
	$("#btnSuccessBack").click(backToList);
	$("#btnSuccessClose").click(function() {
		$("#dlgAddSuccess").modal('hide');
	});
	
	//initFuncTree();
	$("#location").regionpick({});
});

var zTreeSettingCheck = {
	check: {
		enable: true
	},
	
	data: {
		/*
		simpleData: {
			enable: true,
			idKey: "id",
			pIdKey: "pid"
		},
		*/
		key: {
			"children": "children",
			"name": "name"
		}
	}
	
	
};

var globalFuncTree = null;
function initFuncTree() {
	globalFuncTree = null;
	$.post("function/getFunctionByUser", "", function(data) {
		if (data) {
			//var carTree = data.carTree;
			globalFuncTree = $.fn.zTree.init($("#funcTree"), zTreeSettingCheck, data);
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

function setcustomtime(){
	var type=$("#type").val();
	if(type=="2"){
	var d = new Date();
	d.setMonth(d.getMonth()+3);
	var ctime=moment(d);
	$("#expiretime").val(ctime.format('YYYY-MM-DD'));
	$("#expiretime").attr("disabled",true); 
	}else{
		$("#expiretime").val("");
		$("#expiretime").removeAttr("disabled"); 
	}
}




function resetForm() {
	$("#addForm")[0].reset();
	$("#hiddenParentId").val("");
	$("#expiretime").removeAttr("disabled");
	globalFuncTree.checkAllNodes(false);
	$("#dlgAddSuccess").modal('hide');
}
function backToList() {
	window.location.href="custom/role.jsp";
}
function addRole() {
	var name = $("#roleName").val();
	var desc = $("#description").val();
	var linkname=$("#linkname").val();
	var linkphone=$("#linkphone").val();
	var type=$("#type").val();
	var expiretime=$("#expiretime").val();
	var location=$("#location").val();
	var state=$("#state").val();
	var note=$("#note").val();
     
	if (name == "") {
		showNoty("请填写客户名称!", "error", false, 'top');
		return;
	}
	
	if (linkname == "") {
		showNoty("请填写联系人!", "error", false, 'top');
		return;
	}
	if (linkphone == "") {
		showNoty("请填写联系方式!", "error", false, 'top');
		return;
	}
	if (location == "") {
		showNoty("请填写客户地区!", "error", false, 'top');
		return;
	}
	if (expiretime == "") {
		showNoty("请填写到期时间!", "error", false, 'top');
		return;
	}
	var role = {
		"name" : name,
		"description" : desc,
		"linkname" : linkname,
		"linkphone" : linkphone,
		"type" : type,
		"expiretime" : expiretime,
		"location" : location,
		"state" : state,
		"note" :note
		
	};
	
	//var funcNodes = globalFuncTree.getCheckedNodes(true);
	//var funcIds = extractCheckedId(funcNodes, "car");
	
	var requestParam = {
		"role" : role
		//"funcs": funcIds
	}

	$.ajax({
		url: 'custom/create',
		type: "POST",
		contentType: "application/json",
		dataType:"json",
		data : JSON.stringify(requestParam),
		success: function(data) {
			if (data.success) {
				$("#dlgCustomInfo").modal("hide");
				//queryUser(0);
				backToList();
			} else {
				showNoty(data.errorMessage, "error", true, 'top');
			}
		},
		error: function() {
			showNoty("您无权限操作", "error", true, 'top');
		}
	});
}

function extractCheckedId(treeNodes) {
	var ids = [];
	var tmp = null;
	for (var i = 0, len = treeNodes.length; i < len; i++) {
		tmp = treeNodes[i];
		ids.push(tmp.id);
	}
	
	return ids;
}

</script>
<div id="dlgCustomInfo" class="modal">
  <div class="modal-dialog modal-lg" style="width:50%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 新增客户</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
        <div class="col-md-12">

            <div class="widget-content">
              <form id="addForm" class="form-horizontal ">
				<div class="form-group">
                  <label class="col-md-2 control-label">客户名称 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <input type="text" id="roleName" name="roleName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
					<label class="col-md-2 control-label">联系人 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <input type="text" id="linkname" name="roleName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div> 
                </div>
                <div class="form-group">
                  <label class="col-md-2 control-label">联系方式 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <input type="text" id="linkphone" name="roleName" class="form-control required" maxlength="15" onKeyUp="value=value.replace(/\D/g,'')" onafterpaste="value=value.replace(/\D/g,'')"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
					 <label class="col-md-2 control-label">类别 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <select id="type" class="form-control required" >
										<option value="1">正式</option>
										<option value="2">试用</option>
									</select>
                  </div>
                </div>
                <div class="form-group" style="margin-bottom:30px ">
                  <label class="col-md-2 control-label">客户地区 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                <input type="text" id="location" name="region" class="form-control input-sm required" style="color:#555;background-color:#fff;cursor:pointer" readonly >
                  </div>
					 <label class="col-md-2 control-label">状态 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <select id="state" class="form-control required" >
										<option value="1">可用</option>
										<option value="2">禁用</option>
									</select>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-md-2 control-label">到期时间 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                 <input type="text" class="form-control" style="color:#555;background-color:#fff;cursor: pointer;" readonly id="expiretime" name="txtStartCreateDate" placeholder="到期日期">
                  </div>
					 <label class="col-md-2 control-label">备注 &nbsp :</label>
                  <div class="col-md-3">
                    <input type="text" id="note" name="roleName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
                </div>
            
				<div class="form-group" style="display:none">
                  <label class="col-md-2 control-label">描述 :</label>
                  <div class="col-md-3">
                    <textarea id="description" name="roleDescription" rows="3" class="form-control" maxlength="450"> </textarea>
                  </div>
                </div>
                 
              </form>
            
			  <div class="form-actions fluid">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="col-md-offset-2 col-md-10"> 
						<button id="backBtn" class="btn pull-right"> 取&nbsp;消 </button>
						<button id="resetFormBtn" class="btn btn-inverse pull-right"> 重&nbsp;置 </button>
						<button id="confirmAddBtn" class="btn btn-primary pull-right"> 确&nbsp;定 </button>
						<!--a href="javascript:void(0);" class="btn button-previous"> <i class="icon-angle-left"></i> Back </a> 
						<a href="javascript:void(0);" class="btn btn-primary button-next"> Continue <i class="icon-angle-right"></i> </a> 
						<a href="javascript:void(0);" class="btn btn-success button-submit"> Submit <i class="icon-angle-right"></i> </a--> 
					  </div>
                    </div>
                  </div>
                </div>
            </div>
          </div>
        
      </div>
		<!-- end -->
      </div>
 
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->











<script>
$(document).ready(function(){
	
	$("#update_confirmBtn").click(updateRole);
	$("#update_backBtn").click(function() {
		$("#dlgCustomInfos").modal('hide');
	});
	initDateField("#update_expiretime");
	//添加成功对话框
	$("#update_btnSuccessBack").click(backToList);
	$("#update_btnSuccessClose").click(function() {
		$("#update_dlgSuccess").modal('hide');
	});
	$("#update_location").regionpick({});
	$("#update_type").change(setcustomtimes);
});

function setcustomtimes(){
	var type=$("#update_type").val();
	if(type=="2"){
	var d = new Date();
	d.setMonth(d.getMonth()+3);
	var ctime=moment(d);
	$("#update_expiretime").val(ctime.format('YYYY-MM-DD'));
	$("#update_expiretime").attr("disabled",true); 
	}else{
		$("#update_expiretime").val("");
		$("#update_expiretime").removeAttr("disabled"); 
	}
}
var zTreeSettingCheck = {
	check: {
		enable: true
	},
	
	data: {
		/*
		simpleData: {
			enable: true,
			idKey: "id",
			pIdKey: "pid"
		},
		*/
		key: {
			"children": "children",
			"name": "name"
		}
	}
};

var globalFuncTree = null;

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

function ubackToList() {
	//window.location.href="custom/role.jsp";
	 window.history.back();
}
function updateRole() {
	var id = $("#update_roleId").val();
	var name = $("#update_roleName").val();
	var desc = $("#update_roleDescription").val();
	var linkname=$("#update_linkname").val();
	var linkphone=$("#update_linkphone").val();
	var type=$("#update_type").val();
	var expiretime=$("#update_expiretime").val();
	var location=$("#update_location").val();
	var state=$("#update_state").val();
	var note=$("#update_note").val();
	if (id == "") {
		showNoty("未指定要修改的客户!", "error", false, 'top');
		return;
	}
	if (name == "") {
		showNoty("请填写客户名称!", "error", false, 'top');
		return;
	}
	if (linkname == "") {
		showNoty("请填写联系人!", "error", false, 'top');
		return;
	}
	if (linkphone == "") {
		showNoty("请填写联系方式!", "error", false, 'top');
		return;
	}
	if (location == "") {
		showNoty("请填写客户地区!", "error", false, 'top');
		return;
	}
	if (expiretime == "") {
		showNoty("请填写到期时间!", "error", false, 'top');
		return;
	}
	var role = {
		"id" : id,
		"name" : name,
		"description" : desc,
		"linkname" : linkname,
		"linkphone" : linkphone,
		"type" : type,
		"expiretime" : expiretime,
		"location" : location,
		"state" : state,
		"note" :note
	};
	

	var requestParam = {
		"role" : role,
		//"funcs": funcIds
	}
	$.ajax({
		url: 'custom/update',
		type: "POST",
		contentType: "application/json",
		dataType:"json",
		data : JSON.stringify(requestParam),
		success: function(data) {
			if (data.success) {
				$("#dlgCustomInfos").modal("hide");
				showNoty(data.errorMessage, "success", false, 'top');
				queryRole(0);
			} else {
				showNoty(data.errorMessage, "error", true, 'top');
			}
		},
		error: function() {
			showNoty("您无权限操作", "error", true, 'top');
		}
	});
}





function extractCheckedId(treeNodes) {
	var ids = [];
	var tmp = null;
	for (var i = 0, len = treeNodes.length; i < len; i++) {
		tmp = treeNodes[i];
		ids.push(tmp.id);
	}
	
	return ids;
}

	function getRole(roleId) {
		var requestData = "id=" + roleId;
		$.post("custom/getcustom", requestData, function(data) {
			if (data.commonMessage.success) {
				var role = data.role;
				
				$("#update_roleId").val(role.customId);
				$("#update_roleName").val(role.name);
				$("#update_roleDescription").val(role.description);
				$("#update_linkname").val(role.linkManName);
				$("#update_linkphone").val(role.linkManPhone);
				$("#update_type").val(role.type);
				var day = moment(role.expireDateTime);
				//day.format('YYYY-MM-DD HH:mm:ss');
				$("#update_expiretime").val(day.format('YYYY-MM-DD'));
				$("#update_location").val(role.location);
				$("#update_state").val(role.state);
				$("#update_note").val(role.note);
			
				//globalFuncTree = $.fn.zTree.init($("#funcTree"), zTreeSettingCheck, funcs);
				//globalFuncTree.expandAll(true);
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
				//$("#orgTreeGrid").treegrid('reload');
				//$("#orgTreeGrid").treegrid('unselectAll');
			}
		});
	}
</script>


<div id="dlgCustomInfos" class="modal">
  <div class="modal-dialog modal-lg" style="width:50%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 修改客户</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
        <div class="col-md-12">
		  
            <div class="widget-header">
              <h5><i class="icon-angle-right"></i> 客户基本信息</h5>
            </div>
            <div class="widget-content">
              <form id="addForm" class="form-horizontal ">
              <input type="hidden" id="update_roleId" name="roleId" value="" />
				<div class="form-group">
                  <label class="col-md-2 control-label">客户名称 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <input type="text" id="update_roleName" name="roleName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
					<label class="col-md-2 control-label">联系人 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <input type="text" id="update_linkname" name="roleName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div> 
                </div>
                <div class="form-group">
                  <label class="col-md-2 control-label">联系方式 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <input type="text" id="update_linkphone" name="roleName" class="form-control required" maxlength="15" onKeyUp="value=value.replace(/\D/g,'')" onafterpaste="value=value.replace(/\D/g,'')"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
					 <label class="col-md-2 control-label">类别 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <select id="update_type" class="form-control required" >
										<option value="1">正式</option>
										<option value="2">试用</option>
									</select>
                  </div>
                </div>
                <div class="form-group" style="margin-bottom:30px">
                  <label class="col-md-2 control-label">客户地区 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                <input type="text" id="update_location" name="region" class="form-control input-sm required" style="color:#555;background-color:#fff;cursor:pointer" readonly >
                  </div>
					 <label class="col-md-2 control-label">状态 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                    <select id="update_state" class="form-control required" >
										<option value="1">可用</option>
										<option value="2">禁用</option>
									</select>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-md-2 control-label">到期时间 <span class="required">*</span> :</label>
                  <div class="col-md-3">
                 <input type="text" class="form-control" style="color:#555;background-color:#fff;cursor: pointer;" readonly id="update_expiretime" name="txtStartCreateDate" placeholder="到期日期">
                  </div>
					 <label class="col-md-2 control-label">备注 &nbsp :</label>
                  <div class="col-md-3">
                    <input type="text" id="update_note" name="roleName" class="form-control required" maxlength="50"> <label id="orNameErrorMSG" style="color:red;"></label>
                  </div>
                </div>
            
				<div class="form-group" style="display:none">
                  <label class="col-md-2 control-label">描述 :</label>
                  <div class="col-md-3">
                    <textarea id="update_roleDescription" name="roleDescription" rows="3" class="form-control" maxlength="450"> </textarea>
                  </div>
                </div>
                 
              </form>
            
			  <div class="form-actions fluid">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="col-md-offset-2 col-md-10"> 
						<button id="update_backBtn" class="btn pull-right"> 取&nbsp;消 </button>
						<button id="update_confirmBtn" class="btn btn-primary pull-right"> 确&nbsp;定 </button>
						<!--a href="javascript:void(0);" class="btn button-previous"> <i class="icon-angle-left"></i> Back </a> 
						<a href="javascript:void(0);" class="btn btn-primary button-next"> Continue <i class="icon-angle-right"></i> </a> 
						<a href="javascript:void(0);" class="btn btn-success button-submit"> Submit <i class="icon-angle-right"></i> </a--> 
					  </div>
                    </div>
                  </div>
                </div>
            </div>
          </div>
        
      </div>
		<!-- end -->
      </div>
 
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>

