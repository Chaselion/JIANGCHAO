<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zy.dmop.model.User"%>
<%@ page import="com.zy.dmop.api.security.util.SessionUtil"%>
<%@ page session="false"%>
<%
	User loginUser = SessionUtil.getCommonUserFromSession();
	Integer orgId = loginUser.getOrganizationId();
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />  
    <title>报警信息</title>  
    
    <link href="<%=basePath%>mobile/css/mui.min.css" rel="stylesheet"/>  
    <link rel="stylesheet" href="<%=basePath%>mobile/css/app.css" />
	<link rel="stylesheet" href="<%=basePath%>mobile/css/icons-extra.css" />
	<script src="<%=basePath%>mobile/js/mui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>mobile/js/jquery.min.js"></script>  
    <style>    
        body{position: relative;}    
        
        .mui-btn{width:80%; margin: 0 auto; margin-top: 10px;} 
           
        .info-icon{
        	float: left;
        }   
        
        .mui-table-view-cell {
        	height: 5em;
        }
        img{
        	width:70%;
        }
    </style>    
</head> 

<body>  
	<div class="mui-content">
         <ul id="OA_task_2" class="mui-table-view">
			</ul> 
    </div>
</body>  
<script>
	 var appData;
	 function queryData(){
		document.getElementById("OA_task_2").innerHTML="";
		var orgId = <%=orgId%>;
		requestData = {
			"id" : orgId
		}
		$.post("appData/query",requestData,function(data){
			appData = data.appData;
			var localTime = (new Date()).toLocaleDateString() + " " + (new Date()).toLocaleTimeString();
			for(var i = 0;i<appData.length;i++){
				if(appData[i].property=="InnerTemperature"){
					appData[i].property="机内温度";
				}else if(appData[i].property=="DumpEnergy"){
					appData[i].property="剩余电量";
				}else if(appData[i].property=="Workload"){
					appData[i].property="负载功率";
				}else if(appData[i].property=="InputVoltageofR"){
					appData[i].property="市电输入电压";
				}else if(appData[i].property=="OutputVoltageofR"){
					appData[i].property="市电输出电压";
				}else if(appData[i].property=="Inputfrequency"){
					appData[i].property="市电输入频率";
				}else if(appData[i].property=="OutputVoltageofR"){
					appData[i].property="UPS输出电压";
				}
				/* if(appData[i].confirm==0 && appData[i].remind==0){ */
				console.log(appData[i]);
				document.getElementById("OA_task_2").innerHTML += "<li class='mui-table-view-cell'>"
			    +"<div class='mui-slider-right mui-disabled'>"
			    +"<a onclick='warnLater("+ i + ")' class='mui-btn mui-btn-yellow'>稍后提醒</a>"
			    +"<a onclick='confirm("+ i + ")' class='mui-btn mui-btn-red'>" + "确认 " + "</a>"
				+"</div>"
				+ "<div class='mui-slider-handle'>"
				+"<div class='info-icon'>"
				+"<img src='<%=basePath%>mobile/images/red.png'>"
				+ "</div><div class='mui-table-cell'>" + "[" + localTime + "]" + appData[i].terminalId + "设备" + appData[i].property
				+ "发生异常，异常值为" + appData[i].value + "</div></div></li>"	
				/* } */ 
			}
		});
	} 
 
    function warnLater(i){
    	if(appData[i].property=="机内温度"){
			appData[i].property="InnerTemperature";
		}else if(appData[i].property=="剩余电量"){
			appData[i].property="DumpEnergy";
		}else if(appData[i].property=="负载功率"){
			appData[i].property="Workload";
		}else if(appData[i].property=="市电输入电压"){
			appData[i].property="InputVoltageofR";
		}else if(appData[i].property=="市电输出电压"){
			appData[i].property="OutputVoltageofR";
		}else if(appData[i].property=="市电输入频率"){
			appData[i].property="Inputfrequency";
		}else if(appData[i].property=="UPS输出电压"){
			appData[i].property="OutputVoltageofR";
		}
		requestData = {
			"organizationId" : appData[i].organizationId,
			"property":appData[i].property,
			"terminalId":appData[i].terminalId,
			"value":appData[i].value
		}
		$.post("appData/remind",requestData,function(data){
			queryData();
		})
	} 
	
    function confirm(i){
    	if(appData[i].property=="机内温度"){
			appData[i].property="InnerTemperature";
		}else if(appData[i].property=="剩余电量"){
			appData[i].property="DumpEnergy";
		}else if(appData[i].property=="负载功率"){
			appData[i].property="Workload";
		}else if(appData[i].property=="市电输入电压"){
			appData[i].property="InputVoltageofR";
		}else if(appData[i].property=="市电输出电压"){
			appData[i].property="OutputVoltageofR";
		}else if(appData[i].property=="市电输入频率"){
			appData[i].property="Inputfrequency";
		}else if(appData[i].property=="UPS输出电压"){
			appData[i].property="OutputVoltageofR";
		}
    	requestData = {
    		"organizationId" : appData[i].organizationId,
    		"property":appData[i].property,
    		"terminalId":appData[i].terminalId,
    		"value":appData[i].value
    	}
    	$.post("appData/confirm",requestData,function(data){
			queryData();
		})
    }

		 
	 
</script>
</html>  