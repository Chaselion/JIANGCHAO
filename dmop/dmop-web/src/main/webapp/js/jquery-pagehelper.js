//pagerHelper分页插件
(function($){
	function drawEmpty(container) {
		var empty = {start:0, end:0, total:0, currentPageIndex:0, totalPage:1};
		drawInfo(container, empty);
		drawPage(container, empty);
	}

	function updatePageInfo(container, param) {
		var cc = $.data(container, 'pageHelper');
		var options = cc.options;
		options.currentPageIndex = param.currentPageIndex;
		options.totalPage = param.totalPage;
		options.start = param.start;
		options.end = param.end;
		options.total = param.total;
	}
	
	function updateDisplay(container, param) {
		drawInfo(container, param);
		drawPage(container, param);
		
		$(container).find("input.pagehelper-pageIndex").val(param.currentPageIndex + 1);
	}

	function wrapPage(container) {
		var opts = $.data(container, 'pageHelper').options;
		
		drawWrapper(container, opts);
		drawInfo(container, opts);
		drawPage(container, opts);
	}
	
	function drawInfo(container, param) {
		var cc = $(container).find("div.pagehelper-info");
		cc.text('显示第 ' + param.start + ' 至 ' + param.end + '  项结果，共 ' + param.total + '  项');
	}
	
	function drawPage(container, param) {
		var cc = $(container).find("div.pagehelper-page");
		cc.empty()
		$(getPagerHtml(param.currentPageIndex, param.totalPage)).appendTo(cc);
		
		//绑定页码点击事件
		var opts = $.data(container, 'pageHelper').options;
		cc.find("ul.pagination>li>a").bind("click", function() {
			var pageIndex = $(this).data("pageindex");
			if (pageIndex === undefined || pageIndex == null) {
				return;
			} else {
				pageIndex = parseInt(pageIndex);
				if (isNaN(pageIndex)) {
					return;
				}
				opts.requestPageIndex = pageIndex;
				toPage(opts);
			}
		});
		
		$(container).find("div.pagehelper-totalpage").text('共 ' + param.totalPage + ' 页');
	}
	
	function drawWrapper(container, param) {
		var cc = $(container);
		cc.empty();
		//left
		$('<div class="pagehelper-left col-md-4">' + 
				'<div class="pagehelper-info" style="float:left;margin-top:20px;">' + 
				//'显示第 ' + param.start + ' 至 ' + param.end + '  项结果，共 ' + param.total + '  项' +
				'</div>' + 
				'</div>').appendTo(cc);
		
		//right
		$('<div class="pagehelper-right col-md-8">' + 
						'<div style="float: right;margin-left:10px;margin-top:20px;">' + 
						/*'<div class="input-group" style="width:70px;">' + 
								'<input type="text" class="form-control pagehelper-pageIndex" style="height: 29px;" value="1" maxlength="10" />' + 
								'<span class="input-group-btn">' + 
									'<button id="btnSearch" class="pagehelper-jumpbtn btn btn-primary" type="button" style="height: 29px;padding-left:6px;padding-right:6px;">GO</button>' + 
								'</span> '+ 
							'</div>' + */
						'</div>' /*+ 
						'<div class="pagehelper-totalpage" style="float: right;margin-left:10px;margin-top:20px;padding-top: 5px;">' + 
							//'共 ' + param.totalPage + ' 页' +  
						'</div>' */+ 
						
						'<div class="pagehelper-page" style="float: right;margin-left:10px;">' + 
							//getPagerHtml(param.currentPageIndex, param.totalPage) + 
						'</div>' /*+ 
						
						'<div style="float: right;margin-left:10px;margin-top:20px;">' + 
							'每页 ' + 
							'<select class="pagehelper-length" style="height: 29px;padding:0 5px;line-height: 1.42857143;color: #555;background-color: #fff;background-image: none;border: 1px solid #ccc;">' + 
								'<option>10</option>' + 
								'<option>20</option>' + 
								'<option>50</option>' + 
								//'<option>100</option>' + 
							'</select>' + 
							' 行' + 
							
						'</div>' */+ 
					'</div>').appendTo(cc);
		
		var opts = $.data(container, 'pageHelper').options;
		cc.find('select.pagehelper-length').bind('change', function() {
			var newLength = parseInt($(this).val());
			opts.length = newLength;
			
			var estimateTotalPage = Math.floor((opts.total - 1) / newLength) + 1;
			estimateTotalPage = estimateTotalPage <= 0 ? 1 : estimateTotalPage;
			if (estimateTotalPage < opts.currentPageIndex + 1) {
				opts.requestPageIndex = estimateTotalPage - 1;
			} else {
				opts.requestPageIndex = opts.currentPageIndex;
			}
			
			toPage(opts);
		});
		
		var inputPageIndex = cc.find('input.pagehelper-pageIndex')[0];
		cc.find('button.pagehelper-jumpbtn').bind('click', function() {
			var pageNo = $(inputPageIndex).val();
			pageNo = parseInt(pageNo);
			if (isNaN(pageNo)) {
				pageNo = 1;
			}
			
			if (pageNo > opts.totalPage) {
				pageNo = opts.totalPage;
			} else if (pageNo < 1) {
				pageNo = 1;
			}
			
			$(inputPageIndex).val(pageNo);
			opts.requestPageIndex = pageNo -1;
			toPage(opts);
		});
	}
	
	function getPagerHtml(pageIndex, totalPages, opt) {
		opt = opt || {
			lastPageText: "&laquo;上一页",
			nextPageText: "下一页&raquo;"
		};
		var p = [];
		/*
			<ul class="pagination pagination-sm">
			  <li><a href="#">&laquo;</a></li>
			  <li><a href="#">1</a></li>
			  <li><a href="#">2</a></li>
			  <li><a href="#">3</a></li>
			  <li><a href="#">4</a></li>
			  <li><a href="#">5</a></li>
			  <li><a href="#">&raquo;</a></li>
			</ul>
		*/
		p.push('<ul class="pagination pagination-sm"');
		if (opt.paginationCondense) {
			p.push('style="margin:5px 0;"');
		}
		p.push(' >');
		var startDrawIndex = 0;
		if (pageIndex > 2) {
			//增加首页
			if(opt.drawFirstPage) {
				p.push('<li><a href="javascript:' + toPageFuncName + '(0)">首页</a></li>');
			}
			startDrawIndex = pageIndex - 2;
		}
			
		//设置上一页
		var disablePre = "";
		var preHref = 'data-pageindex="' + (pageIndex - 1) + '"'; //'javascript:' + toPageFuncName + '(' + (pageIndex - 1) + ')';
		if (pageIndex == 0) {
			disablePre = ' class="disabled"';
			preHref = '';
		}
		p.push('<li' + disablePre + '><a ' + preHref + '>' + opt.lastPageText + '</a></li>');
		//单独设置每个页码
		var drawEndPageIndex = Math.min(totalPages, startDrawIndex + 5);
		for (var i = startDrawIndex; i < drawEndPageIndex; i++) {
			if (i == pageIndex) {
				//p.push('<li class="active"><a data-pageindex="' + i + '" href="javascript:' + toPageFuncName + '(' + i + ')">' + (i + 1) + ' <span class="sr-only">(current)</span></a></li>');
				p.push('<li class="active"><a data-pageindex="' + i + '">' + (i + 1) + ' <span class="sr-only">(current)</span></a></li>');
			} else {
				//p.push('<li><a data-pageindex="' + i + '" href="javascript:' + toPageFuncName + '(' + i + ')">'  + (i + 1) +  '</a></li>');
				p.push('<li><a data-pageindex="' + i + '">'  + (i + 1) +  '</a></li>');
			}
		}
		//设置下一页
		var disableNext = "";
		var nextHref = 'data-pageindex="' + (pageIndex + 1) + '"';//'javascript:' + toPageFuncName + '(' + (pageIndex + 1) + ')';
		if (pageIndex + 1 == totalPages) {
			disableNext = ' class="disabled"';
			nextHref = '';
		}
		p.push('<li' + disableNext + '><a ' + nextHref + '>' + opt.nextPageText + '</a></li>');
			
		p.push('</ul>');
		return p.join("");
	}
	
	function toPage(opts) {
		var pageIndex = opts.requestPageIndex;
		var length = opts.length;
		var args = [pageIndex, length];
		
		var ctx = opts.toPageCtx || window;
		opts.toPage.apply(ctx, args);
		
		/*
		if (opts.toPageCtx) {
			opts.toPage.apply(opts.toPageCtx, pageIndex, length);
		} else {
			opts.toPage(pageIndex, length);
		}*/
	}
	
	$.fn.pageHelper = function(options, param) {
		if (typeof options == 'string') {
			return $.fn.pageHelper.methods[options](this, param);
		}
			
		// iterate and reformat each matched element    
		return this.each(function() {
			options = options || {};
			var state = $.data(this, 'pageHelper');
			if (state) {
				$.extend(state.options, options);
			} else {
				$.data(this, 'pageHelper', {
					options: $.extend({}, $.fn.pageHelper.defaults, /*$.fn.tabs.parseOptions(this),*/ options)
				});
				wrapPage(this);
			}
		});    
	};

	$.fn.pageHelper.methods = {
		getLength: function(jq) {
			var cc = $.data(jq[0], 'pageHelper');
			return cc.options.length;
		},
		update: function(jq, param){
			updatePageInfo(jq[0], param);
			updateDisplay(jq[0], param);
		},
		displayEmpty: function(jq) {
			drawEmpty(jq[0]);
		}
	};
	
	$.fn.pageHelper.defaults = {
		length: 10,
		start: 0,
		end: 0,
		total: 0,
		currentPageIndex: 0,
		totalPage: 1,
		requestPageIndex: 0
	};
})(jQuery);