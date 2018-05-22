//轨迹回放的点为baidu坐标。对于原始车辆监控数据的gps坐标，在服务端调用baidu api转换为baidu坐标后传入此控件中)
var TrackPlay = function(opts) {
	this.STATE_NOTLOAD = -1;
	this.STATE_READY = 0;
	this.STATE_PLAYING = 1;
	this.STATE_PAUSE = 2;
	
	this.baiduPointIndex = 0;
	this.lastRowIndex = 0;
	
	this.DEFAULT_SPEED_INDEX = 1;
	this.SPEED = [500, 250, 125, 60];
	this.SPEED_LABEL = ["0.5x", "1x", "2x", "4x"];
	this.currentPlaySpeedIndex = this.DEFAULT_SPEED_INDEX;
	
	this.jqSpanTimeProg = $("#spanTimeProgress");
	
	//地图初始化相关参数
	this.mapDivId = opts.mapDivId;
	this.mapCenterLng = opts.mapCenterLng;
	this.mapCenterLat = opts.mapCenterLat;
	this.mapLevel = opts.mapLevel;
	
	this.WINDOW_OFFSET = new BMap.Size(0, -34);
	this.LABEL_OFFSET = new BMap.Size(-40, 25);
	
	this.SRC_ICON = new BMap.Icon("images/dest_markers.png", new BMap.Size(42, 34), {
		anchor: new BMap.Size(10, 34),
		imageOffset: new BMap.Size(0, 0)
	});
	this.DEST_ICON = new BMap.Icon("images/dest_markers.png", new BMap.Size(42, 34), {
		anchor: new BMap.Size(10, 34),
		imageOffset: new BMap.Size(0, -34)
	});
	this.TRUCK_ICON = new BMap.Icon("images/circle.png", new BMap.Size(27, 27), {    //小车图片
		imageOffset: new BMap.Size(0, 0)    //图片的偏移量。为了是图片底部中心对准坐标点。
	});
	
	this.initLayout();
};

TrackPlay.prototype.resetAll = function() {
	this.btnPlay_NotLoadState();
	
	this.jqSlider.slider("disable");
	this.jqSlider.slider("value", 0);
	
	this.jqSpanTimeProg.text("00:00:00 / 00:00:00");
	
	//移除地图覆盖物
	this.map.clearOverlays();
};

TrackPlay.prototype.clearTrackTable = function() {
	$("#tableTrackData").DataTable().clear().draw();
};

TrackPlay.prototype.initLayout = function() {
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
	
	$("#tableTrackData").data("datatable", {
		language: dt_lang,	//加载国际化语言
		processing: true,
		serverSide: false,
		ordering: false,
		paging: false,
		searching: false,
		autoWidth: false,
		columnDefs: [{
				"targets": 0,
				"data": "terminalID",
				"width": "40px",
				"render": function ( data, type, full, meta) {
					return meta.row + 1;
				}
			}, {
				"targets": 1,
				"className": "align-center",
				"width": "160px",
				"data": "logtime"
			}, {
				"targets": 2,
				"className": "align-center",
				"width": "120px",
				"data": "longitude"
			}, {
				"className": "align-center",
				"targets": 3,
				"width": "120px",
				"data": "latitude"
			}, {
				"className": "align-right",
				"targets": 4,
				"width": "120px",
				"data": null,
				"render": function ( data, type, full, meta) {
					return Math.round(data.maxSpeed);
				}
			}, {
				"className": "align-right",
				"targets": 5,
				"width": "120px",
				"data": "batterycapacity"
			}
			/*
			, {
				"className": "align-right",
				"targets": 6,
				"data": "mileage"
			}*/
			]
	});
	
	this.jqSlider = $("#trackplaySlider").slider({
		range: "min",
		value: 0,
		min: 0
    });
	
	var that = this;
	
	this.jqSlider.slider({
		start: function(event, ui) {
			that.lastPlayState = that.playState;
			that.pause();
		},
		stop: function(event, ui) {
			that.baiduPointIndex = ui.value;
			if (that.lastPlayState == that.STATE_PLAYING) {
				that.play();
			} else {
				that.moveTruck(that.baiduPointIndex);
			}
		},
		slide: function(event, ui) {
			that.baiduPointIndex = ui.value;
		}
	});
	
	//绑定按钮等事件
	$("#btnPlay").click(function() {
		that.handlePlayBtnClick();
	});
	$("#btnFastBackward").click(function() {
		that.handleFastBtnClick();
	});
	$("#btnFastForward").click(function() {
		that.handleSlowBtnClick();
	});
};

TrackPlay.prototype.initMap = function() {
	this.map = new BMap.Map(this.mapDivId);            // 创建Map实例
	var point = new BMap.Point(this.mapCenterLng, this.mapCenterLat);    // 创建点坐标
	this.map.centerAndZoom(point, this.mapLevel);                     // 初始化地图,设置中心点坐标和地图级别
	this.map.addControl(new BMap.NavigationControl());
};

TrackPlay.prototype.setDeliveryData = function(dailyDeliverys) {
	this.srcPoi = [];
	this.destPoi = [];
	for (var i = 0; i < dailyDeliverys.length; i++) {
		var dailyDelivery = dailyDeliverys[i];
		
		var srcPoi = {name:dailyDelivery.sourceName, address:dailyDelivery.sourceAddress, lng:dailyDelivery.sourceLng, lat:dailyDelivery.sourceLat, deliveryNumber: dailyDelivery.deliveryNumber};
		this.srcPoi.push(srcPoi);
		
		var destPoi = {name:dailyDelivery.destName, address:dailyDelivery.destAddress, lng:dailyDelivery.destLng, lat:dailyDelivery.destLat, deliveryNumber: dailyDelivery.deliveryNumber};
		this.destPoi.push(destPoi);
	}
};

TrackPlay.prototype.setTrackData = function(trackSegmentData) {
	this.trackData = new Array();			//所有的轨迹数据(包括坐标和性能数据)
	this.baiduPointSegments = new Array();	//按轨迹分段的百度坐标
	this.baiduPoints = new Array();			//所有的百度坐标
	
	for (var i = 0; i < trackSegmentData.length; i++) {
		var section = trackSegmentData[i];
		
		var sectionPaths = [];
		this.baiduPointSegments.push(sectionPaths);
		
		var trackPaths = section.trackPaths;
		for (var j = 0; j < trackPaths.length; j++) {
			var trackPath = trackPaths[j];
			
			this.trackData = this.trackData.concat(trackPath.points);
		
			var segBaiduPoints = this.getSegmentBaiduPoint(trackPath.points);
			
			var sectionPath = {patched: trackPath.patched, points:segBaiduPoints};
			sectionPaths.push(sectionPath);
			
			this.baiduPoints = this.baiduPoints.concat(segBaiduPoints);
		}
	}
	
	var max = Math.max(this.trackData.length - 1, 0);
	
	this.jqSlider.slider( "option", "max", max );
};

TrackPlay.prototype.getSegmentBaiduPoint = function(trackSegment) {
	var segBaiduPoints = new Array();
	for (var j = 0; j < trackSegment.length; j++) {
		segBaiduPoints.push(new BMap.Point(trackSegment[j].longitude, trackSegment[j].latitude));
	}
	return segBaiduPoints;
}

TrackPlay.prototype.drawTrackObjects = function() {
	//this.centerMapToStartPoint();
	//this.drawLocationMarkers(this.srcPoi, {color:"#0F9D33",border:"1px solid #f0ad4e"}, this.SRC_ICON);
	//this.drawLocationMarkers(this.destPoi, {color:"#D6001E", border:"1px solid #f0ad4e"}, this.DEST_ICON);
	this.drawTracks();	//绘制轨迹线路
	this.drawTruck();
	this.centerMapToStartPoint();
	
	//设置时间进度文本
	var timeTxt = this.trackData.length > 0  ? this.getLogtime(0) : "00:00:00 / 00:00:00";
	this.jqSpanTimeProg.text(timeTxt);
	
	this.jqSlider.slider("enable");	//放在这里合适?
	
	this.btnPlay_ReadyState();
};

TrackPlay.prototype.getLogtime = function(index) {
	return this.trackData[index].logtime.split(" ")[1] + " / " + this.trackData[this.trackData.length - 1].logtime.split(" ")[1];
};

TrackPlay.prototype.centerMapToStartPoint = function() {
	/*
	if (this.srcPoi.length > 0) {
		var srcPoint = new BMap.Point(this.srcPoi[0].lng, this.srcPoi[0].lat);
		this.map.panTo(srcPoint, {noAnimation:true});	//将地图中心设置为起点
	}
	*/
	if (this.baiduPoints.length > 0) {
		this.map.panTo(this.baiduPoints[0], {noAnimation:true});
	}
};

TrackPlay.prototype.drawLocationMarkers = function(pois, labelStyle, icon) {
	for (var i=0; i < pois.length; i++) {
		var poi = pois[i];
		var point = new BMap.Point(poi.lng, poi.lat);
		var label = new BMap.Label ("派送单号" + (i + 1) + ": " + poi.deliveryNumber, {offset:this.LABEL_OFFSET, enableMassClear:true});
		label.setStyle(labelStyle);
		var locMarker = new BMap.Marker(point, {icon: icon, enableMassClear:true});
		locMarker.setLabel(label);
		this.addInfoWindow(locMarker, poi.name, poi.address);
		this.map.addOverlay(locMarker);
	}
};

TrackPlay.prototype.drawTracks = function() {
	for (var i = 0; i < this.baiduPointSegments.length; i++) {
		var paths = this.baiduPointSegments[i];
		for (var j = 0; j < paths.length; j++) {
			var color = paths[j].patched ? "blue" : "blue";
		
			var segPolyline = new BMap.Polyline(paths[j].points, {strokeColor:color, strokeWeight:4, strokeOpacity:0.5});
			this.map.addOverlay(segPolyline);
		}
	}
};

TrackPlay.prototype.drawTruck = function() {
	if (this.baiduPoints.length > 0) {
		//车辆图标放置在轨迹的起点
		this.truckMarker = new BMap.Marker(this.baiduPoints[0], {icon: this.TRUCK_ICON, enableMassClear:true});
		this.map.addOverlay(this.truckMarker);
	}
};

TrackPlay.prototype.drawTrackTable = function() {
	$("#tableTrackData").DataTable().rows.add( this.trackData ).draw();
};

TrackPlay.prototype.drawTruckLastPosition = function(lastPositionPoint) {
	var truckMarker = new BMap.Marker(lastPositionPoint, {icon: this.TRUCK_ICON, enableMassClear:true});
	this.map.addOverlay(truckMarker);
	this.map.panTo(lastPositionPoint, {noAnimation:true});
};


TrackPlay.prototype.addInfoWindow = function(marker, name, addr) {
    // infowindow的标题
    var infoWindowTitle = '<div style="font-weight:bold;color:#CE5521;font-size:14px">' + name + '</div>';
    // infowindow的显示信息
    var infoWindowHtml = [];
    infoWindowHtml.push('<table cellspacing="0" style="table-layout:fixed;width:100%;font:12px arial,simsun,sans-serif"><tbody>');
    infoWindowHtml.push('<tr>');
    infoWindowHtml.push('<td style="vertical-align:top;line-height:16px;width:38px;white-space:nowrap;word-break:keep-all">地址：  </td>');
    infoWindowHtml.push('<td style="vertical-align:top;line-height:16px">' + addr + ' </td>');
    infoWindowHtml.push('</tr>');
    infoWindowHtml.push('</tbody></table>');
    var infoWindow = new BMap.InfoWindow(infoWindowHtml.join(""), {title: infoWindowTitle, width: 200, enableMessage:false, offset:this.WINDOW_OFFSET}); 
    var openInfoWinFun = function() {
        marker.openInfoWindow(infoWindow);
    }
    marker.addEventListener("click", openInfoWinFun);
};

TrackPlay.prototype.handleFastBtnClick = function() {
	this.currentPlaySpeedIndex = Math.max(0, this.currentPlaySpeedIndex - 1);
	$("#btnSpeedLabel").text(this.SPEED_LABEL[this.currentPlaySpeedIndex]);
};

TrackPlay.prototype.handleSlowBtnClick = function() {
	this.currentPlaySpeedIndex = Math.min(this.SPEED.length - 1, this.currentPlaySpeedIndex + 1);
	$("#btnSpeedLabel").text(this.SPEED_LABEL[this.currentPlaySpeedIndex]);
};

TrackPlay.prototype.handlePlayBtnClick = function() {
	switch (this.playState)
	{
	case this.STATE_NOTLOAD:
		//提示加载数据
		showNoty("请先选择要回放轨迹的车辆和日期，加载轨迹数据后再执行播放！", "error", false, top);
		break;
	case this.STATE_READY:
		this.play();
		break;
	case this.STATE_PLAYING:
		this.pause();
		break;
	case this.STATE_PAUSE:
		this.play();
		break;
	}
};

TrackPlay.prototype.play = function() {
	this.btnPlay_PlayingState();
	this.moveTruck(this.baiduPointIndex);
};
TrackPlay.prototype.pause = function() {
	this.btnPlay_PauseState();
};

TrackPlay.prototype.moveTruck = function() {
	this.jqSlider.slider("value", this.baiduPointIndex);
	this.truckMarker.setPosition(this.baiduPoints[this.baiduPointIndex]);
	this.map.panTo(this.baiduPoints[this.baiduPointIndex], {noAnimation:true}); //地图中心随车辆一起动
	var timeTxt = this.getLogtime(this.baiduPointIndex);
	this.jqSpanTimeProg.text(timeTxt);
	
	$("#tableTrackData").DataTable().row( this.lastRowIndex, {order:'index'} ).nodes().to$().removeClass("currentRow");
	this.lastRowIndex = this.baiduPointIndex
	$("#tableTrackData").DataTable().row( this.lastRowIndex, {order:'index'} ).nodes().to$().addClass("currentRow");
	
	var scrollTo = ((this.baiduPointIndex - 2) * 29 + 58) + 'px';
	$("#scrollTrack").slimScroll({ scrollTo: scrollTo });
	
	var that = this;
	if (this.playState == this.STATE_PLAYING) {
		this.baiduPointIndex++;
		if(this.baiduPointIndex < this.baiduPoints.length) {
			setTimeout(function() {
				that.moveTruck(that.baiduPointIndex);
			}, that.SPEED[that.currentPlaySpeedIndex]);
		} else {
			this.btnPlay_ReadyState();
			
			this.currentPlaySpeedIndex = this.DEFAULT_SPEED_INDEX;
			$("#btnSpeedLabel").text(this.SPEED_LABEL[this.currentPlaySpeedIndex]);
		}
	}
};

TrackPlay.prototype.btnPlay_PlayingState = function() {
	$("#iconBtnPlay").removeClass("icon-play").addClass("icon-pause");
	this.playState = this.STATE_PLAYING;
};
TrackPlay.prototype.btnPlay_PauseState = function() {
	$("#iconBtnPlay").removeClass("icon-pause").addClass("icon-play");
	this.playState = this.STATE_PAUSE;
};
TrackPlay.prototype.btnPlay_ReadyState = function() {
	$("#iconBtnPlay").removeClass("icon-pause").addClass("icon-play");
	this.playState = this.STATE_READY;
	this.baiduPointIndex = 0;
};
TrackPlay.prototype.btnPlay_NotLoadState = function() {
	$("#iconBtnPlay").removeClass("icon-pause").addClass("icon-play");
	this.playState = this.STATE_NOTLOAD;
	this.baiduPointIndex = 0;
	
	this.srcPoi = null;
	this.destPoi = null;
	this.trackData = null;
};


//////////////////////  fullscreen

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
		});
		
		$(this).on("click", function(event){
			var toolClick = $(this).attr("tool-click");
			onToolClick(toolClick);
		})
	});
}

function onToolClick(toolCmd) {
	if (toolCmd == "fullscreen") {
		doScreen();
	}
}

function doScreen() {
	if (parent.isFull) {
		thisRestoreFullscreen();
		parent.restoreFullscreen();
		$(".fullscreen").removeClass("exit-fullscreen");
	} else {
		thisToFullscreen();
		parent.toFullscreen();
		$(".fullscreen").addClass("exit-fullscreen");
	}
}

function thisToFullscreen() {
	$("#choosePanel").hide();
	$("#ecuTable").hide();
	$("#baidumapWrap").css("top", "35px");
	$("#baidumapWrap").css("bottom", "0px");
} 

function thisRestoreFullscreen() {
	$("#baidumapWrap").css("top", "78px");
	$("#baidumapWrap").css("bottom", "250px");
	$("#choosePanel").show();
	$("#ecuTable").show();
}
