//userpick插件
(function($){
	var UserPick = function (element, options) {
		this.userId = "";
		this.element = $(element);
		this.parentEl = $("body");
		this.container = $(getHtml()).appendTo(this.parentEl);
			
		initSearchUserGrid(this.container, this);
		
		var orgParent = $(this.container);
		
		orgParent.find("input.userpick-org").orgpick({
			parentEl: orgParent
		});
		
		/////////
		if (this.element.is('input')) {
            this.element.on({
                'focus.userpick': $.proxy(this.showPick, this)
            });
        }
		
		this.container
			.on('click.userpick', 'button.userpick-close', $.proxy(this.hide, this))
			.on('click.userpick', 'button.userpick-search', $.proxy(this.searchUser, this))
			.on('click.userpick', 'button.userpick-reset', $.proxy(this.resetForm, this))
			.on('click.userpick', 'button.userpick-ok', $.proxy(this.chooseUser, this));
			
		this.searchUser();
    };

    UserPick.prototype = {
        constructor: UserPick,

        setOptions: function(options, callback) {
		},
		getUserId: function() {
			return this.userId;
		},
		setUserId: function(userId) {
			this.userId = userId;
		},
		showPick: function (e) {
            if (this.isShowing) return;

			$(this.container).modal('show');
			$(this.container).find(".userpick-table").datagrid('resize', {});

            // Create a click proxy that is private to this instance of datepicker, for unbinding
            this._outsideClickProxy = $.proxy(function (e) { this.outsideClick(e); }, this);
            // Bind global datepicker mousedown for hiding and
            $(document)
              .on('mousedown.userpick', this._outsideClickProxy)
              // also explicitly play nice with Bootstrap dropdowns, which stopPropagation when clicking them
              .on('click.userpick', '[data-toggle=dropdown]', this._outsideClickProxy)
              // and also close when focus changes to outside the picker (eg. tabbing between controls)
              .on('focusin.userpick', this._outsideClickProxy);

            this.isShowing = true;
            this.element.trigger('show.userpick', this);
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
              .off('mousedown.userpick')
              .off('click.userpick', '[data-toggle=dropdown]')
              .off('focusin.userpick');

			$(this.container).modal('hide');

            this.isShowing = false;
            this.element.trigger('hide.userpick', this);
        },
		searchUser: function() {
			var param = {};

			var realname = $(this.container).find("input.userpick-realname").val();
			param["realname"] = realname;
			
			var orgId = $(this.container).find("input.userpick-org").orgpick("getOrgId");
			if (orgId != "") {
				param["orgId"] = orgId;
			}
			
			$(this.container).find(".userpick-table").datagrid('load', param);
		},
		resetForm: function() {
			$(this.container).find("input.userpick-realname").val("");
			$(this.container).find("input.userpick-org").orgpick("setOrgId", "");
		},
		setUser: function(id, realname) {
			this.element.val(realname);
			this.userId = id;
		},
		chooseUser: function() {
			var node = $(this.container).find(".userpick-table").datagrid("getSelected");
			if (node) {
				this.setUser(node.id, node.realname);
			}
			
			this.hide();
		}
	};
	
	function initSearchUserGrid(container, userpick) {
		container.find(".userpick-table").datagrid({
			width: 'auto',
			height: '350px',
			pagination: true,
			singleSelect: true,
			columns:[[
				{field:'realname',title:'姓名',width:100},
				{field:'organization_path',title:'所属单位',width:240}
			]],
			onDblClickRow : function(index, row) {
				var ops = container.find(".userpick-table").datagrid('options');
				ops.userpick.setUser(row.id, row.realname);
				ops.userpick.hide();
			},
			userpick: userpick
		});
		container.find(".userpick-table").datagrid("options").url = 'data_meta/searchUser';
	}
	
	function getHtml() {
		var template = 	'<div class="modal modal-condensed userpick">' +
							'<div class="modal-dialog">' +
								'<div class="modal-content">' +
									'<div class="modal-header">' +
										'<button type="button" class="close userpick-close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
										'<h4 class="modal-title">选择用户</h4>' +
									'</div>' +
									'<div class="modal-body">' +
											'<div style="padding-top:5px;padding-bottom:5px;">' +
												'<form class="userpick-form form-inline" role="form">' +
													'<div class="form-group">' +
														'<label class="control-label">用户姓名:</label> ' +
														'<input type="text" class="form-control input-sm userpick-realname" style="width:100px;">' +
													'</div> ' +
													'<div class="form-group">' +
														'<label class="control-label label-color">所属单位:</label> ' +
														'<input type="text" class="form-control input-sm userpick-org" style="width:100px;color:#555;background-color:#fff;cursor: pointer;" readonly />' +
													'</div> ' +
													'<button class="btn btn-primary btn-sm userpick-search" type="button" >查询</button> ' +
													'<button class="btn btn-default btn-sm userpick-reset" type="button" >重置</button>' +
												'</form>' +
											'</div>' +
											'<table class="userpick-table" style="height:100%;width:100%">' +
											'</table>' + 
									'</div>' +
									'<div class="modal-footer">' +
										'<button type="button" class="btn btn-sm btn-primary userpick-ok" >确定</button>' +
										'<button type="button" class="btn btn-sm btn-default userpick-close">取消</button>' +
									'</div>' +
								'</div>' +
							'</div>' +
						'</div>'
						
		return template;
	}
	
	$.fn.userpick = function (options, param) {
		if (typeof options == 'string') {
			return $.fn.userpick.methods[options](this, param);
		}
		
        this.each(function () {
            var el = $(this);
			/*
            if (el.data('userpick'))
                el.data('userpick').remove();
				*/
            el.data('userpick', new UserPick(el, options));
        });
        return this;
    };
	
	$.fn.userpick.methods = {
		getUserId: function(jq) {
			var cc = $.data(jq[0], 'userpick');
			if (cc) {
				return cc.getUserId();
			}
			return "";
		},
		setUserId: function(jq, id) {
			var cc = $.data(jq[0], 'userpick');
			if (cc) {
				cc.setUserId(id);
			}
		}
	};
})(jQuery);