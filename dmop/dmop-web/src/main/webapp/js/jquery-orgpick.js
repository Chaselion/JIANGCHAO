//orgpick插件
(function($){
	var OrgPick = function (element, options) {
		this.orgId = "";
		this.element = $(element);
		this.parentEl = $("body");
		this.parentEl = (typeof options === 'object' && options.parentEl && $(options.parentEl).length) ? $(options.parentEl) : $(this.parentEl);
		
		this.container = $(getHtml()).appendTo(this.parentEl);
		
		initOrgGrid(this.container, this);
		
		/////////
		if (this.element.is('input')) {
            this.element.on({
                'focus.orgpick': $.proxy(this.showPick, this)
            });
        }
		
		this.container
			.on('click.orgpick', 'button.orgpick-close', $.proxy(this.hide, this));
    };

    OrgPick.prototype = {
        constructor: OrgPick,

        setOptions: function(options, callback) {
		},
		getOrgId: function() {
			return this.orgId;
		},
		setOrgId: function(orgId) {
			this.orgId = orgId;
			if (this.orgId == "") {
				this.element.val("");
			}
		},
		showPick: function (e) {
            if (this.isShowing) return;

            //this.element.addClass('active');
            this.container.show();
			$(this.container).find(".orgpick-table").treegrid('resize', {});
            this.move();

            // Create a click proxy that is private to this instance of datepicker, for unbinding
            this._outsideClickProxy = $.proxy(function (e) { this.outsideClick(e); }, this);
            // Bind global datepicker mousedown for hiding and
            $(document)
              .on('mousedown.orgpick', this._outsideClickProxy)
              // also explicitly play nice with Bootstrap dropdowns, which stopPropagation when clicking them
              .on('click.orgpick', '[data-toggle=dropdown]', this._outsideClickProxy)
              // and also close when focus changes to outside the picker (eg. tabbing between controls)
              .on('focusin.orgpick', this._outsideClickProxy);

            this.isShowing = true;
            this.element.trigger('show.orgpick', this);
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
              .off('mousedown.orgpick')
              .off('click.orgpick', '[data-toggle=dropdown]')
              .off('focusin.orgpick');

            this.container.hide();
			
            this.isShowing = false;
            this.element.trigger('hide.orgpick', this);
        },
		chooseOrg: function(id, name) {
			this.element.val(name);
			this.orgId = id;
			this.hide();
		}
	};
	
	function getHtml() {
		var template =	'<div class="orgpick" style="display:none;">' +
							'<div style="height:6px;">' + //因close button和modal的close button在关闭时会有冲突，暂时不使用
								'<button type="button" class="orgpick-close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
							'</div>' + 
							'<div style="padding-top:10px;"></div>' +
							'<table class="orgpick-table" style="height:300px"></table>' +
							'<div style="padding: 2px 3px;float:right;"><span style="color:red;">*</span> 点击组织进行选择</div>' + 
						'</div>';
		
		return template;
	}
	
	function initOrgGrid(container, orgpick) {
		container.find(".orgpick-table").treegrid({
			width: 'auto',
			url:'organization_ui/treegrid',
			idField:'id',
			treeField:'name',
			columns:[[
				{field:'name',title:'名称',width:'140px'},
				{field:'description',title:'描述',width:'100px', 
					formatter: function(value, row, index){
						if (row.data){
							return row.data.description;
						} else {
							return value;
						}
					}
				},
				{field:'create_date',title:'创建日期',width:'100px',
					formatter: function(value, row, index){
						if (row.data){
							return row.data.create_date;
						} else {
							return value;
						}
					}
				}
			]],
			onClickRow : function(row) {
				var ops = container.find(".orgpick-table").treegrid('options');
				ops.orgpick.chooseOrg(row.id, row.name);
			},
			orgpick: orgpick
		});
	}
	
	$.fn.orgpick = function (options, param) {
		if (typeof options == 'string') {
			return $.fn.orgpick.methods[options](this, param);
		}
		
		
        this.each(function () {
            var el = $(this);
			/*
            if (el.data('orgpick'))
                el.data('orgpick').remove();
				*/
            el.data('orgpick', new OrgPick(el, options));
        });
        return this;
    };
	
	$.fn.orgpick.methods = {
		getOrgId: function(jq) {
			var cc = $.data(jq[0], 'orgpick');
			if (cc) {
				return cc.getOrgId();
			}
			return "";
		},
		setOrgId: function(jq, id) {
			var cc = $.data(jq[0], 'orgpick');
			if (cc) {
				cc.setOrgId(id);
			}
		}
	};
})(jQuery);