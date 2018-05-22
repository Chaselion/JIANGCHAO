var LocationChooser = function(options) {
	this.ID = options.ID;	//modal对话框的ID，也作为LocationChooser示例的js变量名，因此要求唯一
	this.jqID = "#" + options.ID;
	window[options.ID] = this;
	
	this.countPerPage = 10;	//	每页最大显示结果数
	this.pageOpt = {
		paginationCondense: true,
		drawFirstPage:true,
		lastPageText: "&laquo;",
		nextPageText: "&raquo;"
	};

	this.drawnMarkerAarry = [];
	
	//类型常量
	this.TYPE_CUSTOM = 1;
	this.TYPE_BAIDU = 2;
	
	//marker和baiduWindow打开函数缓存
	this.markerArray_baidu = [];
	this.openInfoWinFuns_baidu = [];
	this.poiInfo_baidu = [];
	
	this.markerArray_custom = [];
	this.openInfoWinFuns_custom = [];
	this.poiInfo_custom = [];

	var that = this;
	
	/* 查找modal对话框内部的tab */
	$(this.jqID).find('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		//e.target // activated tab
		//e.relatedTarget // previous tab
		var typeStr = $(e.target).data("chooselocaltype");
		var type = parseInt(typeStr);
		that.clearLastSearchMarker();
		that.redrawMarkerByType(type);
	});
	
	$(this.jqID).on('shown.bs.modal', function (e) {
			that.initMap();
	});
	
	$('#dlgOutletForm').on('hidden.bs.modal', function (e) {
		$("#outletForm").validate().resetForm();
	});
	
	//搜索百度地图按钮事件
	$("#btnSearchLocal").click(function() {
		that.baiduSearchLocal();
	});
	//搜索自定义地点按钮事件
	$("#btnCustomSearchLocal").click(function() {
		that.customSearchLocal();
	});
	
	//搜索百度地图输入框回车事件
	$('#txtLocationKeyword').bind('keypress',function(event){
        if(event.keyCode == "13") {
			that.baiduSearchLocal();
        }
    });
	//搜索自定义地点输入框回车事件
	$('#txtCustomLocationKeyword').bind('keypress',function(event){
        if(event.keyCode == "13") {
			that.customSearchLocal();
        }
    });
	
	//保存自定义地点
	$("#btnConfirmOutletForm").click(function() {
		that.requestSaveOutlet();
	});
};

LocationChooser.prototype.initMap = function() {
	if (this.map != null) {
		return;
	}
	this.map = new BMap.Map("baidumap");            // 创建Map实例
	var point = new BMap.Point(104.06, 30.67);    // 创建点坐标
	this.map.centerAndZoom(point, 13);                     // 初始化地图,设置中心点坐标和地图级别。
	this.map.enableScrollWheelZoom();                            //启用滚轮放大缩小

	//var opts = {offset: new BMap.Size(0, 47)};

	var leftNaviCtrl = new BMap.NavigationControl();
	this.map.addControl(leftNaviCtrl);  //添加默认缩放平移控件
};

LocationChooser.prototype.baiduSearchLocal = function() {
	var keyword = $("#txtLocationKeyword").val();
	var that = this;
	if (this.baidu_LocalSearch == null) {
		var baidu_onSearchComplete = function(results) {
				that.clearLastSearchMarker();
				that.openInfoWinFuns_baidu = [];
				that.poiInfo_baidu = [];
				that.markerArray_baidu = [];
				
				// 判断状态是否正确
				var pageHtml = "";
				var resultHtml = "没有找到相关结果!";
				if (that.baidu_LocalSearch.getStatus() == BMAP_STATUS_SUCCESS){
					var totalCount = results.getNumPois();	//返回总结果数
					var totalPages = results.getNumPages();	//返回总页数
					var pageIndex = results.getPageIndex();	//返回页数序号


					pageHtml = getPagerHtml(pageIndex, totalPages, that.ID + '.baidu_toPage', that.pageOpt);
					resultHtml = that.getSearchResultHtml(results, that.TYPE_BAIDU);
					
				}
				document.getElementById("r-result").innerHTML = resultHtml;
				document.getElementById("r-result-pager").innerHTML = pageHtml;
			};
	
		this.baidu_LocalSearch = new BMap.LocalSearch(this.map, {
			//renderOptions: {map: this.map, autoViewport : false},
			onSearchComplete: baidu_onSearchComplete
			
		});
	}
	this.baidu_LocalSearch.search(keyword);
};

LocationChooser.prototype.customSearchLocal = function() {
	this.customLocalType = $("#selectCustomLocalType").val();
	this.customSearchKeyword = $("#txtCustomLocationKeyword").val();
	//this.customStartIndex = $("#customStartIndex").val();
	
	this.requestCustomSearchLocal(0, this.customLocalType, this.customSearchKeyword);
};

LocationChooser.prototype.requestCustomSearchLocal = function(customPageIndex, customLocalType, customSearchKeyword) {
	$("#customPageIndex").val(customPageIndex);
	
	var that = this;
	var countPerPage = this.countPerPage;
	var customStartIndex = countPerPage * customPageIndex;
	$.post("outlet/queryOutlet", {
			"start": customStartIndex, 
			"length": countPerPage, 
			"outletType": customLocalType, 
			"outletName": customSearchKeyword}, function(responseData) {
		that.clearLastSearchMarker();
		that.openInfoWinFuns_custom = [];
		that.poiInfo_custom = [];
		that.markerArray_custom = [];
		
		var pageHtml = "";
		var resultHtml = "没有找到相关结果!";
		if (responseData.data.length > 0) {
			var totalCount = responseData.recordsFiltered;	//返回符合条件的总结果数
			var totalPages = responseData.totalPage;	//总页数
			var pageIndex = responseData.currentPage;	//返回页数序号
			
			var pois = [];
			for (var i = 0; i < responseData.data.length; i++) {
				var tmpOutlet = responseData.data[i];
				var poi = {
					"title": tmpOutlet.outletName,
					"address": tmpOutlet.outletAddress,
					"point" : new BMap.Point(tmpOutlet.outletLng, tmpOutlet.outletLat),
					"type" : BMAP_POI_TYPE_NORMAL,
					"outletId": tmpOutlet.outletId,
					"outletType": tmpOutlet.outletType
				};
				pois.push(poi);
			}
			
			var results = {
				pois: pois,
				getCurrentNumPois: function(i) {
					return this.pois.length;
				},
				getPoi: function(i) {
					if (i >= 0 && i < this.pois.length) {
						return this.pois[i];
					} else {
						return null;
					}
				}
			};
			
			pageHtml = getPagerHtml(pageIndex, totalPages, that.ID + '.custom_toPage', that.pageOpt);
			resultHtml = that.getSearchResultHtml(results, that.TYPE_CUSTOM);
		}
		document.getElementById("c-r-result").innerHTML = resultHtml;
		document.getElementById("c-r-result-pager").innerHTML = pageHtml;
	});
}

//清空上次查询缓存的marker、poi信息、点击弹出窗等
LocationChooser.prototype.clearLastSearchMarker = function() {
	for (var i = 0; i < this.drawnMarkerAarry.length; i++) {
			this.map.removeOverlay(this.drawnMarkerAarry[i]);
	}
	this.drawnMarkerAarry = [];
};

LocationChooser.prototype.redrawMarkerByType = function(type) {
	var tmpMarkerArray = null;
	if (type == this.TYPE_BAIDU) {
		tmpMarkerArray = this.markerArray_baidu;
	} else {
		tmpMarkerArray = this.markerArray_custom;
	}
	for (var i = 0; i < tmpMarkerArray.length; i++) {
		this.map.addOverlay(tmpMarkerArray[i]);
		this.drawnMarkerAarry.push(tmpMarkerArray[i]);
	}
};

LocationChooser.prototype.resetDlgContent = function() {
	$("#c-r-result").html('');
	$("#c-r-result-pager").html('');
	
	$("#r-result").html('');
	$("#r-result-pager").html('');
	
	//$("#customStartIndex").val(0);
}

LocationChooser.prototype.getSearchResultHtml = function(results, type) {
	var tmpOpenInfoWinFuns = null;
	var tmpPoiInfo = null;
	var tmpMarkerArray = null;
	var listPre = "";
	var funcSuffix = "";
	if (type == this.TYPE_BAIDU) {
		//this.openInfoWinFuns_baidu = [];
		//this.poiInfo_baidu = [];
		//this.markerArray_baidu = [];
		
		tmpOpenInfoWinFuns = this.openInfoWinFuns_baidu;
		tmpPoiInfo = this.poiInfo_baidu;
		tmpMarkerArray = this.markerArray_baidu;
		listPre = "listBaidu";
		funcSuffix = "_baidu";
	} else {
		//this.openInfoWinFuns_custom = [];
		//this.poiInfo_custom = [];
		//this.markerArray_custom = [];
		
		tmpOpenInfoWinFuns = this.openInfoWinFuns_custom;
		tmpPoiInfo = this.poiInfo_custom;
		tmpMarkerArray = this.markerArray_custom;
		listPre = "listCustom";
		funcSuffix = "_custom";
	}
	
	var s = [];
    s.push('<div style="height: 320px;overflow:auto;font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; border: 1px solid rgb(153, 153, 153);">');
    s.push('<div style="background: rgb(255, 255, 255);">');
    s.push('<ol style="list-style: none; padding: 0px; margin: 0px;">');
    	
    for (var i = 0; i < results.getCurrentNumPois(); i ++) {
        var marker = this.addMarker(results.getPoi(i).point, i);
		tmpMarkerArray.push(marker);	//加入缓存以便清除
			
        var openInfoWinFun = this.addInfoWindow(marker, results.getPoi(i), i, listPre);
        tmpOpenInfoWinFuns.push(openInfoWinFun);
			
		//缓存POI信息
		tmpPoiInfo.push(results.getPoi(i));
			
        // 默认打开第一标注的信息窗口
        var selected = "";
        if(i == 0) {
            selected = "background-color:#f0f0f0;";
            openInfoWinFun();
        }
		var yOff = 0 - i * 25;
        s.push('<li id="' + listPre + i + '" style="margin: 2px 0px; padding: 0px 5px 5px 0px; cursor: pointer; overflow: hidden; line-height: 17px;' + selected + '" onclick="' + this.ID + '.openInfoWinFuns' + funcSuffix + '[' + i + ']()">');
			s.push('<span style="background:url(images/markers.png) -23px ' + yOff + 'px no-repeat;width:19px;height:25px;cursor:pointer;float:left;*zoom:1;overflow:hidden;margin:2px 3px 0 5px;*margin-right:0px;display:inline;">&nbsp;</span>');
			s.push('<div sytle="zoom: 1; overflow: hidden; padding: 0px 5px;">');
			s.push('<div style="line-height:20px;font-size:12px;"');
			s.push('<span style="color:#00c;">' + results.getPoi(i).title + '</span>');
			//s.push('<a href="javascript:' + this.ID + '.confirmSelectLoc(' + i + ', ' + type + ')" style="margin-left:10px;">选择</a>');
			s.push('</div>');
			s.push('<div style="padding:2px 0;line-height:18px;*zoom:1;overflow:hidden;">');
			s.push('<b style="float:left;font-weight:bold;*zoom:1;overflow:hidden;padding-right:5px;*margin-right:-3px;">地址:</b>');
			s.push('<span style="color:#666;display:block;zoom:1;overflow:hidden;">' + results.getPoi(i).address + '</span>');
            s.push('</div>');
			
			s.push('<div style="padding-left:25px;">');
			s.push('<a href="javascript:' + this.ID + '.confirmSelectLoc(' + i + ', ' + type + ')">选择</a>');
			if (type == this.TYPE_BAIDU) {
				//s.push('<button class="btn btn-default btn-xs" type="button" onclick="' + this.ID + '.openSaveOutlet(' + i + ')">保存到自定义</button>');
				s.push('<a href="javascript:' + this.ID + '.openSaveOutlet(' + i + ')" style="margin-left:10px;">保存到自定义</a>');
			} else {
				s.push('<a href="javascript:' + this.ID + '.openEditOutlet(' + i + ')" style="margin-left:10px;">修改</a>');
				s.push('<a href="javascript:' + this.ID + '.openDeleteOutlet(' + i + ')" style="margin-left:10px;">删除</a>');
			}
			s.push('</div>');
			
			s.push('</div>');
			s.push('</li>');
            s.push('');
    }
    s.push('</ol></div></div>');
	return s.join("");
}

LocationChooser.prototype.confirmSelectLoc = function(poiIndex, type) {
	var tmpPoiInfo = null;
	if (type == this.TYPE_BAIDU) {
		tmpPoiInfo = this.poiInfo_baidu;
	} else {
		tmpPoiInfo = this.poiInfo_custom;
	}
	var poi = tmpPoiInfo[poiIndex];
	
	var callbackId = $(this.jqID).data('callbackId');
	
	$("#" + callbackId).data("dataPOI", poi);
	$("#txtDelivery" + callbackId).val(poi.title + '[' + poi.address + ']');
	$("#hiddenName" + callbackId).val(poi.title);
	$("#hiddenAddress" + callbackId).val(poi.address);
	$("#hiddenLng" + callbackId).val(poi.point.lng);
	$("#hiddenLat" + callbackId).val(poi.point.lat);
	$(this.jqID).modal('hide');
	return false;
};

LocationChooser.prototype.baidu_toPage = function (pageIndex) {
	this.baidu_LocalSearch.gotoPage(pageIndex);
};

LocationChooser.prototype.custom_toPage = function(pageIndex) {
	$("#selectCustomLocalType").val(this.customLocalType);
	$("#txtCustomLocationKeyword").val(this.customSearchKeyword);
	
	//var customStartIndex = this.countPerPage * pageIndex;
	this.requestCustomSearchLocal(pageIndex, this.customLocalType, this.customSearchKeyword);
}

// 添加标注
LocationChooser.prototype.addMarker = function(point, index){
	var myIcon = new BMap.Icon("images/markers.png", new BMap.Size(23, 25), {
		offset: new BMap.Size(10, 25),
		imageOffset: new BMap.Size(0, 0 - index * 25)
	});
	var marker = new BMap.Marker(point, {icon: myIcon});
	this.map.addOverlay(marker);
	
	this.drawnMarkerAarry.push(marker);
	
	return marker;
};

// 添加信息窗口
LocationChooser.prototype.addInfoWindow = function(marker, poi, index, listPre) {
    var maxLen = this.countPerPage;
    var name = null;
    if (poi.type == BMAP_POI_TYPE_NORMAL) {
        name = "地址：  ";
    } else if (poi.type == BMAP_POI_TYPE_BUSSTOP) {
        name = "公交：  ";
    } else if (poi.type == BMAP_POI_TYPE_SUBSTOP) {
        name = "地铁：  ";
    }
    // infowindow的标题
    var infoWindowTitle = '<div style="font-weight:bold;color:#CE5521;font-size:14px">' + poi.title + '</div>';
    // infowindow的显示信息
    var infoWindowHtml = [];
    infoWindowHtml.push('<table cellspacing="0" style="table-layout:fixed;width:100%;font:12px arial,simsun,sans-serif"><tbody>');
    infoWindowHtml.push('<tr>');
    infoWindowHtml.push('<td style="vertical-align:top;line-height:16px;width:38px;white-space:nowrap;word-break:keep-all">' + name + '</td>');
    infoWindowHtml.push('<td style="vertical-align:top;line-height:16px">' + poi.address + ' </td>');
    infoWindowHtml.push('</tr>');
    infoWindowHtml.push('</tbody></table>');
    var infoWindow = new BMap.InfoWindow(infoWindowHtml.join(""), {title: infoWindowTitle, width: 200}); 
    var openInfoWinFun = function() {
        marker.openInfoWindow(infoWindow);
        for(var cnt = 0; cnt < maxLen; cnt++){
            if(!document.getElementById(listPre + cnt)){continue;}
            if(cnt == index){
                document.getElementById(listPre + cnt).style.backgroundColor = "#f0f0f0";
            }else{
                document.getElementById(listPre + cnt).style.backgroundColor = "#fff";
            }
        }
    }
    marker.addEventListener("click", openInfoWinFun);
    return openInfoWinFun;
};

LocationChooser.prototype.openSaveOutlet = function(poiIndex) {
	var poi = this.poiInfo_baidu[poiIndex];
	$("#outletName").val(poi.title);
	$("#outletAddress").val(poi.address);
	$("#outletLng").val(poi.point.lng);
	$("#outletLat").val(poi.point.lat);
	$("#outletId").val("-1");
	$("#outletType option:first").attr("selected", "selected");
	
	
	$("#dlgOutletForm").modal("show");
	return false;
};

LocationChooser.prototype.openEditOutlet = function(poiIndex) {
	var poi = this.poiInfo_custom[poiIndex];
	$("#outletName").val(poi.title);
	$("#outletAddress").val(poi.address);
	$("#outletLng").val(poi.point.lng);
	$("#outletLat").val(poi.point.lat);
	
	$("#outletId").val(poi.outletId);
	$("#outletType").val(poi.outletType);
	
	
	$("#dlgOutletForm").modal("show");
	return false;
};

LocationChooser.prototype.openDeleteOutlet = function(poiIndex) {
	var poi = this.poiInfo_custom[poiIndex];
	this.requestDeleteOutlet(poi.outletId);
};

LocationChooser.prototype.requestSaveOutlet = function(poiIndex) {
	
	var outletId = $("#outletId").val();
	if (outletId == "-1") {
		this.requestAddOutlet();
	} else {
		this.requestUpdateOutlet();
	}
	
	
	/*
	var url = outletId == "-1" ? "outlet/add" : "outlet/update";
	var successMsg = outletId == "-1" ? "成功保存到自定义地点列表!" : "自定义地点信息修改成功!";
	$.post(url, $("#outletForm").serializeArray(), function(data){
		var notyParams = {
			dismissQueue: true,
			modal: false,
			layout: 'top',
			theme: 'defaultTheme'
		};
		if (data.success) {
			notyParams.text = successMsg;
			notyParams.type = "success";
			notyParams.timeout = 2000;
		} else {
			notyParams.text = data.errorMessage;
			notyParams.type = "error";
			notyParams.timeout = 3000;
		}
		noty(notyParams);
	});
	*/
};

LocationChooser.prototype.requestAddOutlet = function() {
	var valid = $("#outletForm").validate().form();
	if (!valid) return;
	
	$.post("outlet/add", $("#outletForm").serializeArray(), function(data){
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
			$("#dlgOutletForm").modal("hide");
		} else {
			notyParams.text = data.errorMessage;
			notyParams.type = "error";
			notyParams.timeout = 3000;
		}
		noty(notyParams);
	});
};

LocationChooser.prototype.requestUpdateOutlet = function() {
	var that = this;
	
	var valid = $("#outletForm").validate().form();
	if (!valid) return;
	
	$.post("outlet/update", $("#outletForm").serializeArray(), function(data){
		//刷新
		
		var notyParams = {
			dismissQueue: true,
			modal: false,
			layout: 'top',
			theme: 'defaultTheme'
		};
		if (data.success) {
			notyParams.text = "自定义地点信息修改成功!";
			notyParams.type = "success";
			notyParams.timeout = 2000;
			
			var customPageIndex = parseInt($("#customPageIndex").val());
			that.custom_toPage(customPageIndex);
			$("#dlgOutletForm").modal("hide");
		} else {
			notyParams.text = data.errorMessage;
			notyParams.type = "error";
			notyParams.timeout = 3000;
		}
		noty(notyParams);
	});
};

LocationChooser.prototype.requestDeleteOutlet = function(outletId) {
	var that = this;
	var requestData = $.param({"outletId":outletId}, true);
	$.post("outlet/delete", requestData, function(data){
		//刷新
		var customPageIndex = parseInt($("#customPageIndex").val());
		if (that.poiInfo_custom.length == 1) {
			customPageIndex = customPageIndex - 1 < 0 ? 0 : customPageIndex - 1;
		}
		
		that.custom_toPage(customPageIndex);
		
		var notyParams = {
			dismissQueue: true,
			modal: false,
			layout: 'top',
			theme: 'defaultTheme'
		};
		if (data.success) {
			notyParams.text = "从自定义地点列表中删除成功!";
			notyParams.type = "success";
			notyParams.timeout = 2000;
		} else {
			notyParams.text = data.errorMessage;
			notyParams.type = "error";
			notyParams.timeout = 3000;
		}
		noty(notyParams);
	});
};
