<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	String basePath = request.getContextPath() + "/";
	User loginUser = SessionUtil.getCommonUserFromSession();
	Integer orgId = loginUser.getOrganizationId();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>统计报表</title>
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
<link href="<%=basePath%>bootstrap/css/bootstrap-dialog.min.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css">
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css">
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->

<script type="text/javascript"
	src="<%=basePath%>assets/js/libs/jquery-1.10.2.min.js"></script>
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
	src="<%=basePath%>plugins/daterangepicker/moment.min.js"></script>
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
	src="<%=basePath%>plugins/blockui/jquery.blockUI.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/select2/select2.min.js"></script>

<script type="text/javascript"
	src="<%=basePath%>plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/validation/messages_zh.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/echarts/echarts-plain.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/tabletools/TableTools.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/colvis/ColVis.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/columnfilter/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/DT_bootstrap.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/daterangepicker/moment-with-langs.min.js"></script>
<script type="text/javascript" src="<%=basePath%>mobile/js/echarts.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/plugins.form-components.js"></script>

<!-- 加载国际化语言 -->
<script type="text/javascript"
	src="<%=basePath%>plugins/datatables/i18n/zh_CN.js"></script>
<script type="text/javascript"
	src="<%=basePath%>plugins/echarts/echarts-plain-original-map.js"></script>
<script type="text/javascript" src="<%=basePath%>js/dateFormate.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap-dialog.min.js"></script>
<!-- <meta http-equiv="refresh" content="2">//页面自动刷新 -->
</head>
<style>
	select {
	    width: 100%;
	    height: 35px;
	    border: 1px solid #ccc;
	    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	}
</style>
<body>
	<div class="out-container">
		<div class="statistic-content">
			<h4>查询条件</h4>
			<hr>
			<div class="search-area">
				<div class="form-group" style="height: 30px">
					<label class="col-md-2 control-label">组织架构:</label>
					<div class="col-md-2">
						<select id="orgName">
						<option selected="selected" disabled="disabled"  style='display: none' value=''></option>  
						</select>
					</div>
					<label class="col-md-2 control-label">终端名称:</label>
					<div class="col-md-2">
						<select id="terminalName">
						<option selected="selected" disabled="disabled"  style='display: none' value=''></option>  
						</select>
					</div>
					<label class="col-md-2 control-label">终端序号:</label>
					<div class="col-md-2">
						<select id="termialNum">
						<option selected="selected" disabled="disabled"  style='display: none' value=''></option>  
						</select>
					</div>
				</div>
				<div class="form-group" style="height: 30px">
					<label class="col-md-2 control-label">起始时间(含):</label>
					<div class="col-md-2">
						<input type="text" class="form-control active"
								style="display: inline; width: 100%; color: #555; background-color: #fff; cursor: pointer;"
								id="txtStartDate" name="txtStartDate">
					</div>
					<label class="col-md-2 control-label">结束时间(含):</label>
					<div class="col-md-2">
						 <input type="text" required="required" class="form-control"
								style="display: inline; width: 100%; color: #555; background-color: #fff; cursor: pointer;"
								id="txtEndDate" name="txtEndDate">
					</div>
					<button onclick="searchData()" style="margin-right: 10px; float: right; background-color: dodgerblue; border: none; height: 30px; padding: 0px 20px; color: white; border-radius: 5px;">查
						询</button>
				</div>
			</div>
		</div>
		<div class="statistic-content" style="height:450px;width:97%">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active">
					<a href="#ups" data-toggle="tab">UPS</a>
				</li>
				<li><a href="#temp" data-toggle="tab">温湿度</a></li>
				
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="ups">
					<div id="echart" style="height:400px;width:97%"></div>
				</div>
				<div class="tab-pane fade" id="temp">
					<div id="sa" style="height:400px;width:100%"></div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function() {
			initDateField("#txtStartDate");
			initDateField("#txtEndDate");
			queryOrganization();
			queryTerminalName();
			queryTerminalNum();
		})
		
		function initDateField(id) {
			//设置回放日期
			var playDate = moment();
			$(id).daterangepicker({
				singleDatePicker : true,
				showDropdowns : true,
				startDate : playDate,
				timePicker : true,
				format : 'YYYY-MM-DD'
			}, function(start, end, label) {
			});
		}
		
		function queryOrganization(){
			var requestParam = {
				"orgId" : <%=orgId%>
			}
			$.post("Datagram/getOrgName",requestParam,function(data){
				var result = data.deviceClass;
				for(var i = 0;i<result.length;i++){
					$("#orgName").append("<option>" + result[i].name + "</option>")
				}
			})
		}
		
		function queryTerminalName(){
			var requestParam = {
					"orgId" : <%=orgId%>
			}
			$.post("Datagram/getTerName",requestParam,function(data){
				var result = data.deviceClass;
				for(var i = 0;i<result.length;i++){
					$("#terminalName").append("<option>" + result[i].terminalName + "</option>")
				}
			})
		}
		
		function queryTerminalNum(){
			$("#terminalName").change(function(){	
				var terminalName = $("#terminalName option:selected").val();
				var requestParam = {
					"terName" : terminalName
				}
				$.post("Datagram/getTerNum",requestParam,function(data){
					var result = data.deviceClass;
					var resultData = result[0].terminalNum;
					$("#termialNum").append("<option>" + resultData + "</option>")
				})
			})
		}

		function getDate(datestr){
			  var temp = datestr.split("-");
			  var date = new Date(temp[0],temp[1],temp[2]);
			  return date;
		}
		
		//转换日期类型，保持格式不变
		var formatDate = function (timeStr) {  
			var date = new Date(Date.parse(timeStr.replace(/-/g,  "/")));//先将日期转换成中国标准时间
			var y = date.getFullYear();  
		    var m = date.getMonth() + 1;  
		    m = m < 10 ? '0' + m : m;  
		    var d = date.getDate();  
		    d = d < 10 ? ('0' + d) : d;  
		    return y + '-' + m + '-' + d;   
		};
		
		
		//点击查询事件
		function searchData(){
			var startTime = $("#txtStartDate").val();
			var endTime = $("#txtEndDate").val();
			var terminalNum = $("#termialNum").val();
			if(startTime!=""&endTime!=""){
				var requestData = {
					"terminalNum":terminalNum,
					"startTime":startTime,
				    "endTime":endTime
				}
				console.log(requestData);

				$.post("Datagram/getData",requestData,function(data){
					var result = data.deviceClass;
					console.log(result);
					drawEchart(result,startTime,endTime);
				}) 
			}else{
				alert("请选择日期！");
			};
		}
		
		function drawEchart(result,startTime,endTime){
			var start = getDate(formatDate(startTime));
			var end = getDate(formatDate(endTime));
			var xData=[];//x轴数据
			while((end.getTime()-start.getTime())>=0){
				var year = start.getFullYear();
				var month = start.getMonth().toString().length==1?"0"+start.getMonth().toString():start.getMonth();
				var day = start.getDate().toString().length==1?"0"+start.getDate():start.getDate();
				xData.push(year+"-"+month+"-"+day);
				start.setDate(start.getDate()+1);
			}
			var yDataDE = [];//剩余电量
			var yDataWL = [];//负载
			var yDataIT = [];//机内温度
			var yDataIV = [];//输入电压
			var yDataOV = [];//输出电压
			var yDataIF = [];//频率
			for(var i = 0;i<result.length;i++){
				yDataDE.push(result[i].dumpEnergy);
				yDataWL.push(result[i].workLoad);
				yDataIT.push(result[i].innerTemperature);
				yDataIV.push(result[i].inputVoltage);
				yDataOV.push(result[i].outputVoltage);
				yDataIT.push(result[i].inputFrequency);
			}
			
			var chartStatus = echarts.init(document.getElementById('echart'));
			chartStatus.setOption(getLineSearchOption(xData,yDataDE,yDataWL,yDataIT,yDataIV,yDataOV,yDataIF));
		}
			/*--------------------------------------------------------------*/
			
			function getLineSearchOption(xData,yDataDE,yDataWL,yDataIT,yDataIV,yDataOV,yDataIF){
			var option =  {
				    title : {
				        text: 'UPS运行趋势',
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['剩余电量','负载','机内温度','输入电压','输出电压','频率']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data :xData
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				            axisLabel : {
				                formatter: '{value} °C'
				            }
				        }
				    ],
				    series : [
				        {
				            name:'剩余电量',
				            type:'line',
				            data:yDataDE,
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				        },
				        {
				            name:'负载',
				            type:'line',
				            data:yDataWL,
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				        },
				        {
				            name:'机内温度',
				            type:'line',
				            data:yDataIT,
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				        },
				        {
				            name:'输入电压',
				            type:'line',
				            data:yDataIV,
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				        },
				        {
				            name:'输出电压',
				            type:'line',
				            data:yDataOV,
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				        },
				        {
				            name:'频率',
				            type:'line',
				            data:yDataIF,
				            markPoint : {
				                data : [
				                    {type : 'max', name: '最大值'},
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				        },
				    ]
				};
				return option;
			}	                    
			
		</script>
	</div>

</body>
</html>