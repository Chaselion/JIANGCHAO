//regionpick插件
(function($){
	var regionData = {
		"hot": [
			{"id":510100, "shortName":"成都"}, {"id":420100, "shortName":"武汉"}, {"id":500100, "shortName":"重庆"},
			{"id":110100, "shortName":"北京"}, {"id":310100, "shortName":"上海"}, {"id":440100, "shortName":"广州"}, 
			{"id":440300, "shortName":"深圳"}, {"id":120100, "shortName":"天津"}, {"id":320100, "shortName":"南京"}, 
			{"id":330100, "shortName":"杭州"}
		],
		pinyinLabels: ["A","B","C","D","F","G","H","J","L","N","Q","S","T","X","Y","Z"],
		"A": [{"shortName": "安徽", "cities": [{"id":340800, "shortName": "安庆"}, {"id":340300, "shortName": "蚌埠"}, {"id":341600, "shortName": "亳州"}, {"id":341700, "shortName": "池州"}, {"id":341100, "shortName": "滁州"}, {"id":341200, "shortName": "阜阳"}, {"id":340100, "shortName": "合肥"}, {"id":340600, "shortName": "淮北"}, {"id":340400, "shortName": "淮南"}, {"id":341000, "shortName": "黄山"}, {"id":341500, "shortName": "六安"}, {"id":340500, "shortName": "马鞍山"}, {"id":341300, "shortName": "宿州"}, {"id":340700, "shortName": "铜陵"}, {"id":340200, "shortName": "芜湖"}, {"id":341800, "shortName": "宣城"}]},
		{"shortName": "澳门", "cities": [{"id":820300, "shortName": "路环岛"}, {"id":820100, "shortName": "澳门半岛"}, {"id":820200, "shortName": "氹仔岛"}]}],
"B": [{"shortName": "北京", "cities": [{"id":110100, "shortName": "北京"}]}],
"C": [{"shortName": "重庆", "cities": [{"id":500100, "shortName": "重庆"}, {"id":500300, "shortName": "两江新区"}]}],

"F": [{"shortName": "福建", "cities": [{"id":350100, "shortName": "福州"}, {"id":350800, "shortName": "龙岩"}, {"id":350700, "shortName": "南平"}, {"id":350900, "shortName": "宁德"}, {"id":350300, "shortName": "莆田"}, {"id":350500, "shortName": "泉州"}, {"id":350400, "shortName": "三明"}, {"id":350200, "shortName": "厦门"}, {"id":350600, "shortName": "漳州"}]}],
"G": [{"shortName": "甘肃", "cities": [{"id":620400, "shortName": "白银"}, {"id":621100, "shortName": "定西"}, {"id":623000, "shortName": "甘南"}, {"id":620200, "shortName": "嘉峪关"}, {"id":620300, "shortName": "金昌"}, {"id":620900, "shortName": "酒泉"}, {"id":620100, "shortName": "兰州"}, {"id":622900, "shortName": "临夏"}, {"id":621200, "shortName": "陇南"}, {"id":620800, "shortName": "平凉"}, {"id":621000, "shortName": "庆阳"}, {"id":620500, "shortName": "天水"}, {"id":620600, "shortName": "武威"}, {"id":620700, "shortName": "张掖"}]}, 
{"shortName": "广东", "cities": [{"id":445100, "shortName": "潮州"}, {"id":441900, "shortName": "东莞"}, {"id":440600, "shortName": "佛山"}, {"id":440100, "shortName": "广州"}, {"id":441600, "shortName": "河源"}, {"id":441300, "shortName": "惠州"}, {"id":440700, "shortName": "江门"}, {"id":445200, "shortName": "揭阳"}, {"id":440900, "shortName": "茂名"}, {"id":441400, "shortName": "梅州"}, {"id":441800, "shortName": "清远"}, {"id":440500, "shortName": "汕头"}, {"id":441500, "shortName": "汕尾"}, {"id":440200, "shortName": "韶关"}, {"id":440300, "shortName": "深圳"}, {"id":441700, "shortName": "阳江"}, {"id":445300, "shortName": "云浮"}, {"id":440800, "shortName": "湛江"}, {"id":441200, "shortName": "肇庆"}, {"id":442000, "shortName": "中山"}, {"id":440400, "shortName": "珠海"}]}, 
{"shortName": "广西", "cities": [{"id":451000, "shortName": "百色"}, {"id":450500, "shortName": "北海"}, {"id":451400, "shortName": "崇左"}, {"id":450600, "shortName": "防城港"}, {"id":450800, "shortName": "贵港"}, {"id":450300, "shortName": "桂林"}, {"id":451200, "shortName": "河池"}, {"id":451100, "shortName": "贺州"}, {"id":451300, "shortName": "来宾"}, {"id":450200, "shortName": "柳州"}, {"id":450100, "shortName": "南宁"}, {"id":450700, "shortName": "钦州"}, {"id":450400, "shortName": "梧州"}, {"id":450900, "shortName": "玉林"}]}, 
{"shortName": "贵州", "cities": [{"id":520400, "shortName": "安顺"}, {"id":520500, "shortName": "毕节"}, {"id":520100, "shortName": "贵阳"}, {"id":520200, "shortName": "六盘水"}, {"id":522600, "shortName": "黔东南"}, {"id":522700, "shortName": "黔南"}, {"id":522300, "shortName": "黔西南"}, {"id":520600, "shortName": "铜仁"}, {"id":520300, "shortName": "遵义"}]}],
"H": [{"shortName": "海南", "cities": [{"id":460100, "shortName": "海口"}, {"id":460300, "shortName": "三沙"}, {"id":460200, "shortName": "三亚"}]}, 
{"shortName": "河北", "cities": [{"id":130600, "shortName": "保定"}, {"id":130900, "shortName": "沧州"}, {"id":130800, "shortName": "承德"}, {"id":130400, "shortName": "邯郸"}, {"id":131100, "shortName": "衡水"}, {"id":131000, "shortName": "廊坊"}, {"id":130300, "shortName": "秦皇岛"}, {"id":130100, "shortName": "石家庄"}, {"id":130200, "shortName": "唐山"}, {"id":130500, "shortName": "邢台"}, {"id":130700, "shortName": "张家口"}]}, 
{"shortName": "黑龙江", "cities": [{"id":230600, "shortName": "大庆"}, {"id":232700, "shortName": "大兴安岭"}, {"id":230100, "shortName": "哈尔滨"}, {"id":230400, "shortName": "鹤岗"}, {"id":231100, "shortName": "黑河"}, {"id":230800, "shortName": "佳木斯"}, {"id":230300, "shortName": "鸡西"}, {"id":231000, "shortName": "牡丹江"}, {"id":230200, "shortName": "齐齐哈尔"}, {"id":230900, "shortName": "七台河"}, {"id":230500, "shortName": "双鸭山"}, {"id":231200, "shortName": "绥化"}, {"id":230700, "shortName": "伊春"}]}, 
{"shortName": "河南", "cities": [{"id":410500, "shortName": "安阳"}, {"id":410600, "shortName": "鹤壁"}, {"id":410800, "shortName": "焦作"}, {"id":410200, "shortName": "开封"}, {"id":411100, "shortName": "漯河"}, {"id":410300, "shortName": "洛阳"}, {"id":411300, "shortName": "南阳"}, {"id":410400, "shortName": "平顶山"}, {"id":410900, "shortName": "濮阳"}, {"id":411200, "shortName": "三门峡"}, {"id":411400, "shortName": "商丘"}, {"id":410700, "shortName": "新乡"}, {"id":411500, "shortName": "信阳"}, {"id":411000, "shortName": "许昌"}, {"id":410100, "shortName": "郑州"}, {"id":411600, "shortName": "周口"}, {"id":411700, "shortName": "驻马店"}]}, 
{"shortName": "湖北", "cities": [{"id":422800, "shortName": "恩施"}, {"id":420700, "shortName": "鄂州"}, {"id":421100, "shortName": "黄冈"}, {"id":420200, "shortName": "黄石"}, {"id":420800, "shortName": "荆门"}, {"id":421000, "shortName": "荆州"}, {"id":420300, "shortName": "十堰"}, {"id":421300, "shortName": "随州"}, {"id":420100, "shortName": "武汉"}, {"id":420600, "shortName": "襄阳"}, {"id":421200, "shortName": "咸宁"}, {"id":420900, "shortName": "孝感"}, {"id":420500, "shortName": "宜昌"}]}, 
{"shortName": "湖南", "cities": [{"id":430700, "shortName": "常德"}, {"id":430100, "shortName": "长沙"}, {"id":431000, "shortName": "郴州"}, {"id":430400, "shortName": "衡阳"}, {"id":431200, "shortName": "怀化"}, {"id":431300, "shortName": "娄底"}, {"id":430500, "shortName": "邵阳"}, {"id":430300, "shortName": "湘潭"}, {"id":433100, "shortName": "湘西"}, {"id":430900, "shortName": "益阳"}, {"id":431100, "shortName": "永州"}, {"id":430600, "shortName": "岳阳"}, {"id":430800, "shortName": "张家界"}, {"id":430200, "shortName": "株洲"}]}],
"J": [{"shortName": "江苏", "cities": [{"id":320400, "shortName": "常州"}, {"id":320800, "shortName": "淮安"}, {"id":320700, "shortName": "连云港"}, {"id":320100, "shortName": "南京"}, {"id":320600, "shortName": "南通"}, {"id":321300, "shortName": "宿迁"}, {"id":320500, "shortName": "苏州"}, {"id":321200, "shortName": "泰州"}, {"id":320200, "shortName": "无锡"}, {"id":320300, "shortName": "徐州"}, {"id":320900, "shortName": "盐城"}, {"id":321000, "shortName": "扬州"}, {"id":321100, "shortName": "镇江"}]}, 
{"shortName": "江西", "cities": [{"id":361000, "shortName": "抚州"}, {"id":360700, "shortName": "赣州"}, {"id":360800, "shortName": "吉安"}, {"id":360200, "shortName": "景德镇"}, {"id":360400, "shortName": "九江"}, {"id":360100, "shortName": "南昌"}, {"id":360300, "shortName": "萍乡"}, {"id":361100, "shortName": "上饶"}, {"id":360500, "shortName": "新余"}, {"id":360900, "shortName": "宜春"}, {"id":360600, "shortName": "鹰潭"}]}, 
{"shortName": "吉林", "cities": [{"id":220800, "shortName": "白城"}, {"id":220600, "shortName": "白山"}, {"id":220100, "shortName": "长春"}, {"id":220200, "shortName": "吉林"}, {"id":220400, "shortName": "辽源"}, {"id":220300, "shortName": "四平"}, {"id":220700, "shortName": "松原"}, {"id":220500, "shortName": "通化"}, {"id":222400, "shortName": "延边"}]}],
"L": [{"shortName": "辽宁", "cities": [{"id":210300, "shortName": "鞍山"}, {"id":210500, "shortName": "本溪"}, {"id":211300, "shortName": "朝阳"}, {"id":210200, "shortName": "大连"}, {"id":210600, "shortName": "丹东"}, {"id":210400, "shortName": "抚顺"}, {"id":210900, "shortName": "阜新"}, {"id":211400, "shortName": "葫芦岛"}, {"id":211500, "shortName": "金普新区"}, {"id":210700, "shortName": "锦州"}, {"id":211000, "shortName": "辽阳"}, {"id":211100, "shortName": "盘锦"}, {"id":210100, "shortName": "沈阳"}, {"id":211200, "shortName": "铁岭"}, {"id":210800, "shortName": "营口"}]}],
"N": [{"shortName": "宁夏", "cities": [{"id":640400, "shortName": "固原"}, {"id":640200, "shortName": "石嘴山"}, {"id":640300, "shortName": "吴忠"}, {"id":640100, "shortName": "银川"}, {"id":640500, "shortName": "中卫"}]},
{"shortName": "内蒙古", "cities": [{"id":152900, "shortName": "阿拉善盟"}, {"id":150200, "shortName": "包头"}, {"id":150800, "shortName": "巴彦淖尔"}, {"id":150400, "shortName": "赤峰"}, {"id":152200, "shortName": "兴安盟"}, {"id":150100, "shortName": "呼和浩特"}, {"id":150700, "shortName": "呼伦贝尔"}, {"id":150600, "shortName": "鄂尔多斯"}, {"id":150500, "shortName": "通辽"}, {"id":150900, "shortName": "乌兰察布"}, {"id":150300, "shortName": "乌海"}, {"id":152500, "shortName": "锡林郭勒盟"}]}],
"Q": [{"shortName": "青海", "cities": [{"id":632600, "shortName": "果洛"}, {"id":632200, "shortName": "海北"}, {"id":630200, "shortName": "海东"}, {"id":632500, "shortName": "海南"}, {"id":632800, "shortName": "海西"}, {"id":632300, "shortName": "黄南"}, {"id":630100, "shortName": "西宁"}, {"id":632700, "shortName": "玉树"}]}],
"S": [{"shortName": "陕西", "cities": [{"id":610900, "shortName": "安康"}, {"id":610300, "shortName": "宝鸡"}, {"id":610700, "shortName": "汉中"}, {"id":611000, "shortName": "商洛"}, {"id":610200, "shortName": "铜川"}, {"id":610500, "shortName": "渭南"}, {"id":610100, "shortName": "西安"}, {"id":610400, "shortName": "咸阳"}, {"id":611100, "shortName": "西咸"}, {"id":610600, "shortName": "延安"}, {"id":610800, "shortName": "榆林"}]}, 
{"shortName": "山东", "cities": [{"id":371600, "shortName": "滨州"}, {"id":371400, "shortName": "德州"}, {"id":370500, "shortName": "东营"}, {"id":371700, "shortName": "菏泽"}, {"id":370100, "shortName": "济南"}, {"id":370800, "shortName": "济宁"}, {"id":371200, "shortName": "莱芜"}, {"id":371500, "shortName": "聊城"}, {"id":371300, "shortName": "临沂"}, {"id":370200, "shortName": "青岛"}, {"id":371100, "shortName": "日照"}, {"id":370900, "shortName": "泰安"}, {"id":370700, "shortName": "潍坊"}, {"id":371000, "shortName": "威海"}, {"id":370600, "shortName": "烟台"}, {"id":370400, "shortName": "枣庄"}, {"id":370300, "shortName": "淄博"}]}, 
{"shortName": "上海", "cities": [{"id":310100, "shortName": "上海"}]}, 
{"shortName": "山西", "cities": [{"id":140400, "shortName": "长治"}, {"id":140200, "shortName": "大同"}, {"id":140500, "shortName": "晋城"}, {"id":140700, "shortName": "晋中"}, {"id":141000, "shortName": "临汾"}, {"id":141100, "shortName": "吕梁"}, {"id":140600, "shortName": "朔州"}, {"id":140100, "shortName": "太原"}, {"id":140900, "shortName": "忻州"}, {"id":140300, "shortName": "阳泉"}, {"id":140800, "shortName": "运城"}]}, 
{"shortName": "四川", "cities": [{"id":513200, "shortName": "阿坝"}, {"id":511900, "shortName": "巴中"}, {"id":510100, "shortName": "成都"}, {"id":511700, "shortName": "达州"}, {"id":510600, "shortName": "德阳"}, {"id":513300, "shortName": "甘孜"}, {"id":511600, "shortName": "广安"}, {"id":510800, "shortName": "广元"}, {"id":511100, "shortName": "乐山"}, {"id":513400, "shortName": "凉山"}, {"id":510500, "shortName": "泸州"}, {"id":511400, "shortName": "眉山"}, {"id":510700, "shortName": "绵阳"}, {"id":511300, "shortName": "南充"}, {"id":511000, "shortName": "内江"}, {"id":510400, "shortName": "攀枝花"}, {"id":510900, "shortName": "遂宁"}, {"id":511800, "shortName": "雅安"}, {"id":511500, "shortName": "宜宾"}, {"id":510300, "shortName": "自贡"}, {"id":512000, "shortName": "资阳"}]}],
"T": [{"shortName": "台湾", "cities": [{"id":712700, "shortName": "彰化"}, {"id":713000, "shortName": "嘉义"}, {"id":710700, "shortName": "嘉义"}, {"id":710600, "shortName": "新竹"}, {"id":712400, "shortName": "新竹"}, {"id":713500, "shortName": "花莲"}, {"id":713700, "shortName": "金门"}, {"id":710200, "shortName": "高雄"}, {"id":710300, "shortName": "基隆"}, {"id":713800, "shortName": "连江"}, {"id":712500, "shortName": "苗栗"}, {"id":712800, "shortName": "南投"}, {"id":710800, "shortName": "新北"}, {"id":713600, "shortName": "澎湖"}, {"id":713300, "shortName": "屏东"}, {"id":710400, "shortName": "台中"}, {"id":710500, "shortName": "台南"}, {"id":710100, "shortName": "台北"}, {"id":713400, "shortName": "台东"}, {"id":712300, "shortName": "桃园"}, {"id":712200, "shortName": "宜兰"}, {"id":712900, "shortName": "云林"}]}, 
{"shortName": "天津", "cities": [{"id":120100, "shortName": "天津"}]}],
"X": [{"shortName": "西藏", "cities": [{"id":540100, "shortName": "拉萨"}, {"id":542400, "shortName": "那曲"}, {"id":542500, "shortName": "阿里"}, {"id":542600, "shortName": "林芝"}, {"id":540300, "shortName": "昌都"}, {"id":540200, "shortName": "日喀则"}, {"id":542200, "shortName": "山南"}]},
{"shortName": "香港", "cities": [{"id":810100, "shortName": "香港岛"}, {"id":810200, "shortName": "九龙"}, {"id":810300, "shortName": "新界"}]}, 
{"shortName": "新疆", "cities": [{"id":652900, "shortName": "阿克苏"}, {"id":654300, "shortName": "阿勒泰"}, {"id":652800, "shortName": "巴音郭楞"}, {"id":652700, "shortName": "博尔塔拉"}, {"id":652300, "shortName": "昌吉"}, {"id":652200, "shortName": "哈密"}, {"id":653200, "shortName": "和田"}, {"id":654000, "shortName": "伊犁"}, {"id":650200, "shortName": "克拉玛依"}, {"id":653100, "shortName": "喀什"}, {"id":653000, "shortName": "克孜勒苏"}, {"id":654200, "shortName": "塔城"}, {"id":652100, "shortName": "吐鲁番"}, {"id":650100, "shortName": "乌鲁木齐"}]}],
"Y": [{"shortName": "云南", "cities": [{"id":530500, "shortName": "保山"}, {"id":532300, "shortName": "楚雄"}, {"id":532900, "shortName": "大理"}, {"id":533100, "shortName": "德宏"}, {"id":533400, "shortName": "迪庆"}, {"id":532500, "shortName": "红河"}, {"id":530100, "shortName": "昆明"}, {"id":530700, "shortName": "丽江"}, {"id":530900, "shortName": "临沧"}, {"id":533300, "shortName": "怒江"}, {"id":530800, "shortName": "普洱"}, {"id":530300, "shortName": "曲靖"}, {"id":532600, "shortName": "文山"}, {"id":532800, "shortName": "西双版纳"}, {"id":530400, "shortName": "玉溪"}, {"id":530600, "shortName": "昭通"}]}],
"Z": [{"shortName": "浙江", "cities": [{"id":330100, "shortName": "杭州"}, {"id":330500, "shortName": "湖州"}, {"id":330400, "shortName": "嘉兴"}, {"id":330700, "shortName": "金华"}, {"id":331100, "shortName": "丽水"}, {"id":330200, "shortName": "宁波"}, {"id":330800, "shortName": "衢州"}, {"id":330600, "shortName": "绍兴"}, {"id":331000, "shortName": "台州"}, {"id":330300, "shortName": "温州"}, {"id":330900, "shortName": "舟山"}, {"id":331200, "shortName": "舟山新区"}]}]
	};

	var RegionPick = function (element, options) {
		this.regionId = "";
		this.element = $(element);
		this.parentEl = $("body");
		this.parentEl = (typeof options === 'object' && options.parentEl && $(options.parentEl).length) ? $(options.parentEl) : $(this.parentEl);
		this.container = $(getCityTableHtml()).appendTo(this.parentEl);
		
		//增加滚动条
		this.container.find(".regionpick-scroll").slimScroll({
			height: '273px',
			alwaysVisible: true
		});
		
		/////////
		if (this.element.is('input')) {
            this.element.on({
                'focus.regionpick': $.proxy(this.showPick, this)
            });
        }
		
		this.container
			.on('click.regionpick', 'a', $.proxy(this.clickRegion, this))
			.on('click.regionpick', 'button.regionpick-close', $.proxy(this.hide, this));
    };

    RegionPick.prototype = {
        constructor: RegionPick,

        setOptions: function(options, callback) {
		},
		getRegionId: function() {
			return this.regionId;
		},
		setRegionId: function(regionId) {
			this.regionId = regionId;
		},
		clickRegion: function (e) {
            var id = $(e.target).data("regionpick-id");
			if (id === undefined || id == null) {
				return;
			} else {
				var name = $(e.target).text();
				this.element.val(name);
				this.regionId = id;
				this.hide();
			}
		},
		showPick: function (e) {
            if (this.isShowing) return;

            //this.element.addClass('active');
            this.container.show();
            this.move();

            // Create a click proxy that is private to this instance of datepicker, for unbinding
            this._outsideClickProxy = $.proxy(function (e) { this.outsideClick(e); }, this);
            // Bind global datepicker mousedown for hiding and
            $(document)
              .on('mousedown.regionpick', this._outsideClickProxy)
              // also explicitly play nice with Bootstrap dropdowns, which stopPropagation when clicking them
              .on('click.regionpick', '[data-toggle=dropdown]', this._outsideClickProxy)
              // and also close when focus changes to outside the picker (eg. tabbing between controls)
              .on('focusin.regionpick', this._outsideClickProxy);

            this.isShowing = true;
            this.element.trigger('show.regionpick', this);
        },
		move: function () {
            var parentOffset = { top: 0, left: 0 };
            if (!this.parentEl.is('body')) {
                parentOffset = {
                    top: this.parentEl.offset().top - this.parentEl.scrollTop(),
                    left: this.parentEl.offset().left - this.parentEl.scrollLeft()
                };
            }

			/*
            if (this.opens == 'left') {
                this.container.css({
                    top: this.element.offset().top + this.element.outerHeight() - parentOffset.top,
                    right: $(window).width() - this.element.offset().left - this.element.outerWidth() - parentOffset.left,
                    left: 'auto'
                });
                if (this.container.offset().left < 0) {
                    this.container.css({
                        right: 'auto',
                        left: 9
                    });
                }
            
			} else {
			*/
                this.container.css({
                    top: this.element.offset().top + this.element.outerHeight() - parentOffset.top,
                    left: this.element.offset().left - parentOffset.left,
                    right: 'auto'
                });
                if (this.container.offset().left + this.container.outerWidth() > $(window).width()) {
                    this.container.css({
                        left: 'auto',
                        right: 0
                    });
                }
            //}
        },
		outsideClick: function (e) {
            var target = $(e.target);
            // if the page is clicked anywhere except within the daterangerpicker/button
            // itself then call this.hide()
            if (
                target.closest(this.element).length ||
                target.closest(this.container).length
				// || target.closest('.calendar-date').length
                ) return;
            this.hide();
        },

        hide: function (e) {
            if (!this.isShowing) return;

            $(document)
              .off('mousedown.regionpick')
              .off('click.regionpick', '[data-toggle=dropdown]')
              .off('focusin.regionpick');

            //this.element.removeClass('active');
            this.container.hide();

            this.isShowing = false;
            this.element.trigger('hide.regionpick', this);
        },
	};
	
	function getCityTableHtml() {
		var h = [];
		h.push('<div class="regionpick" style="display:none;">');
		h.push('<div style="height:6px;">' + 
			'<button type="button" class="regionpick-close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
			'</div>')
		h.push(getHotCitiesHtml());
		h.push('<div style="border-top:1px solid #CCC;padding-bottom:10px;"></div>');
		h.push('<div class="regionpick-scroll" style="position:relative;">');
		h.push('<table class="regionpick-cities" >');
		
		var labels = regionData.pinyinLabels;
		for (var i = 0; i < labels.length; i++) {
			var provinces = regionData[labels[i]];
			if (provinces) {
				h.push(getProvincesRowsHtml(labels[i], provinces));
			}
		}
		
		h.push('</table>');
		h.push('</div>');
		h.push('</div>');
		return h.join("");
	}
	
	function getHotCitiesHtml() {
		var h = [];
		h.push('<div style="padding:10px 5px;">');
		h.push('<label>常用城市：</label> ');
		h.push(getCityCellHtml(regionData.hot));
		h.push('</div>');
		return h.join("");
	}
	
	function getProvincesRowsHtml(label, provinces) {
		var h = [];
		for (var i = 0; i < provinces.length; i++) {
			h.push('<tr>');
			var displayLabel = "";
			if (i == 0) {
				displayLabel = label;
			}
			h.push('<td class="regionpick-td-letter">' + displayLabel + '</td>');
			
			var provinceData = provinces[i];
			h.push('<td class="regionpick-td-province">' + provinceData.shortName + '：</td>');
			h.push('<td>' + getCityCellHtml(provinceData.cities) + '</td>');
			
			h.push('</tr>');
		}
		
		return h.join("");
	}
	
	function getCityCellHtml(cities) {
		var h = [];
		for (var i = 0; i < cities.length; i++) {
			h.push('<a href="javascript:void(0)" data-regionpick-id="' + cities[i].id + '">' + cities[i].shortName + '</a> ')
		}
		
		return h.join("");
	}
	
	$.fn.regionpick = function (options, param) {
		if (typeof options == 'string') {
			return $.fn.regionpick.methods[options](this, param);
		}
		
		
        this.each(function () {
            var el = $(this);
			/*
            if (el.data('regionpick'))
                el.data('regionpick').remove();
				*/
            el.data('regionpick', new RegionPick(el, options));
        });
        return this;
    };
	
	$.fn.regionpick.methods = {
		getRegionId: function(jq) {
			var cc = $.data(jq[0], 'regionpick');
			if (cc) {
				return cc.getRegionId();
			}
			return "";
		},
		setRegionId: function(jq, regionId) {
			var cc = $.data(jq[0], 'regionpick');
			if (cc) {
				cc.setRegionId(regionId);
			}
		}
	};
})(jQuery);