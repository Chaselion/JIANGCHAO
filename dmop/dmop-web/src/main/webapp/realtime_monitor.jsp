<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%-- <%@ page session="true"%> --%>
<%
	String basePath = request.getContextPath() + "/";
	User loginUser = SessionUtil.getCommonUserFromSession();
	Integer custom_id=loginUser.getCustomId();
	long tenantId = 1;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>实时监控</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css"><![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css">
<!--[if IE 7]><link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css"><![endif]-->
<!--[if IE 8]><link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css"><![endif]-->
<link href="<%=basePath%>css/map-tool.css" rel="stylesheet" >
<link rel="stylesheet" href="css/bootstrap.css" />
<style>

@-webkit-keyframes change {
  0% {
    -webkit-transform: translateY(0px) rotate(0deg);
            transform: translateY(0px) rotate(0deg);
    border-radius: 0%;
  }
  50% {
    -webkit-transform: translateY(150px) rotate(180deg);
            transform: translateY(150px) rotate(180deg);
    border-radius: 50%;
  }
  100% {
    -webkit-transform: translateY(0px) rotate(360deg);
            transform: translateY(0px) rotate(360deg);
    border-radius: 0%;
  }
}

@keyframes change {
  0% {
    -webkit-transform: translateY(0px) rotate(0deg);
            transform: translateY(0px) rotate(0deg);
    border-radius: 0%;
  }
  50% {
    -webkit-transform: translateY(150px) rotate(180deg);
            transform: translateY(150px) rotate(180deg);
    border-radius: 50%;
  }
  100% {
    -webkit-transform: translateY(0px) rotate(360deg);
            transform: translateY(0px) rotate(360deg);
    border-radius: 0%;
  }
}

.height_100 {
	height: 100%;
}
/* 覆盖bootstrap中row的定义 */
.row {
	margin-left: 0;
	margin-right: 0;
}
.clearMarginPad {
	margin: 0 0;
	padding: 0 0;
}

.alarm {
	cursor: pointer;
}
.label-alarm-critical {
	background-color:#e25856
}
.label-alarm-major {
	background-color: rgb(255, 150, 0);
}
.label-alarm-minor {
	background-color: rgb(248, 252, 96);
}
.label-alarm-warning {
	background-color: #658db3;
}

.label-no-delivery {
	background-color:#aa0000;
}
.label-delivery {
	background-color:#29923f;
}

.newAlarm {
	border: 1px solid #A35853;
	border-bottom: 1px solid #A35853 !important;
}

.label-legend-text {
	color: #494444;
}

.label-car-charging {
	background-color:#658db3;
}
.label-car-stop {
	background-color:#ff9600;
}

ul {
	list-style:none; 
}	

#chargerStubList span {
	color:blue;
	padding-right:10px;
}

table.dataTable tbody tr.selected {
	background-color:#0081c2;
	color: white;
}
.content-left-text{
	float:right;
}

.BMap_cpyCtrl {  
    display: none;  
}  
  
.anchorBL {  
    display: none;  
}  

#search-area{
    float: left;
    position: absolute;
    z-index: 1;
    margin-left: 10px;
    margin-top: 10px;
}

#search-input{
	height:40px;
	border: none;
	width: 250px;
	padding: 0px 10px;
}

#search-btn{
    background: #2e77e5;
    height:40px;
    width:50px;
    margin-left: -4px;
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&amp;ak=bP6WvGH3fMdKMxhEDGlgLox7Nkze4c4R"></script>

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
<script type="text/javascript" src="<%=basePath%>plugins/daterangepicker/moment.min.js"></script>
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

<script type="text/javascript" src="<%=basePath%>plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/tabletools/TableTools.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/colvis/ColVis.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/columnfilter/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/DT_bootstrap.js"></script>
<!-- 加载国际化语言 -->
<script type="text/javascript" src="<%=basePath%>plugins/datatables/i18n/zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.form-components.js"></script>

<script type="text/javascript" src="<%=basePath%>plugins/cometd/org/cometd.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/cometd/jquery/jquery.cometd.js"></script>

<script type="text/javascript" src="<%=basePath%>js/alarm-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/noty-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/echarts/echarts-plain-original-map.js"></script>
<!-- 电子围栏所需js -->
<!-- <script type="text/javascript" src="js/jquery-3.1.0.min.js" ></script> -->
		<!-- 引入bootstrap.min.js -->
<!-- 		<script type="text/javascript" src="js/bootstrap.min.js" ></script> -->
		<!-- 百度地图 -->
   		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=bP6WvGH3fMdKMxhEDGlgLox7Nkze4c4R"></script>
		<!--加载鼠标绘制工具-->
		<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>		
		<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
		<!-- 引入vue.js的支持 -->
		<script src="https://unpkg.com/vue/dist/vue.js"></script>

<script type="text/javascript">
var cometdConfig = {
	contextPath: '${pageContext.request.contextPath}'
};
</script>
<script type="text/javascript">


(function($) {
	
   /*  var cometd = $.cometd;
 */
    $(document).ready(function() {
        charts();
        getStatus();
        getStatusLine();
    });
})(jQuery);

function onSubscribe(subscribeReply) {
	if (subscribeReply.successful) {
	}
}

function onAlarmMessage(message){
					var jqEmpty = $("#emptyAlarm");
					if (jqEmpty.length != 0) {
						jqEmpty.hide();
					}
					var alarm = message.data;
					var jqFirstOfList = $("#alarmList li:first-child");
					var htmlStr = [];
					functionStr = "showAlarmDetail('"+alarm.idStr+"',"+alarm.entityId+"," + alarm.alarmRaisedTime + ",this);";
					htmlStr.push('<li class="alarm newAlarm" onclick='+ functionStr +'><div class="col1">');
					htmlStr.push('<div class="content">');
					htmlStr.push('<div class="content-col1">');
					
					var labelClass = "";
					var alarmLevel = alarm.alarmLevel;
					if (alarmLevel == SEVERITY_CRITICAL) {
						labelClass = "label-alarm-critical";
					} else if (alarmLevel == SEVERITY_MAJOR) {
						labelClass = "label-alarm-major";
					} else if (alarmLevel == SEVERITY_MINOR) {
						labelClass = "label-alarm-minor";
					} else if (alarmLevel == SEVERITY_WARNING) {
						labelClass = "label-alarm-warning";
					}
					htmlStr.push('<div class="label ' + labelClass + '" ><i class="icon-warning-sign"></i></div>');
					htmlStr.push('</div>');
                    htmlStr.push('<div class="content-col2">');
					htmlStr.push('<div class="desc">');     
                    htmlStr.push(message.data.alarmReason);
					htmlStr.push('</div></div></div>');
                    htmlStr.push('</div>');          
                    htmlStr.push('<div class="col2">'); 
                    htmlStr.push('<div class="date"> ');
					var date = new Date();
					date.setTime(message.data.alarmRaisedTime);
					date = moment(date);
					var dateStr = date.format('HH:mm:ss');
					htmlStr.push(dateStr);
					htmlStr.push(' </div>'); 
                    htmlStr.push('</div></li>');
					var tmpHtmlStr = htmlStr.join('');
					var newJqObj = $(tmpHtmlStr).insertBefore(jqFirstOfList);
					gUnreadAlarmCount = gUnreadAlarmCount + 1;
					if (gUnreadAlarmCount > 100) {
						gUnreadAlarmCount = 100;
						$("#unreadAlarmCount").text("100+");
					} else {
						$("#unreadAlarmCount").text(gUnreadAlarmCount);
					}
					
					setTimeout(function() {
						//fadeOut逐渐改变被选元素的不透明度，从可见到隐藏
						//fadeIn逐渐改变被选元素的不透明度，从隐藏到可见						
						newJqObj.fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
					})
					
					//超过100，删除多出的部分
					var allAlarm = $("#alarmList li");
					var length = allAlarm.length;
					if (length > 100) {
						for (var i = 100; i < length; i++) {
							allAlarm.eq(i).remove();
						}
					}
					
}
	
	//告警跳转
	function showAlarmDetail(id,entityId,alarmRaisedTime,node) {
		if (parent.isFull) {
			parent.restoreFullscreen();
		} 
		removeNewAlarm(node);
		
		parent.showNavTab('<%=basePath%>car_alarm_detail.jsp?aid=' + id +'&sysCarId=' + entityId + '&alarmRaisedTime=' + alarmRaisedTime, '告警明细面板', ['远程维保','告警明细面板']);
		
	}
	
	
	function showOutletConfig(){
		$("#dlgOutletConfig").modal("show");
	}
	
	
	
	var chartCarStatus;
	var chartChargerStubStatus;
	function charts() {
		//报警统计（圆饼）
		var chartWrapperCarStatus = document.getElementById('chart_car_status');
		chartCarStatus = echarts.init(chartWrapperCarStatus);
		//在线统计（折线）
		var chartWrapperChargerStubStatus = document.getElementById('chart_charger_stub_status');
		chartChargerStubStatus = echarts.init(chartWrapperChargerStubStatus);
		

	}
	
	var colors_status = ['#999','#94b86e','#e25856'];
	var legends_status = ['离线','在线','告警'];

	var colors_status_car = colors_status.concat(['#658db3','#ff9600']);
	var legends_status_car = legends_status.concat([]);

	function makePieStatusOptions(serieName, unit, pieData) {
		return {
			tooltip : {
				trigger: 'item',
				formatter: "{a} <br/>{b} : {c} ({d}%)"
			},
			legend: {
				orient : 'vertical',
				x : 'left',
				data: legends_status_car	//['离线','在线','告警']
			},
			toolbox: {
				show : false
			},
			calculable : false,
			series : [
				{
					name: serieName,
					type:'pie',
					center: ['55%', '50%'],
					radius : ['40%', '75%'],
					clockWise: false,
					itemStyle : {
						normal : {
							label : {
								show : true,
								position : 'outter',
								// '{b}:\n{c} ({d}%)'
								formatter: function (a,b,c,d) {
									return b + '\n' + c + unit + ', ' + (d - 0).toFixed(0) + '%'
								}
							},
							labelLine : {
								show : true,
								length: 15
							},
							color: function(seriesIndex, series, dataIndex, data) {
								//{seriesIndex:x, series:xxx, dataIndex:y, data:yyy}
								return colors_status_car[series];	//['#999','#94b86e','#e25856']
							}
							
						},
						emphasis : {
							label : {
								show : true,
								position : 'center',
								textStyle : {
									fontSize : '15',
									fontWeight : 'bold'
								}
							}
						}
					},
					data: pieData
				}
			]
		};
	}
	
	function makeLineOptions(serieData, legendNames, categoryData) {
		var series = [];
		for (var i = 0; i < serieData.length; i++) {
			var tmpSerie = {
				name: serieData[i].name,
				type:'line',
				symbol:'emptyCircle',
				smooth:true,
				itemStyle: {
					normal: {
						color: serieData[i].color,
						areaStyle: {type: 'default'}
						/*,
						lineStyle: {        // 系列级个性化折线样式
							width: 2,
							type: 'dashed'
						}
						*/
					},
					emphasis: {
						color: serieData[i].color
					}
				},
				data: serieData[i].data
			};
			
			series.push(tmpSerie);
		}

		return {
			
			tooltip : {
				trigger: 'axis'
				//formatter: "{a} <br/>{b} : {c}"
			},
			legend: {
				orient : 'horizontal',
				//x : 'left',
				data:legendNames
			},
			toolbox: {
				show : false
			},
			calculable : false,
			xAxis: [{
				type: 'category',
				boundaryGap : false,
				splitLine: {show:false},
				axisLine: {
					show: false
				},
				axisTick: {
					interval: 1
				},
				data: categoryData
			}],
			yAxis: [{
				type: 'value',
				axisLine: {
					show: false
				}
			}],
			grid: {
				borderWidth: 0,
				x: 30,
				x2: 10,
				y: 35,
				y2: 25
			},
			series : series
		};
	}
 	
	function drawStatusCodeCount(type2StatusCount) {
		
	    var statusCount = type2StatusCount["status"];
		var chartData = getPieStatusData(statusCount);

		chartCarStatus.setOption(makePieStatusOptions('终端状态', '台', chartData), true);

	} 
	
	function drawAlarmDailyCount(alarmDailyCounts) {
		
		var serieName = ["离线", "在 线", "告警"];
		var alarmLineColor = ["#00BFFF", "#00FF7F", "#DC143C"];
		var categoryName = getXAIS();
		
		var offline = [];//0
		var online = [];//1
		var alarm = [];//2
		for (var i = 0; i < alarmDailyCounts.length; i++) {
			var adc = alarmDailyCounts[i];
			for(var j =0;j<adc.length;j++){
				switch (adc[j]['statusCode']) {
					case 0:
						offline.push(adc[j]['count']);
						break;
					case 1:
						online.push(adc[j]['count']);
						break;
					case 2:
						alarm.push(adc[j]['count']);
						break;

				}
			}
			
		}

		categoryName = categoryName.length < 1 ? ['暂无数据'] : categoryName;
	 	
		offline=offline.reverse();
		online=online.reverse();
		alarm=alarm.reverse();
		var lineData = [offline, online, alarm];
		
		var serieData = [];
		for (var i = 0; i < serieName.length; i++) {
			serieData.push({
				name: serieName[i],
				color: alarmLineColor[i],
				data: lineData[i]
			});
		}
	
		chartChargerStubStatus.setOption(makeLineOptions(serieData, serieName, categoryName), true);
		
	}
	var MSGCODE_SYSTEM_OFFLINE = 0;
	var MSGCODE_SYSTEM_ONLINE = 1;
	var MSGCODE_SYSTEM_ALARM = 2;

	var statusCodeLabels = {};
	statusCodeLabels["" + MSGCODE_SYSTEM_OFFLINE] = '离线';
	statusCodeLabels["" + MSGCODE_SYSTEM_ONLINE] = '在线';
	statusCodeLabels["" + MSGCODE_SYSTEM_ALARM] = '告警';

	var MSGCODE_CAR_STOP = 100001;
	var MSGCODE_CAR_CHARGING = 100003;

	var car_statusCodeLabels = {};
	car_statusCodeLabels["" + MSGCODE_SYSTEM_OFFLINE] = '离线';
	car_statusCodeLabels["" + MSGCODE_SYSTEM_ONLINE] = '在线';
	car_statusCodeLabels["" + MSGCODE_SYSTEM_ALARM] = '告警';
	function getPieStatusData(statusCount) {
		
		var data = [];
		for (var i = 0; i < statusCount.length; i++) {
			var code = statusCount[i].statusCode;
			var count = statusCount[i].count;
		
			isShowLabel = count > 0;
		
			data.push({
				value:count, 
				name:car_statusCodeLabels["" + code],
				itemStyle: {
					normal: {
						label: {
							show: isShowLabel
						},
						labelLine: {
							show: isShowLabel
						}
					}
				}
			});
		}
		return data;
	}
	
	function getLineStatusData(statusCount) {
		var data = [];
		for (var i = 0; i < statusCount.length; i++) {
			var code = statusCount[i].statusCode;
			var count = statusCount[i].count;
			
			isShowLabel = count > 0;
			
			data.push({
				value:count, 
				name:statusCodeLabels["" + code],
				itemStyle: {
					normal: {
						label: {
							show: isShowLabel
						},
						labelLine: {
							show: isShowLabel
						}
					}
				}
			});
		}
		
		return data;
	}
	
	function getStatus() {
		$.ajax({
			url: 'dashboard/getData',
			type: "POST",
			contentType: "application/json",
			dataType:"json",
			data : "",
			success: function(data) {
				drawStatusCodeCount(data["status_count"]);
			}
		});
	}
	
	function getStatusLine() {
		$.ajax({
			url: 'dashboard/getLineData',
			type: "POST",
			contentType: "application/json",
			dataType:"json",
			data : "",
			success: function(data) {
				console.log(JSON.stringify(data));
				drawAlarmDailyCount(data["statue"]);
			
			}
		});
	}
	
	function getXAIS(){
		
		var today = new Date();	
		
		var todaym1 = getYesterday(today);
		var todaym2 = getYesterday(todaym1);
		var todaym3 = getYesterday(todaym2);
		var todaym4 = getYesterday(todaym3);
		var todaym5 = getYesterday(todaym4);
		var todaym6 = getYesterday(todaym5);
		
		var todaystr = moment(today).format('MM-DD');
		var todaym1str = moment(todaym1).format('MM-DD');
		var todaym2str = moment(todaym2).format('MM-DD');
		var todaym3str = moment(todaym3).format('MM-DD');
		var todaym4str = moment(todaym4).format('MM-DD');
		var todaym5str = moment(todaym5).format('MM-DD');
		var todaym6str = moment(todaym6).format('MM-DD');
		
		return [todaym6str,todaym5str,todaym4str,todaym3str,todaym2str,todaym1str,todaystr];
	}
	
	function getYesterday(today){
		if(today instanceof Date){
			return new Date(today-24*60*60*1000);
		}
	}
</script>

</head>
<body>
<div id="hideTenantId" hidden="hidden"><%=tenantId %></div>
<div id="container" style="width:60%;position: absolute;margin-top:10px;padding-bottom:40px">					
		<div id="search-area">
			<input type="text" id="search-input" placeholder="输入终端名称搜索" list="mylist"/>
			<datalist id="mylist"></datalist>  
			 <button type="button" onclick="resetMapCenter()" id="search-btn" class="btn btn-default btn-sm">
          		<span class="glyphicon glyphicon-search" style="color:white;font-size: 20px;"></span>
        	</button>
		</div>
		<!-- <div id="content" class="height_100" style="margin:0;border:none;padding-bottom: 0px;">
			<div class="container height_100 clearMarginPad">
				<div class="row height_100"> 
					<div class="height_100" style="padding: 0 0;">-->
						<div id="baidumap"></div>
				<!--</div>
			 	</div>
			</div>
		</div> -->
	</div>
	
	<div id="right-contain"style="width: 39%;float: right;height: 700px;top: 0;margin-top:10px">
		<div id="pie-contain" style="width:100%;height: 350px ">
		<div class="widget box">
            <div class="widget-header">
              <h4><i class="icon-reorder"></i>报警统计</h4>
          
            </div>
            <div class="widget-content">
              <div id="chart_car_status" class="chart"></div>
            </div>
          </div>
		</div>
		<div id="line-contain" style="width:100%;height: 350px ">
		<div class="widget box">
            <div class="widget-header">
              <h4><i class="icon-reorder"></i>在线统计</h4>
            </div>
            <div class="widget-content">
              <div id="chart_charger_stub_status" class="chart"></div>
            </div>
          </div>
		</div>
	</div>

	<div id="infoPanel" class="col-md-4" style="padding: 0 0; background-color:#fff; position:absolute; z-index:1001;left:-410px; top:10px; bottom:10px; width:410px;">
		<div style="width:410px;float:left;height:100%;">
			<div class="row" style="height:50%;border-left:1px solid #d9d9d9;border-right:1px solid #d9d9d9;border-top:1px solid #305A80;">
				<div style="border-bottom:none;color:white;background-color:#305A80;padding-top:5px;padding-bottom:5px;">
					<div style="padding-bottom:5px;">
						<span class="label">总数:  <span id="status_car_total">0</span></span>
						<span class="label label-default">离线:  <span id="status_car_offline">0</span></span>
						<span class="label label-success">在线:  <span id="status_car_online">0</span></span>
						<span class="label label-car-stop">停车:  <span id="status_car_stop">0</span></span>
						<span class="label label-car-charging">充电:  <span id="status_car_charging">0</span></span>
						<span class="label label-danger">报警:  <span id="status_car_alarm">0</span></span>
					</div>
					<div>
						<form class="form-inline" role="form">
							<div class="row">
								<div class="form-group col-lg-6">
									<select id="subtenantId" name="subtenantId" class="form-control input-sm" style="width:100%"></select>
								</div>
								<div class="col-lg-6">
									<div class="input-group">
										<input type="hidden" id="carPageIndex" name="carPageIndex" value="0" />
										<input type="text" class="form-control" id="txtCarLicense" placeholder="输入车牌进行过滤"/>
										<span class="input-group-btn">
											<button id="btnSearchCar" class="btn btn-primary" style="width:54px;" type="button"><i class="icon-search"></i></button>
										</span>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div id="scrollTrack" data-height="220px" data-always-visible="1" data-rail-visible="0">
					<div id="carResult">
						<table id="carList" class="table table-condensed datatable">
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div style="margin:10px 0 0 5px;">
							<span id="spTotalPages"></span> 
						</div>
					</div>
					<div class="col-md-8">
						<div id="carResultPager" style="float:right; margin-right:3px;"></div>
					</div>
				</div>	
			</div>		
			<div class="row" style="height:50%;">
				<div class="widget box" style="margin-bottom:0;height:100%">
					<div class="widget-header" style="color:white;background-color:#1F6B2B;">
						<h5><i class="icon-bell-alt"></i> 告警信息 <span id="unreadAlarmCount" class="label label-danger" style="float:right;">0</span></h5>
					</div>
					<div class="widget-content">
						<div class="scroller" data-height="230px" data-always-visible="1" data-rail-visible="0">
							<ul id="alarmList" class="feeds clearfix">
								<li id="emptyAlarm">当前没有告警信息</li>
							</ul>
						</div>
						<div>
							仅显示最近100条 <!--button class="btn btn-xs btn-primary">查看全部</button-->
							<div style="float:right;">
								<span class="label label-alarm-critical label-legend-text">一级</span>
								<span class="label label-alarm-major label-legend-text">二级</span>
								<span class="label label-alarm-minor label-legend-text">三级</span>
								<span class="label label-alarm-warning label-legend-text">四级</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="infoPanel2" class="col-md-4" style="padding: 0 0; background-color:#fff; position:absolute; z-index:1001;left:-410px; top:10px; bottom:10px; width:410px;">
		<div style="width:410px;float:left;height:100%;">
			<div class="row" style="height:90%;border-left:1px solid #d9d9d9;border-right:1px solid #d9d9d9;border-top:1px solid #305A80;">
				<div style="border-bottom:none;color:white;background-color:#305A80;padding-top:5px;padding-bottom:5px;">
					<div style="padding-bottom:5px;">
						<span class="label">总数:  <span id="status_charger_stub_total">0</span></span>
						<span class="label label-default">离线:  <span id="status_charger_stub_offline">0</span></span>
						<span class="label label-success">在线:  <span id="status_charger_stub_online">0</span></span>
						<span class="label label-danger">报警:  <span id="status_charger_stub_alarm">0</span></span>
					</div>
					<div>
						<form class="form-inline" role="form">
							<div class="row">
								<div class="col-lg-6">
									<div class="input-group">
										<!--<input type="hidden" id="carPageIndex" name="carPageIndex" value="0" />-->
										<input type="text" class="form-control" id="textChargerStubLocalhost" placeholder="输入本机IP进行过滤"/>
									</div><!-- /input-group -->
								</div><!-- /.col-lg-6 -->
								<div class="col-lg-6">
									<div class="input-group">
										<input type="text" class="form-control" id="textAddress" placeholder="输入地址进行过滤"/>
										<span class="input-group-btn">
											<button id="btnSearchChargerStub" class="btn btn-primary" style="width:54px;" type="button"><i class="icon-search"></i></button>
										</span>
									</div><!-- /input-group -->
								</div><!-- /.col-lg-6 -->
							</div>
						</form>
					</div>
				</div>
				<div id="scrollTrack1" data-height="450px" data-always-visible="1" data-rail-visible="0">
					<div id="chargerStubResult">
					</div>
				</div>	
			</div>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-11">
					<div id="divPager" style="float: right;">
						<ul class="pagination">
							<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>
							<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>
						</ul>
					</div>
				</div>
			</div>	
		</div>	
	
<!-- 		<div id="mapSidebar2" style="margin-top:355px; width:10px; margin-left:410px; display:block;"> -->
<!-- 			<span style="padding-left:10px;padding-top:10px;font-size: 12px; word-wrap: break-word; letter-spacing: 10px;cursor:pointer;width:32px;height:140px;background-color:#e9e9e9; display:block; border:1px solid #d9d9d9;border-left:0; ">选择充电桩</span> -->
<!-- 		</div> -->

	</div>
<script>
var map = null;		//百度地图全局对象
var lon = null;
var lat = null;
//车牌label相对偏移位置
var labelOffset = new BMap.Size("-5","25");
var infoOffset = new BMap.Size("3","3");

var contentdispatch = null;	
var contenttrailer = null;
function initMap() {
	map = new BMap.Map("baidumap",{enableMapClick:false}); // 创建Map实例
// 	var point = new BMap.Point(118.82, 32.04); // 创建点坐标
	//var point = new BMap.Point(lon, lat); // 创建点坐标
	
	map.centerAndZoom(Location, 12); // 初始化地图,设置中心点坐标和地图级别。
	map.enableScrollWheelZoom(); //启用滚轮放大缩小

	//var point = new BMap.Point(116.404, 39.915);
	//map.centerAndZoom("南京", 15);
	//makemarks();
			
	var leftNaviCtrl = new BMap.NavigationControl();
	//map.addControl(leftNaviCtrl); //添加默认缩放平移控件
//电子围栏添加
// 	map.addControl(new BMap.CityListControl({
// 	     anchor: BMAP_ANCHOR_TOP_LEFT,
// 	     offset: new BMap.Size(20, 20),
// 	 }));
	//比例尺控件
	 map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}))
	 //定位控件
	/*  MAP.ADDCONTROL(NEW BMAP.GEOLOCATIONCONTROL({ANCHOR:BMAP_ANCHOR_BOTTOM_RIGHT,ENABLEAUTOLOCATION:TRUE,SHOWADDRESSBAR:TRUE})) */


}
var Location = null;
function getLocation(){
	$.ajax({
	type:'post',
	url:'custom/getLocation',
	data:'id='+<%=custom_id%>,
	dataType:'json',
	async:false,
	success:function(data){
	Location=data.location;
	},
	error:function(){     
	}
});
}

	function makemarks(){
		$.post('realtime/markers', "", function(data) {
			//map.centerAndZoom(data.location, 8);
		var longitude=data.longitude;
		var latitude=data.latitude;
		 //var pt = new BMap.Point(116.417, 39.909);
		 //var pt = new BMap.Point(longitude, latitude);
		// map.centerAndZoom(pt, 12);
			//var pt2 = new BMap.Point(116.407, 39.909);
			var myIcon = new BMap.Icon("images/ups.png", new BMap.Size(20,20));
			var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
			//var marker3 =new BMap.Marker(pt2,{icon:myIcon}); 
			map.addOverlay(marker2); 
			//map.addOverlay(marker3); 
			var opts = {
					  width : 300,     // 信息窗口宽度
					  height: 150,     // 信息窗口高度
					  title : "终端信息" , // 信息窗口标题
					  enableMessage:true,//设置允许信息窗发送短息
					  message:""
					}
		    var unitA="%";
		    var unitB="℃";
		    var unitC="V";
			var datime=new Date();
			var content = "<table>" + "<tr><td>" + "终端ID号："
			+ "</td><td colspan='3'>" +data.terminalId
			+ "</td></tr>"
			+ "<tr><td>" +"剩余电a量："
			+"</td><td>" +data.paramA+unitA
			+ "</td></tr>"
			+ "<tr><td>"+"机内温度："
			+ "</td><td>" +data.paramB+unitB
			+ "</td></tr>" 
			+ "<tr><td>"+"输出电压："
			+ "</td><td>" +data.paramC+unitC
			+ "</td></tr>"
			+ "<tr>"
			+ "<td>" + "当前时间："
			+ "</td><td>" +  moment(data.logtime).format('YYYY-MM-DD HH:mm:ss')+"</td></tr>" 
			+ "</table>"
			+ '<a href="javascript:showRealtime();">更多详细数据</a>';
			
			var content2 = "<table>" + "<tr><td>" + "终端ID号："
			+ "</td><td colspan='3'>" +data.terminalId
			+ "</td></tr>"
			+ "<tr><td>" +"温度："
			+"</td><td>" +data.paramA+unitA
			+ "</td></tr>"
			+ "<tr><td>"+"湿度："
			+ "</td><td>" +data.paramB+unitB
			+ "</td></tr>" 
			+ "<tr>"
			+ "<td>" + "当前时间："
			+ "</td><td>" +  moment(data.logtime).format('YYYY-MM-DD HH:mm:ss')+"</td></tr>" 
			+ "</table>";
			var t=data.terminalId;
			var infoWindow;
			var th="TH";
			if(t.indexOf(th)>=0){
				infoWindow = new BMap.InfoWindow(content2, opts);
			}else{
				infoWindow = new BMap.InfoWindow(content, opts);
			}
					marker2.addEventListener("click", function(){ 
						this.openInfoWindow(infoWindow); //开启信息窗口
					});
	});	
					setTimeout("makemarks()", 5000);
		
	}
	
	function showRealtime() {
			window.location.href = '<%=basePath%>ups_information.jsp?entityId=2' 
	}
	
document.onkeypress = function(){
	// 绑定回车键事件，发起查询车辆
	if (event.keyCode == 13) {
		//searchCar();
		return false;
	}
}

var gUnreadAlarmCount = 0;
function removeNewAlarm(node) {
	var jqNode = $(node);
	if (jqNode.hasClass("newAlarm")) {
		$(node).removeClass("newAlarm");
		gUnreadAlarmCount = gUnreadAlarmCount - 1;
		$("#unreadAlarmCount").text(gUnreadAlarmCount);
	}
}
</script>

<script>
// 地图工具条按钮
function initTool() {
	$(".ui-control-wrap span").each(function() {
		$(this).on("mouseover mouseout", function(event){
			if(event.type == "mouseover"){
				//鼠标悬浮
				$(this).addClass("active");
			}else if(event.type == "mouseout"){
				//鼠标离开
				$(this).removeClass("active");
			}
		});F
		
		$(this).on("click", function(event){
			var toolClick = $(this).attr("tool-click");
			onToolClick(toolClick);
		})
	});
}

function onToolClick(toolCmd) {
	if (toolCmd == "mark") {
		showOutletConfig();
	} else if (toolCmd == "fullscreen") {
		doScreen();
	}
}

//特殊点缓存数组
var outletsArray = new Array();

//获取pointType列表	
function getPointTypeList(){
		$.ajax({
		type:'post',
		url:'custom_point/getPointTypeList',
		data:'',
		dataType:'json',
		async:false,
		success:function(data){
		var customPointTypes  = data.customPointTypes;
			for(var i =0 ; i <customPointTypes.length;i++){
				var idStr = "list_" + customPointTypes[i].id;
				//alert(idStr);
				var str= "<ul><li id='list_" + customPointTypes[i].id + "' style = 'margin-top:15px;' >";
				str +="<div id='list_" + customPointTypes[i].id + "' style='cursor:pointer;' onclick='showSubList(this.id);'><img style='width:20px;height:18px;' src='images/open.png' />" + customPointTypes[i].pointTypeName +"</div>";
				str += "<ul id='list_" + customPointTypes[i].id + "_sub'  style='display:none;' ></ul></li></ul>";
				$("#customPointList").append(str);
			}
		}
	});
}

function getCustomPointList(){
		$.ajax({
		type:'post',
		url:'outlet/getOutlet',
		data:'',
		dataType:'json',
		async:false,
		success:function(data){
		var customPoints  = data.customPoints;
			for(var i =0 ; i <customPoints.length;i++){
				var str = "<li style = 'margin-top:5px;'><input id='' type='checkbox' checked='checked' value='"+ customPoints[i].iconName + ",";
				str += customPoints[i].customPointAddress + ","+ customPoints[i].customPointLng +",";
				str += customPoints[i].customPointLat+ ","+ customPoints[i].customPointName +"," +customPoints[i].id+","+"'  style='vertical-align:middle;' /> <span  style='vertical-align:middle;'>" + customPoints[i].customPointName + "</span></li>";
				$("#list_" + customPoints[i].customPointType + ">ul").append(str);	
			}	
		
		},
		error:function(){     
		}
	});
}
//显示特殊点坐标
function drawOutlets(point, icon, content, label) {
	var marker = new BMap.Marker(point, {
		icon : icon,
		enableMassClear:true
	});
	marker.setLabel(label);
	map.addOverlay(marker);
	
	var infoWindow = new BMap.InfoWindow(content, {enableMessage:false});
	map.addOverlay(marker);
	marker.addEventListener("click", function(type, target) {
		this.openInfoWindow(infoWindow);
	});
	var obj = {"marker": marker, "infoWindow":infoWindow};
	outletsArray.push(obj)
}
//清除未必选取的特殊点
function removeOutlet(marker) {
	map.removeOverlay(marker);
 }

 function showSubList(id){
	//alert(idStr + "123");
	if($("#" + id +"_sub").css('display') ==  'none'){
		$("#" + id +"_sub").css('display','block');
		$("#" + id + " img").attr('src','images/fold.png');
	}
	else{
		$("#" + id +"_sub").css('display','none');
		$("#" + id + " img").attr('src','images/open.png');
	}
}

function doScreen() {
	if (parent.isFull) {
		parent.restoreFullscreen();
		$(".fullscreen").removeClass("exit-fullscreen");
	} else {
		parent.toFullscreen();
		$(".fullscreen").addClass("exit-fullscreen");
	}
}

function showInfoPanel() {
	var isShown = $("#infoPanel").data("shown");
	if (isShown) {
		$("#infoPanel").data("shown", false);
		$("#infoPanel").animate({left:'-410px'});
		$("#infoPanel").css("z-index",1000);
	} else {
		$("#infoPanel").data("shown", true);
		$("#infoPanel").animate({left:'0px'});
		$("#infoPanel").css("z-index",1002);
	}
}

function showInfoPanel2() {
	var isShown = $("#infoPanel2").data("shown");
	if (isShown) {
		$("#infoPanel2").data("shown", false);
		$("#infoPanel2").animate({left:'-410px'});
	} else {
		$("#infoPanel2").data("shown", true);
		$("#infoPanel2").animate({left:'0px'});
	}
}

//////////////////////////// 新实现逻辑
function showRealtimeCarState(entityId,isThird,terminalId) {
    var str=terminalId.substr(9,3);
	if (parent.isFull) {
		parent.restoreFullscreen();
	}
	if (isThird) {
		parent.showNavTab('<%=basePath%>thirdparty_car_Information.jsp?entityId=' + entityId, 'UPS实时数据面板', ['UPS监控','UPS实时数据面板']);  
	} else {
		window.location.href= '<%=basePath%>ups_information.jsp?entityId=' + entityId + '&terminalId=\'' + terminalId +'\'';
	}
}

function showRealtimeChargerStub(id,terminalID){
	if (parent.isFull) {
		parent.restoreFullscreen();
	}
	
	parent.showNavTab('<%=basePath%>charger_stub_Information.jsp?id=' + id + '&terminalID=' + terminalID, '充电桩实时数据面板', ['UPS监控','充电桩实时数据面板']);
}

function selectTerminalIdById(entityId){
	var param={
			entityId:entityId
	};
	$.post("ups/get",param, function(data) {
		if (data.commonMessage.success) {
            return data.terminal_id;
		} else {
			showNoty(data.commonMessage.errorMessage, "error", false, "top");
		}
	});
}
////////  实时监控类

var RealtimeManager = function(map) {
	this.map = map;
	
	this.providerTypes = [];
	this.providers = {};
	
	this.makerCaches = {};	//type为键， 该类型下的所有marker为值
	this.redrawState = {};
}
RealtimeManager.prototype.addProvider = function(provider) {
	var type = provider.getType();
	this.providerTypes.push(type);
	this.providers[type] = {
			"provider": provider,
			"redraw": true
		};
};

RealtimeManager.prototype.clearMarkersOfType = function(type) {
	//清除缓存
	var markerObjs = this.makerCaches[type];
	this.makerCaches[type] = {};
	//销毁marker
	if (markerObjs) {
		var that = this;
		_.forEach(markerObjs, function(n, key) {
			that.map.removeOverlay(n.marker);
		});
	}
};

RealtimeManager.prototype.setRedrawState = function(state) {
	this.redrawState = state;
}

// 周期性查询
RealtimeManager.prototype.refresh = function() {
	var that = this;
	this.refreshTaskId = setTimeout(function() {
		that.refreshMapMarkers();
	}, 5000);
}

// 刷新逻辑

var mapPosition;
RealtimeManager.prototype.refreshMapMarkers = function() {
	var redrawState = {};
	//var requestStatusParam = {};
	var requestDataParam = {};
	for (var i = 0; i < this.providerTypes.length; i++) {
		var type = this.providerTypes[i];
		var provider = this.providers[type].provider;
		var redraw = this.providers[type].redraw;
		redrawState[type] = redraw;
		
		var ids = provider.getIds();
		requestDataParam[type] = ids;
		
	}
	
	var requestParam = {};
	requestParam["realtime_data"] = requestDataParam;
	this.setRedrawState(redrawState);
	
	var that = this;
	
	$.ajax({
		url: 'realtime/refreshMapMarkers',
		type: "POST",
		contentType: "application/json",
		dataType:"json",
		data : JSON.stringify(requestParam),
		success: function(data) {
			$("#mylist").empty();
			that.onRefreshMapMarkers(data["realtime_data"]);
			that.onRefreshStatusCodeCount(data["status_count"]);
			mapPosition = data["realtime_data"];
			var arr= mapPosition["elecve.car"];
			for(var i = 0;i<arr.length;i++){
				if(arr[i].name!=null){
					$("#mylist").append("<option>" + arr[i].name + "</option>");
				}
			}
		}
	});
};

RealtimeManager.prototype.onRefreshStatusCodeCount = function(data) {
	for (var i = 0; i < this.providerTypes.length; i++) {
		var type = this.providerTypes[i];
		var provider = this.providers[type].provider;
	}
};
RealtimeManager.prototype.onRefreshMapMarkers = function(data) {
	for (var i = 0; i < this.providerTypes.length; i++) {
		var type = this.providerTypes[i];
		var mapMarkers = data[type];
		var provider = this.providers[type].provider;
		var redraw = this.redrawState[type];
		if (redraw) {
			//清除缓存
			//清除marker
			this.clearMarkersOfType(type);
			
			this.drawMarksForType(type, provider, mapMarkers);
			
			this.providers[type].redraw = false;
		} else {
			this.refreshMarksForType(type, provider, mapMarkers);
		}
	}
	this.refresh();
};
RealtimeManager.prototype.drawMarksForType = function(type, provider, mapMarkers) {
	if (mapMarkers == null || mapMarkers === undefined) {
		return;
	}
	for (var i = 0; i < mapMarkers.length; i++) {
		this.drawMark(type, provider, mapMarkers[i]);
	}
};
RealtimeManager.prototype.drawMark = function(type, provider, item) {
	if (item.unknown) {
		return;
	}
		
	// 更新需要显示的内容和label样式
	var longitude = item.longitude;
	var latitude = item.latitude;
	var point = new BMap.Point(longitude, latitude);
	var content = provider.getInfoWindowContent(item);
	var label = new BMap.Label (item.name, {offset:labelOffset, enableMassClear:false});
	label.setStyle({
		background:"#808080",
		border:"none",
		padding:"2px",		
	});
	var tmpLabelStyle = provider.getLabelStyle(item);
	label.setStyle(tmpLabelStyle);
	var icon = provider.getIcon(item);
		
	this.drawMarkerAndCache(type, point, icon, content, label, item.id);
};

function resetMapCenter(){
	var terminalId = $("#search-input").val();
	var resultArr = mapPosition["elecve.car"];
	for(var i = 0;i<resultArr.length;i++){
	    if(terminalId==resultArr[i].name){
			var lg = resultArr[i].longitude;
			var lat = resultArr[i].latitude;
			map.centerAndZoom(new BMap.Point(lg, lat), 15);
		} 
	}
}

$("#search-input").on("change",function(){
	resetMapCenter();
	
})
RealtimeManager.prototype.drawMarkerAndCache = function(type, point, icon, content, label, id) {
	var marker = new BMap.Marker(point, {
		icon : icon,
		enableMassClear:false
	});
	marker.setLabel(label);
	var infoWindow = new BMap.InfoWindow(content, {offset:infoOffset,enableMessage:false});
	infoWindow.setWidth(300); 
	console.log(marker);
	map.addOverlay(marker);
	
	marker.addEventListener("click", function(type, target) {
		this.openInfoWindow(infoWindow);
	});

	var markerObj = {"id": id, "marker": marker, "infoWindow":infoWindow};
	this.setCachedMark(type, id, markerObj)
};
RealtimeManager.prototype.refreshMarksForType = function(type, provider, mapMarkers) {
	if (mapMarkers == null || mapMarkers == undefined) {
		return;
	}
	for (var i = 0; i < mapMarkers.length; i++) {	
		var item = mapMarkers[i];
		var cachedMarker = this.getCachedMark(type, item.id);
		if (cachedMarker != null) {
			// 更新需要显示的内容和label样式
			var jobContent = provider.getInfoWindowContent(item);
			var tmpLabelStyle = provider.getLabelStyle(item);
			var tmpIcon = provider.getIcon(item);
		
			cachedMarker.infoWindow.setContent(jobContent);
			cachedMarker.marker.getLabel().setStyle(tmpLabelStyle);
			cachedMarker.marker.setIcon(tmpIcon);
			
			//更新marker的位置
			if (provider.isMobileMarker()) {
				var longitude = item.longitude;
				var latitude = item.latitude; 
				var point = new BMap.Point(longitude, latitude);
				
				cachedMarker.marker.setPosition(point);
			}
		} else {
			this.drawMark(type, provider, item);
		}
	}
};

RealtimeManager.prototype.getCachedMark = function(type, markerId) {
	var cachedMarkers = this.makerCaches[type];
	if (cachedMarkers) {
		var marker = cachedMarkers[markerId];
		return marker;
	}
	return null;
};
RealtimeManager.prototype.setCachedMark = function(type, markerId, markerObj) {
	var cachedMarkers = this.makerCaches[type];
	if (cachedMarkers == null) {
		cachedMarkers = {};
		this.makerCaches[type] = cachedMarkers;
	}
	cachedMarkers[markerId] = markerObj;
};
RealtimeManager.prototype.markForRedraw = function(type) {
	this.providers[type].redraw = true;
};
RealtimeManager.prototype.toMarkerAndOpenWindow = function(type, id) {
	var markerObj = this.getCachedMark(type, id);
	if (markerObj != null && markerObj != undefined) {
		markerObj.marker.openInfoWindow(markerObj.infoWindow);
	}
};

var MSGCODE_SYSTEM_OFFLINE = 0;
var MSGCODE_SYSTEM_ONLINE = 1;
var MSGCODE_SYSTEM_ALARM = 2;


/////Car//////
var MSGCODE_CAR_STOP = 100001;
var MSGCODE_CAR_CHARGING = 100003;
var CarProvider = function(realtimeManager) {
	this.realtimeManager = realtimeManager;
	this.statusCodes = [MSGCODE_SYSTEM_OFFLINE, MSGCODE_SYSTEM_ONLINE, MSGCODE_SYSTEM_ALARM, MSGCODE_CAR_STOP, MSGCODE_CAR_CHARGING];
	this.statusCodeLabels = {};
	this.statusCodeLabels["" + MSGCODE_SYSTEM_OFFLINE] = 'status_car_offline';
	this.statusCodeLabels["" + MSGCODE_SYSTEM_ONLINE] = 'status_car_online';
	this.statusCodeLabels["" + MSGCODE_SYSTEM_ALARM] = 'status_car_alarm';
	this.statusCodeLabels["" + MSGCODE_CAR_CHARGING] = 'status_car_charging';
	this.statusCodeLabels["" + MSGCODE_CAR_STOP] = 'status_car_stop';
	
	//this.getAllCompany();
	
	this.ids = [];
	
	var that = this;
	$("#btnSearchCar").click(function() {
		that.search();
	});
	
	$('#txtCarLicense').bind('keypress',function(event){
		if(event.keyCode == "13") {
			that.search();
		}
	});
};
CarProvider.prototype.init = function() {
	this.search();
};

//获取车辆信息，并弹出修改对话框
CarProvider.prototype.getAllCompany = function() {
	$.post("tenant/getSubtenantOfTenant", "", function(data) {
		if (data.commonMessage.success) {
			var subtenants = data.subtenants;
			var jqCompanyList = $("#subtenantId");
			jqCompanyList.append('<option value="-1">= 全部租户 =</option>');
			for (var i = 0; i < subtenants.length; i++) {
				var tmpCom = subtenants[i];
				jqCompanyList.append('<option value="' + tmpCom.id + '">' + tmpCom.name + '</option>');
			}
		} else {
			showNoty(data.commonMessage.errorMessage, "error", false, 'top');
		}
	});
};
CarProvider.prototype.formatDate = function(date){
	//var d =  new Date(date);
	//return d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();  	
	return moment(date).format('YYYY-MM-DD HH:mm:ss');
};
CarProvider.prototype.getType = function() {
	return "elecve.car";
};
CarProvider.prototype.isMobileMarker = function() {
	return true;
};
CarProvider.prototype.getInfoWindowContent = function(mapMarker) {
	var data = mapMarker.data;
	    paramA="剩余电量：";
	    paramB="机内温度：";
	    paramC="输出电压：";
	    unitA="%";
	    unitB="℃";
	    unitC="V";
        var content;
	    var t=data.terminalId;
		var infoWindow;
		var th="TH";
		if(t.indexOf(th)>=0){
			content = "<table>" + "<tr><td>" + "终端ID号："
			+ "</td><td colspan='3'>" + data.terminalId
			+ "</td></tr>"
			+ "<tr><td>" + "温度：" 
			+"</td><td>" + data.paramA+"&nbsp;"+unitB
			+ "</td></tr>"
			+ "<tr><td>"+"湿度："
			+ "</td><td>" + data.paramB+"&nbsp;"+unitA
			+ "</td></tr>" 
			+ "<tr>"
			+ "<td>" + "当前时间："
			+ "</td><td>" + moment(data.logtime).format('YYYY-MM-DD HH:mm:ss') + "</td></tr>" 
			+ "</table>";
		}else{
			
		content = "<table>" + "<tr><td>" + "终端ID号："
					+ "</td><td colspan='3'>" + data.terminalId
					+ "</td></tr>"
					+ "<tr><td>" + paramA 
					+"</td><td>" + data.paramA+"&nbsp;"+unitA
					+ "</td></tr>"
					+ "<tr><td>"+paramB
					+ "</td><td>" + data.paramB+"&nbsp;"+unitB
					+ "</td></tr>" 
					+ "<tr><td>"+paramC
					+ "</td><td>" + data.paramC+"&nbsp;"+unitC
					+ "</td></tr>"
					+ "<tr>"
					+ "<td>" + "当前时间："
					+ "</td><td>" + moment(data.logtime).format('YYYY-MM-DD HH:mm:ss') + "</td></tr>" 
					+ "</table>"
					+ '<a href="javascript:showRealtimeCarState(' + mapMarker.id +',' + data.isThird +',\''+data.terminalId+'\');">更多详细数据</a>';
}

					return content;
				
};
//求每辆车的调度单号
function getdispatchbylorrycar(xxid){
	$.ajax({
		type:'post',
		url:'dispatch/getlorrycarId',
		data:'id='+xxid,
		dataType:'json',
		async:false,
		success:function(data){		
			return data.dispatch.orderId;
		},
		error:function(){     
		}
	});	
};
//获取该租户所拥有终端的坐标，给地图中心实现
function getLonLat(){
	var tenantId = $("#hideTenantId").text();
	$.ajax({
		type:'post',
		url:'ups/getTerminalLonLat',
		data:{tenantId:tenantId},
		dataType:'json',
		async:false,
		success:function(data){
		var ups  = data.ups;
		lon = ups.longitude;
		lat = ups.latitude;
		}
	});
	
}
CarProvider.prototype.getLabelStyle = function(mapMarker) {
//	var carGroupColor = mapMarker.data.color;
	var tmpLabelStyle = {color: "white", border:"1px solid #808080"};
	return tmpLabelStyle;
};
CarProvider.prototype.getIcon = function(mapMarker){
	var stricon=mapMarker.status;
	var data=mapMarker.data;
	var terminalId=data.terminalId;
	var terminalIdtop=terminalId.split("-")[0];
	var th="TH";

 	if(stricon=='1' && terminalIdtop.indexOf(th)<0){
	     return new BMap.Icon("images/ray.png", new BMap.Size(23, 23),{anchor: new BMap.Size(10, 21)}); 
 	}if(stricon=='0' && terminalIdtop.indexOf(th)<0){	
		 return new BMap.Icon("images/ups.png", new BMap.Size(26, 26),{anchor: new BMap.Size(13, 23)});
 	}if(stricon=='1' && terminalIdtop.indexOf(th)>=0){
	     return new BMap.Icon("images/ray.png", new BMap.Size(23, 23),{anchor: new BMap.Size(10, 21)}); 
 	}if(stricon=='0' && terminalIdtop.indexOf(th)>=0){	
		 return new BMap.Icon("images/ups.png", new BMap.Size(26, 26),{anchor: new BMap.Size(13, 23)});
 	}
};

$("#only-online").click(function(event){
	
});

CarProvider.prototype.getIds = function() {
	return this.ids;
};

//更新离线在线等状态的数量
CarProvider.prototype.updateStatusCount = function(statusCount) {
	var total = 0;
	for (var i = 0; i < statusCount.length; i++) {
		var code = statusCount[i].statusCode;
		var count = statusCount[i].count;
	
		$("#" + this.statusCodeLabels["" + code]).text(count);
		total += count;
	}
	$("#status_car_total").text(total);
};
CarProvider.prototype.search = function() {
	var carLicense = $("#txtCarLicense").val();
	
	var params = {
		"carLicense": carLicense
	};
	
	var subtenantId = $("#subtenantId").val();
	if (subtenantId != "-1") {
		params.subtenantId = subtenantId;
	}
	
	var that = this;
	$.post("terminal/getAll",'', function(data) {
		if (data.commonMessage.success) {
			// 缓存id
			that.cacheIds(data.terminal);
			
			//绘制车辆列表
			$("#carList").DataTable().clear().draw();
			$("#carList").DataTable().rows.add(data.terminal).draw();
		} else {
			showNoty(data.commonMessage.errorMessage, "error", false, "top");
		}
	});
};

CarProvider.prototype.cacheIds = function(terminals) {
	if (terminals) {
		var tmpIds = []
		for (var i = 0; i < terminals.length; i++) {
			tmpIds.push("" + terminals[i].terminalId);
		}
		
		this.ids = tmpIds;
		this.realtimeManager.markForRedraw(this.getType());
	}
};
CarProvider.prototype.toMarkerAndOpenWindow = function(entityId) {
	this.realtimeManager.toMarkerAndOpenWindow(this.getType(), entityId)
};

///chargerStub/////
var ChargerStubProvider = function(realtimeManager) {
	this.realtimeManager = realtimeManager;
	this.statusCodes = [MSGCODE_SYSTEM_OFFLINE, MSGCODE_SYSTEM_ONLINE, MSGCODE_SYSTEM_ALARM];
	this.statusCodeLabels = {};
	this.statusCodeLabels["" + MSGCODE_SYSTEM_OFFLINE] = 'status_charger_stub_offline';
	this.statusCodeLabels["" + MSGCODE_SYSTEM_ONLINE] = 'status_charger_stub_online';
	this.statusCodeLabels["" + MSGCODE_SYSTEM_ALARM] = 'status_charger_stub_alarm';
	
	this.ids = [];
	
	var that = this;
	$("#btnSearchChargerStub").click(function() {
		that.search();
	});
	
	$('#textChargerStubLocalhost').bind('keypress',function(event){
		if(event.keyCode == "13") {
			that.search();
		}
	});
};
ChargerStubProvider.prototype.init = function() {
	this.search();
};

ChargerStubProvider.prototype.getType = function() {
	return "elecve.charger_stub";
};
ChargerStubProvider.prototype.isMobileMarker = function() {
	return true;
};

var UNSUPERVISED = 3;
ChargerStubProvider.prototype.getInfoWindowContent = function(mapMarker) {
	var data = mapMarker.data;
	var content = "<table class='table table-hover table-condensed'>" 
					+ "<tr><td class='content-left-text'>" + "IP：" + "</td><td>" + data.localhost + "</td></tr>" 
					+ "<tr><td class='content-left-text'>" + "编码：" + "</td><td>" + data.code + "</td></tr>"			
					+ "<tr><td class='content-left-text'>" + "地址：" + "</td><td>" + data.address + "</td></tr>"  
					+ "<tr><td class='content-left-text'>" + "区县码：" + "</td><td>" + data.areaCode + "</td></tr>" 					
					+ "<tr><td class='content-left-text'>" + "输出电压：" + "</td><td>" + this.transformDataForInteger(data.voltage) + "&nbsp;V</td></tr>"
					+ "<tr><td class='content-left-text'>" + "输出电流：" + "</td><td>" + this.transformDataForInteger(data.current) + "&nbsp;A</td></tr>" 
					+ "<tr><td class='content-left-text'>" + "输出功率：" + "</td><td>" + this.transformDataForOutputPower(data.voltage, data.current) + "&nbsp;KW</td></tr>"
					+ "<tr><td class='content-left-text'>" + "电池剩余量：" + "</td><td>" + this.transformDataForInteger(data.soc)  + "&nbsp;&#37;</td></tr>" 
					+ "<tr><td class='content-left-text'>" + "已充电量：" + "</td><td>" + this.transformDataForInteger(data.chargedCapacity)  + "&nbsp;&#37;</td></tr>" 
					+ "<tr><td class='content-left-text'>" + "已充电时间：" + "</td><td>" + this.displayTime(data.chargedTime) + "</td></tr>" 
					+ "<tr><td class='content-left-text'>" + "剩余充满时间：" + "</td><td>" + this.displayTime(data.remainTime) + "</td></tr>" 														
					+ "<tr><td class='content-left-text'>" + "状态：" + "</td><td>" + this.getStatusText(data.chargeStatus) + "</td></tr>"
					+ "<tr><td colspan='2' style='text-align:center;'>";
		if(data.chargeStatus != UNSUPERVISED && data.chargeStatus != null){
				content	+= '<a href="javascript:showRealtimeChargerStub(' + mapMarker.id + ','+ data.terminalID +');" >更多充电桩数据</a>'
						+ "</td></tr><tr><td colspan='2' style='text-align:center;'>"
						+ '<a href="javascript:showRealtimeVideoMonitor(' + mapMarker.id + ');" >视频监控跳转</a>';
					}				
		content	+= "</td></tr></table>";
	$("#status_"+ data.id).html("<span>状态:</span>"+ this.getStatusText(data.chargeStatus));
	return content;
};

//将值转换为整数
ChargerStubProvider.prototype.transformDataForInteger = function(valData){
	if(typeof valData == 'number'){
		return Math.round(valData);
	}else if(typeof valData == 'undefined'){
		return '-';
	}
}
//将值保留两位小数
ChargerStubProvider.prototype.transformDataForDecimal = function(valData){
	if(typeof valData == 'number'){
		return valData.toFixed(2);
	}else if(typeof valData == 'undefined'){
		return '-';
	}
}
//特殊，用于将输出功率转化为KW
ChargerStubProvider.prototype.transformDataForOutputPower = function(voltage, current){
	if ((typeof voltage == 'number') && (typeof current == 'number')) {
		return Math.abs((voltage * current) / 1000.0).toFixed(2);
	} else if (voltage === undefined || current === undefined ){
		return '-';
	}
}

ChargerStubProvider.prototype.displayTime = function(minutes) {
	if(minutes == null){
		return " - 小时 - 分钟";
	}else{
		hours = minutes / 60 ;
		hoursRound = Math.floor(hours);
		
		minutes = minutes  - (60 * hoursRound);
		minutesRound = Math.floor(minutes);
		
		return hoursRound+"小时"+minutesRound+"分钟";
	}
};
ChargerStubProvider.prototype.getLabelStyle = function(mapMarker) {
//	var carGroupColor = mapMarker.data.color;
	//var carGroupColor = "red";
	var tmpLabelStyle = {};
	return tmpLabelStyle;
};
/* ChargerStubProvider.prototype.getIcon = function(mapMarker) {
	var tmpIcon = new BMap.Icon("filestore?path=icon/chargerstub/" + mapMarker.icon, new BMap.Size(22, 22));
	tmpIcon.setImageSize(new BMap.Size(22, 22));
	return tmpIcon;
}; */
ChargerStubProvider.prototype.getIds = function() {
	return this.ids;
};
/*
ChargerStubProvider.prototype.needStatusMessageCodes = function() {
	return true;
};
*/
ChargerStubProvider.prototype.updateStatusCount = function(statusCount) {
	var total = 0;
	for (var i = 0; i < statusCount.length; i++) {
		var code = statusCount[i].statusCode;
		var count = statusCount[i].count;
	
		$("#" + this.statusCodeLabels["" + code]).text(count);
		total += count;
	}
	$("#status_charger_stub_total").text(total);
};

ChargerStubProvider.prototype.search = function(start, countPerPage) {
	var localhost = $("#textChargerStubLocalhost").val();
	var address = $("#textAddress").val();
	start = start || 0;
	countPerPage = 30;
	var params = {
		"localhost": localhost,
		"address": address,
		"start":start,
		"countPerPage":countPerPage
	};
	
	var requestData = $.param(params, true);
	
	var that = this;
	$.post("charger_stub/query", requestData, function(responseData) {
		if (responseData.commonMessage.success) {
			var chargerStubs = responseData.ChargerStub;
			var page = responseData.page;
			// 缓存id
			that.cacheIds(chargerStubs);
			//清楚div的ul列表
			$("#chargerStubResult").empty();
			//绘制充电桩列表
			for(var i = 0; i < chargerStubs.length;i++){
				var htmlStr = "<ul id='chargerStubList' style='margin-top:15px;cursor: pointer;' onclick='toLocale("+ chargerStubs[i].longitude +","+ chargerStubs[i].latitude +")'>"
							+ "<li><span>IP:</span>" + chargerStubs[i].localhost + "【" + chargerStubs[i].code + "】</li>"
							+ "<li><span>地址:</span>" + chargerStubs[i].address + "</li>"
							+ "<li id='status_" + chargerStubs[i].id + "' ><span>状态:</span><span style='color:#CDC9C9;'>监管</spoan></li>"
							+ "</ul>";
				$("#chargerStubResult").append(htmlStr);
			}
			var pager = getPagerHtml(page.currentPage, page.totalPage, "pageChargerStubProvider.toPage");
			$("#divPager").empty().append(pager);
		} else {
			showNoty(responseData.commonMessage.errorMessage, "error", false, "top");
		}
	});
}

ChargerStubProvider.prototype.getStatusText = function(status) {
	switch(status)
	{
	case 0:return "<span style='color:#blue;'>充电中</span>";break;
	case 1:return "<span style='color:green;'>就绪</span>";break;
	case 2:return "<span style='color:red;'>故障中</span>";break;
	case 3:return "<span style='color:#CDC9C9;'>未监管</span>";break;
	default: return "<span style='color:#CDC9C9;'>未监管</span>";break;
	}
};

function toLocale(x,y) {
	if(x != "" && y != ""){
		map.panTo(new BMap.Point(x, y)); 
	}
};

ChargerStubProvider.prototype.cacheIds = function(chargerStubs) {
	if (chargerStubs) {
		var tmpIds = []
		for (var i = 0; i < chargerStubs.length; i++) {
			tmpIds.push("" + chargerStubs[i].id);
		}
		
		this.ids = tmpIds;
		this.realtimeManager.markForRedraw(this.getType());
	}
};
ChargerStubProvider.prototype.toPage = function(pageIndex) {
	var countPerPage = 30;
	var start = pageIndex * countPerPage;
	this.search(start);
};

/////


// function initall(){
// 	initfreedispatch();
// 	initfreetrailer();
// }
$(function() {
	
	
	//添加遮罩
	var docHeight = $(document).height(); //获取窗口高度  
    
	  $('body').append('<div id="overlay" ></div>');  
	     //滚动条（<div style="margin:400px ; width:50%" id="process" class="progress progress-striped active"><div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div></div>）
	  $('#overlay')  
	    .height(docHeight)  
	    .css({  
	      'opacity': .9, //透明度  
	      'position': 'absolute',  
	      'top': 0,  
	      'left': 0,  
	      'background-color': 'black',  
	      'width': '100%',  
	      'z-index': 5000 //保证这个悬浮层位于其它内容之上  
	    });  
	//设置3秒后覆盖层自动淡出 
	    setTimeout(function(){$('#overlay').fadeOut('slow')}, 4500);  
	
	
	
	
	
		initCarList();
		$("#scrollTrack").slimScroll({
			size: "7px",
			opacity: "0.2",
			position: "right",
			height: $("#scrollTrack").attr("data-height"),
			alwaysVisible: ($("#scrollTrack").attr("data-always-visible") == "1" ? true: false),
			railVisible: ($("#scrollTrack").attr("data-rail-visible") == "1" ? true: false),
			disableFadeOut: true,
			wheelStep: 5
		});
		
		$("#scrollTrack1").slimScroll({
			size: "7px",
			opacity: "0.2",
			position: "right",
			height: $("#scrollTrack1").attr("data-height"),
			alwaysVisible: ($("#scrollTrack1").attr("data-always-visible") == "1" ? true: false),
			railVisible: ($("#scrollTrack1").attr("data-rail-visible") == "1" ? true: false),
			disableFadeOut: true,
			wheelStep: 5
		});
		
		App.init();
		Plugins.init();
		FormComponents.init();
		
		$("#btnCancelOuletConfig").click(function() {
			//$("#dlgChooseGroup").modal("hide");
		});
		$("#btnConfirmOuletConfig").click(function() {
				$("#customPointList input[type='checkbox']").each(function () {
					var outlet = $(this).val().split(",");
                     if($(this).is(":checked")){
						var point = new BMap.Point(outlet[2], outlet[3]); 
						var icon = new BMap.Icon("filestore?path=icon/outlet/" + outlet[0], new BMap.Size(22, 22));
						icon.setImageSize(new BMap.Size(22, 22));
						initfreedispatch(outlet[5]);
						var content = "<table>" + "<tr><td>" + "名称："
						+ "</td><td colspan='4'>" + outlet[4]
						+ "</td></tr>" + "<tr><td>" + "地址："
						+ "</td><td>" + outlet[1]
						+ "</td></tr>"
						+ "</table>";
						var label = new BMap.Label ("",{offset:labelOffset, enableMassClear:true});
						drawOutlets(point, icon, contenttrailer, label);
					 }else{
							for(var i = 0 ; i < outletsArray.length;i++){
								if(outletsArray[i].marker.point.lng  == outlet[2] && outletsArray[i].marker.point.lat  == outlet[3]){
										removeOutlet(outletsArray[i].marker);
										outletsArray.splice(i,1);
										break;
									}	
							}
							
					 }
                });
				$("#dlgOutletConfig").modal("hide");
		});
		//
		function getAllPark(){
			$("#customPointList input[type='checkbox']").each(function () {
					var outlet = $(this).val().split(",");
                     if($(this).is(":checked")){
						var point = new BMap.Point(outlet[2], outlet[3]); 
						var icon = new BMap.Icon("filestore?path=icon/outlet/" + outlet[0], new BMap.Size(22, 22));
						icon.setImageSize(new BMap.Size(22, 22));
						initfreedispatch(outlet[5]);
						var content = "<table>" + "<tr><td>" + "名称："
						+ "</td><td colspan='4'>" + outlet[4]
						+ "</td></tr>" + "<tr><td>" + "地址："
						+ "</td><td>" + outlet[1]
						+ "</td></tr>"
						+ "</table>";
						var label = new BMap.Label ("",{offset:labelOffset, enableMassClear:true});
						drawOutlets(point, icon, contenttrailer, label);
					 }else{
							for(var i = 0 ; i < outletsArray.length;i++){
								if(outletsArray[i].marker.point.lng  == outlet[2] && outletsArray[i].marker.point.lat  == outlet[3]){
										removeOutlet(outletsArray[i].marker);
										outletsArray.splice(i,1);
										break;
									}	
							}
					 }
                });
		
		}
		//
		
// 		$("#mapSidebar").click(function() {
// 			showInfoPanel();
// 		});
// 		$("#mapSidebar2").click(function() {
// 			showInfoPanel2();
// 		});
		
// 		initfreedispatch();
		//initfreetrailer();
		getLocation();
		initTool();
		//getLonLat();
		initMap();
		
		pageRealtimeManager = new RealtimeManager(map);
		pageCarProvider = new CarProvider(pageRealtimeManager);
// 		pageChargerStubProvider = new ChargerStubProvider(pageRealtimeManager);
		pageRealtimeManager.addProvider(pageCarProvider);
// 		pageRealtimeManager.addProvider(pageChargerStubProvider);
		
		pageCarProvider.init();
// 		pageChargerStubProvider.init();
		pageRealtimeManager.refresh();
		
		
		//getPointTypeList();
		//getCustomPointList();
		// xgetAllPark();
	});
	
	var pageRealtimeManager;
	var pageCarProvider;
	var pageChargerStubProvider;
	
	function initCarList() {
		$("#carList").data("datatable", {
			language: dt_lang,	//加载国际化语言
			processing: true,
			serverSide: false,
			ordering: false,
			paging: false,
			searching: false,
			info: false,
			"columnDefs" : [{
				"targets" : 0,
				"className" : "align-center",
				"data" : "terminalNum"
			}]
		});
		
		$('#carList').on('draw.dt', function () {
			$('#carList tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
					$(this).removeClass('selected');
				}
				else {
					$("#carList").DataTable().$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
				
				if (pageCarProvider != null) {
					var carData = $("#carList").DataTable().row( this ).data();
					var id = carData.id;
					pageCarProvider.toMarkerAndOpenWindow(id);
				}
			} );
		});
	}
	
	var RAFunction = window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame || window.oRequestAnimationFrame || function ( callback ) {
	    window.setTimeout( callback, 1000 / 60 );
	};
	var Round = ( function () {
	    var END_ANGLE, RADIUS, START_ANGLE, ARC_BG;
	    START_ANGLE = Math.PI * 1;
	    END_ANGLE = Math.PI * 1.5;
	    ARC_BG = END_ANGLE;

	    function Round( params ) {
	        var _ = this;
	        _.params = params;
	        _.canvas = params.element;
	        _.context = _.canvas.getContext( "2d" );
	        _.currentAngle = 0;
	        _.shadow_radius = 15;
	        _.ball = {};
	        _.speed = 0.02 * 5000 / params.speed;
	        _.onlyCircle = params.onlyCircle || false;
	        _.resize.call( _ );
	        if ( params.play !== false || params.play === undefined ) {
	            _.played = true;
	        } else {
	            _.played = false;
	            return;
	        }
	        RAFunction(
	            ( function ( _this ) {
	                return function () {
	                    if ( _.played ) return _this.update();
	                };
	            } )( _ ) );
	    }
	    Round.prototype.resize = function () {
	        var _ = this;
	        _.canvas.height = $( _.canvas.parentNode ).innerHeight() * 2;
	        _.canvas.width = $( _.canvas.parentNode ).innerHeight() * 2;
	        _.offset = _.canvas.height / 25;
	        _.padding = _.canvas.height / 2;
	        _.canvas_radius = _.canvas.height / 2 - _.offset;
	        _.shadow_radius = 15;
	        _.ball_radius = 5;
	        if ( _.onlyCircle ) {
	            _.update();
	        }
	    };
	    Round.prototype.clear = function () {
	        return this.context.clearRect( 0, 0, this.canvas.width, this.canvas.height );
	    };
	    Round.prototype.stop = function () {
	        this.played = false;
	    };
	    Round.prototype.play = function () {
	        var _ = this;
	        if ( !_.initialize ) {
	            tMax.fromTo( _.canvas, 3, {
	                autoAlpha: 0
	            }, {
	                autoAlpha: 1
	            } );
	        }
	        if ( _.played === false ) {
	            _.played = true;
	            setTimeout( function () {
	                _.update();
	            }, 50 );
	        }
	    };
	    Round.prototype.update = function () {
	        var _ = this,
	            gradientPos, diff, newTime;
	        if ( _.played === false ) return;
	        if ( !_.onlyCircle ) _.resize.call( _ );
	        var cxt = _.context;
	        _.initialize = true;
	        cxt.clearRect( 0, 0, _.canvas.width, _.canvas.height );
	        cxt.beginPath();
	        cxt.lineWidth = 3;
	        cxt.shadowColor = "transparent";
	        cxt.strokeStyle = "rgba(255,255,255,.1)";
	        if ( _.onlyCircle ) {
	            cxt.arc( _.padding, _.padding, _.canvas_radius, 0, Math.PI * 2, false );
	            cxt.stroke();
	            cxt.closePath();
	            return;
	        }
	        if ( ARC_BG / Math.PI < 4 ) {
	            cxt.arc( _.padding, _.padding, _.canvas_radius, END_ANGLE, ARC_BG, false );
	            ARC_BG += _.speed;
	        } else {
	            _.context.arc( _.padding, _.padding, _.canvas_radius, 0, Math.PI * 2, false );
	        }
	        cxt.stroke();
	        cxt.closePath();
	        cxt.beginPath();
	        var gradientPos = Math.PI * 0.3 + _.currentAngle / Math.PI;
	        gradientPos = gradientPos % 2;
	        gradientPos = 2 - gradientPos;
	        gradientPos *= Math.PI;
	        var radius = _.canvas.width / 2;
	        var gradientPosX = _.canvas_radius + Math.cos( gradientPos ) * _.canvas_radius * 1.7;
	        var gradientPosY = _.canvas_radius - Math.sin( gradientPos ) * _.canvas_radius * 1.7;
	        var gradient = cxt.createLinearGradient( _.canvas.width / 2, _.canvas.width / 2, gradientPosX, gradientPosY );
	        gradient.addColorStop( 0, "rgba(255,255,255,1)" );
	        gradient.addColorStop( 0.4, "rgba(255,255,255,0)" );
	        cxt.arc( _.padding, _.padding, _.canvas_radius, START_ANGLE + _.currentAngle, END_ANGLE + this.currentAngle, false );
	        cxt.lineCap = "round";
	        cxt.strokeStyle = gradient;
	        cxt.lineWidth = 3;
	        cxt.stroke();
	        cxt.closePath();
	        cxt.beginPath();
	        _.ball.x = _.padding + Math.cos( _.currentAngle + Math.PI * 1.5 ) * _.canvas_radius;
	        _.ball.y = _.padding + Math.sin( _.currentAngle + Math.PI * 1.5 ) * _.canvas_radius;
	        cxt.fillStyle = "#fff";
	        cxt.shadowColor = "rgba(202, 19, 110, 0.7)";
	        cxt.shadowBlur = 30;
	        cxt.shadowOffsetX = 0;
	        cxt.shadowOffsetY = 0;
	        cxt.strokeStyle = "rgba(88, 56, 100,.7)";
	        cxt.lineWidth = _.shadow_radius;
	        cxt.arc( this.ball.x, this.ball.y, _.ball_radius, 0, Math.PI * 2, true );
	        cxt.stroke();
	        cxt.fill();
	        cxt.closePath();
	        _.currentAngle += this.speed;
	        _.currentAngle %= 2 * Math.PI;
	        _.path = Math.PI * 2 / 4;
	        ( _.params.onUpdate || function () {} )( _, Math.ceil( _.currentAngle / ( Math.PI * 2 / 100 ) ) );
	        return RAFunction(
	            ( function ( _this ) {
	                return function () {
	                    _this.update();
	                };
	            } )( _ ) );
	    };
	    return Round;
	} )();

	
	//终端筛选
	

	
</script>


<div id="dlgOutletConfig" class="modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button id="btnCloseForm" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title"><i class="icon-reorder"></i> 特殊点配置</h4>
      </div>
      <div class="modal-body">
		<!-- start -->
        <div class="row">
			<div class="col-md-12">
					<input type="hidden" id="codeId" name="id" value="-1">
					<div class="widget">
					<div class="widget-header">
					<h5><i class="icon-angle-right"></i>特殊点</h5>
					</div>
					<div class="widget-content" id = "customPointList">
					</div>
					</div>
				</div>
			</div>
			 <!-- end -->
      </div><!-- /.modal-body> -->
	 
      <div id="codeFormModalFooter" class="modal-footer">
		<button id="btnConfirmOuletConfig" type="button" class="btn btn-primary" data-loading-text="处理中...">确定</button>
        <button id="btnCancelOuletConfig" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>
