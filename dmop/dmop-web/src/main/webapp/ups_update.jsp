<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page session="false"%>
<%
    /*HttpSession session = request.getSession(false);*/
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Charts &amp; Statistics | Melon - Flat &amp; Responsive Admin Template</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css">
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css">
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->
<style>
#baidumap {
	width: 100%;height: 100%;overflow: hidden;margin:0;
}

#baidumap img {
	max-width: none;
}

.height_100 {
	height: 100%;
}
.clearMarginPad {
	margin: 0 0;
	padding: 0 0;
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&amp;ak=L5rglNsfmEd9D6CQxHGNgTLG"></script>

<script type="text/javascript" src="<%=basePath%>assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/ajaxfileupload/ajaxfileupload.js"></script>
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
<script type="text/javascript" src="<%=basePath%>plugins/select2/select2.min.js"></script>

<script type="text/javascript" src="<%=basePath%>plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/validation/messages_zh.js"></script>

<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.form-components.js"></script>
<script type="text/javascript" src="<%=basePath%>js/page-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/location-choose.js"></script>
<script type="text/javascript" src="<%=basePath%>js/url-helper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/gps.js"></script>
<script>
var searchOutletType;
var searchOutletName;
var searchOutletAddress;
var searchip;
var searchport;
var searchstate;
var searchstartTime;
var searchlongitude;
var searchlatitude;

$(document).ready(function(){
	initMap();
	queryIfSearchStringExist();
	//getPointTypeList();
$("#showLocationBtn").click(function(){
		var x = $("#longitude").val();
		var y = $("#latitude").val();
		showPointPosition(x,y);
	});
//保存
$("#savePointBtn").click(function(){
// 	Torestful();
	saveOrUpdataCustomPoint();
	window.location.href="terminal.jsp?outletType="+searchOutletType+"&outletName="+searchOutletName+"&outletAddress="+searchOutletAddress; 
});
		
//没用	
$("#cancenlBtn2").click(function(){
		$("#typeName").val("");
		$("#addType ").val(0);  
	});
//返回列表
$("#cancenlBtn1").click(function(){
	window.location.href="terminal.jsp?outletType="+searchOutletType+"&outletName="+searchOutletName+"&outletAddress="+searchOutletAddress; 
    });

$("#startTime").daterangepicker({
	singleDatePicker : true,
	showDropdowns : true,
	startDate : new Date(),
	format : 'YYYY-MM-DD HH:mm:SS',
	
});
$("div[class='daterangepicker dropdown-menu opensright']")[0].style.zIndex = 1000000;



	
});
//restful调用方法
function Torestful(){
	
	var id=$("#pointId").val();
	var longitude=$("#longitude").val();
	var latitude=$("#latitude").val();
	var param={
			id:id,
	       Longtitude:longitude,
	       Latitude:latitude
	}
// 	alert(longitude+"--"+latitude);
	
// 	$.ajax({
// 		url:'upsinfo/info',
// 		type:'post',
// 		dataType:'json',
// 		data:JSON.stringfy(param),
// 		success:function(data){
// 			alert("成功发往终端");
// 		}
// 	});
$.post("upsinfo/info", param, function(data) {
			alert("成功发往终端");
	
});

}

function queryIfSearchStringExist() {
	var params = window.location.search;
	if (params != null && params != "") {
		params = params.substr(1);	//去掉?号
		var id = getUrlParam(params, "id");
		if (id != "") {
			//getPoint(id);
		}
		//终端ID
		searchOutletType=getUrlParam(params, "outletType");
		//终端名称
		searchOutletName=getUrlParam(params, "outletName");
		searchOutletAddress=getUrlParam(params, "outletAddress");
		
		searchip = getUrlParam(params,"ip");
		searchport = getUrlParam(params,"port");
		searchstate = getUrlParam(params,"state");
		searchstartTime = getUrlParam(params,"startTime");
		searchlongitude = getUrlParam(params,"longitude");
		searchlatitude = getUrlParam(params,"latitude");
		
// 		if(searchip=="null"&&searchip==null&&searchip==""){
// 			alert("adw");
// 			$("#ip").val("");
// 		}else{
// 		$("#ip").val(searchip);			
// 		}
		
// 		alert(searchstartTime);
		
// 		alert(searchip+"--"+id+"--"+$("#pointId").val());
		
		if(searchip!="null"){			
		$("#ip").val(searchip);			
			$("#pointId").val(id);
// 			alert($("#pointId").val());
		}
		if(searchOutletType!="null"){			
		$("#terminal_id").val(searchOutletType);
		}
		if(searchOutletName!="null"){
		$("#carLicense").val(searchOutletName);			
		}
		if(searchport!="null"){
		$("#port").val(searchport);			
		}
// 		if(searchstate!="null"){			
 // 		$("#state").val(searchstate);
//            if(searchstate==1){
        	   
//            }
// 		}	
$("input[name='state']").each(function(){  
    if($(this).val() == searchstate){  
        $(this).prop( "checked", true );  
    }  
}); 
		if(searchstartTime!="null"&&searchstartTime!=null&&searchstartTime!=""){			
		$("#startTime").val( dateFormate(searchstartTime));
		}
		if(searchlongitude!="null"&&searchlatitude!="null"){
		$("#longitude").val(searchlongitude);
		$("#latitude").val(searchlatitude);			
		}
		
		
	}
}

//获取pointType列表	
// function getPointTypeList(){
// 		$.ajax({
// 		type:'post',
// 		url:'custom_point/getPointTypeList',
// 		data:'',
// 		dataType:'json',
// 		success:function(data){
// 		var customPointTypes  = data.customPointTypes;
// 			for(var i = 0 ;i< customPointTypes.length ; i++)
// 			{
// 				$("#outletType").append("<option value='" + customPointTypes[i].id + "'>" + customPointTypes[i].pointTypeName + "</option>");      
// 			}
// 		},
// 		error:function(){     
// 		}
// 	});
// }	
var map;	
function initMap() {
	map = new BMap.Map("baidumap"); // 创建Map实例
	var point = new BMap.Point(118.803, 32.046); // 创建点坐标
	map.centerAndZoom(point, 12); // 初始化地图,设置中心点坐标和地图级别。
	map.enableScrollWheelZoom(); //启用滚轮放大缩小

	var leftNaviCtrl = new BMap.NavigationControl();
	map.addControl(leftNaviCtrl); //添加默认缩放平移控件	
	
	
	map.addEventListener("click",function(e){
		map.clearOverlays();
		$("#longitude").val(e.point.lng); 
		$("#latitude").val(e.point.lat);
		var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
		map.addOverlay(marker); 
	});
}

function showPointPosition(x,y){
	if(x != "" && y != ""){
		map.panTo(new BMap.Point(x, y)); 
	}
	else{
		alert("请输入坐标！");	
	}
}

function getPoint(id){
	$.ajax({
	type:'post',
	url:'ups/getPointById',
	data:{id:id},
	dataType:'json',
	success:function(data){
	var customPoint  = data.customPoint;
		
		//$("#outletType").val(customPoint.outletType);
		$("#carLicense").val(customPoint.carLicense);
		$("#terminal_id").val(customPoint.terminal_id);
		$("#longitude").val(customPoint.longitude);
		$("#latitude").val(customPoint.latitude);
		$("#pointId").val(customPoint.id);	
		$("#ip").val(customPoint.ip);
		$("#port").val(customPoint.port);
		//$("#newAlarmDisplay").find("option[value=" + alarmLevel.colorDisplay + "]").prop("selected",true);
	},
	error:function(){     
	}
	});
}

//保存特殊点

function saveOrUpdataCustomPoint(){
	var valid = $("#addPointForm").validate().form();
	if (!valid) return;
	var outletName =  $("#terminal_id").val();
	if(outletName == "" ){
		alert("请输入特殊点名称");
		return false;
	}
	
	var carLicense=$("#carLicense").val();
	var terminal_id=$("#terminal_id").val();
	var longitude=$("#longitude").val();
	var latitude=$("#latitude").val();
	var id=$("#pointId").val();
    var ip=$("#ip").val();
    var port=$("#port").val();
    var state = getState();

    var startTime = $("#startTime").val();

	//将百度坐标转换成火星坐标，在将火星坐标转换成地图坐标
	var gpsgcj = GPS.bd_decrypt(latitude,longitude);
	var gpswgs = GPS.gcj_decrypt_exact(gpsgcj.lat,gpsgcj.lon);

	if(id==""){
		var param={
				ip:ip,
				port:port,
				longitude:gpswgs.lon,
				latitude:gpswgs.lat,
				upsId:terminal_id,
				state:state,
				startTime:startTime
		}
		var url="terminal/addups";
// 		$.ajax({
// 			type:'post',
// 			url:'terminal/addups',
// 			data:JSON.stringify(param),
// 			dataType:'json',
// 			success:function(data){
// 				alert("chengg");
// 			}
// 		})
	}else{
		var param={
				ip:ip,
				port:port,
				longitude:gpswgs.lon,
				latitude:gpswgs.lat,
				upsId:terminal_id,
				state:state,
				startTime:startTime
		};
		var url="terminal/updateups";
	}
// 	var requestData=$.param(param,true);
	$.post(url, param, function(data){
		var notyParams = {
			dismissQueue: true,
			modal: false,
			layout: 'top',
			theme: 'defaultTheme'
		};
		if (data.success) {
			notyParams.text = "成功保存到自定义地点列表!";
			notyParams.type = "success";
			notyParams.timeout = 2000;
			window.location.href="outlet_add.jsp?outletType="+searchOutletType+"&outletName="+searchOutletName+"&outletAddress="+searchOutletAddress; 
		} else {
			notyParams.text = data.errorMessage;
			notyParams.type = "error";
			notyParams.timeout = 3000;
		}
		noty(notyParams);
	});
}

function getState(){
	  var value="";
	  var radio=document.getElementsByName("state");
	  for(var i=0;i<radio.length;i++){
		if(radio[i].checked==true){
		  value=radio[i].value;
		  break;
		}
	  }
	  return value;
	}


function dateFormate(date){
	function p(s){
		return s<10?"0"+s:s;
	}
	date=parseInt(date,10);
	var time = new Date(date);
	var year =  time.getFullYear();
	var month = time.getMonth()+1;
	var day = time.getDate();
	var hour = time.getHours();
	var minute = time.getMinutes();
	var second = time.getSeconds();
	return year+"-"+p(month)+"-"+p(day)+" "+p(hour)+":"+p(minute)+":"+p(second); 
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
</script>
</head>
<body>
<div id="container" class="height_100" style="padding-top:10px;width:100%;">
  <div id="content" class="height_100">
    <div class="container height_100 clearMarginPad">
		
	  <div class="row height_100" style="margin-left: 5px;margin-right: 5px;">
            
			<div class="col-md-8 height_100" style="padding: 0 0;">
				<div id="baidumap"></div>
			</div>
			<div id="chooseRight" class="col-md-4" style="padding: 0 0;">
				<div class="tabbable tabbable-custom" style="margin-left:10px; ">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab_1_1" data-toggle="tab" data-chooselocaltype="1">添加坐标点</a></li>
					</ul>
					
					<div class="tab-content">
						<div class="tab-pane active" id="tab_1_1">
							<div style="height:428px;">
								<!-- 添加坐标点start -->
								 <form id="addPointForm" class="form-horizontal ">
								    <input type="hidden" id="pointId" name="pointId" value="">
<!-- 									<div class="form-group"> -->
<!-- 										  <label class="col-md-5 control-label">选择分类:</label> -->
<!-- 										  <div class="col-md-7"> -->
<!-- 											<select id="outletType" name="outletType" class="col-md-12 full-width-fix"> -->
<!-- 											</select> -->
<!-- 										 </div> -->
<!-- 									</div> -->
									<div class="form-group">
										  <label class="col-md-5 control-label">服务器地址:</label>
										  <div class="col-md-7">		
												<input type="text" id="ip" name="ip" class="form-control" maxlength="20">
										 </div>
									</div>
									<div class="form-group">
										  <label class="col-md-5 control-label">端口号:</label>
										  <div class="col-md-7">		
												<input type="text" id="port" name="port" class="form-control" maxlength="20">
										 </div>
									</div>
									<div class="form-group">
										  <label class="col-md-5 control-label">终端号:</label>
										  <div class="col-md-7">		
												<input type="text" id="terminal_id" name="terminal_id" class="form-control" maxlength="20" readonly="readonly">
										 </div>
									</div>
									<div class="form-group">
										  <label class="col-md-5 control-label">终端名称:</label>
										  <div class="col-md-7">		
												<input type="text" id="carLicense" name="carLicense" class="form-control" maxlength="20" readonly="readonly">
										 </div>
									</div>
									<div class="form-group">
										  <label class="col-md-5 control-label">是否上线:</label>
										  <div class="col-md-7">		
<!-- 												<input type="text" id="state" name="state" class="form-control" maxlength="20"> -->
													<input type="radio" name="state" value="1" >是
													<input type="radio" name="state" value="0" >否
										 </div>
									</div>
									<div class="form-group">
										  <label class="col-md-5 control-label">上线时间:</label>
										  <div class="col-md-7">		
<!-- 												<input type="text" id="startTime" name="startTime" class="form-control" maxlength="20"> -->
										 			 <input type="text" id="startTime"
														name="startTime"
														class="form-control input-sm required"
														style="color:#555;background-color:#fff;cursor:text"
														readonly maxlength="20">
										 </div>
									</div>
									<div class="form-group">
										  <label class="col-md-5  control-label">GPS坐标:</label>
										  <div class="col-md-7">	
												<label class="col-md-3  control-label">x:</label>
												<div class="col-md-9">	
													<input type="text" id="longitude" name="longitude" class="form-control">
												</div>
										 </div>
									</div>
									<div class="form-group">
										  <label class="col-md-5  control-label"></label>
										  <div class="col-md-7">	
												<label class="col-md-3  control-label">y:</label>
												<div class="col-md-9">	
													<input type="text" id="latitude" name="latitude" class="form-control">
												</div>
										 </div>
									</div>
								 </form >
								 <div class="form-group">
									<label class="col-md-5  control-label"></label>
										  <div class="col-md-7">	
												<button id="showLocationBtn" class="btn btn-success">坐标定位</button>
										 </div>
								</div>
								<div class="form-group">
									<div style="float:right; margin-top:25px;">
										   <button id="savePointBtn" class="btn btn-primary">保存</button>
										  <button id="cancenlBtn1" class="btn btn-primary">返回列表</button>
									</div>
								</div>
								<!-- 添加坐标点end -->
							</div>
						</div>
						
					</div>
				</div>
			
				
			</div>
			</div>
	  </div>  
	</div>
  </div>
</div>	

</body>
</html>

