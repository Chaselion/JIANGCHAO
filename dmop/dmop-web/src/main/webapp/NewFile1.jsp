<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	String basePath = request.getContextPath();
	User loginUser = SessionUtil.getCommonUserFromSession();
	Integer orgId = loginUser.getOrganizationId();
%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>可视化界面</title>
<link href="<%=basePath%>/css/css.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>/datatable/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css">
<script src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/echarts.min.js"></script>
<%-- <script type="text/javascript" src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script> --%>
<script type="text/javascript"
	src="<%=basePath%>/datatable/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/datatable/dataTables.bootstrap.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=bP6WvGH3fMdKMxhEDGlgLox7Nkze4c4R"></script>
<script type="text/javascript"
	src="<%=basePath%>/plugins/daterangepicker/moment-with-langs.min.js"></script>
<style>
* {
	padding: 0;
	margin: 0;
}

body {
	width: 100%;
	height: 100%;
	background-image: url(<%=basePath%>/images/timg.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	background-attachment: fixed;
}

#cover {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: absolute;
	background: rgba(0, 0, 0, 0.5);
}

.outer {
	width: 25%;
	height: 100%;
	float: left;
	margin: 1%;
}

.inner {
	width: 100%;
	height: 45%;
	box-shadow: 0px 0px 20px 0px #FFFAFA inset;
	padding: 5px;
	border-radius: 5px;
}

#inOut {
	margin-bottom: 5%;
}

#alarmReason {
	margin-bottom: 5%;
}

#middleContain {
	width: 40%;
	height: 100%;
	float: left;
	margin: 1%;
	border-radius: 5px;
}

#map {
	width: 100%;
	height: 55%;
	margin-bottom: 3%;
	border-radius: 5px;
	padding: 5px;
}

#list {
	width: 100%;
	height: 35%;
	box-shadow: 0px 0px 20px 0px #FFFAFA inset;
	border-radius: 5px;
	padding: 5px;
}

.BMap_cpyCtrl {
	display: none;
}

.anchorBL {
	display: none;
}

.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th
	{
	background-color: transparent;
}

table {
	color: #6495ED;
	border: none
}

.table>thead:first-child>tr:first-child>th {
	border: none;
}

.table-striped>tbody>tr:nth-child(odd)>td {
	border-left: none;
	border-right: none;
	border-color: lightslategrey;
}

table.table-bordered.dataTable tbody td {
	border-left: none;
	border-right: none;
	border-color: lightslategrey;
}
</style>
</head>

<body>
	<div id="cover">
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<div id="leftContain" class="outer">
			<div id="inOut" class="inner"></div>
			<div id="status" class="inner"></div>
		</div>
		<div id="middleContain">
			<div id="map"></div>
			<div id="list" style="background: rgba(0, 0, 255, 0.2)">
				<table id="example" style="border: none"
					class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>发生时间</th>
							<th>设备类别</th>
							<th>终 端 号</th>
							<th>设备属性</th>
						</tr>
					</thead>
					<!-- tbody是必须的 -->
				</table>
			</div>
		</div>
		<div id="rightContain" class="outer">
			<div id="alarmReason" class="inner"></div>
			<div id="alarmNum" class="inner"></div>
		</div>
		
		<div class="livechat-girl animated">
			<a href="<%=basePath%>/index/win10"><img class = "girl" src="images/chilun.png"></a>
			<div
				class="livechat-hint rd-notice-tooltip rd-notice-type-success rd-notice-position-left single-line show_hint">
				<div class="rd-notice-content">点此切换视图</div>
			</div>
			<div class="animated-circles">
				<div class="circle c-1"></div>
				<div class="circle c-2"></div>
				<div class="circle c-3"></div>
			</div>
		</div>
	</div>
</body>
<script>
	$(function(){
		getTerminalStatus();
		getThroughput();
		getAlarmReason();
		getAlarmNum();
		getTableData();
		
		//悬浮齿轮效果
		setInterval(function(){
			if($(".animated-circles").hasClass("animated")){
				$(".animated-circles").removeClass("animated");
			}else{
				$(".animated-circles").addClass('animated');
			}
		},3000);
		var wait = setInterval(function(){
			$(".livechat-hint").removeClass("show_hint").addClass("hide_hint");
			clearInterval(wait);
		},4500);
		$(".livechat-girl").hover(function(){
			clearInterval(wait);
			$(".livechat-hint").removeClass("hide_hint").addClass("show_hint");
		},function(){
			$(".livechat-hint").removeClass("show_hint").addClass("hide_hint");
		})
		
		/*-----------------------------地图---------------------------------*/
		var map = new BMap.Map("map");    // 创建Map实例
		map.centerAndZoom(new BMap.Point(116.404, 39.915), 5);  // 初始化地图,设置中心点坐标和地图级别
		//添加地图类型控件
		map.removeControl(new BMap.MapTypeControl({//写addControl地图右上角会有图标
			 mapTypes:[
	            BMAP_NORMAL_MAP,
	        ]})); 	  
		map.setCurrentCity("南京");          // 设置地图显示的城市 此项是必须设置的
		map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
		
		var orgId = "<%=orgId%>";
		var requestData={
			"id":orgId
		}
		
		$.ajax({
			type:"post",
			url:"<%=basePath%>/technology/mapMarkers",
			data:requestData,
			dataType:'json',
			success:function(data){
				var result = data.realtimeData;
				for(var i = 0;i<result.length;i++){
					var point = new BMap.Point(parseFloat(result[i].longitude),parseFloat(result[i].latitude));
					var marker = new BMap.Marker(point);
					map.addOverlay(marker);
				}
			}
		});
		map.setMapStyle({
			styleJson:[
	          {
	                    "featureType": "water",
	                    "elementType": "all",
	                    "stylers": {
	                              "color": "#021019"
	                    }
	          },
	          {
	                    "featureType": "highway",
	                    "elementType": "geometry.fill",
	                    "stylers": {
	                              "color": "#000000",
	                              "visibility": "off"
	                    }
	          },
	          {
	                    "featureType": "highway",
	                    "elementType": "geometry.stroke",
	                    "stylers": {
	                              "color": "#147a92",
	                              "visibility": "off"
	                    }
	          },
	          {
	                    "featureType": "arterial",
	                    "elementType": "geometry.fill",
	                    "stylers": {
	                              "color": "#000000"
	                    }
	          },
	          {
	                    "featureType": "arterial",
	                    "elementType": "geometry.stroke",
	                    "stylers": {
	                              "color": "#0b3d51"
	                    }
	          },
	          {
	                    "featureType": "local",
	                    "elementType": "geometry",
	                    "stylers": {
	                              "color": "#000000"
	                    }
	          },
	          {
	                    "featureType": "land",
	                    "elementType": "all",
	                    "stylers": {
	                              "color": "#08304b"
	                    }
	          },
	          {
	                    "featureType": "railway",
	                    "elementType": "geometry.fill",
	                    "stylers": {
	                              "color": "#000000",
	                              "visibility": "off"
	                    }
	          },
	          {
	                    "featureType": "railway",
	                    "elementType": "geometry.stroke",
	                    "stylers": {
	                              "color": "#08304b",
	                              "visibility": "off"
	                    }
	          },
	          {
	                    "featureType": "subway",
	                    "elementType": "geometry",
	                    "stylers": {
	                              "lightness": -70
	                    }
	          },
	          {
	                    "featureType": "building",
	                    "elementType": "geometry.fill",
	                    "stylers": {
	                              "color": "#000000",
	                              "visibility": "off"
	                    }
	          },
	          {
	                    "featureType": "all",
	                    "elementType": "labels.text.fill",
	                    "stylers": {
	                              "color": "#857f7f"
	                    }
	          },
	          {
	                    "featureType": "all",
	                    "elementType": "labels.text.stroke",
	                    "stylers": {
	                              "color": "#000000"
	                    }
	          },
	          {
	                    "featureType": "building",
	                    "elementType": "geometry",
	                    "stylers": {
	                              "color": "#022338"
	                    }
	          },
	          {
	                    "featureType": "green",
	                    "elementType": "geometry",
	                    "stylers": {
	                              "color": "#062032"
	                    }
	          },
	          {
	                    "featureType": "boundary",
	                    "elementType": "all",
	                    "stylers": {
	                              "color": "white"
	                    }
	          },
	          {
	                    "featureType": "manmade",
	                    "elementType": "geometry",
	                    "stylers": {
	                              "color": "#022338"
	                    }
	          },
	          {
	                    "featureType": "poi",
	                    "elementType": "all",
	                    "stylers": {
	                              "visibility": "off"
	                    }
	          },
	          {
	                    "featureType": "all",
	                    "elementType": "labels.icon",
	                    "stylers": {
	                              "visibility": "off"
	                    }
	          },
	          {
	                    "featureType": "background",
	                    "elementType": "all",
	                    "stylers": {
	                              "color": "#0d0d65ff",
	                              "visibility": "on"
	                    }
	          }
			]
		});
	});
	/*------------------------------列表----------------------------------------*/
		function getTableData(){
		    $.ajax({
			type:"post",
			url:"<%=basePath%>/alarmLog/queryLogAlarm",
			data:"",
			async:false,
			dataType:'json',
			success:function(data){ 
				var rowNum = 1;
				var arr = data.alarms;
				var result;
				if(arr.length>5){
					 result = arr.slice(0,5);//只显示前五条数据
				}else{
					result = arr;
				}
				$('#example').dataTable({
			        "data": result,
			        pageLength: 3,
			        "paging": false, //不分页
			        "searching" : false,//不显示搜索框
			        "bSort": false,//不排序  
			        "bInfo" : false,//隐藏左下角Showing 1 to 5 of 5 entries
			        "columns": [
			            {
			            	"data" : null,
							"render" : function(data, type, full, meta) {
								return rowNum++;
							}	
			            },
			            { "data":null,
			              "render" : function(data, type, full, meta) {
								var day = moment(data.createDateTime);
								return day.format('YYYY-MM-DD');
							}	
			            },
			            { "data": "deviceClass" },
			            { "data": "deviceName"},
			            { "data": "conditionName"}
			        ]
			    });
				}
			}) 
		}
	/* ------------------------------------------------------------------ */
	function getTerminalStatus(){
		$.ajax({
		type:"post",
		url:"<%=basePath%>/dashboard/getData",
		data:"",
		async:false,
		dataType:'json',
		success:function(data){ 
			var result = data.status_count.status;
			console.log(result);
			var statusName = [];
			var resultData = [];
			var statusValue = [];
			for(var i=0;i<result.length;i++){
				 if(result[i].statusCode==1){
					result[i].statusCode="在线";
					statusName.push(result[i].statusCode);
				}else if(result[i].statusCode==0){
					result[i].statusCode="离线";
					statusName.push(result[i].statusCode);
				}else if(result[i].statusCode==2){
					result[i].statusCode="告警";
					statusName.push(result[i].statusCode);
				}
				statusValue.push(result[i].count);
			}
			for(var j = 0;j<statusName.length;j++){
				resultData.push({
					name: statusName[j],
					value:statusValue[j]
				});
			}
			statusChart.setOption(getStatusOption(statusName,resultData));
		}
		});
	}
	
	function getThroughput(){
		$.ajax({
		type:"post",
		url:"<%=basePath%>/technology/throughput",
		data:"",
		async:false,
		dataType:'json',
		success:function(data){ 
			var result = data.throughput;
			var xdata = [];
			var ydata = [];
			for (var i = 0; i < result.length; i++) {
				for ( var timeKey in result[i]) {
					xdata.push(timeKey);
					ydata.push(result[i][timeKey]);
				}
			}
			console.log(xdata);
			console.log(ydata);
			inOutChart.setOption(getThroughPutOption(xdata, ydata));
		}
		});
	}

	function getAlarmReason(){
		<%-- $.post("<%=basePath%>/pieGraph/getAlarmLogs","",function(data){ --%>
			$.ajax({
				type:"post",
				url:"<%=basePath%>/pieGraph/getAlarmLogs",
				data:"",
				async:false,
				dataType:'json',
				success:function(data){ 
			var result = data.alarmLog;
			var category = [];
			var value = [];
			var resultData = [];
			console.log(result);
			for(var i = 0;i<result.length;i++){
				for(var key in result[i]){
					category.push(key);
					value.push(result[i][key]);
				}
			}
			console.warn(category);
			console.warn(value);
			for(var j = 0;j<category.length;j++){
				resultData.push({
					name: category[j],
					value:value[j]
				});
			}
			reasonChart.setOption(getAlarmReasonOption(category,resultData));
		 }
		});
	}
	
	function getAlarmNum(){
		$.ajax({
		type:"post",
		url:"<%=basePath%>/lineGraph/getAlarmLogs",
		data:"",
		async:false,
		dataType:'json',
		success:function(data){ 
			var result = data.alarmLog;
			console.log(result);
			var xdata = [];
			var ydata = [];
			for(var i = 0;i<result.length;i++){
				for(var timeKey in result[i]){
					xdata.push(timeKey);
					ydata.push(result[i][timeKey]);
				}
			}
			console.log(xdata);
			console.log(ydata);
			numChart.setOption(getNumOption(xdata,ydata));
		  }
		});
	}
	/*-----------------------------状态--------------------------------*/
	// 基于准备好的dom，初始化echarts实例
	var statusChart = echarts.init(document.getElementById('status'));
	// 指定图表的配置项和数据
	function getStatusOption(statusName, resultData) {
		var statusOption = {
			backgroundColor : 'rgba(0,0,255,0.2)',
			title : {
				text : '终端状态分布',
				x : 'left',
				textStyle : {
					color : 'white'
				}
			},
			legend : {
				orient : 'vertical',
				x : 'right',
				textStyle : {
					color : 'white',
				},
				data : statusName
			},
			calculable : true,
			series : [ {
				name : '访问来源',
				type : 'pie',
				radius : '65%',
				center : [ '50%', '60%' ],
				data : resultData,
				itemStyle : {
					normal : {
						label : {
							show : false
						},
						labelLine : {
							show : false
						}
					},
				},
			} ]
		};
		return statusOption;
	}
	/*-----------------------------吞吐---------------------------------*/
	var inOutChart = echarts.init(document.getElementById('inOut'));
	function getThroughPutOption(xdata, ydata) {
		var inOutOption = {
			backgroundColor : 'rgba(0,0,255,0.2)',
			tooltip : {
				trigger : 'axis',
			},
			title : {
				text : '吞吐量',
				textStyle : {
					color : 'white'
				}
			},
			grid : {
				left : '15%',
				bottom : '15%',
				top : '20%'
			}, //调整图标的大小
			calculable : true,
			xAxis : [ {
				type : 'category',
				boundaryGap : false,
				axisLabel : {
					show : true,
					textStyle : {
						color : '#fff',
					}
				},
				axisLine : {
					lineStyle : {
						color : '#fff'
					}
				},
				data : xdata
			} ],
			yAxis : [ {
				type : 'value',
				splitLine : {
					show : false
				},
				axisLabel : {
					show : true,
					textStyle : {
						color : 'white',
					}
				},
				axisLine : {
					lineStyle : {
						color : '#fff'
					}
				},
			} ],
			series : [
					{
						name : '吞吐量',
						type : 'line',
						stack : '总量',
						itemStyle : {
							normal : {
								areaStyle : {
									type : 'default'
								},
								lineStyle : {
									color : '#6495ED'
								},
								areaStyle : {
									color : new echarts.graphic.LinearGradient(
											0, 0, 0, 1, [ {
												offset : 0,
												color : '#6495ED'
											}, {
												offset : 0.5,
												color : '#6495ED'
											}, {
												offset : 1,
												color : 'transparent'
											} ])
								}
							}
						},
						data : ydata,
					}, ]
		};
		return inOutOption;
	}

	/*-----------------------------报警原因--------------------------------*/
	// 基于准备好的dom，初始化echarts实例
	var reasonChart = echarts.init(document.getElementById('alarmReason'));
	// 指定图表的配置项和数据
	function getAlarmReasonOption(category,resultData){
	var reasonOption = {
		backgroundColor : 'rgba(0,0,255,0.2)',
		title : {
			text : '报警原因',
			x : 'left',
			textStyle : {
				color : 'white'
			}
		},
		legend : {
			orient : 'vertical',
			x : 'right',
			textStyle : {
				color : 'white',
			},
			data :category
		},
		calculable : true,
		series : [ {
			name : '访问来源',
			type : 'pie',
			radius : '65%',
			center : [ '50%', '60%' ],
			data : resultData,
			itemStyle : {
				normal : {
					label : {
						show : false
					},
					labelLine : {
						show : false
					}
				},
			},
		} ]
	};
	return reasonOption;
	}
	/*-----------------------------报警数量---------------------------------*/
	var numChart = echarts.init(document.getElementById('alarmNum'));
	function getNumOption(xdata,ydata){
	var numOption = {
			backgroundColor : 'rgba(0,0,255,0.2)',
			title : {
				text : '报警数量',
				x : 'left',
				textStyle : {
					color : 'white'
				}
			},
		    color: ['rgba(100,149,237,0.5)'],
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            axisLabel : {
						show : true,
						textStyle : {
							color : '#fff',
						}
					},
					axisLine : {
						lineStyle : {
							color : '#fff'
						}
					},
		            data :xdata,
		        }
		    ],
		    yAxis : [
		        {
		        	splitLine:{
		        		show:false,
		        	},
		            type : 'value',
		            axisLabel : {
						show : true,
						textStyle : {
							color : '#fff',
						}
					},
					axisLine : {
						lineStyle : {
							color : '#fff'
						}
					},
		        }
		    ],
		    series : [
		        {
		            name:'报警数量',
		            type:'bar',
		            barWidth: '60%',
		            data:ydata
		        }
		    ]
	};
	return numOption;
	}
</script>
</html>