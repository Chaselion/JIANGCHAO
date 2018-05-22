<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	User loginUser = SessionUtil.getCommonUserFromSession();
	Integer userId = loginUser.getUserId();
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />  
		<title>实时信息</title>
	    <link href="css/mui.min.css" rel="stylesheet"/>  
	    <link rel="stylesheet" href="css/app.css" />
	    <link rel="stylesheet" href="css/icons-extra.css" />
	    <style>
			/*跨webview需要手动指定位置*/
			.mui-popover {
				height: 350px;
			}
		
		</style>
	    <script src="js/echarts.js"></script>
	    <script src="js/mui.min.js"></script>  
	    <script type="text/javascript" src="<%=basePath%>assets/js/libs/jquery-1.10.2.min.js"></script>
	    <script type="text/javascript" src="<%=basePath%>plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugins/daterangepicker/moment-with-langs.min.js"></script>
	</head>
	<body>
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
			.mui-content {
				background-color: white;
			}
			#item1{
				height: 200px;
			}
			#item2{
				height: 200px;
			}
			.mui-bar-nav~.mui-content .mui-pull-top-pocket {
    			top: 64px;
			}
			.asd{
			    width: 190px;
			    border: none;background-color: transparent;padding: 0;
			}
		</style>
		
		<div class="mui-content">
		  <div style="position: relative;height:35px;text-align: center;background-color: rgba(0,0,0,.1);">
			<div class="mui-input-row mui-search" style="width: 90%;float: left;">
				<input id="searchnum" type="search" class="mui-input-clear"  onkeyup="loadrealtime()" placeholder="输入终端号搜索">
			</div>
			<a href="javascript:loadrealtime()"><span id="fresh" class="mui-icon mui-icon-loop" style="margin-top: 5px;"></span></a>
		  </div>	
			<div id="pullrefresh" class="mui-content">
			 <ul id="list" class="mui-table-view"></ul>
			</div>
		</div>
		<script>
		
		(function($){
		    $(".mui-scroll-wrapper").scroll({
		        bounce: true,//滚动条是否有弹力默认是true
		        indicators: true, //是否显示滚动条,默认是true
		    }); 
		  
		})
		
		
			loadrealtime();
			 
			function loadrealtime() {
				var start = 0;
				var	countPerPage = 100;
					var terminalNum=$("#searchnum").val();
					
					var param = {
						terminalNum:terminalNum,
						start: start,
						countPerPage: countPerPage
					};

					var requestData = mui.param(param, true);
					$("#list").html("");
					$.post("<%=basePath%>terminal/mquery", requestData, function(data) {
						var terminals = data.terminal;
						for(var i=0;i<terminals.length;i++){
						var terminal =terminals[i];
						console.warn(terminal);
						var state=terminal.icon;
						var statusStr = '未知';
						if (state =='0') {
							
							statusStr = '<span class="mui-badge mui-badge-danger">离线</span>';
						} else if (state == '1') {
							
							statusStr = '<span class="mui-badge mui-badge-success">在线</span>';
						}
						var but='<button type="button" style="background: cornflowerblue;">详情</button>';
						var button='<a href="#middlePopover" class="mui-btn mui-btn-primary mui-btn-block mui-btn-outlined" style="border:0px" ><button type="button" style="background: cornflowerblue;">详情</button></a>';
						var html = '<a href="javascript:getDetail(' + terminal.terminalId + ');" class=" "  ><button type="button" style="background: cornflowerblue;">详情</button></a>';
						$("#list").append('<li class="mui-table-view-cell">'+terminal.terminalName+html+statusStr+'</li>');
						}
					
					});
				}	
			
			function getDetail(id) {
				var th="TH";
				var param = {
					entityId : id,
				};
				var requestData = mui.param(param, true);
				$.post("<%=basePath%>carState/queryAllCurrCarState", requestData, function(data) {
					var endResult = data.allCurrCarState[0];
					console.log(endResult);
					var et = endResult.terminalID+"";
					if(et.indexOf(th)>=0){
						<%-- $.post("<%=basePath%>terminala/query", requestData, function(data) {
							console.log(data);
						}); --%>
						$("#terminalid").val(endResult.terminalID);
			             $("#temper").val(endResult.DumpEnergy+"℃");
						 $("#humidity").val(endResult.InnerTemperature+"%");
						 mui('#middlePopover').popover('show',document.getElementById("list"));
				}else{
					 $("#terminalID").val(endResult.terminalID);
					 $("#Workload").val(endResult.Workload*100+"%");
		            if(endResult.DumpEnergy>0){
		             	$("#DumpEnergy").val(endResult.DumpEnergy + "V");
		             } else{
		            	 $("#DumpEnergy").val("");
		             }
					 $("#InputVoltageofR").val(endResult.InputVoltageofR+"V");
					 $("#InnerTemperature").val(endResult.InnerTemperature+"℃");
					 $("#OutputVoltageofR").val(endResult.OutputVoltageofR + "V");
					mui('#middlePopover2').popover('show',document.getElementById("list"));
				}
				});
				
			}
		</script>
		
		
		<div id="middlePopover" class="mui-popover">
			<div class="mui-popover-arrow"></div>
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view">
					<li class="mui-table-view-cell"><a href="#">终端号：<input id="terminalid" class="asd" type="text" value="11" readonly="readonly" style="width:190px;border: none;background-color: transparent;padding: 0;"></a>
						</li>
						<li class="mui-table-view-cell"><a href="#">温度：<input id="temper" class="asd" type="text" value="11" readonly="readonly" style="width:190px;border: none;background-color: transparent;padding: 0;"></a>
						</li>
						<li class="mui-table-view-cell"><a href="#">湿度：<input id="humidity" class="asd" type="text" value="22" readonly="readonly" style="width:190px;border: none;background-color: transparent;padding: 0;"></a>
						</li>
						
					</ul>
				</div>
			</div>

		</div>
		
		<div id="middlePopover2" class="mui-popover">
			<div class="mui-popover-arrow"></div>
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view">
						<li class="mui-table-view-cell" style="height:60px"><a href="#">终端号：<input id="terminalID" type="text" value="1" readonly="readonly" style="width:170px;border: none;background-color: transparent;padding: 0;"></a>
						</li>
						<li class="mui-table-view-cell" style="height:60px"><a href="#">机内温度：<input id="InnerTemperature" type="text" value="1" readonly="readonly" style="width:150px;border: none;background-color: transparent;padding: 0;"></a>
						</li>
						<li class="mui-table-view-cell" style="height:60px"><a href="#">负  载：<input id="Workload" type="text" value="1" readonly="readonly" style="width:190px;border: none;background-color: transparent;padding: 0;"></a>
						</li>
						<li class="mui-table-view-cell" style="height:60px"><a href="#">剩余电量：<input id="DumpEnergy" type="text" value="1" readonly="readonly" style="width:150px;border: none;background-color: transparent;padding: 0;"></a>
						</li>
						<li class="mui-table-view-cell" style="height:60px"><a href="#">输入电压：<input id="InputVoltageofR" type="text" value="1" readonly="readonly" style="width:150px;border: none;background-color: transparent;padding: 0;"></a>
						</li>
						<li class="mui-table-view-cell" style="height:60px"><a href="#">输出电压：<input id="OutputVoltageofR" type="text" value="1" readonly="readonly" style="width:150px;border: none;background-color: transparent;padding: 0;"></a>
						</li>
					</ul>
				</div>
			</div>

		</div>
		<script>
			//mui('.mui-scroll-wrapper').scroll();
			mui('body').on('shown', '.mui-popover', function(e) {
				//console.log('shown', e.detail.id);//detail为当前popover元素
			});
			mui('body').on('hidden', '.mui-popover', function(e) {
				//console.log('hidden', e.detail.id);//detail为当前popover元素
			});
		</script>
	</body>
</html>
