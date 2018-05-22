<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	User loginUser = SessionUtil.getCommonUserFromSession();
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
	<head>
	    <base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />  
		<title>统计信息</title>
	    <link href="<%=basePath%>mobile/css/mui.min.css" rel="stylesheet"/>  
	    <link rel="stylesheet" href="<%=basePath%>mobile/css/app.css" />
	    <link rel="stylesheet" href="<%=basePath%>mobile/css/icons-extra.css" />
	    <link rel="stylesheet" href="<%=basePath%>mobile/css/mui.picker.min.css" />
	    <script src="<%=basePath%>mobile/js/echarts.js"></script>
	    <script src="<%=basePath%>mobile/js/mui.min.js"></script>
	    <script type="text/javascript" src="<%=basePath%>mobile/js/jquery.min.js" ></script>
	    <script type="text/javascript" src="<%=basePath%>mobile/js/mui.picker.min.js" ></script>
	    <style>
	    	.mui-card .mui-control-content {
				padding: 10px;
			}
			.mui-control-content {
				height: 150px;
			}
			.chart {
				height: 200px;
				margin: 0px;
				padding: 0px;
			}
			h5 {
				margin-top: 30px;
				font-weight: bold;
			}
			h5:first-child {
				margin-top: 15px;
			}
			.mui-content{
				background-color: white;
			}
			#item1{
				height: 300px;
			}
			#item2{
				height: 300px;
			}
			.search{
				border: 1px solid #ccc;
				margin: 8px;
    			border-radius: 5px;
    			padding: 0 10px;
    			padding-bottom: 15px;
    			background-color: #F5F5F5;
			}
			.aa a{
				float: left;
				color:black;
				line-height: 2.5;
			}
			.bb a{
				float: left;
				color:black;
				line-height: 2.5;
			}
			.aa{
			    width: 50%;
			    float: left;
			    margin: 15px 0;	
			}
			.bb{
				width:70%;
				float: left;
			}
			#terminalNum{
				width: 50%;
				float: left;
				padding: 10px 2px;
				margin: 0;	
			}
			#pieSearch{
			    border: 1px solid darkgray;
    			background-color: #007aff;

			}
			#lineSearch{
			    border: 1px solid darkgray;
   			    background-color: #007aff;

			}
	    </style>
	</head>
	<body>
		<div class="mui-content">
			<div class="search">
				<div class="aa">
					<a>开始：</a>
					<input id="start-time" class="time" data-options='{"type":"date"}' type="text" style="width:60%;margin: 0;padding: 10px 2px;"/>
				</div>
				<div class="aa">
					<a>结束：</a>
					<input id="end-time" class="time" data-options='{"type":"date"}' type="text" style="width:60%;margin: 0;padding: 10px 2px;"/>
				</div>
				<div class="bb">
					<a>终端号：</a>
					<input id="terminalNum" type="text"/>
				</div>
				<div class="cc">
					<button class="goSearch" type="submit"><span class="mui-icon mui-icon-search" style="color: white;"></span><a style="font-size: 17px;color: white;">查询</a></button>
			    </div>
				</div>
			<div style="padding: 10px 10px;">
				<div id="segmentedControl" class="mui-segmented-control">
					<a id="line-btn" class="mui-control-item mui-active" href="#lineChart">
						趋势图
					</a>
					<a id="pie-btn" class="mui-control-item" href="#pieChart">
						占比图
					</a>
				</div>
			</div>
				<div class="mui-control-content mui-active" id="lineChart" style="height: 300px;width: 100%;"></div>
				<div class="mui-control-content" id="pieChart" style="height: 300px;width: 100%;"></div>
			
		</div>

		<script>
		    //时间选择器
			(function($,jQuery) {
				$.init();
				var btns = $('.time');
				btns.each(function(i, btn) {
					btn.addEventListener('tap', function() {
						var optionsJson = this.getAttribute('data-options') || '{}';
						var options = JSON.parse(optionsJson);
						var id = this.getAttribute('id');
						var picker = new $.DtPicker(options);
						picker.show(function(rs) {
							document.getElementById(id).value=rs.text;
							picker.dispose();
						});
					}, false);
				});
			})(mui,jQuery);
		////////////////////////////////////////////////////////////			
		$(function(){	
			$(".goSearch").attr("id","lineSearch");
			var lineChart;
			var pieChart;
			var allLineData;
			var allLineSearchResult;

			queryLineSearch();
			queryPieSearch();
			
			//切换选项卡至折线图
			var lineee = document.getElementById("line-btn");
			lineee.addEventListener('tap', function() {
				$(".goSearch").removeAttr("id");
				$(".goSearch").attr("id","lineSearch");
				queryLineSearch();
				
			});
			
			//查询折线图
			var lineSearch = document.getElementById("lineSearch");
			lineSearch.addEventListener('tap', function() {
				queryLineSearch();	
			});	
			
			//切换选项卡至饼图
			var pieee = document.getElementById("pie-btn");
			pieee.addEventListener('tap', function() {
				$(".goSearch").attr("id","pieSearch");			
				queryPieSearch();
				//查询饼图
				$("#pieSearch").on("click", function() {
					queryPieSearch();
				});
			});
		
		});		
		
	//////////////////////////////////////////////////////////////////////
		function queryLineSearch(){
			var startTime  = $("#start-time").val();
			var endTime = $("#end-time").val();
			var terminalNum = $("#terminalNum").val();
			requestData = {
					"startTime" : convertDateFromString(startTime),
					"endTime" : convertDateFromString(endTime),
					"terminalId" : terminalNum,
			}
			$.post("lineGraph/getAlarmLogs",requestData,function(data){
				allLineSearchResult = data.alarmLog;
				getLineSearchData(allLineSearchResult);
				 var mainContainer = document.getElementById('lineChart');
			        //用于使chart自适应高度和宽度,通过窗体高宽计算容器高宽
			        var resizeMainContainer = function () {
			            mainContainer.style.width = window.innerWidth+'px';
			            mainContainer.style.height = window.innerHeight*0.8+'px';
			        };
		       		// 初始化图表
		       		echarts.dispose(mainContainer);
			        lineChart = echarts.init(mainContainer);
			        $(window).on('resize',function(){//
			            //屏幕大小自适应，重置容器高宽
			            resizeMainContainer();
			            lineChart.resize();
			        });
				lineChart.setOption(getLineSearchOption(lineSearchName,lineSearchValue,lineSearchData));
			});	
		}
	
		var lineSearchName = [];
		var lineSearchValue = [];
		var lineSearchData = [];
		function getLineSearchData(allLineSearchResult){
			 lineSearchName.length=0;
			 lineSearchValue.length=0;
			for(var i = 0;i<allLineSearchResult.length;i++){
				for(var timeKey in allLineSearchResult[i]){	
					lineSearchName.push(timeKey);
					lineSearchValue.push(allLineSearchResult[i][timeKey]);
			    }
			}
			lineSearchData.length=0;//先清空保存数据的变量,不可以放在循环中
			for(var j=0;j<lineSearchName.length;j++){
				lineSearchData.push({
					lineName: lineSearchName[j],
					type:'line',
					lineValue:lineSearchValue[j],	
				});
			}
		}
		

		
		function getLineSearchOption(lineSearchName,lineSearchValue,lineSearchData) {
			var lineOption =   {
				    tooltip : {
				        trigger: 'axis'
				    },   
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : lineSearchName,
				            axisLabel:{
		                        interval:0,  
		                        rotate:50,//倾斜度 -90 至 90 默认为0  
		                        margin:2,  
		                        textStyle:{  

		                            color:"#000000"  
		                        }  
		                    },  
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series :{
				    	 name:'报警数',
				            type:'line',
				            stack: '总量',
				            data:lineSearchValue
				    }
				};
			return lineOption;
		};
		
		
		
			//将String类型的日期转换为Data类型
			function convertDateFromString(dateString) {
				if (dateString) { 
					var date = new Date(dateString.replace(/-/,"/")) 
					return date;
				}
			}
			
			/* 折线图 */				
			 function byId(id) {
				return document.getElementById(id);
			};
		
			//////////////////////////////////////////////////////////////////////
			var allSearchResult;
			function queryPieSearch(){
				var startTime  = $("#start-time").val();
				var endTime = $("#end-time").val();
				var terminalNum = $("#terminalNum").val();
				requestData = {
						"startTime" : convertDateFromString(startTime),
						"endTime" : convertDateFromString(endTime),
						"terminalId" : terminalNum,
				}
				$.post("pieGraph/getAlarmLogs",requestData,function(data){
					allSearchResult = data.alarmLog;
					getPieSearchData(allSearchResult);

					 var mainContainer = document.getElementById('pieChart');
				        //用于使chart自适应高度和宽度,通过窗体高宽计算容器高宽
				        var resizeMainContainer = function () {
				            mainContainer.style.width = window.innerWidth+'px';
				            mainContainer.style.height = window.innerHeight*0.8+'px';
				        };
				        //设置div容器高宽
				        resizeMainContainer();
				        // 初始化图表
				        echarts.dispose(mainContainer);
				        pieChart = echarts.init(mainContainer);
				        $(window).on('resize',function(){//
				            //屏幕大小自适应，重置容器高宽
				            resizeMainContainer();
				            pieChart.resize();
				        });
					pieChart.setOption(getPieSearchOption(searchName,searchValue,searchData));
				});	
			}
			
			
			var searchName = [];
			var searchValue = [];
			var searchData = [];
			function getPieSearchData(allSearchResult){
				searchName.length=0;
				searchValue.length = 0;
				for(var i = 0;i<allSearchResult.length;i++){
					for(var conditionName in allSearchResult[i]){	
						searchName.push(conditionName);
						searchValue.push(allSearchResult[i][conditionName]);
				    }
				}
				searchData.length=0;//先清空保存数据的变量,不可以放在循环中
				for(var j=0;j<searchName.length;j++){
					searchData.push({
						name: searchName[j],
						value:searchValue[j]
					});
				}
			}
		
			
			function getPieSearchOption(searchName,searchValue,searchData) {
				var pieOption =  {
				    title : {
				        text: '报警类型占比图',
				        x:'center'
				    },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				        orient : 'vertical',
				        x : 'left',
				        data:searchName
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {
				                show: true, 
				                type: ['pie', 'funnel'],
				                option: {
				                    funnel: {
				                        x: '25%',
				                        width: '50%',
				                        funnelAlign: 'left',
				                        max: 1548
				                    }
				                }
				            },
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    series : [
				        {
				            name:'访问来源',
				            type:'pie',
				            radius : '55%',
				            center: ['50%', '60%'],
				            data: searchData
				        }
				    ]
				} 
				return pieOption;
			};
			
		
		</script>
	</body>
</html>
