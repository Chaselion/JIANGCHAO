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
<script type="text/javascript" src="<%=basePath%>plugins/zTree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/zTree/jquery.ztree.excheck-3.5.js"></script>

<script>
	$(document).ready(function() {
		
		initRoleList();
		
		$("#btnSearch").click(function () {
			
			queryRole(0);
		});
		
		$("#btnConfirmDelete").click(requestRemove);
		$('#btnCloseConfirmDelete').click(resetDelDlgBtns);
		
		//界面框架初始化 -- 开始
		App.init();
		Plugins.init();
		CarFormComponents.init();
		//界面框架初始化 -- 结束
		
		//添加按钮的点击事件
		$("#addBtn").click(function() {
			window.location.href="security/role/role_add.jsp";
		});
		
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
				showNoty("请选择要删除的角色信息！", "error", false, 'top');
			}
		});
		
		$('#dlgRoleInfo').on('hidden.bs.modal', function (e) {
			//清空表单输入
			$("#roleInfoForm")[0].reset();
		});
		
		queryRole(0);
	});
	
	function toUpdate(id) {
		window.location.href="security/role/role_update.jsp?id=" + id;
	}
	
	function remove(id) {
		$('#dlgConfirmDelete').data('customId', id);
		$('#dlgConfirmDelete').modal('show');
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
			scrollY: "400px",
			scrollCollapse: false,
			"columnDefs": [{
				"targets": 0,
				"data": null,
				"render": function ( data, type, full, meta) {
					return rowNum++;
					}
				},{
				"targets": 1,
				"className": "align-left",
				"data": "name"
			}, {
				"className": "align-left",
				"targets": 2,
				"data": "linkManName"
			},{
				"className": "align-left",
				"targets": 3,
				"data": "linkManPhone"
			},{
				"className": "align-left",
				"targets": 4,
				"data": "type"
			},{
				"className": "align-left",
				"targets": 5,
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.createDateTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
			},{
				"className": "align-left",
				"targets": 6,
				"data": null,
				"render": function (data, type, full, meta) {
					var day = moment(data.expireDateTime);
					return day.format('YYYY-MM-DD HH:mm:ss');
				}
			},{
				"className": "align-left",
				"targets": 7,
				"data": "location"
			},{
				"className": "align-left",
				"targets": 8,
				"data": "state"
			},{
				"className": "align-left",
				"targets": 9,
				"data": "description"
			},{
				"className": "align-left",
				"targets": 10,
				"data": "note"
			},{
				"targets": 11,
				"data": null,
				"render": function ( data, type, full, meta ) {
					
					var html = '<ul class="table-controls"> ';
					html += '<li><a href="javascript:getDetail(' + data.customId + ');" class="bs-tooltip" title="详情"><i class="icon-search"></i></a></li> ';
					
						html += '<li><a href="javascript:toUpdate(' + data.customId + ');" class="bs-tooltip" title="修改"><i class="icon-pencil"></i></a></li> <li><a href="javascript:remove(' + data.customId + ');" class="bs-tooltip" title="删除"><i class="icon-trash"></i></a></li> ';
					
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
<div id="container">
  <div id="content">
    <div class="container">
	  <div style="padding-top:5px;">
      </div>
	  
	  <div style="padding-top:5px;">
				<div class="col-md-6">
					<button id="addBtn" class="btn btn-sm btn-success">新增客户</button>
					<button id="delSelectedBtn" class="btn btn-sm btn-primary">删除选中</button>
				</div>
		
				<div class="col-md-6">
					<div style="float:right;display:inline-block;width:270px;">
						<div class="input-group">
							<input type="text" class="form-control" id="txtSearchName" placeholder="输入角色名称进行过滤" value="" />
							<span class="input-group-btn">
								<button id="btnSearch" class="btn btn-primary" type="button"><i class="icon-search"></i> 过滤 </button>
							</span> 
						</div>
					</div>
					
				</div>
			</div>
	  
	  <div class="row">
        <div class="col-md-12">
		  <table id="roleList" class="table table-highlight-head table-condensed table-bordered datatable" data-scroll-y="true">	<!-- app.js中暂时不清楚如何获取scrollY属性的值，在此加上来判断 -->
                <thead>
                  <tr>
                   <th class="align-center">序号</th>
                    <th class="align-center">客户名称</th>
					<th class="align-center">联系人</th>
					<th class="col-md-2 align-center">联系方式</th>
					<th class="align-center">客户类别</th>
					<th class="align-center">加入时间</th>
					<th class="align-center">到期时间</th>
					<th class="align-center">客户地区</th>
					<th class="align-center">状态</th>
					<th class="col-md-2 align-center">描述</th>
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

<div id="dlgRoleInfo" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 角色信息</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
        <div class="row">
			<div class="col-md-12">
			  <form id="roleInfoForm" class="form-horizontal">
					<div class="form-group">
					  <label class="col-md-2 control-label">名称 :</label>
					  <div class="col-md-10">
						<input type="text" id="roleName" name="roleName" class="form-control readonly-white" readonly maxlength="50"> 
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-2 control-label">描述 :</label>
					  <div class="col-md-10">
						<textarea id="roleDescription" name="roleDescription" rows="3" class="form-control readonly-white" readonly maxlength="450"> </textarea>
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-2 control-label">权限设置 :</label>
					  <div class="col-md-10">
						<div style="height:200px;width:100%;border:1px solid #d9d9d9;overflow-y:auto">
							<ul id="funcTree" class="ztree" ></ul>
						</div>
					  </div>
						 
					</div>
				  </form>
			</div>
		</div>
		<!-- end -->
	  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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

</body>
</html>

