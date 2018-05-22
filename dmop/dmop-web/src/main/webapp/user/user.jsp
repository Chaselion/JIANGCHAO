<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	User loginUser = SessionUtil.getCommonUserFromSession();
	Integer userId = loginUser.getUserId();
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>用户管理</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css" rel="stylesheet" >
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
table.dataTable tbody tr.selected {
	background-color:#0081c2;
	color: white;
}

.btn-toggle-size {
	padding:6px 13px;
	height:39px;
	margin-bottom:-5px;
	display:inline-block;
	border-bottom:thin solid #fff;
}

.btn-collapse-border {
	border-top:thin solid #fff;
	border-left:thin solid #fff;
	border-right:thin solid #fff;
}

.btn-expand-border {
	border-top:thin solid #cfcfcf;
	border-left:thin solid #cfcfcf;
	border-right:thin solid #cfcfcf;
}

.longtext-ellipsis {
	max-width:300px;display: inline-block;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;
}

#dlgUserInfo div.form-group {
	margin-bottom: 5px;
}
#dlgUserInfo .modal-footer {
	padding-top: 6px;
	padding-bottom: 6px;
	margin-top: 0;
}
#dlgUserInfo .modal-body {
	padding: 2px 20px;
}
#dlgUserInfo .modal-header {
	padding: 8px 15px;
}
#dlgUserInfo .widget {
	margin-bottom: 5px;
}
#dlgUserInfo .widget .widget-header{
	margin-bottom: 8px;
}
#dlgUserInfo h5 {
	font-size:13px;
	font-weight:bold;
	margin-top:5px;
	margin-bottom:5px;
}

.readonly-white {
	color:#555 !important;
	background-color:#fff !important;
}
#dlgChooseParentOrg{position: absolute; 
                     z-index: 9999; }
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
<script type="text/javascript" src="<%=basePath%>js/car.plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>
<script type="text/javascript" 
	src="<%=basePath%>plugins/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
<script>
	$(document).ready(function() {
		moment.lang('zh-cn');
		
		initList();
		
		$("#btnSearch").click(function () {
			queryUser(0);
		});
		$("#btnAdvanceSearch").click(function () {
			queryUser(0);
		});
		
		$("#btnReset").click(resetSearchCondition);
		
		$("#orgName").focus(chooseParentOrg);
		$("#btnConfirmChooseParentOrg").click(chooseOrg);
	
		$("#btnToggleSearchPanel").click(toggleAdvanceSearchPanel);
		initDateField("#txtStartCreateDate");
		initDateField("#txtEndCreateDate");
		$('#dlgChooseParentOrg').draggable();
		$('#update_dlgChooseParentOrg').draggable();
		$("#btnConfirmDelete").click(requestRemove);
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		$("#btnConfirmexport").click(exportAlarm);
		//界面框架初始化 -- 开始
		App.init();
		Plugins.init();
		CarFormComponents.init();
		//界面框架初始化 -- 结束
		
		//添加按钮的点击事件
		$("#addBtn").click(function() {
			$("#dlgUserInfos").modal({backdrop: 'static'});
			$("#dlgUserInfos").modal("show");
			//window.location.href="user/user_add.jsp";
		});
		//修改密码事件取消
		$("#backOrgBtn").click(function() {
			$("#dlgOrgInfos").modal('hide');
			$('#oldpassword').val("");
			$('#newpassword').val("");
			$('#confirmpassword').val("");
		});
		//修改密码事件
		$("#confirmpsdBtn").click(function() {
			

			var oldpassword = $("#oldpassword").val();
			var newpassword = $("#newpassword").val();
			var confirmpassword = $("#confirmpassword").val();
			
			if (oldpassword == "") {
				showNoty("请填写原密码!", "error", false, 'top');
				return;
			}
			
			if (newpassword == "") {
				showNoty("请填写新密码!", "error", false, 'top');
				return;
			}
			if (confirmpassword == "") {
				showNoty("请确认新密码!", "error", false, 'top');
				return;
			}

			var requestData = {
				"oldpassword" : oldpassword,
				"newpassword" : newpassword,
				"confirmpassword" : confirmpassword
			}
			$.ajax({
				url : 'user/updatePwd',
				type : "POST",
				contentType : "application/json",
				dataType : "json",
				data : JSON.stringify(requestData),
				success : function(data) {
					if (data.success) {
						$("#dlgOrgInfos").modal("hide");
						//queryUser(0);
						$('#oldpassword').html('');
						$('#newpassword').html('');
						$('#confirmpassword').html('');
						backToList();
					} else {
						showNoty(data.errorMessage, "error", true, 'top');
					}
				},
				error: function() {
					showNoty("您无权限操作", "error", true, 'top');
				}
			});
			//window.location.href="user/user_add.jsp";
		});
		//"删除选中"按钮点击事件
		$("#delSelectedBtn").click(function () {
			var node = $("#userTable").DataTable().row('.selected');
			if (node.length == 1) {
				var data = node.data();
				//if (data.editable) {
					remove(data.id);
				//} else {
				//	showNoty("该用户不可删除！", "error", false, 'top');
				//}
			} else {
				showNoty("请选择要删除的用户！", "error", false, 'top');
			}
		});
		
		$("#initSelectedPsd").click(function () {
			var node = $("#userTable").DataTable().row('.selected');
			if (node.length == 1) {
				var data = node.data();
				$('#dlgConfirmpsd').modal('show');
			} else {
				showNoty("请选择要重置密码的用户！", "error", false, 'top');
			}
		})
		$("#btnConfirmpsd").click(function () {
			var node = $("#userTable").DataTable().row('.selected');
			if (node.length == 1) {
				var data = node.data();
				
					initpsd(data.id);
					$('#dlgConfirmpsd').modal('hide');
			} else {
				showNoty("请选择要重置密码的用户！", "error", false, 'top');
			}
		});
		
		queryUser(0);
	});

	
function toggleAdvanceSearchPanel() {
	$("#advSearchPanel").toggle();
	if ($("#advSearchPanel").is(":hidden")) {
		$("#btnToggleSearchPanel").text("更多搜索条件 ");
		$("#btnToggleSearchPanel").append("<i class='arrow icon-angle-down'></i>");
		$("#btnWrapperToggleSearchPanel").removeClass("btn-expand-border").addClass("btn-collapse-border");
		
		$("#useAdvanced").val('false');
	} else {
		$("#btnToggleSearchPanel").text("收起更多搜索 ");
		$("#btnToggleSearchPanel").append("<i class='arrow icon-angle-up'></i>");
		$("#btnWrapperToggleSearchPanel").removeClass("btn-collapse-border").addClass("btn-expand-border");
		
		$("#useAdvanced").val('true');
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
		format: 'YYYY-MM-DD'
	}, function(start, end, label) {
	});
}

function resetSearchCondition() {
	$("#txtSearchName").val("");
	$("#hiddenOrgId").val("");
	$("#formAdvanceSearch")[0].reset();
	queryUser();
}

var gStart = 0;
var gEnd = 0;
var rowNum = -1;
function queryUser(start) {
	start = start || 0;
	
	var name = $("#txtSearchName").val();
	var param = {"realname" : name};
	param["start"] = start;
	param["countPerPage"] = 10;
	
	var useAdv = $("#useAdvanced").val();
	
	if (useAdv == "true") {
		var username = $("#username").val();
		if (username != "") {
			param["username"] = username;
		}
		
		var orgId = $("#hiddenOrgId").val();
		if (orgId != "") {
			param["orgId"] = orgId;
		}
		
		var status = $("#selectStatus").val();
		if (status != "") {
			param["status"] = status;
		}
		
		var startCreateDate = $("#txtStartCreateDate").val();
		if (startCreateDate != "") {
			param["startCreateDate"] = startCreateDate;
		}
		
		var endCreateDate = $("#txtEndCreateDate").val();
		if (endCreateDate != "") {
			param["endCreateDate"] = endCreateDate;
		}
		
		if (startCreateDate != "" && endCreateDate != "") {
			var startCreateDateObj = moment(startCreateDate, 'YYYY-MM-DD');
			var endCreateDateObj = moment(endCreateDate, 'YYYY-MM-DD');
			
			if (startCreateDateObj.diff(endCreateDateObj) > 0) {
				showNoty("结束时间不应早于开始时间!", "error", false, 'top');
				return;
			}
		}
		
	}
	
	var requestData = $.param(param, true);
	
	//////////
	$("#userTable").DataTable().clear().draw();
	drawPageInfo(0, 0, 0);
		
	var emptyPager = '<ul class="pagination">' + 
				'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
				'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
			'</ul>';
	$("#divPager").empty().append(emptyPager);
	
	$.post('user/queryUser', requestData, function(data) {
		var users = data.users;
		var page = data.page;
		
		//
		gStart = page.start;
		var rowStart = page.start + 1;
		var rowEnd = rowStart + page.limit - 1;
		var count = page.count;
		rowStart = Math.min(rowStart, count);
		rowEnd = Math.min(rowEnd, count);
		
		rowNum = rowStart;
		
		$("#userTable").DataTable().rows.add( users ).draw();
		
		drawPageInfo(rowStart, rowEnd, count);
		
		var pager = getPagerHtml(page.currentPage, page.totalPage, "toPage");
		$("#divPager").empty().append(pager);
	});
}
	
	//修改用户
	function toUpdate(id) {
		$("#dlgUserInfoss").modal({backdrop: 'static'});
		$("#dlgUserInfoss").modal("show");
		ugetUser(id);
		//window.location.href="user/user_update.jsp?id=" + id;
	}
	//修改密码
	function toUpdatepsd() {
		$("#dlgOrgInfos").modal({backdrop: 'static'});
		$("#dlgOrgInfos").modal("show");
		
		//window.location.href="user/user_update.jsp?id=" + id;
	}
	function remove(id) {
		$('#dlgConfirmDelete').data('id', id);
		$('#dlgConfirmDelete').modal('show');
	}
	
	//发送删除请求
	function requestRemove() {
		var id = $('#dlgConfirmDelete').data('id');
			
		if (id != undefined) {
			$("#btnCancelDelete").attr("disabled", "disabled");
			
			var requestData = $.param({"id" : id}, true);
			$.ajax({
				type: "POST",
				url: "user/delete",
				data: requestData,
				dataType: "json",
				success: function(data) {
					if (data.success == true) {
						showNoty(data.errorMessage, "success", false, 'top');
						
						queryUser(gStart);
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
	
	
	function  exportshow(){
		$('#dlgConfirmexport').modal('show');
	}
	
	//导出数据
	function exportAlarm() {
		
		var form = $("<form>");	//定义一个form表单
		form.attr("style", "display:none");
		form.attr("target", "");
		form.attr("method", "post");
		form.attr("action", <%=basePath%> + "DownloadUserQuery");
		var txtSearchName = $("#txtSearchName").val();

			input = $("<input>");
			input.attr("type", "hidden");
			input.attr("name", "txtSearchName");
			input.attr("value", txtSearchName);
			form.append(input);
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
	//导入表格按钮 点击事件
	$("#importExcel").click(function(){
		ajaxFileUpload();
		$("#myPicture").val("");
	});
	
	//上传表格
	function doExcelUpload(param){
		
		var fd = new FormData();
		if(param.files[0]){	
			
			fd.append('fileToUpload',param.files[0]);
			fd.append('table',"user");
			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener("progress",uploadProgress,false);
			xhr.addEventListener("load", uploadComplete, false);  
		    xhr.addEventListener("error", uploadFailed, false);  
		    xhr.addEventListener("abort", uploadCanceled, false);  
		    xhr.open("POST", "excel/adduser");//修改成自己的接口  
		    xhr.send(fd);
		    var file=$("#excel").val();
		}
		//queryUser(0);
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
	       showNoty(res.commonMessage.errorMessage, "success", false, 'top');
	       queryUser(0);
		}  
		function uploadFailed(evt) {  
		}  
		function uploadCanceled(evt) {  
		}
	
	//重置密码
	function initpsd(id) {
		if (id != undefined) {
		var requestData = $.param({"id" : id}, true);
			$.ajax({
				type: "POST",
				url: "user/initpsd",
				data: requestData,
				dataType: "json",
				success: function(data) {
					if (data.success == true) {
						showNoty("重置密码成功！", "success", false, 'top');
						queryUser(gStart);
					} else {
						showNoty(data.errorMessage, "error", true, 'top');
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
				
				$("#dlgOrgForm").modal("show");
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
				$("#orgTreeGrid").treegrid('reload');
				$("#orgTreeGrid").treegrid('unselectAll');
			}
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
	queryUser(start);
}
	
	function initList() {
		$("#userTable").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			info: false,
			searching: false,
			//scrollY: "350px",
			scrollCollapse: false,
			"columnDefs": [{
				"targets": 0,
				"data": null,
				"className": "align-center",
				"render": function ( data, type, full, meta) {
				  //return "<input value=\"" + data.id + "\" type=\"checkbox\" class=\"uniform\">";
				  
				  return rowNum++;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					//$(td).addClass('checkbox-column');
				}
			}, {
				"className": "align-center",
				"targets": 1,
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.createTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
			}, {
				"className": "align-center",
				"targets": 2,
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.modifyTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
			}, {
				"className": "align-center",
				"targets": 3,
				"data": "username"
			}, {
				"className": "align-center",
				"targets": 4,
				"data": "realname"
			},{
				"className": "align-center",
				"targets": 5,
				"data": "permission"
				
			} , {
				"className": "align-center",
				"targets": 6,
				"data": null,
				render: function(data, type, full, meta) {
					var status = data.status;
					
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
			}, {
				"className": "align-center",
				"targets": 7,
				"data": null,
				"render": function(data, type, full, meta) {
					var alarmlevelid = data.alarmlevelid;
					
					var labelClass = 'label-warning';
					var statusStr = '未知';
					if (alarmlevelid =='1') {
						labelClass = 'label-warning';
						statusStr = '初级';
					} else if (alarmlevelid == '2') {
						labelClass = 'label-danger';
						statusStr = '中级';
					}else if (alarmlevelid == '3') {
						labelClass = 'label-danger';
						statusStr = '高级';
					}else if (alarmlevelid == '4') {
						labelClass = 'label-danger';
						statusStr = '紧急';
					}
					return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
				}
			},{
				"className": "align-left",
				"targets": 8,
				"data": null,
				render: function(data, type, full, meta) {
					/*
					var organizationPath = data.organizationPath;
					var count = organizationPath.names.length;
					var htmlLink = "";
					for (var i = 0; i < count; i++) {
						htmlLink += '<a href="' + organizationPath.links[i] + '" title="' + organizationPath.names[i] + '"><span class="longtext-ellipsis">' + organizationPath.names[i] + '</span></a>'
						if (i != count -1) {
							htmlLink += ' &raquo; ';
						}
					}
					return htmlLink;
					*/
					return '<span class="longtext-ellipsis" title="' + data.organization_path + '">' + data.organization_path + '</span>';
				}
			}, {
				"targets": 9,
				"data": null,
				"render": function ( data, type, full, meta ) {
					if (data.status == '1') {
						iconLock = 'icon-unlock';
						tipLock = '禁用';
						funcLock = 'lock';
					} else {
						iconLock = 'icon-lock';
						tipLock = '解禁';
						funcLock = 'unlock';
					}
					
					var htmlLock = '<li><a href="javascript:' + funcLock + '(' + data.id + ');" class="bs-tooltip" title="' + tipLock + '"><i class="' + iconLock + '"></i></a></li> ';
					//var htmlLock = '<a href="javascript:' + funcLock + '(' + data.id + ');" class="btn btn-xs bs-tooltip" title="' + tipLock + '"><i class="' + iconLock + '"></i></a>';
				
					/*
					var html = '<span class=\"btn-group\"> ';
					html += '<a href="javascript:getDetail(' + data.id + ');" class="btn btn-xs bs-tooltip" title="详情"><i class="icon-search"></i></a> ';
					if (data.editable) {
						html += '<a href="javascript:toUpdate(' + data.id + ');" class="btn btn-xs bs-tooltip" title="修改"><i class="icon-pencil"></i></a> ' + 
								htmlLock + '<a href="javascript:remove(' + data.id + ');" class="btn btn-xs bs-tooltip" title="删除"><i class="icon-trash"></i></a> ';
					}
					html += ' </span>';
					*/
					var html = '<ul class="table-controls">';
					html += '<li><a href="javascript:getDetail(' + data.id + ');" class="bs-tooltip" title="详情"><i class="icon-search"></i></a></li> ';
					if(data.id!=<%=userId%>){
						html += '<shiro:hasPermission name="System.SecurityMgmt.User.update"><li><a href="javascript:toUpdate(' + data.id + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li></shiro:hasPermission> ' + 
								htmlLock + '<shiro:hasPermission name="System.SecurityMgmt.User.delete"><li><a href="javascript:remove(' + data.id + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li></shiro:hasPermission> ';
					
					
						
						
					}
					
					html += '</ul>';
					return html;
				},
				"createdCell": function (td, cellData, rowData, row, col) {
					$(td).addClass('align-center');
				}
			}]
		});
		
		$('#userTable').on('draw.dt', function () {
			/*
			$('#userTable').find(".bs-tooltip").tooltip({
				container: "body"
			});
			*/
			
			$('#userTable tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
					$(this).removeClass('selected');
				}
				else {
					$("#userTable").DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			} );
		});
	}
	
	function lock(id) {
		updateStatus(id, 'user/lock');
	}
	
	function unlock(id) {
		updateStatus(id, 'user/unlock');
	}
	
	function updateStatus(id, url) {
		var requestData = $.param({"id" : id}, true);
			$.ajax({
				type: "POST",
				url: url,
				data: requestData,
				dataType: "json",
				success: function(data) {
					if (data.success == true) {
						showNoty(data.errorMessage, "success", false, 'top');
						
						queryUser(gStart);
					} else {
						showNoty(data.errorMessage, "error", true, 'top');
					}		
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
	
	
	
	function getDetail(id) {
		
		var requestData = "id=" + id + "&onlyUserOwn=true";
		$.post("user/getUserWithRole", requestData, function(data) {
			if (data.commonMessage.success) {
				var user = data.user;
				var org=data.organization;
				//$("#userId").val(user.id);
				$("#detail_username").val(user.username);
				$("#detail_realname").val(user.realname);
				$("#detail_mobilePhone").val(user.mobilePhone);
				$("#detail_email").val(user.email);
				$("#detail_txtParentOrg").val(org.name);
				var alarmStr = '未知';
				if (user.alarmLevelId =='1') {
					alarmStr = '初级';
				} else if (user.alarmLevelId == '2') {
					alarmStr = '中级';
				}else if (user.alarmLevelId == '3') {
					alarmStr = '高级';
				}else if (user.alarmLevelId == '4') {
					alarmStr = '紧急';
				}
				$("#detail_alarmlev").val(alarmStr);
				$("#detail_note").val(user.note);
				var statusStr = "";
				if (user.state =="1") {
					statusStr = '可用';
				} else if (user.state =="2"){
					statusStr = '禁用';
				}
				$("#detail_status").val(statusStr);
				
				//var roles = data.roles;
				//drawRoleTable(roles);
				//$(".form-horizontal input").removeAttr("readonly");
				$("#dlgUserInfo").modal("show");
				if(null!=user.permissionGroupId){
					getPermissionGroupById(user.permissionGroupId);
					initDataTree(user.permissionGroupId);					
				}else{
					$("#detail_permissionGroup").val("未授权");
				}
				
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
			}
		});
	}
	
	var theadPre = '<table id="roleList" ' + 
					'class="table table-highlight-head table-condensed table-striped table-bordered" ' +
					'data-scroll-y="true">' +
							'<thead>' +
								'<tr>' +
									'<th class="align-center">角色名称</th>' +
									'<th class="align-center">角色描述</th>' + 
								'</tr></thead>';
									
	function drawRoleTable(roles) {
		var rolesBody = [];
		for (var i = 0; i < roles.length; i++) {
			rolesBody.push('<tr><td>');
			rolesBody.push(roles[i].name);
			rolesBody.push('</td>');
			rolesBody.push('<td>');
			rolesBody.push(roles[i].description);
			rolesBody.push('</td></tr>');
		}
		rolesBody.push('</table>');
		
		var roleBodyStr = rolesBody.join('');
		
		var tableHtml = theadPre + roleBodyStr;
		$(tableHtml).replaceAll($("#roleList"));
	}
	function getPermissionGroupById(id){
		$.post("permissiongroup/get",{'groupId':id},function(data){
			if(data.commonMessage.success){
				$("#detail_permissionGroup").val(data.group.name);
			}else{
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
			}
		}).error(function(){
			showNoty("出现未知错误", "error", true, 'top');
		});
		
	}
	function initDataTree(id){
		$('#permissionItem')
		.treegrid(
				{
					url : 'permission/treegridById?id='+id+'',
					idField : 'id',
					treeField : 'name',
					fit : 'true',
					fitColumns : 'true',
					columns : [ [
							{
								field : 'name',
								title : '名称',
								width : '21%'
							},
							{
								field : 'show',
								title : '查询',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".show";

										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'show\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_show'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'export',
								title : '导出',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".export";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'export\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_export'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'add',
								title : '添加',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".add";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'add\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_add'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'import',
								title : '导入',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".import";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'import\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_import'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'delete',
								title : '删除',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".delete";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'delete\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_delete'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'update',
								title : '修改',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".update";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'update\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_update'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'py',
								title : '替补权限A',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code + ".py";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'py\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_py'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'px',
								title : '替补权限B',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code + ".px";

										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'px\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_px'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							}

					] ]
				});
	}	
	
</script>
</head>
<body>
<div id="container" style="width:100%">
  <div id="content">
    <div class="container">
		<div style="padding-top:5px;">
			
				<div id="btnWrapperToggleSearchPanel" class="btn-toggle-size" style="display:none">
					<a id="btnToggleSearchPanel" style="text-decoration:none" href="javascript:void(0);">更多搜索条件 <i class="arrow icon-angle-down"></i></a>
				</div>
				<div style="display:inline-block;">
				<shiro:hasPermission name="System.SecurityMgmt.User.add">
                <button id="addBtn" class="btn btn-sm btn-success">新增用户</button>
                </shiro:hasPermission>
					<shiro:hasPermission name="System.SecurityMgmt.User.delete">
                <button id="delSelectedBtn" class="btn btn-sm btn-primary" style="display: none">删除选中</button>
                </shiro:hasPermission>
					
					<button id="initSelectedPsd" class="btn btn-sm btn-primary" >重置密码</button>
					<shiro:hasPermission name="System.SecurityMgmt.User.export">
                <button id="btnOutPut" class="btn btn-sm btn-primary" type="button"  onclick="javascript:exportshow();">导出</button>
                </shiro:hasPermission>
					<shiro:hasPermission name="System.SecurityMgmt.User.import">
                <button id="importExcel" class="btn btn-sm btn-primary" onclick="$('#excel').click();return false;">导入</button>
                </shiro:hasPermission>
					
						<input type="file" id="excel" onchange="doExcelUpload(this);" style="display: none">
				</div>
					<div class="col-md-6" style="float:right;">
					<div class="input-group">
						<input type="text" style="width:200px;float:right;margin-right:6px;" class="form-control" id="txtSearchName" placeholder="输入姓名进行过滤" value="" />
						<span class="input-group-btn">
							<button id="btnSearch" class="btn btn-primary" type="button">搜索 </button>
							<button id="btnReset" style="margin-left:6px;" class="btn btn-primary" type="button"> 重置 </button>
						</span> 
					</div>
				</div>
			</div>
			<div id="advSearchPanel" style="display:none;margin-top:4px;padding-top:8px;border-top:thin solid #cfcfcf;">
				<form id="formAdvanceSearch" class="form-inline" role="form">
					<input type="hidden" id="useAdvanced" value="false" />
					<div class="form-group">
						<label class="control-label" for="username">登录名:</label>
						<input id="susername" name="username" type="text" class="form-control" style="width:160px;">
					</div>
					<div class="form-group">
						<label class="control-label" for="input18">所属单位:</label>
						<input type="hidden" id="hiddenOrgId" name="hiddenOrgId" value="" />
						<input id="orgName" name="orgName" type="text" class="form-control" style="width:160px;color:#555;background-color:#fff;cursor: pointer;">
					</div>
					<div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="selectStatus">账号状态:</label>
						<select id="selectStatus" name="selectStatus" class="form-control" style="color:black;width:80px;">
							<option value="ALL" selected>全部</option>
							<option value="AVAILABLE">可用</option>
							<option value="DISABLED">禁用</option>
						</select>
					</div>
					<div class="form-group" style="margin-left:10px;">
						<label class="control-label" for="txtPlayDate">创建日期:</label>
						<input type="text" class="form-control" style="width:80px;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtStartCreateDate" name="txtStartCreateDate" placeholder="开始日期">
						-
						<input type="text" class="form-control" style="width:80px;color:#555;background-color:#fff;cursor: pointer;" readonly id="txtEndCreateDate" name="txtEndCreateDate" placeholder="结束日期">
					</div>
					<button id="btnAdvanceSearch" class="btn btn-primary" type="button" > 搜索 </button>
					<button id="btnReset" class="btn btn-default" type="button"> 重置 </button>
				</form>
			</div>
	
			<!-- <hr class="hr-margin-sm" /> -->
	  
	  <div class="row">
        <div class="col-md-12">
		  <table id="userTable" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
                <thead>
                  <tr>
                    <th class="align-center" style="width:40px;">
						#
					</th>
					<th class="align-center col-md-2">创建时间</th>
					<th class="align-center col-md-2">修改时间</th>
					<th class="align-center col-md-1">登录名</th>
					<th class="align-center col-md-1">姓名</th>
					<th class="align-center col-md-1">权限名</th>
					<th class="align-center col-md-1">账号状态</th>
					<th class="align-center col-md-1">报警等级</th>
					<th class="align-center col-md-2">所属单位</th>
					<th class="align-center col-md-1">操作</th>
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
        <h4 class="modal-title">删除用户信息</h4>
      </div>
      <div class="modal-body">
        <p>您确定要删除此用户吗?</p>
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
        <h4 class="modal-title">导出用户信息</h4>
      </div>
      <div class="modal-body">
        <p>您确定要导出用户信息吗?</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmexport" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelexport" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgConfirmpsd" class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">重置用户密码</h4>
      </div>
      <div class="modal-body">
        <p>是否确定重置密码？（重置之后密码变为初始密码）</p>
      </div>
      <div class="modal-footer">
		<button id="btnConfirmpsd" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelpsd" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="dlgChooseParentOrg" class="modal">
  <div class="modal-dialog modal-lg" style="width:40%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 选择所属组织</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<table id="orgTreeGrid" >
		</table>
		<!-- end -->
      </div>
      <div class="modal-footer">
		<button id="btnConfirmChooseParentOrg" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div id="dlgUserInfo" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 用户详情</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
			<div class="col-md-12">
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 用户基本信息</h5>
						</div>
						
						<div class="widget-content" style="padding-top:5px;">
							<form id="addModal" class="form-horizontal">
								<input type="hidden" id="userId" name="userId" value="" />
								<div class="form-group">
								  <label class="col-md-2 control-label">登录名 :</label>
								  <div class="col-md-10">
									<input type="text" id="detail_username" name="detail_username" class="form-control input-sm readonly-white" readonly> 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">姓名 :</label>
								  <div class="col-md-10">
									<input type="text" id="detail_realname" name="detail_realname" class="form-control input-sm readonly-white" readonly > 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">手机 :</label>
								  <div class="col-md-10">
									<input type="text" id="detail_mobilePhone" name="detail_mobilePhone" class="form-control input-sm readonly-white" readonly > 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">电子邮箱 :</label>
								  <div class="col-md-10">
									<input type="text" id="detail_email" name="detail_email" class="form-control input-sm readonly-white" readonly > 
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">报警推送等级:</label>
								  <div class="col-md-10">
									<input type="text" id="detail_alarmlev" name="detail_alarmlev" class="form-control input-sm readonly-white" readonly > 
								
								  </div>
								</div>
								<div class="form-group">
								  <label class="col-md-2 control-label">备注 :</label>
								  <div class="col-md-10">
									<input type="text" id="detail_note" name="detail_note" class="form-control input-sm readonly-white" readonly > 
								  </div>
								</div>
				
								<div id="lableParentOrg" class="form-group">
									<label class="col-md-2 control-label">所属组织 :</label>
									<div class="col-md-10">
										<input id="detail_txtParentOrg" type="text" class="form-control input-sm readonly-white" readonly value="">
									</div>
								</div>
				
								<div class="form-group">
								  <label class="col-md-2 control-label">账号状态 :</label>
								  <div class="col-md-10">
									<input id="detail_status" type="text" class="form-control input-sm readonly-white" readonly value="">
								  </div>
								</div>
				
							</form>
						</div>
					</div>
					
					<div class="widget">
						<div class="widget-header">
							<h5><i class="icon-angle-right"></i> 权限设置</h5>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">用户权限 :</label>
							<div class="col-md-10">
								<input id="detail_permissionGroup" type="text" class="form-control input-sm readonly-white" readonly value="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label">权限详情 :</label>
							<div class="col-md-10">
								<div style="height: 260px; width: 100%; border: 1px solid #d9d9d9; overflow-y: auto">
									<table id="permissionItem" style="width: 1150px; height: 258px;"></table>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
		<!-- end -->
      </div>
      <div class="modal-footer">
		<!--button id="btnConfirmChooseParentOrg" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button-->
        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->





<!-- /新增用户弹出框 -->
<script>
	$(document).ready(function() {
		initRoleList();

		$("#txtParentOrg").click(chooseParentOrg);
		$("#btnConfirmChooseParentOrg").click(chooseOrg);

		$("#confirmAddBtn").click(addUser);
		$("#resetFormBtn").click(resetForm);
		$("#backBtn").click(function() {
			$("#dlgUserInfos").modal('hide');
		});
		
		//添加成功对话框
		$("#btnSuccessContinue").click(resetForm);
		$("#btnSuccessBack").click(backToList);
		$("#btnSuccessClose").click(function() {
			$("#dlgAddSuccess").modal('hide');
		});
		initPermissionGroup();
	});
	
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
	$(function(){ 
		  $('#password').keyup(function(e) {
		    // alert('---------');
		     //密码为八位及以上并且字母数字特殊字符三项都包括
		     var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
		    
		   //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
		     var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
		     var enoughRegex = new RegExp("(?=.{6,}).*", "g");
		     if (false == enoughRegex.test($(this).val())) {
		         $('#passstrength').html('密码过短');
		     } else if (strongRegex.test($(this).val())) {
		         $('#passstrength').className = 'ok';
		         $('#passstrength').html('强!');
		     } else if (mediumRegex.test($(this).val())) {
		         $('#passstrength').className = 'alert';
		         $('#passstrength').html('中!');
		     } else {
		         $('#passstrength').className = 'error';
		         $('#passstrength').html('弱!');
		     }
		     return true;
		  });
		});
	function resetForm() {
		$('#passstrength').html('');
		$("#addForm")[0].reset();
		$("#addForm").validate().resetForm();
		initPermissionItem(0);
		$("#hiddenOrgId").val("");
		$("#lableParentOrg").removeClass("has-error");
		$("#parentOrgErrorMSG").removeClass("has-error help-block");
		$("#dlgAddSuccess").modal('hide');
	}
	function backToList() {
		window.location.href = "user/user.jsp";
	}
	function initPermissionGroup(){
		$.post("permissiongroup/getPermissionGroupByOrganization",null,function(data){
			if(data.commonMessage.success){
				for(var i in data.groups){
					$("#permissionGroupSelect").append('<option value="'+data.groups[i].permissionGroupId+'">'+data.groups[i].name+'</option>')
				}
			}else{
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
			}
		}).error(function(){
			showNoty("出现未知错误", "error", true, 'top');
		});
	}
	function addUser() {
		var valid = $("#addForm").validate().form();
		var orgName = $("#txtParentOrg").val();
		if (orgName == "") {
			$("#lableParentOrg").addClass("has-error");
			$("#parentOrgErrorMSG").addClass("has-error help-block");
		}
		
		

		var username = $("#username").val();
		var password = $("#password").val();
		var realname = $("#realname").val();
		var mobilePhone = $("#mobilePhone").val();
		var email = $("#email").val();
		var orgId = $("#hiddenOrgId").val();
		var status = $("#status").val();
		var alarmlev = $("#alarmlev").val();
		var note = $("#note").val();
		var groupId = $("#permissionGroupSelect").val();
		if (username == "") {
			showNoty("请填写登录名!", "error", false, 'top');
			return;
		}
		
		if (password == "") {
			showNoty("请设置密码!", "error", false, 'top');
			return;
		}
		if (realname == "") {
			showNoty("请填写姓名!", "error", false, 'top');
			return;
		}
		if (mobilePhone == "") {
			showNoty("请填写手机!", "error", false, 'top');
			return;
		}
		var confirmPassword = $("#confirmPassword").val();
		if(password!=confirmPassword){
			showNoty("请重新确认密码!", "error", false, 'top');
			return;
		}
		if (email == "") {
			showNoty("请填写邮箱!", "error", false, 'top');
			return;
		}
		if (orgId == "") {
			showNoty("请填写所属组织!", "error", false, 'top');
			return;
		}
		if(groupId==0){
			showNoty("未授予用户权限", "error", true, 'top');
			return;
		}
		 var reg =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
         var bool = reg.test(email);
         if (bool == false) {
        	 showNoty("邮箱格式错误，请重新输入！", "error", true, 'top');
                 return;
         }
		if (!valid){
			return;}
		var user = {
			"username" : username,
			"password" : password,
			"realname" : realname,
			"mobilePhone" : mobilePhone,
			"email" : email,
			"orgId" : orgId,
			"status" : status,
			"alarmlev" : alarmlev,
			"note" : note,
			"groupId":groupId
		};

		

		var requestParam = {
			"user" : user
		}
		$.ajax({
			url : 'user/create',
			type : "POST",
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify(requestParam),
			success : function(data) {
				if (data.success) {
					$("#dlgUserInfos").modal("hide");
					//queryUser(0);
					$('#passstrength').html('')
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

	////////////
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

	function initRoleList() {
		$("#roleList")
				.data(
						"datatable",
						{
							language : dt_lang, //加载国际化语言
							processing : true,
							serverSide : false,
							ordering : false,
							paging : false,
							searching : false,
							info : false,
							scrollY : "200px",
							scrollCollapse : false,
							"columnDefs" : [
									{
										"targets" : 0,
										"data" : null,
										"render" : function(data, type, full,
												meta) {
											//return "<input value=\"" + data.id + "\" type=\"checkbox\" class=\"uniform\">";
											return "<input value=\"" + data.id + "\" type=\"checkbox\" >";
										},
										"createdCell" : function(td, cellData,
												rowData, row, col) {
											$(td).addClass('checkbox-column');
										}
									}, {
										"targets" : 1,
										"className" : "align-left",
										"data" : "name"
									}, {
										"className" : "align-left",
										"targets" : 2,
										"data" : "description"
									} ]
						});

		$('#roleList').on(
				'draw.dt',
				function() {
					$('#roleList').find(".bs-tooltip").tooltip({
						container : "body"
					});

					$('#roleList tbody').on(
							'click',
							'tr',
							function() {
								if ($(this).hasClass('selected')) {
									$(this).removeClass('selected');
								} else {
									$("#roleList").DataTable().$('tr.selected')
											.removeClass('selected');
									$(this).addClass('selected');
								}
							});
				});
	}
	function permissionGroupChange(){
		var choosen = $("#permissionGroupSelect").val();
		initPermissionItem(choosen);
	}
	function initPermissionItem(id){
		$('#permissionItema')
		.treegrid(
				{
					url : 'permission/treegridById?id='+id+'',
					idField : 'id',
					treeField : 'name',
					fit : 'true',
					fitColumns : 'true',
					columns : [ [
							{
								field : 'name',
								title : '名称',
								width : '21%'
							},
							{
								field : 'show',
								title : '查询',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".show";

										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'show\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_show'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'export',
								title : '导出',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".export";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'export\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_export'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'add',
								title : '添加',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".add";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'add\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_add'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'import',
								title : '导入',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".import";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'import\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_import'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'delete',
								title : '删除',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".delete";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'delete\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_delete'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'update',
								title : '修改',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".update";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'update\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_update'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'py',
								title : '替补权限A',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code + ".py";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'py\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_py'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'px',
								title : '替补权限B',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code + ".px";

										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'px\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_px'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							}

					] ]
				});
	}
	
	
</script>
<div id="dlgUserInfos" class="modal">
  <div class="modal-dialog modal-lg" style="width:60%" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 新增用户</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
			<div class="col-md-12">
					<div class="widget">
						<div class="widget-content" style="padding-top: 5px;">
								<form id="addForm" class="form-horizontal ">
									<div class="form-group" >
										<label class="col-md-2 control-label">登录名 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
											<input type="text" id="username" name="username"
												class="form-control " maxlength="32">
										</div>
										<label class="col-md-2 control-label">姓名 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
											<input type="text" id="realname" name="realname"
												class="form-control " maxlength="32">
										</div>
										
									</div>
									<div class="form-group">
									<label class="col-md-2 control-label">设置密码 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
											<input type="password" id="password" name="password"
												class="form-control " maxlength="32">
										</div>
										<label class="col-md-2 control-label"><div>
												<label id="passstrength" class=""
											style="float:left"></label></div>手机 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
											<input type="text" id="mobilePhone" name="mobilePhone"
												class="form-control required" maxlength="11" onKeyUp="value=value.replace(/\D/g,'')" onafterpaste="value=value.replace(/\D/g,'')" >
										
										</div>
									</div>
									<div class="form-group">
									<label class="col-md-2 control-label">确认密码 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
											<input type="password" id="confirmPassword"
												name="confirmPassword" class="form-control "
												 maxlength="32">
										</div>
										
										<label class="col-md-2 control-label">邮箱 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
											<input type="text" id="email" name="email"
												class="form-control email required" maxlength="100">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">报警等级 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
											<select id="alarmlev" class="form-control" >
										<option value="1">初级报警</option>
										<option value="2">中级报警</option>
										<option value="3">高级报警</option>
										<option value="4">紧急报警</option>
									</select>
										</div>
											 <label class="col-md-2 control-label">状态 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
											<select id="status" class="form-control required">
												<option value="1">可用</option>
												<option value="2">禁用</option>
											</select>
										</div>
									</div>

									<div id="lableParentOrg" class="form-group">
										<label class="col-md-2 control-label">所属组织 <span
											class="required">*</span> :
										</label>
										<div class="col-md-3">
												<input id="txtParentOrg" type="text" class="form-control"
													style="color: #555; background-color: #fff;" readonly
													value=""> <input id="hiddenOrgId" type="hidden"
													value=""> 
										
										</div>
										<label class="col-md-2 control-label">备注  &nbsp :</label>
										<div class="col-md-3">
											<input type="text" id="note" name="note"
												class="form-control" maxlength="100">
										</div>
										
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">用户权限 <span
											class="required">*</span> :</label>
										<div class="col-md-3">
											<select id="permissionGroupSelect" class="form-control" onchange="permissionGroupChange()">
												<option value="0">未选择</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">权限预览 :</label>
										<div class="col-md-10">
											<div  id="per" style="height: 180px; width: 100%; border: 1px solid #d9d9d9; overflow-y: auto">
												<table id="permissionItema"
													style=" height: 160px;"></table>
											</div>
										</div>
									</div>


								</form>
							</div>
					</div>
					
					<div class="form-actions fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-offset-2 col-md-10">
										<button id="backBtn" class="btn pull-right">取&nbsp;消
										</button>
										<button id="resetFormBtn" class="btn btn-inverse pull-right">
											重&nbsp;置</button>
										<button id="confirmAddBtn" class="btn btn-primary pull-right">
											确&nbsp;定</button>
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

<div id="dlgChooseParentOrg" class="modal">
		<div class="modal-dialog modal-lg" style="width:30px">
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

















<script>
$(document).ready(function(){
	$("#update_txtParentOrg").click(uchooseParentOrg);
	$("#update_btnConfirmChooseParentOrg").click(uchooseOrg);
	
	$("#update_confirmAddBtn").click(uupdateUser);
	$("#update_backBtn").click(function() {
		$("#dlgUserInfoss").modal('hide');
	});
	
	//添加成功对话框
	$("#update_btnSuccessBack").click(ubackToList);
	$("#update_btnSuccessClose").click(function() {
		$("#update_dlgAddSuccess").modal('hide');
	});
	
	uinitPermissionGroup();
	uqueryIfSearchStringExist();
});

function uqueryIfSearchStringExist() {
	/* var params = window.location.search;
	if (params != null && params != "") {
		params = params.substr(1);	//去掉?号
		var id = getUrlParam(params, "id");
		if (id != "") {
			ugetUser(id);
			
		}
	} */
}


function ubackToList() {
	window.location.href="user/user.jsp";
}
function uupdateUser() {
	var valid = $("#update_addForm").validate().form();
	var orgName = $("#update_txtParentOrg").val();
	if (orgName == "") {
		$("#update_lableParentOrg").addClass("has-error");
		$("#update_parentOrgErrorMSG").addClass("has-error help-block");
	}
	

	var id = $("#update_userId").val();
	var realname = $("#update_realname").val();
	var mobilePhone = $("#update_mobilePhone").val();
	var email = $("#update_email").val();
	var orgId = $("#update_hiddenOrgId").val();
	var status = $("#update_status").val();
	var alarmlev = $("#update_alarmlev").val();
	var note = $("#update_note").val();
	var groupId = $("#update_permissionGroupSelect").val();
	if (realname == "") {
		showNoty("请填写姓名!", "error", false, 'top');
		return;
	}
	if (mobilePhone == "") {
		showNoty("请填写手机!", "error", false, 'top');
		return;
	}
	if (email == "") {
		showNoty("请填写邮箱!", "error", false, 'top');
		return;
	}
	if (orgId == "") {
		showNoty("请填写所属组织!", "error", false, 'top');
		return;
	}
	if(groupId==0){
		showNoty("未授予用户权限", "error", true, 'top');
		return;
	}
	 var reg =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
     var bool = reg.test(email);
     if (bool == false) {
    	 showNoty("邮箱格式错误，请重新输入！", "error", true, 'top');
             return;
     }
     if (!valid) return;
	var user = {
		"id" : id,
		"realname" : realname,
		"mobilePhone" : mobilePhone,
		"email" : email,
		"orgId" : orgId,
		"status" : status,
		"alarmlev" :alarmlev,
		"note" :note,
		"groupId":groupId
	};

	var requestParam = {
		"user" : user,
	}
	$.ajax({
		url: 'user/update',
		type: "POST",
		contentType: "application/json",
		dataType:"json",
		data : JSON.stringify(requestParam),
		success: function(data) {
			if (data.success) {
				$("#dlgUserInfoss").modal("hide");
				showNoty(data.errorMessage, "success", false, 'top');
				queryUser(0);
			} else {
				showNoty(data.errorMessage, "error", true, 'top');
			}
		},
		error: function() {
			showNoty("您无权限操作", "error", true, 'top');
		}
	});
}

////////////
function uchooseParentOrg() {
	
	$('#update_dlgChooseParentOrg').modal('show');
	uinitOrgTreeGrid();
}
function uinitPermissionGroup(){
	$.post("permissiongroup/getPermissionGroupByOrganization",null,function(data){
		if(data.commonMessage.success){
			for(var i in data.groups){
				$("#update_permissionGroupSelect").append('<option value="'+data.groups[i].permissionGroupId+'">'+data.groups[i].name+'</option>')
			}
		}else{
			showNoty(data.commonMessage.errorMessage, "error", true, 'top');
		}
	}).error(function(){
		showNoty("出现未知错误", "error", true, 'top');
	});
}
function uinitOrgTreeGrid() {
		$('#update_orgTreeGrid').treegrid({
			width: 'auto',
			url:'organization_ui/ctreegrid',
			idField:'id',
			treeField:'name',
			columns:[[
				{field:'name',title:'名称',width:'40%'},
				{field:'description',title:'描述',width:'60%', 
					formatter: function(value, row, index){
						if (row.data){
							return row.data.description;
						} else {
							return value;
						}
					}
				}
			]],
			onDblClickRow : function(row) {
				chooseOrg();
			}
		});
	}

function uchooseOrg() {
	var node = $("#update_orgTreeGrid").treegrid("getSelected");
	if (node) {
		$("#update_txtParentOrg").val(node.name);
		$("#update_hiddenOrgId").val(node.id);
		$("#update_lableParentOrg").removeClass("has-error").addClass("has-success");
		$("#update_parentOrgErrorMSG").removeClass("has-error help-block");
	}
	$('#update_dlgChooseParentOrg').modal('hide');
}


	
	function ugetUser(id) {
		var requestData = "id=" + id;
		$.post("user/getUserWithRole", requestData, function(data) {
			if (data.commonMessage.success) {
				var user = data.user;
				var organization=data.organization;
				$("#update_userId").val(user.userId);
				$("#update_username").val(user.username);
				$("#update_realname").val(user.realname);
				$("#update_mobilePhone").val(user.mobilePhone);
				$("#update_email").val(user.email);
				//if (user.organization) {
					$("#update_hiddenOrgId").val(organization.organizationId);
					$("#update_txtParentOrg").val(organization.name);
				//}
				$("#update_status").val(user.state);
				$("#update_alarmlev").val(user.alarmLevelId);
				$("#update_note").val(user.note);
				//debugger;
				$("#update_permissionGroupSelect option").each(function(){
					if($(this).val()==user.permissionGroupId){
						$(this).attr('selected','selected');
					}	
				});
				if(null!=user.permissionGroupId){
					uinitPermissionItem(user.permissionGroupId);					
				}
				
			} else {
				showNoty(data.commonMessage.errorMessage, "error", true, 'top');
			}
		});
	}
	function upermissionGroupChange(){
		var groupId = $("#update_permissionGroupSelect").val();
		uinitPermissionItem(groupId);
		
	}
	function uinitPermissionItem(id){
		$('#update_permissionItem')
		.treegrid(
				{
					url : 'permission/treegridById?id='+id+'',
					idField : 'id',
					treeField : 'name',
					fit : 'true',
					fitColumns : 'true',
					columns : [ [
							{
								field : 'name',
								title : '名称',
								width : '21%'
							},
							{
								field : 'show',
								title : '查询',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".show";

										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'show\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_show'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'export',
								title : '导出',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".export";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'export\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_export'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'add',
								title : '添加',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".add";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'add\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_add'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'import',
								title : '导入',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".import";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'import\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_import'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'delete',
								title : '删除',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".delete";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'delete\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_delete'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'update',
								title : '修改',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code
												+ ".update";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'update\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_update'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'py',
								title : '替补权限A',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code + ".py";
										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'py\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_py'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							},
							{
								field : 'px',
								title : '替补权限B',
								width : '10%',
								formatter : function(value, row, index) {
									if (row.data) {
										var bits = row.data.bit;
										var bit = row.data.code + ".px";

										if (bits.indexOf(bit) > -1) {
											return '<input type="checkbox"  onchange="changePermission('+ row.id+ ','+ '\'px\''+ ')" checked="checked"  class="permissionItem" disabled="disabled"  id="'+ row.id+ '_px'+ '">';
										} else {
											return '<a class="glyphicon glyphicon-ban-circle" disable="disable" style="text-decoration:none;cursor:not-allowed;"></a>';
										}
									} else {
										return value;
									}
								}
							}

					] ]
				});
	}
</script>

<div id="dlgUserInfoss" class="modal">
  <div class="modal-dialog modal-lg" style="width:60%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 修改用户</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row" style="padding-top:5px;">
				<div id="addWrapper" class="col-md-12">
					<div class="widget">
						<div class="widget-content" style="padding-top:5px;">
							<form id="update_addForm" class="form-horizontal ">
								<input type="hidden" id="update_userId" name="userId" value="" />
								
								<div class="form-group">
								  <label class="col-md-2 control-label">登录名 :</label>
								  <div class="col-md-3">
									<input type="text" id="update_username" name="username" class="form-control" readonly> 
								  </div>
								  <label class="col-md-2 control-label">姓名 <span class="required">*</span> :</label>
								  <div class="col-md-3">
									<input type="text" id="update_realname" name="realname" class="form-control required" maxlength="32"> 
								  </div>
								</div>
						
								<div class="form-group">
								  <label class="col-md-2 control-label">手机 <span class="required">*</span> :</label>
								  <div class="col-md-3">
									<input type="text" id="update_mobilePhone" name="mobilePhone" class="form-control digits required" maxlength="11" onKeyUp="value=value.replace(/\D/g,'')" onafterpaste="value=value.replace(/\D/g,'')"> 
								  </div>
								  <label class="col-md-2 control-label">邮箱 <span class="required">*</span> :</label>
								  <div class="col-md-3">
									<input type="text" id="update_email" name="email" class="form-control email required" maxlength="100"> 
								  </div>
								</div>
							
								<div id="lableParentOrg" class="form-group">
									<label class="col-md-2 control-label">所属组织 <span class="required">*</span> :</label>
									<div class="col-md-3">
										
											<input id="update_txtParentOrg" type="text" class="form-control" style="color:#555;background-color:#fff;" readonly value="">
											<input id="update_hiddenOrgId" type="hidden" value="">
									
									</div>
									<label id="parentOrgErrorMSG" for="txtParentOrg" class="" style="display:none">必选字段</label>
								<label class="col-md-2 control-label">状态 <span class="required">*</span> :</label>
								  <div class="col-md-3">
									<select id="update_status" class="form-control required" >
										<option value="1">可用</option>
										<option value="2">禁用</option>
									</select>
								  </div>
								</div>
				
								<div class="form-group">
								  <label class="col-md-2 control-label">报警等级 <span class="required">*</span> :</label>
								  <div class="col-md-3">
									<select id="update_alarmlev" class="form-control required" >
										<option value="1">初级报警</option>
										<option value="2">中级报警</option>
										<option value="3">高级报警</option>
										<option value="4">紧急报警</option>
									</select>
								  </div>
								  <label class="col-md-2 control-label">备注  &nbsp :</label>
								  <div class="col-md-3">
									<input type="text" id="update_note" name="note" class="form-control" maxlength="11"> 
								  </div>
								</div>
						
								<div class="form-group">
										<label class="col-md-2 control-label">用户权限 : <span
											class="required">*</span> :</label>
										<div class="col-md-3">
											<select id="update_permissionGroupSelect" onchange="upermissionGroupChange()">
												<option value="0">未选择</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label">权限预览 :</label>
										<div class="col-md-10">
											<div
												style="height: 180px; width: 100%; border: 1px solid #d9d9d9; overflow-y: auto">
												<table id="update_permissionItem"
													style="width: 850px; height: 160px;"></table>
											</div>
										</div>
									</div>
							</form>
						</div>
					</div>
			
			  
					<div class="form-actions fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-offset-2 col-md-10"> 
									<button id="update_backBtn" class="btn pull-right"> 取&nbsp;消 </button>
									<!--button id="update_resetFormBtn" class="btn btn-inverse pull-right"> 重&nbsp;置 </button-->
									<button id="update_confirmAddBtn" class="btn btn-primary pull-right"> 确&nbsp;定 </button>
								</div>
							</div>
						</div>
					</div>
					
					
					<!--div class="widget box">
						<div class="widget-header">
							<h4><i class="icon-reorder"></i> 新增用户信息 ${titleLabel}</h4>
						</div>
						<div class="widget-content">
					  
					  
						</div>
					</div-->
				</div>
			</div>
		<!-- end -->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="update_dlgChooseParentOrg" class="modal">
  <div class="modal-dialog modal-lg" style="width:40%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 选择用户所属组织</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
			<div style="width:100%">
			
			</div>
		</div>
		<table id="update_orgTreeGrid" >
                
			</table>
		<!-- end -->
      </div>
      <div class="modal-footer">
		<button id="update_btnConfirmChooseParentOrg" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<div id="dlgOrgInfos" class="modal">
  <div class="modal-dialog modal-lg" style="width:600px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 修改密码</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
		<div class="row">
        <div class="col-md-12">
		  
            <div class="widget-content">
              <form id="addOrgForm" class="form-horizontal ">
				
				<div class="form-group">
                  <label class="col-md-2 control-label">原密码<span class="required">*</span> :</label>
                  <div class="col-md-5">
                    
						<input type="password" id="oldpassword" name="password"
												class="form-control " maxlength="32">
							
						
                  </div>
                 
                </div>
				<div class="form-group" >
                  <label class="col-md-2 control-label">新密码 <span class="required">*</span> :</label>
                  <div class="col-md-5">
                    <input type="password" id="newpassword" name="password"
												class="form-control " maxlength="32">
                  </div>
					 
                </div>
                <div class="form-group" >
                  <label class="col-md-2 control-label">确认密码 <span class="required">*</span> :</label>
                  <div class="col-md-5">
                    <input type="password" id="confirmpassword" name="password"
												class="form-control " maxlength="32">
                  </div>
					 
                </div>
			
              </form>
			  <div class="form-actions fluid">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="col-md-offset-2 col-md-10"> 
						<button id="backOrgBtn" class="btn pull-right"> 取&nbsp;消</button>
						<button id="confirmpsdBtn" class="btn btn-primary pull-right"> 确&nbsp;定 </button>
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

