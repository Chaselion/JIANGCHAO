<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DMOP</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="<%=basePath%>/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/menu/index.css">
<script src="<%=basePath%>/plugins/menu/jquery-1.10.2.js"></script>
</head>
 <script type="text/javascript">
	 $(function(){
 		$.post("firstPage/getData","",function(data){
			var totalData = data.menuModule;//所有数据
			var title = [];
			var allTitle = $(".introduction a");//放置父级text位置
			var iconPosition = $(".mynew-icons");
			var allIcon=[];
			var arrTitle = [];
			var allChildren = [];	//所有父级	
			for(i=0;i<totalData.length;i++){
					allChildren.push(totalData[i].children);
					for(j=0;j<allTitle.length;j++){
						arrTitle[j] = allTitle[j].id;
						if(i==j){
							$("#"+arrTitle[j]).text(totalData[i].text);				
						}
					}//将父级text放入
					
					for(k=0;k<iconPosition.length;k++){
						allIcon[k] = iconPosition[k].id;
						if(i==k){
			
							$("#"+allIcon[k]).append("<i class = '" + totalData[i].iconcls + " icon-4x' style='color:lightgray'></i>");
						}
					}//将父级icon放入

			}
 			
			//第一个父级的子级放入各个li
			var children0 = allChildren[0];
			var li0 = $("#li-contain0 li");
			var arrli0 = [];
			for(j=0;j<li0.length;j++){
				arrli0[j] = li0[j].id;
				for(i=0;i<children0.length;i++){
					 var page_url = children0[i].url;
					if(j==i){
						$("#"+arrli0[j]).append("<a>" + children0[i].text + "</a>");
						 (function(j,page_url){						 
		 					 $("#"+arrli0[j]).on('click',function(event){
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}
			
			var children1 = allChildren[1];
			var li1 = $("#li-contain1 li");
			var arrli1 = [];
			for(j=0;j<li1.length;j++){
				arrli1[j] = li1[j].id;
				for(i=0;i<children1.length;i++){
					 var page_url = children1[i].url;
					if(j==i){
						$("#"+arrli1[j]).append("<a>" + children1[i].text + "</a>");
 						(function(j,page_url){	 
		 					 $("#"+arrli1[j]).on('click',function(event){
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}

			var children2 = allChildren[2];
			var li2 = $("#li-contain2 li");
			var arrli2 = [];
			for(j=0;j<li2.length;j++){
				arrli2[j] = li2[j].id;
				for(i=0;i<children2.length;i++){
					if(j==i){
						$("#"+arrli2[j]).append("<a>" + children2[i].text + "</a>");
						(function(j,page_url){	 
		 					 $("#"+arrli2[j]).on('click',function(event){
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}
			
			var children3 = allChildren[3];
			var li3 = $("#li-contain3 li");
			var arrli3 = [];
			for(j=0;j<li3.length;j++){
				arrli3[j] = li3[j].id;
				for(i=0;i<children3.length;i++){
					 var page_url = children3[i].url;
					if(j==i){
						$("#"+arrli3[j]).append("<a>" + children3[i].text + "</a>");
						(function(j,page_url){	 
		 					 $("#"+arrli3[j]).on('click',function(event){
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}
			
			var children4 = allChildren[4];
			var li4 = $("#li-contain4 li");
			var arrli4 = [];
			for(j=0;j<li4.length;j++){
				arrli4[j] = li4[j].id;
				for(i=0;i<children4.length;i++){
					 var page_url = children4[i].url;
					if(j==i){
						$("#"+arrli4[j]).append("<a>" + children4[i].text + "</a>");
						(function(j,page_url){	 
		 					 $("#"+arrli4[j]).on('click',function(event){
		 						 $("iframe").attr("src", "/dmop-web" + page_url);
		 						
		 					 });
		 					 
	 					 })(j,page_url);
					}				
				}
			}

			
 		});
	});	

</script>
<body>
 <div class="guide-slider" id="guideSlider">
        <div id="logo-position">
            <img id="head-logo" src="<%=basePath%>/images/logo.png">
        </div>
        <ul class="guide-list">
            <li class="guide on">
                <div class="display">
                    <div class="mynew-icons" id="icon0"></div>
                    <div class="introduction"><a id="mo-title0"></a></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain0">
                            <li id="a0" class="function corner"></li>
                            <li id="a1" class="function corner"></li>
                            <li id="a2" class="function corner"></li>
                            <li id="a3" class="function corner"></li>
                            <li id="a4" class="function corner"></li>
                            <li id="a5" class="function corner"></li>
                        </ul>
                    </div>
                </div>
            </li>
             <li class="guide">
                <div class="display">
                     <div class="mynew-icons" id="icon1"></div>
                    <div class="introduction"><a id="mo-title1"></a></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain1">
                            <li id="b0" class="function"></li>
                            <li id="b1" class="function"></li>
                            <li id="b2" class="function"></li>
 							<li id="b3" class="function"></li>
 							<li id="b4" class="function"></li>
 							<li id="b5" class="function"></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="guide">
                <div class="display">
                    <div class="mynew-icons" id="icon2"></div>
                    <div class="introduction"><a id="mo-title2"></a></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain2">
                            <li id="c0" class="function"></li>
                            <li id="c1" class="function"></li>
                            <li id="c2" class="function"></li>
                            <li id="c3" class="function"></li>
                            <li id="c4" class="function"></li>
						    <li id="c5" class="function"></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="guide">
                <div class="display">
                   <div class="mynew-icons" id="icon3"></div>
                    <div class="introduction"><a id="mo-title3"></a></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain3">
                            <li id="d0" class="function"></li>
                            <li id="d1" class="function"></li>
                            <li id="d2" class="function"></li>
 							<li id="d3" class="function"></li>
 							<li id="d4" class="function"></li>
 							<li id="d5" class="function"></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li class="guide">
                <div class="display">
                     <div class="mynew-icons" id="icon4"></div>
                    <div class="introduction"><a id="mo-title4"></a></div>
                </div>
                <div class="behind">
                    <div class="function-list-wrap">
                        <ul class="function-list" id="li-contain4">
                            <li id="e0" class="function"></li>
                            <li id="e1" class="function"></li>
                            <li id="e2" class="function"></li>
                            <li id="e3" class="function"></li>
                            <li id="e4" class="function"></li>
                            <li id="e5" class="function"></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
   
    <iframe src="<%=basePath%>/dashboard.jsp" id="origin-content" scrolling="auto" frameborder=0 width="100%" margin-top="155px" height="100%"></iframe>
    <iframe id="wen-content" width="100%" scrolling="auto" frameborder=0 margin-top="155px" height="100%"></iframe>
</body>

<script type="text/javascript">
var $guideSlider = $("#guideSlider").eq(0);

$guideSlider.find(".guide-list .guide").hover(function() {
    $(this).addClass("on").siblings().removeClass("on");
});
</script>
</html>