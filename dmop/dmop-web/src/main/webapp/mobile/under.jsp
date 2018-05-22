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
	    <script type="text/javascript" src="<%=basePath%>assets/js/libs/jquery-1.10.2.min.js"></script>
	    <script type="text/javascript" src="<%=basePath%>plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugins/daterangepicker/moment-with-langs.min.js"></script>
	<script src="js/echarts.js"></script>
	    <script src="js/mui.min.js"></script>  
	</head>
	<body>			
			
				<nav class="mui-bar mui-bar-tab">
				<a class="mui-tab-item mui-active" href="realtime.jsp">
					<span class="mui-icon-extra mui-icon-extra-order"></span>
					<span class="mui-tab-label">实时</span>
				</a>
				<a class="mui-tab-item" href="alarm.jsp">
					<span class="mui-icon-extra mui-icon-extra-notice"></span>
					<span class="mui-tab-label">报警</span>
				</a>
				<a class="mui-tab-item" href="echart.jsp">
					<span class="mui-icon-extra mui-icon-extra-trend"></span>
					<span class="mui-tab-label">统计</span>
				</a>
				<a class="mui-tab-item" href="about.jsp">
					<span class="mui-icon mui-icon-info" style="top:0;"></span>
					<span class="mui-tab-label">关于</span>
				</a>
			</nav>

		<script>
		mui.init();
		var href = location.href;
        var detailID = href.split("?")[1];

		//设置默认打开首页显示的子页序号；
		var Index=detailID;
		//把子页的路径写在数组里面
		var subpages = ['realtime.jsp','alarm.jsp','echart.jsp','about.jsp'];

		//所有的plus-*方法写在mui.plusReady中或者后面。
		mui.plusReady(function() {
		    //获取当前页面所属的Webview窗口对象
		    var self = plus.webview.currentWebview();
		    for (var i = 0; i < 4; i++) {
		        //创建webview子页
		        var sub = plus.webview.create(
		            subpages[i], //子页url
		            subpages[i], //子页id
		            {
		                top: '0px',//设置距离顶部的距离
		                bottom: '50px'//设置距离底部的距离
		            }
		        );
		        //如不是我们设置的默认的子页则隐藏，否则添加到窗口中
		        if (i != Index) {
		            sub.hide();
		        }
		        //将webview对象填充到窗口
		        self.append(sub);
		    }
		});
		
		
		//当前激活选项
		var activeTab = subpages[Index],title=document.querySelector(".mui-title");
		//选项卡点击事件
		mui('.mui-bar-tab').on('tap', 'a', function(e) {
		    //获取目标子页的id
		    var targetTab = this.getAttribute('href');
		    if (targetTab == activeTab) {
		        return;
		    }
		    //更换标题
		    //title.innerHTML = this.querySelector('.mui-tab-label').innerHTML;
		    //显示目标选项卡
		    plus.webview.show(targetTab);
		    //隐藏当前选项卡
		    plus.webview.hide(activeTab);
		    //更改当前活跃的选项卡
		    activeTab = targetTab;
		   
		});
		</script>
	</body>
</html>
