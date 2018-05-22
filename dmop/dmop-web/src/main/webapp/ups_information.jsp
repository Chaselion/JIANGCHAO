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
<title>UPS实时数据</title>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugins/jquery-ui/jquery.ui.1.10.2.ie.css">
<![endif]-->
<link href="<%=basePath%>assets/css/main.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/plugins.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/responsive.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/css/icons.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome.min.css">
<style>
.panel {
	margin-bottom: 0px;
}
.panel-body {
	margin-bottom: 30px;
}
.row-border .form-group {
	padding-top: 2px;
	padding-bottom: 1px;
}

#alarm-status{
	width: 120px;      
    height: 30px;
    border: none;
    background-color: #alarm-status;
    color: white;
}

.mytable label{
	width:100%;
	padding:0px 5%;
	margin-bottom: 10px;
}

.mytable input{
	margin: 0px 10%;
}

hr{
	margin-top:0px
}
</style>
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath%>assets/css/fontawesome/font-awesome-ie7.min.css">
<![endif]-->
<!--[if IE 8]>
<link href="<%=basePath%>assets/css/ie8.css" rel="stylesheet" type="text/css">
<![endif]-->

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
<script type="text/javascript" src="<%=basePath%>plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/select2/select2.min.js"></script>

<script type="text/javascript" src="<%=basePath%>plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/validation/messages_zh.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/echarts/echarts-plain.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/tabletools/TableTools.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/colvis/ColVis.min.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/columnfilter/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/datatables/DT_bootstrap.js"></script>

<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.js"></script>
<script type="text/javascript" src="<%=basePath%>assets/js/plugins.form-components.js"></script>

<!-- 加载国际化语言 -->
<script type="text/javascript" src="<%=basePath%>plugins/datatables/i18n/zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>plugins/echarts/echarts-plain-original-map.js"></script>
<script type="text/javascript" src="<%=basePath%>js/dateFormate.js"></script>
<!-- <meta http-equiv="refresh" content="2">//页面自动刷新 -->




</head>
<body>

<div id="container">
<!--     <div class="container"> -->
	  <div style="padding-top:5px;">
      </div>
	  
	  <div class="row">
        <div class="col-md-12">
          <div class="widget box">
            <div class="widget-header">
              <h4>
              	UPS数据实时监控
              	</h4>
            </div>  
            	
      

   		<div class="tabbable">
        
		<div class="tab-content">
			<div id="collapseOne" class="tab-pane active">
				<div class="panel panel-default">
      				
			      	<div id="collapseOne-Two" class="panel-collapse collapse in">
			        	 <div class="panel-body" style="margin:0px 15px;padding:0;background-color: white;">
			            	<div class="panel-body-inner">
			            		<div class="panel-body-inner-up">
			            			<div id="inner-up-left" style="margin-left: 10%;"><img src="images/u18.jpg"></div>
			            			<div id="inner-up-right" style="margin-left: 15%;">
			            			<canvas id="right-up-add" width="190" height="30" style="border:1px">
			            			</canvas>
			            				<script>
										var myc=document.getElementById("right-up-add");
										var myctx = myc.getContext("2d");
										myctx.strokeStyle="green";
										myctx.lineWidth=4;
										myctx.moveTo(0,30);
										myctx.lineTo(190,30);							
										myctx.stroke();		
									</script>
			            			<div id="right-up">
				            			<div id="inner-up-right1">
				            				<div class="right-up-content1"><span class="myspan">市电输入</span></div>
				            				<div class="right-up-content2">
				            				<label>电压：<input class="myinput" id="InputVoltageofR" type="text" onfocus=this.blur()></label></br>
				            				<label>频率：<input  class="myinput" id="Inputfrequency" type="text" onfocus=this.blur()></label>
				            				</div>
				            			
				            			</div>
				            			<canvas id="inner-up-line1">
				            			</canvas>
				            			<script>
									    function drawDirectionLine(x1, y1, x2, y2) {
									        var angle = Math.abs(Math.atan((x2 - x1) / (y2 - y1))); //倾斜角余角
									        var length = 30; //箭头斜线长度
									        var degree = Math.PI / 7; //箭头倾斜角
									        var theta = 0;
									        var altha = 0;
									        var a1 = 0;
									        var b1 = 0;
									        var a2 = 0;
									        var b2 = 0;
									
									        if (angle >= degree && angle <= Math.PI / 2 - degree) {
									            console.log("30-60");
									            theta = angle - degree;
									            altha = Math.PI / 2 - 2 * degree - theta;
									            if (x2 >= x1) {
									                console.log("x2 >= x1");
									                a1 = x2 - length * Math.sin(theta);
									                a2 = x2 - length * Math.cos(altha);
									            } else {
									                console.log("x2 < x1");
									                a1 = x2 + length * Math.sin(theta);
									                a2 = x2 + length * Math.cos(altha);
									            }
									            if (y2 >= y1) {
									                console.log("y2 >= y1");
									                b1 = y2 - length * Math.cos(theta);
									                b2 = y2 - length * Math.sin(altha);
									            } else {
									                console.log("y2 < y1");
									                b1 = y2 + length * Math.cos(theta);
									                b2 = y2 + length * Math.sin(altha);
									            }
									        } else {
									            console.log("0-30 && 60-90");
									            theta = angle - degree;
									            altha = theta + 2 * degree - Math.PI / 2;
									            if (x2 >= x1 && y2 >= y1) {
									                console.log("x2 >= x1 && y2 >= y1");
									                a1 = x2 - length * Math.sin(theta);
									                b1 = y2 - length * Math.cos(theta);
									                a2 = x2 - length * Math.cos(altha);
									                b2 = y2 + length * Math.sin(altha);
									            } else if (x2 >= x1 && y2 < y1) {
									                console.log("x2 >= x1 && y2 < y1");
									                a1 = x2 - length * Math.sin(theta);
									                b1 = y2 + length * Math.cos(theta);
									                a2 = x2 - length * Math.cos(altha);
									                b2 = y2 - length * Math.sin(altha);
									            } else if (x2 < x1 && y2 < y1) {
									                console.log("x2 < x1 && y2 < y1");
									                a1 = x2 + length * Math.sin(theta);
									                b1 = y2 + length * Math.cos(theta);
									                a2 = x2 + length * Math.cos(altha);
									                b2 = y2 - length * Math.sin(altha);
									            } else {
									                console.log("x2 < x1 && y2 >= y1");
									                a1 = x2 + length * Math.sin(theta);
									                b1 = y2 - length * Math.cos(theta);
									                a2 = x2 + length * Math.cos(altha);
									                b2 = y2 + length * Math.sin(altha);
									            }
									        }
									
									        ctx.beginPath();
									        ctx.moveTo(x1, y1);
									        ctx.lineTo(x2, y2);
									        ctx.lineTo(a1, b1);
									        ctx.stroke();
									        ctx.moveTo(x2, y2);
									        ctx.lineTo(a2, b2);
									        ctx.strokeStyle="green";
									        ctx.stroke();
						
									    }
									</script>
									<script>
									    var c = document.getElementById("inner-up-line1");
									    var ctx = c.getContext("2d");
									
									    drawDirectionLine(20,110,280,110);
									</script>
									<script>
										var mnc=document.getElementById("inner-up-line1");
										var mnctx = mnc.getContext("2d");
										mnctx.strokeStyle="green";
										mnctx.lineWidth=4;
										mnctx.moveTo(130.5,0);
										mnctx.lineTo(120.5,110);									
										mnctx.stroke();
									</script>
									
																									
				            			<div id="inner-up-right2">
				            			    <div class="right-up-content1"><span class="myspan">UPS</span></div>
				            				<div class="right-up-content2">
					            				<label>厂商：<input class="myinput" id="UPSfactoryinfo" type="text" disabled="disabled"></label></br>
					            				<label>型号：<input class="myinput" id="UPSserial" type="text" disabled="disabled"></label></br>
					            				<label>版本：<input class="myinput" id="UPShardware" type="text" disabled="disabled"></label></br>
					            				<label>工作温度：<input  class="myinput" id="InnerTemperature" type="text" onfocus=this.blur()></label>
				            				</div>
				            			</div>
				            			<canvas id="inner-up-line2">
				            			</canvas>
				            			<script>
									    var c = document.getElementById("inner-up-line2");
									    var ctx = c.getContext("2d");
									
									    drawDirectionLine(20,110,280,110);
									</script>
									<script>
										var mvc=document.getElementById("inner-up-line2");
										var mvctx = mvc.getContext("2d");
										mvctx.strokeStyle="green";
										mvctx.lineWidth=4;
										mvctx.moveTo(120.5,0);
										mvctx.lineTo(120.5,110);
										mvctx.stroke();
									</script>
									
				            			<div id="inner-up-right3">
				            			    <div class="right-up-content1"><span class="myspan">UPS输出</span>				     			            			
				            			    </div>
				            				<div class="right-up-content2">
				            					<label>电压：<input class="myinput" id="OutputVoltageofR" type="text" onfocus=this.blur()></label></br>
					            				<label>负载：<input class="myinput" id="Workload" type="text" onfocus=this.blur()></label>
				            				</div>
				            			</div>
				            			
				            	     </div>
				            	     <div id="right-middle">
				            	     	<canvas id="inner-up-line3">
				            			</canvas>
				            			<script>
									    var c = document.getElementById("inner-up-line3");
									    var ctx = c.getContext("2d");
									    ctx.lineWidth=6;
									    drawDirectionLine(180.5,150,180.5,30);
									</script>
				            	     </div>
				            	     <div id="right-down">
				            	     	<div id="inner-up-right4" style="height:130px;width:180px;">
				            	     	    <div class="right-up-content1"><span class="myspan">电池</span></div>
				            				<div class="right-up-content2">
				            					<label>单节电池电压：<input class="myinput" id="SingleCellVoltage" type="text" onfocus=this.blur()></label></br>
				            					<label>电池系数：<input class="myinput" id="coefficient" type="text" disabled="disabled"></label></br>
					            				<label>总&nbsp;&nbsp;电&nbsp;&nbsp;压：<input class="myinput" id="totalPower" type="text" onfocus=this.blur()></label></br>
					            				<label>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：<input class="myinput" id="DumpEnergy" type="text" onfocus=this.blur()></label>
				            				</div>
				            			</div>
				            	     </div>
			            			</div>
			
			            		</div>
			            		<div class="panel-body-inner-down">
			            			<!-- <div id="panel-body-inner-down1">
			            			  <span class="myspan">报警信息：<input class="myinput" id="alarm-status" type="text" onfocus=this.blur()></span>
			            			</div> -->
			            			<div id="panel-body-inner-down2">
				            			<div class="inner-down">
				            			<div style="padding: 0px 10px;"><h3>报警信息</h3></div>
				            			<hr>
					            			<form>
					            			<table class="mytable">
				            				  <tr>
					            				<td><label>输入电压：<input class="myinput" id="InputVoltageofR1" type="text" style="border:0px;" onfocus=this.blur()></label></td>
					            				<td><label>输出电压：<input class="myinput" id="OutputVoltageofR1" type="text" style="border:0px;" onfocus=this.blur()></label></td>
					            			  </tr>
					            			  <tr>
					            				<td><label>输入频率：<input class="myinput" id="Inputfrequency1" type="text" style="border:0px;" onfocus=this.blur()></label></td>
					            				<td><label>负&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp载：<input class="myinput" id="Workload1"type="text" style="border:0px;" onfocus=this.blur()></label></td>
											  </tr>
											  <tr>
					            				<td><label>电池电压：<input class="myinput" id="SingleCellVoltage1" type="text" style="border:0px;"></label></td>
					            				<td><label>剩余电量：<input class="myinput" id="DumpEnergy1" type="text" style="border:0px;" onfocus=this.blur()></label></td>
					            			  </tr>
					            			  <tr>
					            				<td><label>机内温度：<input class="myinput" id="InnerTemperature1" type="text" style="border:0px;" onfocus=this.blur()></label></td>
					            				<td><label>续航时间：<input class="myinput" id="EnduranceTime1" type="text" style="border:0px;" onfocus=this.blur()></label></td>
					            			  </tr>
					            			</table>
					            			</form>
				            			</div>
				            			<div class="inner-down">
					            			<div style="padding: 0px 10px;"><h3>报警信息</h3></div>
					            			<hr>
				            			    <form>
				            					<table class="mytable">
				            					<tr>
							            				<td><label>市电状态：<input type="text" class="myinput" id="Citystate" name="" style="border:0px;" onfocus=this.blur()></label></td>
							            			
							            				<td><label>电池状态：<input type="text" class="myinput" id="Cellstate" name="" style="border:0px;" onfocus=this.blur()></label></td>
							            			</tr>
							            			<tr> 								       								        
							            				<td><label>工作模式：<input type="text" class="myinput" id="Workingtype" name="" style="border:0px;" onfocus=this.blur()></label></td>
							            		
							            				<td><label>UPS状态：<input type="text" class="myinput" id="Workingstate" name="" style="border:0px;" onfocus=this.blur()></label></td>
							            			</tr>
							            			<tr>
							            				<td><label>UPS类型：<input type="text" class="myinput" id="Upstype" name="" style="border:0px;" onfocus=this.blur()></label></td>
							            				 
							            				<td><label>是否测试：<input type="text" class="myinput" id="TestYorN" name="" style="border:0px;" onfocus=this.blur()></label></td>
							            		    </tr>
							            		    <tr>
							            				<td><label>关机状态：<input type="text" class="myinput" id="Shutdownstate" name="" style="border:0px;" onfocus=this.blur()></label></td>
							            				
							            				<td><label>蜂&nbsp&nbsp鸣&nbsp&nbsp机：<input type="text" class="myinput" id="Buzzer" name="" style="border:0px;" onfocus=this.blur()></label></td>
							            			</tr>
					            				 </table>
					            			</form>
				            			</div>
				            		</div>
				            		<button onclick="insertInfo()" style="float: right;margin-top: 10px;margin-right: 7%;background-color: red;border: red;color: white;height: 30px;width:60px;border-radius: 5px;">提  交</button>
			            		<button onclick="editInfo()" style="float: right;margin-top: 10px;margin-right: 15px;background-color: green;border: green;color: white;height: 30px;width:60px;border-radius: 5px;">修  改</button>
			            		</div>
			     
			            	</div>
			  			 </div>
			      	</div>
   			</div>

			</div>
<!-- 		echart基础信息显示的模块 -->
	      	<div id="collapseTwo" class="tab-pane fade ">
	        	 <div class="panel-body">
	            	<form class="form-horizontal row-border" >
	  				<div id="graphic1" class="col-md-6">
<!-- 	  				关于车速的图 -->
		                <div id="compoundChartLeft" class="main1" style="height:400px;border:1px solid #ccc;padding:10px;"></div>
		               <div>
 		                    <button type="button" class="btn btn-sm btn-success" onclick="refresh(true,this)">刷 新</button>
		                    <span id='wrong-message' style="color:red"></span>
		                </div>  
		            </div>
		            <div id="graphic1" class="col-md-6">
<!-- 		           关于转矩的图 -->
		                <div id="compoundChartRight" class="main2" style="height:400px;border:1px solid #ccc;padding:10px;"></div>
		            </div>
	            </form>
	        		 </div>
	      		</div>
	           
	      	<div id="collapseThree" class="tab-pane fade ">
	        	<div class="panel-body">
            	<form class="form-horizontal row-border" >
  					<div class="col-md-12">
						<div id="motorOuttorque" class="motorOuttorque" style="height:400px;border:1px solid #ccc;padding:10px;"></div>
					</div>
	            </form>
        		 </div>
	   			</div>
	
	      	<div id="collapseFour" class="tab-pane fade ">
	        	 <div class="panel-body">
	            	<form class="form-horizontal row-border" >
	                	<div class="col-md-12">
	                		<div id="DCDCInputVoltage" class="DCDCInputVoltage" style="height:400px;border:1px solid #ccc;padding:10px;"></div>
	            		</div>
	            	</form>
	        	</div>
	      	</div>
	      		
      		<div id="collapseFive" class="tab-pane fade ">
      		  <div class="panel-body">
	            <form class="form-horizontal row-border" >
					<div class="col-md-12">
	                	<div id="DCDCOutputCurrent" class="DCDCOutputCurrent" style="height:400px;border:1px solid #ccc;padding:10px;"></div>
	            	</div>
	            </form>
	          </div>
      		</div>
      		
      		<div id="collapseSix" class="tab-pane fade ">
      		       	 <div class="panel-body">
	            	<form class="form-horizontal row-border" >
					<div class="col-md-12">
	                	<div id="DCDCTemperature" class="DCDCTemperature" style="height:400px;border:1px solid #ccc;padding:10px;"></div>
	            	</div>
	            </form>
	        		 </div>
      		</div>
	          
	      	<div id="collapseSeven" class="tab-pane fade ">
	        	 <div class="panel-body">
	            	<form class="form-horizontal row-border" >
	            	<div id="graphic3" class="col-md-12">
		                <div id="tempratureMain" class="tempratureMain" style="height:400px;border:1px solid #ccc;padding:10px;"></div>
		            </div>
	            </form>
	        		 </div>
	      		</div>
	
	      	<div id="collapseEight" class="tab-pane fade ">
	        	 <div class="panel-body">
	            	<form class="form-horizontal row-border" >
	            	<div id="graphic4" class="col-md-12">
		                <div id="highVoltageMain" class="highVoltageMain" style="height:400px;border:1px solid #ccc;padding:10px;"></div>
		            </div>
	            </form>
	        		 </div>
	      		</div>
	     </div>    
         </div>
 
        </div>
      </div>
	</div>
	
  </div>


</body>
<script>
var param = <%=request.getParameter("entityId")%>;
var requestData = {entityId:param,interval:600};
var restLogTime;
var carHistoryState = [];
var displayNums=600;
var volDisplayNums = 10;
var getDataInterval=1000;

var leftCompoundChart;
var rightCompoundChart;
var motorChart;
var DCChart;
var dcOutChart;
var dcTempChart;
var tempratureChart;
var rateChart;
var highVoltageChart;
var selectedIndex;
var disposeGauge=true;
var dcTempOptionNum=0;
var dcOutOptionNum=0;;
var DCOptionNum=0;;
var tempratureOptionNum=0;
var rateOptionNum=0;
var dcZoomStart=0;
var dCDOutZoomStart=0;
var dCACTempxoomStart=0;
var tempZoomStart=0;
var rateZoomStart=0;
var dcAxis;
var dCDOutAxis;
var dCACTempAxis;
var tempAxis;
var rateAxis;

var fd=function formatDate(d) {  
    return d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();  
};  

var bb;
function getInfo(){
	var terId = <%=request.getParameter("terminalId")%>;
	var requestPara={
			"terminalId" : terId
	};
	$.post("carState/getInfo",requestPara,function(data){
		var upsData = data.ups;
		$("#UPSfactoryinfo").val(upsData[0]["upsFactoryInfo"]);
		$("#UPSserial").val(upsData[0]["upsSerial"]);
		$("#UPShardware").val(upsData[0]["upsHardware"]);
		$("#coefficient").val(upsData[0]["coefficient"]);
		bb=upsData[0]["coefficient"];
		console.warn("bb:" + bb);
	});
};



function insertInfo(){
	var terId = <%=request.getParameter("terminalId")%>;
	var UpsInfo = {};
	var upsFactoryInfo = $("#UPSfactoryinfo").val();
	var upsSerial = $("#UPSserial").val();
	var upsHardware = $("#UPShardware").val();
	var coefficient = $("#coefficient").val();
	var singleCellVoltage = $("#SingleCellVoltage").val();
	UpsInfo = {
		"terminalId" : terId,
		"upsFactoryInfo" : upsFactoryInfo,
		"upsSerial" : upsSerial,
		"upsHardware" : upsHardware,
		"coefficient" : coefficient
	};
	$.ajax({
			url: "carState/addInfo",
			type: "POST",
			data: UpsInfo, 
			success: function(data){
				 $("#UPSfactoryinfo").removeAttr("style");
				 document.getElementById("UPSfactoryinfo").setAttribute("disabled","disabled");
				 $("#UPSserial").removeAttr("style");
				 document.getElementById("UPSserial").setAttribute("disabled","disabled");
				 $("#UPShardware").removeAttr("style");
				 document.getElementById("UPShardware").setAttribute("disabled","disabled");
				 $("#coefficient").removeAttr("style");
				 document.getElementById("coefficient").setAttribute("disabled","disabled");
				 $("#totalPower").val(aa * coefficient + "V");
			}
		});
}

function editInfo(){
	 document.getElementById("UPSfactoryinfo").setAttribute("style","background-color:gainsboro");
	 document.getElementById("UPSserial").setAttribute("style","background-color:gainsboro");
	 document.getElementById("UPShardware").setAttribute("style","background-color:gainsboro");
	 document.getElementById("coefficient").setAttribute("style","background-color:gainsboro");
	 $("#UPSfactoryinfo").removeAttr("disabled");
	 $("#UPSserial").removeAttr("disabled");
	 $("#UPShardware").removeAttr("disabled");
	 $("#coefficient").removeAttr("disabled");
}

function queryHistoryCarMonitorState() {
	dcTempOptionNum=0;
	dcOutOptionNum=0;;
	DCOptionNum=0;;
	tempratureOptionNum=0;
	rateOptionNum=0;
	App.blockUI($("#container"));
	$.ajax({  
		type : "post",  
		url : "carState/queryHistoryCarState",  
		data : requestData,  
		async : false,  
		success : function(data){
			carHistoryState = data.historyCarState;
			if(carHistoryState!=null){
				if(carHistoryState.length>0){
					restLogTime = carHistoryState[0].LogTimeLong;
					historyLen=carHistoryState.length;
				}else{
					restLogTime=new Date().getTime();
				}
				//旁路电压
				dcAxis=makeDcAxis();
				//负载
				dCDOutAxis=makeDCDOutAxis();
				//输入电压
				dCACTempAxis=makeDCACTempAxis();
				//输出电压
				tempAxis=makeTempAxis();
				//频率
				rateAxis =makeRateAxis();
				
				dcZoomStart=getDataZoomStart(DCOptionNum);
				dCDOutZoomStart=getDataZoomStart(dcOutOptionNum);
				dCACTempxoomStart=getDataZoomStart(dcTempOptionNum);
				tempZoomStart=getDataZoomStart(tempratureOptionNum);
				rateZoomStart=getDataZoomStart(rateOptionNum);
				historyTimeAxis = makeTimeAxisByHistoryData(displayNums);
				volHistoryTimeAxis = makeTimeAxisByHistoryData(volDisplayNums);
				makeChartOptions();
				drawChart();
			}
			App.unblockUI($("#container"));
			
			//setInterval("init()",getDataInterval);
			init();
		}  
	});
}

function getDataZoomStart(dataLen){
	return 100-(100 > dataLen ? 100 : (100/dataLen)*100);
}

function makeDcAxis(){
    var xAxisData = [];
	for(var i=0;i<carHistoryState.length;i++){
// 			if(carHistoryState[i].BypassVoltageofS!=0
// 				&& carHistoryState[i].BypassVoltageofT!=0
// 				&& carHistoryState[i].BypassVoltageofR!=0){
				xAxisData.unshift(new Date(carHistoryState[i].LogTimeLong).Format('yyyy-MM-dd hh:mm:ss'));
				DCOptionNum++;
// 			}
	}
	if(xAxisData.length==0){//如果历史数据被过滤光了，必须有一个值
        var shiftDate =moment();
        xAxisData.unshift(shiftDate.format('YYYY-MM-DD HH:mm:ss'));
        DCOptionNum++;
	}
	return xAxisData;
}

function makeDCDOutAxis(){
    var xAxisData = [];
	for(var i=0;i<carHistoryState.length;i++){
// 			if(carHistoryState[i].dCDCOutputCurrent!=0){
				xAxisData.unshift(new Date(carHistoryState[i].LogTimeLong).Format('yyyy-MM-dd hh:mm:ss'));
				dcOutOptionNum++;
// 			}
	}
	if(xAxisData.length==0){//如果历史数据被过滤光了，必须有一个值
        var shiftDate =moment();
        xAxisData.unshift(shiftDate.format('YYYY-MM-DD HH:mm:ss'));
        dcOutOptionNum++;
	}
	return xAxisData;
}

function makeDCACTempAxis(){
    var xAxisData = [];
	for(var i=0;i<carHistoryState.length;i++){
// 			if(carHistoryState[i].dCDCTemperature!=0 && carHistoryState[i].dCDCTemperature!=-40
// 				   &&carHistoryState[i].dCACTemperature!=0 && carHistoryState[i].dCACTemperature!=-40){
				xAxisData.unshift(new Date(carHistoryState[i].LogTimeLong).Format('yyyy-MM-dd hh:mm:ss'));
				dcTempOptionNum++;
// 			}
	}
	if(xAxisData.length==0){//如果历史数据被过滤光了，必须有一个值
        var shiftDate =moment();
        xAxisData.unshift(shiftDate.format('YYYY-MM-DD HH:mm:ss'));
        dcTempOptionNum++;
	}
	return xAxisData;
}


function makeTempAxis(){
    var xAxisData = [];
	for(var i=0;i<carHistoryState.length;i++){
// 		if(carHistoryState[i].temperature!=0 && carHistoryState[i].temperature!=-40){
			xAxisData.unshift(new Date(carHistoryState[i].LogTimeLong).Format('yyyy-MM-dd hh:mm:ss'));
			tempratureOptionNum++;
// 		}
	}
	if(xAxisData.length==0){//如果历史数据被过滤光了，必须有一个值
     var shiftDate =moment();
     xAxisData.unshift(shiftDate.format('YYYY-MM-DD HH:mm:ss'));
     tempratureOptionNum++;
	}
	return xAxisData;
}
function makeRateAxis(){
    var xAxisData = [];
	for(var i=0;i<carHistoryState.length;i++){
// 		if(carHistoryState[i].temperature!=0 && carHistoryState[i].temperature!=-40){
			xAxisData.unshift(new Date(carHistoryState[i].LogTimeLong).Format('yyyy-MM-dd hh:mm:ss'));
			rateOptionNum++;
// 		}
	}
	if(xAxisData.length==0){//如果历史数据被过滤光了，必须有一个值
     var shiftDate =moment();
     xAxisData.unshift(shiftDate.format('YYYY-MM-DD HH:mm:ss'));
     rateOptionNum++;
	}
	return xAxisData;
}

function makeTimeAxisByHistoryData(historyMaxNum) {
    var xAxisRes = new Array(historyMaxNum);
    var shiftDate = carHistoryState.length > 0 ? moment(carHistoryState[carHistoryState.length-1].LogTimeLong) : moment();
	for(var i = historyMaxNum - 1; i >= 0; i--){
		if(i < carHistoryState.length) {
			xAxisRes[historyMaxNum - 1 - i] = new Date(carHistoryState[i].LogTimeLong).Format('yyyy-MM-dd hh:mm:ss');
		} else {
			shiftDate.subtract(1, 'seconds');
			xAxisRes[historyMaxNum - 1 - i] = shiftDate.format('YYYY-MM-DD HH:mm:ss');
		}
	} 
    return xAxisRes;
}

function makeChartOptions() {
	//车速表----对应redis所取属性中的speed
var serieSpeed = {
			        	name:'车速',
			            type:'gauge',
			            min:-100,
			            max:200,
			            radius : '65%',
			            splitNumber:10,			 
			            axisLine: {            // 坐标轴线
			                lineStyle: {       // 属性lineStyle控制线条样式
			                    width: 8
			                }
			            },
			            axisTick: {            // 坐标轴小标记
			                length :12,        // 属性length控制线长
			                lineStyle: {       // 属性lineStyle控制线条样式
			                    color: 'auto'
			                }
			            },
			            splitLine: {           // 分隔线
			                length :20,         // 属性length控制线长
			                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
			                    color: 'auto'
			                }
			            },
			            title : {
			                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
			                    fontWeight: 'bolder',
			                    fontSize: 6
			                },
			                offsetCenter: [0, '-115%'],       // x, y，单位px
			            },
			            detail : {
			                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
			                    fontWeight: 'bolder'
			                }
			            },
						data:[{value: 0, name: '车速(单位：KM/h)'}]
			        };
	//电机转速，对应redis中属性的motorspeed
	var  serieMotorSpeed = {
			        	name:'电机转速',
			            type:'gauge',
			            center : ['15%', '50%'],    // 默认全局居中
			            radius : '40%',
			            min:0,
			            max:10000,
			            startAngle:135,
			            endAngle:45,
			            splitNumber:2,
			            axisLine: {            // 坐标轴线
			                lineStyle: {       // 属性lineStyle控制线条样式
			                    width: 8
			                }
			            },
			            axisTick: {            // 坐标轴小标记
			                length :12,        // 属性length控制线长
			                lineStyle: {       // 属性lineStyle控制线条样式
			                    color: 'auto'
			                }
			            },
			            splitLine: {           // 分隔线
			                length :20,         // 属性length控制线长
			                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
			                    color: 'auto'
			                }
			            },
			            pointer: {
			                width:5
			            },
			            title : {
			            	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				                    fontWeight: 'bolder',
				                    fontSize: 4
				            },
			                offsetCenter: [0, '-115%'],       // x, y，单位px
			            },
			            detail : {
			                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
			                    fontWeight: 'bolder',
			                    fontSize: 16
			                },
			                offsetCenter: [0, '-50%'],       // x, y，单位px
			            },
						data:[{value: 0, name: '电机转速(单位:r/min)'}]
			        };
	//总里程数----对应redis中的（目前无）
	var  serieMileage ={
					    name:'总里程数',
					    type:'gauge',
					    center : ['15%', '50%'],    // 默认全局居中
					    radius : '40%',
					    min:0,
					    max:1000,
					    startAngle:315,
					    endAngle:225,
					    splitNumber:2,
					    axisLine: {            // 坐标轴线
					        lineStyle: {       // 属性lineStyle控制线条样式
					            color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
					            width: 8
					        }
					    },
					    axisTick: {            // 坐标轴小标记
					        splitNumber:5,
					        length :10,        // 属性length控制线长
					        lineStyle: {       // 属性lineStyle控制线条样式
					            color: 'auto'
					        }
					    },
					    splitLine: {           // 分隔线
					        length :15,         // 属性length控制线长
					        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
					            color: 'auto'
					        }
					    },
					    pointer: {
					        width:2
					    },
					    title : {
					    	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					                fontWeight: 'bolder',
					                fontSize: 8
					        },
					        offsetCenter: [0, '115%'],       // x, y，单位px
					    },
					    detail : {
					        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					            fontWeight: 'bolder',
					            fontSize: 16,
					        },
					        offsetCenter: [0, '5%'],       // x, y，单位px
					    },
						data:[{value: 0, name: '总里程数(单位：X1000 KM)'}]
					};
	//电池容量---对应redis中的batterycapacity
	var serieCapacity={
			    	name:'电池容量',
			        type:'gauge',
			        center : ['85%', '50%'],    // 默认全局居中
			        radius : '40%',
			        min:0,
			        max:100,
			        startAngle:135,
			        endAngle:45,
			        splitNumber:2,
			        axisLine: {            // 坐标轴线
			            lineStyle: {       // 属性lineStyle控制线条样式
			                color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
			                width: 8
			            }
			        },
			        axisTick: {            // 坐标轴小标记
			            splitNumber:5,
			            length :10,        // 属性length控制线长
			            lineStyle: {       // 属性lineStyle控制线条样式
			                color: 'auto'
			            }
			        },
			        splitLine: {           // 分隔线
			            length :15,         // 属性length控制线长
			            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
			                color: 'auto'
			            }
			        },
			        pointer: {
			            width:2
			        },
			        title : {
			        	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
			                    fontWeight: 'bolder',
			                    fontSize: 8
			            },
			            offsetCenter: [0, '-115%'],       // x, y，单位px
			        },
			        detail : {
			            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
			                fontWeight: 'bolder',
			                fontSize: 16,
			            },
			            offsetCenter: [0, '-50%'],       // x, y，单位px
			        },
					data:[{value: 0, name: '电池容量(单位：%)'}]
			    };
	//电池SOC---对应redis中的batteryState
	var serieSOC={
            name:'电池SOC',
            type:'gauge',
            center : ['85%', '50%'],    // 默认全局居中
            radius : '40%',
            min:0,
            max:100,
            startAngle:315,
            endAngle:225,
            splitNumber:2,
            axisLine: {            // 坐标轴线
                lineStyle: {       // 属性lineStyle控制线条样式
                    color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
                    width: 8
                }
            },
            axisTick: {            // 坐标轴小标记
                splitNumber:5,
                length :10,        // 属性length控制线长
                lineStyle: {       // 属性lineStyle控制线条样式
                    color: 'auto'
                }
            },
            splitLine: {           // 分隔线
                length :15,         // 属性length控制线长
                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                    color: 'auto'
                }
            },
            pointer: {
                width:2
            },
            title : {
            	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder',
	                    fontSize: 8,
	            },
                offsetCenter: [0, '115%'],       // x, y，单位px
            },
            detail : {
                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    fontWeight: 'bolder',
                    fontSize: 16,
                },
                offsetCenter: [0, '5%'],       // x, y，单位px
            },
			data:[{value: 0, name: '电池SOC(单位：%)'}]
        };
if(disposeGauge){
	leftCompoundChartOption = {
		  tooltip : {
		        formatter: "{a} <br/>{c} {b}"
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            //restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    animation: true,
		    animationDurationUpdate:2000,
		    series : [
		        serieSpeed,
		        serieMotorSpeed,
		        serieMileage,
		        serieCapacity,
				serieSOC
		    ]
	};
}
	//（一、右）   电机转矩----redis中的torque
var serieToque={
        name:'电机转矩',
        type:'gauge',
        min:0,
        max:1000,
        radius : '65%',
        splitNumber:10,
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            length :12,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length :20,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 12,
           //   fontStyle: 'italic'
            },
            offsetCenter: [0, '-115%'],       // x, y，单位px
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder'
            }
        },
		data:[{value: 0, name: '电机转矩(单位：Nm)'}]
    };
    //电池温度---redis中的temperature
var serieTemp={
    	name:'电池温度',
        type:'gauge',
        center : ['15%', '50%'],    // 默认全局居中
        radius : '40%',
        min:-50,
        max:150,
        startAngle:135,
        endAngle:45,
        splitNumber:2,
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber:5,
            length :10,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length :15,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer: {
            width:2
        },
        title : {
        	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    fontWeight: 'bolder',
                    fontSize: 8,
               //   fontStyle: 'italic'
            },
            offsetCenter: [0, '-115%'],       // x, y，单位px
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 16,
            },
            offsetCenter: [0, '-50%'],       // x, y，单位px
        },
		data:[{value: 0, name: '电池温度(单位：°C)'}]
    };
     //压力--redis中的pressure
var seriePressure={
        name:'压力',
        type:'gauge',
        center : ['15%', '50%'],    // 默认全局居中
        radius : '40%',
        min:0,
        max:1,
        startAngle:315,
        endAngle:225,
        splitNumber:1,
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber:5,
            length :10,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length :15,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer: {
            width:2
        },
        title : {
        	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    fontWeight: 'bolder',
                    fontSize: 8
            },
            offsetCenter: [0, '115%'],       // x, y，单位px
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 16,
            },
            offsetCenter: [0, '5%'],       // x, y，单位px
        },
		data:[{value: 0, name: '压力(单位：MPa)'}]
    };
//总线电压--redis中的totalvoltage
var serieVoltage={
        name:'总线电压',
        type:'gauge',
        center : ['85%', '50%'],    // 默认全局居中
        radius : '40%',
        min:0,
        max:1000,
        startAngle:135,
        endAngle:45,
        splitNumber:2,
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber:5,
            length :10,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length :15,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer: {
            width:2
        },
        title : {
        	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    fontWeight: 'bolder',
                    fontSize: 8
            },
            offsetCenter: [0, '-115%'],       // x, y，单位px
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 16,
            },
            offsetCenter: [0, '-50%'],       // x, y，单位px
        },
		data:[{value: 0, name: '总线电压(单位：V)'}]
    };
    //充放电电流--redis中的totalcurrent
var serieCurrent={
        name:'充放电电流',
        type:'gauge',
        center : ['85%', '50%'],    // 默认全局居中
        radius : '40%',
        min:-200,
        max:200,
        startAngle:315,
        endAngle:225,
        splitNumber:2,
        axisLine: {            // 坐标轴线
	            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
                width: 8
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber:5,
            length :10,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length :15,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer: {
            width:2
        },
        title : {
        	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                    fontWeight: 'bolder',
                    fontSize: 8
            },
            offsetCenter: [0, '115%'],       // x, y，单位px
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 16,
            },
            offsetCenter: [0, '5%'],       // x, y，单位px
        },
		data:[{value: 0, name: '充放电电流(单位：A)'}]
    };
if(disposeGauge){
	rightCompoundChartOption = {
			  tooltip : {
			        formatter: "{a} <br/>{c} {b}"
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            //restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    animation: true,
			    animationDurationUpdate:2000,
			    series : [
					serieToque,
					serieTemp,
			        seriePressure,
			        serieVoltage,
			        serieCurrent
			    ]
		};
}

if(disposeGauge){	
motorOption = {
	    tooltip : {
	        formatter: "{a} <br/>{c} {b}"
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            saveAsImage : {show: true}
	        }
	    },
	    animation: true,
	    animationDurationUpdate:2000,
	    series : [
	        {
	            name:'发动机温度',
	            type:'gauge',
	            min:-40,
	            max:210,
	            radius : '70%',
	            splitNumber:10,
	            axisLine: {            // 坐标轴线
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    width: 10
	                }
	            },
	            axisTick: {            // 坐标轴小标记
	                length :15,        // 属性length控制线长
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: 'auto'
	                }
	            },
	            splitLine: {           // 分隔线
	                length :20,         // 属性length控制线长
	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
	                    color: 'auto'
	                }
	            },
	            title : {
	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder',
	                    fontSize: 10
	                },
	           		 offsetCenter: [0, '-110%'],
	            },
	            detail : {
	                textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder'
	                }
	            },
				data:[{value: 0, name: '发动机温度(单位:' +'℃)'}]
	        },
	        {
	            name:'瞬时油料使用率',
	            type:'gauge',
	            center : ['32%', '50%'],    // 默认全局居中
	            radius : '40%',
	            min:0,
	            max:125,
	            startAngle:135,
	            endAngle:45,
	            splitNumber:2,
	            axisLine: {            // 坐标轴线
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
	                    width: 8
	                }
	            },
	            axisTick: {            // 坐标轴小标记
	                splitNumber:5,
	                length :10,        // 属性length控制线长
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: 'auto'
	                }
	            },
	            splitLine: {           // 分隔线
	                length :15,         // 属性length控制线长
	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
	                    color: 'auto'
	                }
	            },
	            pointer: {
	                width:2
	            },
	            title : {
	            	textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder',
	                    fontSize: 8
	            },
                offsetCenter: [0, '-110%'],
	            },
	            detail : {
	            	textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder',
	                    fontSize: 16,
	                },
	                offsetCenter: [0, '-50%'],
	            },
				data:[{value: 0, name: '瞬时油料使用率(单位:公里/升)'}]
	        },
	        {
	            name:'油料使用率',
	            type:'gauge',
	            center : ['32%', '50%'],    // 默认全局居中
	            radius : '40%',
	            min:0,
	            max:3213,
	            startAngle:315,
	            endAngle:225,
	            splitNumber:2,
	            axisLine: {            // 坐标轴线
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
	                    width: 8
	                }
	            },
	            axisTick: {            // 坐标轴小标记
	            	splitNumber:5,
	                length :10,        // 属性length控制线长
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: 'auto'
	                }
	            },
	            splitLine: {           // 分隔线
	                length :15,         // 属性length控制线长
	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
	                    color: 'auto'
	                }
	            },
	            pointer: {
	                width:2
	            },
	            title : {
	            	textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder',
	                    fontSize: 8,
	               //   fontStyle: 'italic'
	            },
                offsetCenter: [0, '115%'],
	            },
	            detail : {
	            	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    fontWeight: 'bolder',
		                    fontSize: 16,
		                },
		                offsetCenter: [0, '5%'],
	            },
	            //data:[{value: carHistoryState[0].motorVoltage, name: '电机控制器直流侧电压(单位:V)'}]
				data:[{value: 0, name: '油料使用率(单位:升/时)'}]
	        },
	        {
	            name:'发动机油压',
	            type:'gauge',
	            center : ['68%', '50%'],    // 默认全局居中
	            radius : '40%',
	            min:-40,
	            max:210,
	            startAngle:135,
	            endAngle:45,
	            splitNumber:2,
	            axisLine: {            // 坐标轴线
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
	                    width: 8
	                }
	            },
	            axisTick: {            // 坐标轴小标记
	                splitNumber:5,
	                length :10,        // 属性length控制线长
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: 'auto'
	                }
	            },
	            splitLine: {           // 分隔线
	                length :15,         // 属性length控制线长
	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
	                    color: 'auto'
	                }
	            },
	            pointer: {
	                width:2
	            },
	            title : {
	            	textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder',
	                    fontSize: 8
	            },
                offsetCenter: [0, '-110%'],
	            },
	            detail : {
	            	textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder',
	                    fontSize: 16,
	                },
	                offsetCenter: [0, '-50%'],
	            },
				data:[{value: 0, name: '发动机油压(单位:'+'kpa)'}]
	        },
	        {
	            name:'油料传递压力',
	            type:'gauge',
	            center : ['68%', '50%'],    // 默认全局居中
	            radius : '40%',
	            min:-50,
	            max:150,
	            startAngle:315,
	            endAngle:225,
	            splitNumber:2,
	            axisLine: {            // 坐标轴线
	                lineStyle: {       // 属性lineStyle控制线条样式
	                    color: [[0.2, '#ff4500'],[0.8, '#48b'],[1, '#228b22']], 
	                    width: 8
	                }
	            },
	            axisTick: {            // 坐标轴小标记
	            	 splitNumber:5,
		                length :10,        // 属性length控制线长
		                lineStyle: {       // 属性lineStyle控制线条样式
		                    color: 'auto'
		                }
	            },
	            splitLine: {           // 分隔线
	                length :15,         // 属性length控制线长
	                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
	                    color: 'auto'
	                }
	            },
	            pointer: {
	                width:2
	            },
	            title : {
	            	textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
	                    fontWeight: 'bolder',
	                    fontSize: 8
	            },
                offsetCenter: [0, '115%'],
	            },
	            detail : {
	            	 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
		                    fontWeight: 'bolder',
		                    fontSize: 16,
		                },
		                offsetCenter: [0, '5%'],
	            },
				data:[{value: 0, name: '油料传递压力(单位:'+'kpa)'}]
	        }
	    ]
	};
}
	//旁路电压
DCOption = {
	animation:false,
		title : {
	        text: '机内温度',
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    animation: false,
	    legend: {
	        data:['机内温度']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            saveAsImage : {show: true}
	        }
	    },
	    dataZoom : {
	        show : true,
	        start : dcZoomStart,
	        end : 100
	    },
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : true,
				data : dcAxis
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name : '摄氏度(℃)'
	        }
	    ],
	    series : [
	        {
	            name:'机内温度',
	            type:'line',
	            data:(function (){
	                var DCDCInputVoltageRes = [];
            		for(var i=0;i<carHistoryState.length;i++){
//             			if(carHistoryState[i].dCDCInputVoltage!=0
//            					&& carHistoryState[i].dCDCOutputVoltage!=0
//            					&& carHistoryState[i].dCACInputVoltage!=0){
           					DCDCInputVoltageRes.unshift(carHistoryState[i].InnerTemperature);
//             			}
            		}
            		if(DCDCInputVoltageRes.length==0){
            			DCDCInputVoltageRes.unshift(0);
            		}
            		return DCDCInputVoltageRes;
	            })()
	        }
	    ]
	};
//负载
dcOutOption = {
	    title : {
	        text: '单节电池电压',
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['单节电池电压']
	    },
	    animation: false,
	    toolbox: {
	        show : true,
	        feature : {
	            saveAsImage : {show: true}
	        }
	    },
	    dataZoom : {
	        show : true,
	        start : dCDOutZoomStart,
	        end : 100
	    },
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : true,
				data : dCDOutAxis
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name : '伏特(V)'
	        }
	    ],
	    series : [
	        {
	            name:'单节电池电压',
	            type:'line',
	            data:(function (){
	                var DCDCOutputCurrentRes = [];
            		for(var i=0;i<carHistoryState.length;i++){
           					DCDCOutputCurrentRes.unshift(carHistoryState[i].SingleCellVoltage);
            		} 
            		if(DCDCOutputCurrentRes.length==0){
            			DCDCOutputCurrentRes.unshift(0);
            		}
	                return DCDCOutputCurrentRes;
	            })()
	        }

	    ]
	};
	
rateOption = {
	    title : {
	        text: '输出频率',
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['输出频率']
	    },
	    animation: false,
	    toolbox: {
	        show : true,
	        feature : {
	            saveAsImage : {show: true}
	        }
	    },
	    dataZoom : {
	        show : true,
	        start : rateZoomStart,
	        end : 100
	    },
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : true,
				data : rateAxis
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name : '赫兹(Hz)'
	        }
	    ],
	    series : [
	        {
	            name:'输出频率',
	            type:'line',
	            data:(function (){
	                var rateCurrentRes = [];
            		for(var i=0;i<carHistoryState.length;i++){
            			rateCurrentRes.unshift(carHistoryState[i].OutputFrequency);
            		} 
            		if(rateCurrentRes.length==0){
            			rateCurrentRes.unshift(0);
            		}
	                return rateCurrentRes;
	            })()
	        }

	    ]
	};
	//输入电压
dcTempOption = {
	    title : {
	        text: '剩余电量',
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    animation: false,
	    legend: {
	        data:['剩余电量']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            saveAsImage : {show: true}
	        }
	    },
	    dataZoom : {
	        show : true,
	        start : dCACTempxoomStart,
	        end : 100
	    },
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : true,
				data : dCACTempAxis
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name : '百分比(%)'
	        }
	    ],
	    series : [
	        {
	            name:'剩余电量',
	            type:'line',
	            data:(function (){
	                var DCDCTemperatureRes = [];
            		for(var i=0;i<carHistoryState.length;i++){
           					DCDCTemperatureRes.unshift(carHistoryState[i].DumpEnergy);
            		} 
            		if(DCDCTemperatureRes.length==0){
            			DCDCTemperatureRes.unshift(0);
            		}
	                return DCDCTemperatureRes;
	            })()
	        }
	    ]
	};
	//输出电压
tempratureOption = {
	    title : {
	        text: '',
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    animation: false,
	    legend: {
	        data:['输出电压R','输出电压S','输出电压T']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            saveAsImage : {show: true}
	        }
	    },
	    dataZoom : {
	        show : true,
	        start : dCACTempxoomStart,
	        end : 100
	    },
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : true,
				data : tempAxis
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name : '伏特(V)'
	        }
	    ],
	    series : [
	        {
	            name:'输出电压R',
	            type:'line',
	            data:(function (){
	                var DCDCTemperatureRes = [];
            		for(var i=0;i<carHistoryState.length;i++){
           					DCDCTemperatureRes.unshift(carHistoryState[i].OutputVoltageofR);
            		} 
            		if(DCDCTemperatureRes.length==0){
            			DCDCTemperatureRes.unshift(0);
            		}
	                return DCDCTemperatureRes;
	            })()
	        },{
	            name:'输出电压S',
	            type:'line',
	            data:(function (){
	                var DCDCTemperatureRes = [];
            		for(var i=0;i<carHistoryState.length;i++){
           					DCDCTemperatureRes.unshift(carHistoryState[i].OutputVoltageofS);
            		} 
            		if(DCDCTemperatureRes.length==0){
            			DCDCTemperatureRes.unshift(0);
            		}
	                return DCDCTemperatureRes;
	            })()
	        },{
	            name:'输出电压T',
	            type:'line',
	            data:(function (){
	                var DCDCTemperatureRes = [];
            		for(var i=0;i<carHistoryState.length;i++){
           					DCDCTemperatureRes.unshift(carHistoryState[i].OutputVoltageofT);
            		} 
            		if(DCDCTemperatureRes.length==0){
            			DCDCTemperatureRes.unshift(0);
            		}
	                return DCDCTemperatureRes;
	            })()
	        }
	    ]
	};
	
	highVoltageOption = {
		    title : {
		        text: '单体电池电压',
		        subtext: '实时数据'
		    },
		    animation: false,
		    addDataAnimation:false,
		    tooltip : {
		        trigger: 'axis',
		        formatter: function (params,ticket,callback) {
		    		var param = <%=request.getParameter("entityId")%>;
		    		var requestData = {entityId:param,logTime:params[0][1]};	  
		    		var carState;
		        	$.ajax({  
		        	    type : "post",  
		        	     url : "carState/queryCurrCarStateByLogTime",  
		        	     data : requestData,  
		        	     async : false,  
		        	     success : function(data){
		        	    	 	carState=data.CarState;
		        	     }  
		        	});
		            var res = '单体电池电压 : <br/>' + params[0][1];
		            if(carState!=null){
		            	res += '<br/>' + params[0][0] + ' : ' + params[0][2]+",串号:"+carState.batteryHighVoltageISN;
		                res += '<br/>' + params[1][0] + ' : ' + params[1][2]+",串号:"+carState.batteryHighVoltageIISN;
		                res += '<br/>' + params[2][0] + ' : ' + params[2][2]+",串号:"+carState.batteryHighVoltageIIISN;
		                res += '<br/>' + params[3][0] + ' : ' + params[3][2]+",串号:"+carState.batteryHighVoltageIVSN;
		                res += '<br/>' + params[4][0] + ' : ' + params[4][2]+",串号:"+carState.batteryLowVoltageISN;
		                res += '<br/>' + params[5][0] + ' : ' + params[5][2]+",串号:"+carState.batteryLowVoltageIISN;
		                res += '<br/>' + params[6][0] + ' : ' + params[6][2]+",串号:"+carState.batteryLowVoltageIIISN;
		                res += '<br/>' + params[7][0] + ' : ' + params[7][2]+",串号:"+carState.batteryLowVoltageIVSN;
		            }
		            else{
		                for (var i = 0, l = params.length; i < l; i++) {
		                    res += '<br/>' + params[i][0] + ' : ' + params[i][2];
		                }
		            }
					return res;
		        }
		    },
		    legend: {
		        data:['最高电压','第二高压','第三高压','第四高压','','最低电压','第二低压','第三低压','第四低压']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            //magicType : {show: true, type: ['line', 'bar']},
		            //restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    dataZoom : {
		        show : true,
		        start : 90,
		        end : 100
		    },
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : true,
					data : volHistoryTimeAxis
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            name : '电压(V)'
		        }
		    ],
		    series : [
		        {
		            name:'最高电压',
		            type:'bar',
		            itemStyle: {
		                normal: {
		                    label : {
		                        show: true, position: 'insideTop'
		                    }
		                }
		            },
		            data:(function (){
		                var voltRes = [];
	            		for(var i=0;i<volDisplayNums;i++){
	            			if(i<carHistoryState.length){
	            				voltRes.unshift(carHistoryState[i].batteryHighVoltageI);
	            			}else{
	            				voltRes.unshift(0);
	            			}
	            		} 
		                return voltRes;
		            })(),
		        },{
		            name:'第二高压',
		            type:'bar',
		            itemStyle: {
		                normal: {
		                    label : {
		                        show: true, position: 'insideTop'
		                    }
		                }
		            },
		            data:(function (){
		                var voltRes = [];
	            		for(var i=0;i<volDisplayNums;i++){
	            			if(i<carHistoryState.length){
	            				voltRes.unshift(carHistoryState[i].batteryHighVoltageII);
	            			}else{
	            				voltRes.unshift(0);
	            			}
	            		} 
		                return voltRes;
		            })(),
		        },{
		            name:'第三高压',
		            type:'bar',
		            itemStyle: {
		                normal: {
		                    label : {
		                        show: true, position: 'insideTop'
		                    }
		                }
		            },
		            data:(function (){
		                var voltRes = [];
	            		for(var i=0;i<volDisplayNums;i++){
	            			if(i<carHistoryState.length){
	            				voltRes.unshift(carHistoryState[i].batteryHighVoltageIII);
	            			}else{
	            				voltRes.unshift(0);
	            			}
	            		} 
		                return voltRes;
		            })(),
		        },{
		            name:'第四高压',
		            type:'bar',
		            itemStyle: {
		                normal: {
		                    label : {
		                        show: true, position: 'insideTop'
		                    }
		                }
		            },
		            data:(function (){
		                var voltRes = [];
	            		for(var i=0;i<volDisplayNums;i++){
	            			if(i<carHistoryState.length){
	            				voltRes.unshift(carHistoryState[i].batteryHighVoltageIV);
	            			}else{
	            				voltRes.unshift(0);
	            			}
	            		} 
		                return voltRes;
		            })(),
		        },{
		            name:'最低电压',
		            type:'bar',
		            itemStyle: {
		                normal: {
		                    label : {
		                        show: true, position: 'insideTop'
		                    }
		                }
		            },
		            data:(function (){
		                var voltRes = [];
	            		for(var i=0;i<volDisplayNums;i++){
	            			if(i<carHistoryState.length){
	            				voltRes.unshift(carHistoryState[i].batteryLowVoltageI);
	            			}else{
	            				voltRes.unshift(0);
	            			}
	            		} 
		                return voltRes;
		            })(),
		        },{
		            name:'第二低压',
		            type:'bar',
		            itemStyle: {
		                normal: {
		                    label : {
		                        show: true, position: 'insideTop'
		                    }
		                }
		            },
		            data:(function (){
		                var voltRes = [];
	            		for(var i=0;i<volDisplayNums;i++){
	            			if(i<carHistoryState.length){
	            				voltRes.unshift(carHistoryState[i].batteryLowVoltageII);
	            			}else{
	            				voltRes.unshift(0);
	            			}
	            		} 
		                return voltRes;
		            })(),
		        },{
		            name:'第三低压',
		            type:'bar',
		            itemStyle: {
		                normal: {
		                    label : {
		                        show: true, position: 'insideTop'
		                    }
		                }
		            },
		            data:(function (){
		                var voltRes = [];
	            		for(var i=0;i<volDisplayNums;i++){
	            			if(i<carHistoryState.length){
	            				voltRes.unshift(carHistoryState[i].batteryLowVoltageIII);
	            			}else{
	            				voltRes.unshift(0);
	            			}
	            		} 
		                return voltRes;
		            })(),
		        },{
		            name:'第四低压',
		            type:'bar',
		            itemStyle: {
		                normal: {
		                    label : {
		                        show: true, position: 'insideTop'
		                    }
		                }
		            },
		            data:(function (){
		                var voltRes = [];
	            		for(var i=0;i<volDisplayNums;i++){
	            			if(i<carHistoryState.length){
	            				voltRes.unshift(carHistoryState[i].batteryLowVoltageIV);
	            			}else{
	            				voltRes.unshift(0);
	            			}
	            		} 
		                return voltRes;
		            })(),
		        },
		    ]
		};
		makeCarPannelData(carHistoryState);
		makeCarDataText(carHistoryState);
	}
	
	function makeCarPannelData(carHistoryState){
		if(carHistoryState.length>0){
		}
	}
	
	var aa;
	function makeCarDataText(carHistoryState){
		var a=true;
		var b=true;
		var c=true;
		var d=true;
		var changeStatus="";
		var CitystateStr="";
		var CellstateStr="";
		var WorkingtypeStr="";
		var UpstypeStr="";
		var TestYorNStr="";
		var ShutdownstateStr="";
		var BuzzerStr="";
		if(carHistoryState.length>0){
			
			if(((carHistoryState[0].Workingstate)&8)!=8){
				changeStatus="UPS在线";
				a=false;
			}
			if(((carHistoryState[0].Workingstate)&0x40)==0x40){
				changeStatus=changeStatus+"  电池电压异常";
				b=false;
			}
			if(((carHistoryState[0].Workingstate)&0x20)==0x20){
				changeStatus=changeStatus+"  UPS超载运行";
				c=false;
			}
			if(((carHistoryState[0].Workingstate)&0x10)==0x10){
				changeStatus=changeStatus+"  电池逆变";
				d=false;
			}
				if(a&b&c&d){
				changeStatus="UPS正常";
				$("#Workingstate").css("background-color","#3CB371")
			}
				//市电
				if(carHistoryState[0].Citystate==0){
					CitystateStr="正常";
					$("#Citystate").css("background-color","#3CB371");
				}
				if(carHistoryState[0].Citystate==1){
					CitystateStr="失败";
					$("#Citystate").css("background-color","#FFA500"); 
				}
				//电池
				if(carHistoryState[0].InputVoltageofS==0){
					CellstateStr="正常";
					$("#Cellstate").css("background-color","#3CB371");
				}
				if(carHistoryState[0].InputVoltageofS==1){
					CellstateStr="低";
					$("#Cellstate").css("background-color","#FFA500"); 
				}
				//工作模式
				if(carHistoryState[0].ChargeAndDischarge==0){
					WorkingtypeStr="正常";
					$("#Workingtype").css("background-color","#3CB371"); 
				}
				if(carHistoryState[0].ChargeAndDischarge==1){
					WorkingtypeStr="异常";
					$("#Workingtype").css("background-color","#FFA500"); 
				}
				//ups类型
				if(carHistoryState[0].BypassVoltageofR==0){
					UpstypeStr="在线式";
					$("#Upstype").css("background-color","#3CB371"); 
				}
				if(carHistoryState[0].BypassVoltageofR==1){
					UpstypeStr="离线式";
					$("#Upstype").css("background-color","#FFA500"); 
				}
				//测试
				if(carHistoryState[0].LoadofR==0){
					TestYorNStr="未测试";	
					$("#TestYorN").css("background-color","#FFA500");
				}
				if(carHistoryState[0].LoadofR==1){
					TestYorNStr="正在测试";
					$("#TestYorN").css("background-color","#4876FF");
				}
				//关机
				if(carHistoryState[0].BypassVoltageofS==0){
					ShutdownstateStr="未关机";
					$("#Shutdownstate").css("background-color","#3CB371"); 
				}
				if(carHistoryState[0].BypassVoltageofS==1){
					ShutdownstateStr="已关机";
					$("#Shutdownstate").css("background-color","#FFA500"); 
				}
				//蜂鸣
				if(carHistoryState[0].Buzzer==1){
					BuzzerStr="开启";
					$("#Buzzer").css("background-color","#FFA500"); 
				}
				if(carHistoryState[0].Buzzer==0){
					BuzzerStr="关闭";
					$("#Buzzer").css("background-color","#3CB371");
				}
				
				aa = carHistoryState[0].SingleCellVoltage;
			
			$("#pressureText").val(changeStatus);
			$("#terminalIDText").val(carHistoryState[0].terminalID);
			$("#logtimeText").val(new Date(carHistoryState[0].LogTimeLong).Format("yyyy-MM-dd hh:mm:ss"));
			$("#torqueText").val(carHistoryState[0].DumpEnergy);
			$("#motorspeedText").val(carHistoryState[0].Workload);
			$("#temperatureText").val(carHistoryState[0].InnerTemperature);
			$("#pedalSignalText").val(carHistoryState[0].ChargeAndDischarge);
			$("#stopSignalText").val(carHistoryState[0].InputVoltageFault);
			$("#speedText").val(carHistoryState[0].SingleCellVoltage);
			$("#directionAlarmSignalText").val(carHistoryState[0].EnduranceTime);
			$("#batterycapacityText").val(carHistoryState[0].OutputFrequency);
			$("#batterySOCText").val(carHistoryState[0].BypassVoltage);
			$("#batteryStateText").val(carHistoryState[0].BypassFrequency);
			
			$("#Workingstate").val(changeStatus);
			$("#Citystate").val(CitystateStr);
			$("#Cellstate").val(CellstateStr);
			$("#Workingtype").val(WorkingtypeStr);
			$("#Upstype").val(UpstypeStr);
			$("#TestYorN").val(TestYorNStr);
			$("#Shutdownstate").val(ShutdownstateStr);
			$("#Buzzer").val(BuzzerStr);
			
			$("#InputVoltageofR").val(carHistoryState[0].InputVoltageofR+"V");
			$("#InputVoltageofR1").val(carHistoryState[0].InputVoltageofR+"V");
			$("#Inputfrequency").val(carHistoryState[0].OutputFrequency+"Hz");
			$("#Inputfrequency1").val(carHistoryState[0].OutputFrequency+"Hz");
			$("#OutputVoltageofR").val(carHistoryState[0].OutputVoltageofR+"V");
			$("#OutputVoltageofR1").val(carHistoryState[0].OutputVoltageofR+"V");
			
			$("#Workload").val(carHistoryState[0].Workload*100+"%");
			$("#Workload1").val(carHistoryState[0].Workload*100+"%");
			
			$("#SingleCellVoltage").val(carHistoryState[0].SingleCellVoltage+"V");
			$("#SingleCellVoltage1").val(carHistoryState[0].SingleCellVoltage+"V");
			
			if(carHistoryState[0].DumpEnergy>0){
			$("#DumpEnergy").val(carHistoryState[0].DumpEnergy+"%");
			}
			if(carHistoryState[0].DumpEnergy>0){
			$("#DumpEnergy1").val(carHistoryState[0].DumpEnergy+"%");
			}
			$("#InnerTemperature").val(carHistoryState[0].InnerTemperature+"℃");
			$("#InnerTemperature1").val(carHistoryState[0].InnerTemperature+"℃");
			
			$("#EnduranceTime").val(new Date(carHistoryState[0].EnduranceTime).Format("dd hh:mm:ss"));
			$("#EnduranceTime1").val(carHistoryState[0].EnduranceTime+"分钟");
			/* $.ajax({
				type:'post',
				url:'carState/getInfo',
				data:{id:param},
				dataType:'json',
				success:function(data) {
				var ups = data.ups[0];
			$("#UPSfactoryinfo").val(ups.upsFactoryInfo);
			$("#UPSserial").val(ups.upsSerial);
			$("#UPShardware").val(ups.upsHardware);
				}
			}); */
		}
	}
	
	function drawChart() {
		addStyle();
	    //旁路电压
		DCChart = echarts.init(document.getElementById('DCDCInputVoltage'));
		DCChart.setOption(DCOption,true);
		
	    //负载
		dcOutChart = echarts.init(document.getElementById('DCDCOutputCurrent'));
		dcOutChart.setOption(dcOutOption,true);
		
		//输入电压
		dcTempChart = echarts.init(document.getElementById('DCDCTemperature'));
		dcTempChart.setOption(dcTempOption,true);
		//输出电压
		tempratureChart=echarts.init(document.getElementById('tempratureMain'));
		tempratureChart.setOption(tempratureOption,true);
		
		rateChart=echarts.init(document.getElementById('highVoltageMain'))
		rateChart.setOption(rateOption,true);
// 		highVoltageChart=echarts.init(document.getElementById('highVoltageMain'));
// 		highVoltageChart.setOption(highVoltageOption,true);
		removeStyle();
	}	
	
	function addStyle(){ //必须对navtab进行初始化，否则无法显示图表
		if($("#collapseOne").hasClass("active")){
			selectedIndex=1;
		}else{
			$("#collapseOne").addClass("fade");
		}
		if($("#collapseTwo").hasClass("active")){
			selectedIndex=2;
		}else{
			$("#collapseTwo").addClass("fade");
		}
		if($("#collapseThree").hasClass("active")){
			selectedIndex=3;
		}else{
			$("#collapseThree").addClass("fade");
		}
		if($("#collapseFour").hasClass("active")){
			selectedIndex=4;
		}else{
			$("#collapseFour").addClass("fade");
		}
		if($("#collapseFive").hasClass("active")){
			selectedIndex=5;
		}else{
			$("#collapseFive").addClass("fade");
		}
		if($("#collapseSix").hasClass("active")){
			selectedIndex=6;
		}else{
			$("#collapseSix").addClass("fade");
		}
		if($("#collapseSeven").hasClass("active")){
			selectedIndex=7;
		}else{
			$("#collapseSeven").addClass("fade");
		}
		if($("#collapseEight").hasClass("active")){
			selectedIndex=8;
		}else{
			$("#collapseEight").addClass("fade");
		}
		$("#collapseOne").addClass("active");	
		$("#collapseTwo").addClass("active");
		$("#collapseThree").addClass("active");
		$("#collapseFour").addClass("active");
		$("#collapseFive").addClass("active");
		$("#collapseSix").addClass("active");
		$("#collapseSeven").addClass("active");
		$("#collapseEight").addClass("active");
	}
	
	function removeStyle(){
		$("#collapseOne").removeClass();	
		$("#collapseTwo").removeClass();
		$("#collapseThree").removeClass();
		$("#collapseFour").removeClass();
		$("#collapseFive").removeClass();
		$("#collapseSix").removeClass();
		$("#collapseSeven").removeClass();
		$("#collapseEight").removeClass();
		$("#collapseOne").addClass("tab-pane");	
		$("#collapseTwo").addClass("tab-pane");
		$("#collapseThree").addClass("tab-pane");
		$("#collapseFour").addClass("tab-pane");
		$("#collapseFive").addClass("tab-pane");
		$("#collapseSix").addClass("tab-pane");
		$("#collapseSeven").addClass("tab-pane");
		$("#collapseEight").addClass("tab-pane");
		if(selectedIndex==1){
			$("#collapseOne").addClass("active");
			$("#l1").addClass("active");
		}
		if(selectedIndex==2){
			$("#collapseTwo").addClass("active");
			$("#l2").addClass("active");
		}
		if(selectedIndex==3){
			$("#collapseThree").addClass("active");
			$("#l3").addClass("active");
		}
		if(selectedIndex==4){
			$("#collapseFour").addClass("active");
			$("#l4").addClass("active");
		}
		if(selectedIndex==5){
			$("#collapseFive").addClass("active");
			$("#l5").addClass("active");
		}
		if(selectedIndex==6){
			$("#collapseSix").addClass("active");
			$("#l6").addClass("active");
		}
		if(selectedIndex==7){
			$("#collapseSeven").addClass("active");
			$("#l7").addClass("active");
		}
		if(selectedIndex==8){
			$("#collapseEight").addClass("active");
			$("#l8").addClass("active");
		}
	}
	
	
	var currCarState;
	var currCarStatelen;
	//初始化方法
	function init(){
		var param = <%=request.getParameter("entityId")%>;
		$.post("carState/queryAllCurrCarState", {entityId:param}, function(data) {
			console.warn(data.allCurrCarState[0]["SingleCellVoltage"]);
			$("#totalPower").val((aa * $("#coefficient").val()).toFixed(2) + "V");
			dealData(data);
		});
	};
	
	var dealNum=0;
	//刷新
	function dealData(data){
				
				currCarState = data.allCurrCarState;
				if(currCarState!=null){
					len=currCarState.length;
				}else{
					len=0;
				}
				if(len>0){
					restLogTime=currCarState[0].LogTimeLong;
					var displayAllCurrCarState=setTimeout(function(){
							for(var i=len-1;i>=0;i--){		
							    var axisData = new Date(currCarState[i].LogTimeLong).Format("yyyy-MM-dd hh:mm:ss");
							    dcTempOptionAddlen=false;
							    dcOutOptionAddlen=false;
							    DCOptionAddlen=false;
							    rateOptionAddlen=false;
							    tempratureOptionAddlen=false;
							    if(dcTempOptionNum<displayNums){
							    	dcTempOptionAddlen=true;
							    	dcTempOptionNum++;
							    }
							    if(dcOutOptionNum<displayNums){
							    	dcOutOptionAddlen=true;
							    	dcOutOptionNum++;
							    }
							    if(DCOptionNum<displayNums){
							    	DCOptionAddlen=true;
							    	DCOptionNum++;
							    }
							    if(tempratureOptionNum<displayNums){
							    	dcTempOptionAddlen=true;
							    	tempratureOptionNum++;
							    }
							    if(rateOptionNum<displayNums){
							    	rateOptionAddlen=true;
							    	rateOptionNum++;
							    }
							    	DCOption.dataZoom.start=getDataZoomStart(DCOptionNum);	
								    DCChart.addData([
										[
											0,        // 系列索引
											currCarState[i].InnerTemperature, // 新增数据
											false,     // 新增数据是否从队列头部插入
											DCOptionAddlen,     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
											axisData
										]
									]);
							    	dcOutOption.dataZoom.start=getDataZoomStart(dcOutOptionNum);
								    dcOutChart.addData([
										[
											0,        // 系列索引
											currCarState[i].SingleCellVoltage, // 新增数据
											false,     // 新增数据是否从队列头部插入
											dcOutOptionAddlen,     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
											axisData
										]
									]);
							    	dcTempOption.dataZoom.start=getDataZoomStart(dcTempOptionNum);
								    dcTempChart.addData([
										[
											0,        // 系列索引
											currCarState[i].DumpEnergy, // 新增数据
											false,     // 新增数据是否从队列头部插入
											dcTempOptionAddlen,     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
											axisData
										]
									]);
							    	tempratureOption.dataZoom.start=getDataZoomStart(tempratureOptionNum);
								    tempratureChart.addData([
					   			        [
					   			            0,        // 系列索引
					   			         	currCarState[i].OutputVoltageofR, // 新增数据
					   			            false,     // 新增数据是否从队列头部插入
					   			         	tempratureOptionAddlen,     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
					   			        	axisData
					   			        ],[
					   			            1,        // 系列索引
					   			         	currCarState[i].OutputVoltageofS, // 新增数据
					   			            false,     // 新增数据是否从队列头部插入
					   			         	tempratureOptionAddlen,     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
					   			        	axisData
					   			        ],[
					   			            2,        // 系列索引
					   			         	currCarState[i].OutputVoltageofT, // 新增数据
					   			            false,     // 新增数据是否从队列头部插入
					   			         	tempratureOptionAddlen,     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
					   			        	axisData
					   			        ]
					   			    ]);
							    	rateOption.dataZoom.start=getDataZoomStart(rateOptionNum);
								    rateChart.addData([
					   			        [
					   			            0,        // 系列索引
					   			         	currCarState[i].OutputFrequency, // 新增数据
					   			            false,     // 新增数据是否从队列头部插入
					   			         	rateOptionAddlen,     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
					   			        	axisData
					   			        ]
					   			     ]);
							}
							makeCarPannelData(currCarState);
							makeCarDataText(currCarState);
							$("#totalPower").val(aa * bb + "V");
							dealNum++;
							if(dealNum>=20)
							{
								dealNum=0;
								disposeGauge=false;
								disposeChart();
								queryHistoryCarMonitorState();
								return;
							}							
							init();
						},
						getDataInterval);
				}else{
					setTimeout('init()',getDataInterval);
				}
	};
	
	function disposeChart(){
		if(disposeGauge==true){
		}
		DCChart.clear();
		DCChart.dispose();
		dcOutChart.clear();
		dcOutChart.dispose();
		dcTempChart.clear();
		dcTempChart.dispose();
		tempratureChart.clear();
		tempratureChart.dispose();
	}
		
    function sleep(n) {
        var start = new Date().getTime();
        while(true)  if(new Date().getTime()-start > n) break;
    }

	
	$(document).ready(function() {
		App.init();
		getInfo();
		queryHistoryCarMonitorState();
		$(window).bind('beforeunload',function(){
			disposeChart();
		});
	})
	
</script>
</html>