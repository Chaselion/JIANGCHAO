function getPagerHtml(pageIndex, totalPages, toPageFuncName, opt) {
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
	var preHref = 'javascript:' + toPageFuncName + '(' + (pageIndex - 1) + ')';
	if (pageIndex == 0) {
		disablePre = ' class="disabled"';
		preHref = 'javascript:void(0)';
	}
	p.push('<li' + disablePre + '><a href="' + preHref + '">' + opt.lastPageText + '</a></li>');
	//单独设置每个页码
	var drawEndPageIndex = Math.min(totalPages, startDrawIndex + 5);
	for (var i = startDrawIndex; i < drawEndPageIndex; i++) {
		if (i == pageIndex) {
			p.push('<li class="active"><a href="javascript:' + toPageFuncName + '(' + i + ')">' + (i + 1) + ' <span class="sr-only">(current)</span></a></li>');
		} else {
			p.push('<li><a href="javascript:' + toPageFuncName + '(' + i + ')">'  + (i + 1) +  '</a></li>');
		}
	}
	//设置下一页
	var disableNext = "";
	var nextHref = 'javascript:' + toPageFuncName + '(' + (pageIndex + 1) + ')';
	if (pageIndex + 1 == totalPages) {
		disableNext = ' class="disabled"';
		nextHref = 'javascript:void(0)';
	}
	p.push('<li' + disableNext + '><a href="' + nextHref + '">' + opt.nextPageText + '</a></li>');
		
	p.push('</ul>');
	return p.join("");
}

var PageHelper = {};

PageHelper.emptyPager = '<ul class="pagination">' + 
				'<li class="disabled"><a href="javascript:void(0);">&laquo; 上一页</a></li>' + 
				'<li class="disabled"><a href="javascript:void(0);">下一页 &raquo;</a></li>' + 
			'</ul>';

PageHelper.drawEmptyPager = function(wrapperId) {
	$("#" + wrapperId).empty().append(PageHelper.emptyPager);
};

PageHelper.drawPageInfo = function(start, end, total, wrapperId) {
	var pageInfo = '<div style="float:left;margin-top:20px;">' + 
				'显示第 ' + start + ' 至 ' + end + '  项结果，共 ' + total + '  项' +
			'</div>';
	$("#" + wrapperId).empty().append(pageInfo);
};