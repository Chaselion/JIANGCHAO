//datametapick插件
(function($){
	var DataMetaPick = function (element, options) {
		this.dataMetaId = options.dataMetaId;
		this.provider = getProvider(options.dataMetaId);
		
		this.dataId = "";
		this.element = $(element);
		this.parentEl = $("body");
		this.container = $(this.provider.getHtml()).appendTo(this.parentEl);
		this.provider.init(this);
		
		/////////
		if (this.element.is('input')) {
            this.element.on({
                'focus.datametapick': $.proxy(this.showPick, this)
            });
        }
		
		this.container
			.on('click.datametapick', 'button.datametapick-close', $.proxy(this.hide, this));
			
		this.provider.search();
    };

    DataMetaPick.prototype = {
        constructor: DataMetaPick,

        setOptions: function(options, callback) {
		},
		getDataId: function() {
			return this.dataId;
		},
		setDataId: function(dataId) {
			this.dataId = dataId;
			if (dataId == "") {
				this.element.val("");
			}
		},
		showPick: function (e) {
            if (this.isShowing) return;
			
			$(this.container).modal('show');
			this.provider.onShow();

            // Create a click proxy that is private to this instance of datepicker, for unbinding
            this._outsideClickProxy = $.proxy(function (e) { this.outsideClick(e); }, this);
            // Bind global datepicker mousedown for hiding and
            $(document)
              .on('mousedown.datametapick', this._outsideClickProxy)
              // also explicitly play nice with Bootstrap dropdowns, which stopPropagation when clicking them
              .on('click.datametapick', '[data-toggle=dropdown]', this._outsideClickProxy)
              // and also close when focus changes to outside the picker (eg. tabbing between controls)
              .on('focusin.datametapick', this._outsideClickProxy);

            this.isShowing = true;
            this.element.trigger('show.datametapick', this);
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
              .off('mousedown.datametapick')
              .off('click.datametapick', '[data-toggle=dropdown]')
              .off('focusin.datametapick');

			$(this.container).modal('hide');

            this.isShowing = false;
            this.element.trigger('hide.datametapick', this);
        },
		setData: function(id, name) {
			this.element.val(name);
			this.dataId = id;
		},
		remove: function() {
            this.container.remove();
            this.element.val("");
			this.element.off('.datametapick');
            this.element.removeData('datametapick');
        }
	};
		
	function getProvider(dataMetaId) {
		switch(dataMetaId) {
			case "100000001":
				return new ElecveCarProvider();
			case "100000002":
				return new ElecveChargerStubProvider();
		}
	}
	
	// 电动车
	var ElecveCarProvider = function () {
	};
	ElecveCarProvider.prototype = {
		getHtml: function() {	// api
			var template = 	
				'<div class="modal modal-condensed datametapick">' +
					'<div class="modal-dialog">' +
						'<div class="modal-content">' +
							'<div class="modal-header">' +
								'<button type="button" class="close datametapick-close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
								'<h4 class="modal-title">选择电动车</h4>' +
							'</div>' +
							'<div class="modal-body">' +
									
								'<div style="padding-bottom:5px;">' +
									'<form class="form-inline datametapick-form" role="form">' +
										'<div class="form-group">' +
											'<label class="control-label label-color">车牌号:</label> ' +
											'<input type="text" class="form-control input-sm datametapick-elecve_car_license" style="width:100px;" />' +
										'</div> ' +
										'<div class="form-group">' +
											'<label class="control-label label-color">客户:</label> ' +
											'<select class="form-control input-sm datametapick-elecve_car_subtenantId" style="width:100px;" >' +
												'<option value="" selected>全部</option>' +
											'</select>' +
										'</div> ' +
										'<div class="form-group">' +
											'<label class="control-label label-color">所属地:</label> ' +
											'<input type="text" class="form-control input-sm datametapick-elecve_car_region" style="width:100px;color:#555;background-color:#fff;cursor: pointer;" readonly  />' +
										'</div> ' +
										'<button class="btn btn-primary btn-sm datametapick-search" type="button" >查询</button> ' +
										'<button class="btn btn-default btn-sm datametapick-reset" type="button" >重置</button>' +
									'</form>' +
								'</div>' +
									
								'<table class="datametapick-table" style="height:100%;width:100%">' +
								'</table>' + 
							
							'</div>' +
							'<div class="modal-footer">' +
								'<button type="button" class="btn btn-sm btn-primary datametapick-ok" >确定</button>' +
								'<button type="button" class="btn btn-sm btn-default datametapick-close">取消</button>' +
							'</div>' +
						'</div>' +
					'</div>' +
				'</div>'
			return template;
		},
		init: function(parentPick) {	// api
			this.parentPick = parentPick;
			this.parentContainer = parentPick.container;
			
			this.parentContainer.find(".datametapick-elecve_car_region").regionpick({
				parentEl: this.parentContainer
			});
			
			this.initGrid();
			
			this.parentContainer
				.on('click.datametapick', 'button.datametapick-search', $.proxy(this.search, this))
				.on('click.datametapick', 'button.datametapick-reset', $.proxy(this.resetForm, this))
				.on('click.datametapick', 'button.datametapick-ok', $.proxy(this.choose, this));
			
			this.getSubtenant();
		},
		search: function () {	// api
			var param = {dataMetaId: this.parentPick.dataMetaId};

			var license = this.parentContainer.find(".datametapick-elecve_car_license").val();
			param["extAdd_elecve_car_license"] = license;
			
			var subtenantId = this.parentContainer.find(".datametapick-elecve_car_subtenantId").val();
			if (subtenantId != "") {
				param["extAdd_elecve_car_subtenantId"] = subtenantId;
			}
			
			var regionId = this.parentContainer.find(".datametapick-elecve_car_region").regionpick("getRegionId");
			if (regionId != "") {
				param["extAdd_elecve_car_regionId"] = regionId;
			}
			
			this.parentContainer.find('.datametapick-table').datagrid('load', param);
		},
		onShow: function() {	// api
			this.parentContainer.find(".datametapick-table").datagrid('resize', {});
		},
		initGrid: function() {
			var that = this;
			this.parentContainer.find('.datametapick-table').datagrid({
				width: 'auto',
				height: '350px',
				pagination: true,
				singleSelect: true,
				columns:[[
					{field:'carLicense',title:'车牌号',width:100},
					{field:'terminalID',title:'终端号',width:100},
					{field:'regionShortName',title:'所属地',width:100},
					{field:'subtenantName',title:'所属客户',width:100},
					{field:'status',title:'状态',width:100,
						formatter: function(value, row, index){
								var status = value;
								var labelClass = 'label-error';
								var statusStr = '未知';
								if (status == 'INSTOCK') {
									labelClass = 'label-warning';
									statusStr = '在库';
								} else if (status == 'SOLD') {
									labelClass = 'label-success';
									statusStr = '已售';
								} else if (status == 'RENT') {
									labelClass = 'label-info';
									statusStr = '已租';
								}
								return '<span class="label ' + labelClass + '">' + statusStr + '</span>';
						}
					}
					
				]],
				onLoadSuccess: function(data) {
					if (data.commonMessage.success == false) {
						showNoty(data.commonMessage.errorMessage, "error", true, 'top');
					}
				},
				onDblClickRow : function(index, row) {
					var ops = that.parentContainer.find(".datametapick-table").datagrid('options');
					ops.datametapick.setData(row.id, row.carLicense);
					ops.datametapick.hide();
				},
				datametapick: that.parentPick
			});
			this.parentContainer.find('.datametapick-table').datagrid("options").url = 'data_meta/searchDatasOfDataMeta';
		},
		choose: function() {
			var row = this.parentContainer.find(".datametapick-table").datagrid("getSelected");
			if (row) {
				this.parentPick.setData(row.id, row.carLicense);
			}
			
			this.parentPick.hide();
		},
		resetForm: function() {
			this.parentContainer.find(".datametapick-form")[0].reset();
			this.parentContainer.find(".datametapick-elecve_car_region").regionpick("setRegionId", "");
		},
		getSubtenant: function() {
			var that = this;
			$.post("tenant/getSubtenantOfTenant", "", function(data) {
				if (data.commonMessage.success) {
					var subtenants = data.subtenants;
				
					var jqSubtenantList = that.parentContainer.find(".datametapick-elecve_car_subtenantId");
					for (var i = 0; i < subtenants.length; i++) {
						var subtenant= subtenants[i];
						jqSubtenantList.append('<option value="' + subtenant.id + '">' + subtenant.name + '</option>');
					}
				} else {
					showNoty(data.commonMessage.errorMessage, "error", false, "top");
				}
			});
		}
	};
	
	//充电桩
	var ElecveChargerStubProvider = function () {
	};
	ElecveChargerStubProvider.prototype = {
		getHtml: function() {	// api
			var template = 	
				'<div class="modal modal-condensed datametapick">' +
					'<div class="modal-dialog">' +
						'<div class="modal-content">' +
							'<div class="modal-header">' +
								'<button type="button" class="close datametapick-close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' +
								'<h4 class="modal-title">选择充电桩</h4>' +
							'</div>' +
							'<div class="modal-body">' +
									
								'<div style="padding-bottom:5px;">' +
									'<form class="form-inline datametapick-form" role="form">' +
										'<div class="form-group">' +
											'<label class="control-label label-color">本机IP:</label> ' +
											'<input type="text" class="form-control input-sm datametapick-elecve_charger_stub_localhost" style="width:90px;" />' +
										'</div> ' +
										'<div class="form-group">' +
											'<label class="control-label label-color">厂商:</label> ' +
											'<select class="form-control input-sm datametapick-elecve_charger_stub_manufacturerId" style="width:80px;" >' +
												'<option value="" selected>全部</option>' +
											'</select>' +
										'</div> ' +
										'<div class="form-group">' +
											'<label class="control-label label-color">所属地:</label> ' +
											'<input type="text" class="form-control input-sm datametapick-elecve_charger_stub_region" style="width:80px;color:#555;background-color:#fff;cursor: pointer;" readonly  />' +
										'</div> ' +
										'<div class="form-group">' +
											'<label class="control-label label-color">地址:</label> ' +
											'<input type="text" class="form-control input-sm datametapick-elecve_charger_stub_address" style="width:90px;" />' +
										'</div>' +
									'</form>' +
								'</div>' +
								'<div style="padding-bottom:5px;">' +
									'<form class="form-inline" role="form">' +
										'<button class="btn btn-primary btn-sm datametapick-search" type="button" >查询</button> ' +
										'<button class="btn btn-default btn-sm datametapick-reset" type="button" >重置</button>' +
									'</form>' +
								'</div>' +
								'<table class="datametapick-table" style="height:100%;width:100%">' +
								'</table>' + 
							
							'</div>' +
							'<div class="modal-footer">' +
								'<button type="button" class="btn btn-sm btn-primary datametapick-ok" >确定</button>' +
								'<button type="button" class="btn btn-sm btn-default datametapick-close">取消</button>' +
							'</div>' +
						'</div>' +
					'</div>' +
				'</div>'
			return template;
		},
		init: function(parentPick) {	// api
			this.parentPick = parentPick;
			this.parentContainer = parentPick.container;
			
			this.parentContainer.find(".datametapick-elecve_charger_stub_region").regionpick({
				parentEl: this.parentContainer
			});
			
			this.initGrid();
			
			this.parentContainer
				.on('click.datametapick', 'button.datametapick-search', $.proxy(this.search, this))
				.on('click.datametapick', 'button.datametapick-reset', $.proxy(this.resetForm, this))
				.on('click.datametapick', 'button.datametapick-ok', $.proxy(this.choose, this));
			
			this.getManufacturer();
		},
		search: function () {	// api
			var param = {dataMetaId: this.parentPick.dataMetaId};

			var localhost = this.parentContainer.find(".datametapick-elecve_charger_stub_localhost").val();
			param["extAdd_elecve_charger_stub_localhost"] = localhost;
			
			var manufacturerId = this.parentContainer.find(".datametapick-elecve_charger_stub_manufacturerId").val();
			if (manufacturerId != "") {
				param["extAdd_elecve_charger_stub_manufacturerId"] = manufacturerId;
			}
			
			var regionId = this.parentContainer.find(".datametapick-elecve_charger_stub_region").regionpick("getRegionId");
			if (regionId != "") {
				param["extAdd_elecve_charger_stub_region"] = regionId;
			}
			
			var address = this.parentContainer.find(".datametapick-elecve_charger_stub_address").val();
			if (address != "") {
				param["extAdd_elecve_charger_stub_address"] = address;
			}
			
			this.parentContainer.find('.datametapick-table').datagrid('load', param);
		},
		onShow: function() {	// api
			this.parentContainer.find(".datametapick-table").datagrid('resize', {});
		},
		initGrid: function() {
			var that = this;
			this.parentContainer.find('.datametapick-table').datagrid({
				width: 'auto',
				height: '350px',
				pagination: true,
				singleSelect: true,
				columns:[[
					{field:'localhost',title:'本机IP',width:100},
					{field:'server',title:'主机地址',width:100},
					{field:'manufacturer.name',title:'厂商',width:100,
						formatter: function(value, row, index){
							if (row.manufacturer) {
								return row.manufacturer.name;
							}
							return "";
						}
					},
					{field:'code',title:'充电机号',width:100},
					{field:'regionShortName',title:'所属地',width:100, 
						formatter: function(value, row, index){
							if (row.region){
								return row.region.shortName;
							} else {
								return value;
							}
						}
					},
					{field:'address',title:'地址',width:100},
					{field:'areaCode',title:'区县码',width:100},
					{field:'areaAddress',title:'区域地址',width:100}
				]],
				onLoadSuccess: function(data) {
					if (data.commonMessage.success == false) {
						showNoty(data.commonMessage.errorMessage, "error", true, 'top');
					}
				},
				onDblClickRow : function(index, row) {
					var ops = that.parentContainer.find(".datametapick-table").datagrid('options');
					ops.datametapick.setData(row.id, row.localhost);
					ops.datametapick.hide();
				},
				datametapick: that.parentPick
			});
			this.parentContainer.find('.datametapick-table').datagrid("options").url = 'data_meta/searchDatasOfDataMeta';
		},
		choose: function() {
			var row = this.parentContainer.find(".datametapick-table").datagrid("getSelected");
			if (row) {
				this.parentPick.setData(row.id, row.localhost);
			}
			
			this.parentPick.hide();
		},
		resetForm: function() {
			this.parentContainer.find(".datametapick-form")[0].reset();
			this.parentContainer.find(".datametapick-elecve_charger_stub_region").regionpick("setRegionId", "");
		},
		getManufacturer: function() {
			var that = this;
			$.ajax({
				type: 'post',
				url: 'charger_stub_manufacturer/getAll',
				data: "",
				dataType: 'json',
				success: function(data) {
					var chargerStubManufacturer  = data.chargerStubManufacturers;
					
					var jqAddManufacturerList = that.parentContainer.find(".datametapick-elecve_charger_stub_manufacturerId");
					for (var i = 0; i < chargerStubManufacturer.length; i++) {
						var manufacturer= chargerStubManufacturer[i];
						jqAddManufacturerList.append('<option value="' + manufacturer.id + '">' + manufacturer.name + '</option>');
					}
				}
			});
		}
	};
	
	$.fn.datametapick = function (options, param) {
		if (typeof options == 'string') {
			return $.fn.datametapick.methods[options](this, param);
		}
		
        this.each(function () {
            var el = $(this);
			
            if (el.data('datametapick')) {
				var existDataMetaId = el.data('datametapick').dataMetaId;
				if (existDataMetaId != options.dataMetaId) {
					 el.data('datametapick').remove();
				}
			}
			
			el.data('datametapick', new DataMetaPick(el, options));
        });
        return this;
    };
	
	$.fn.datametapick.methods = {
		getDataId: function(jq) {
			var cc = $.data(jq[0], 'datametapick');
			if (cc) {
				return cc.getDataId();
			}
			return "";
		},
		setDataId: function(jq, id) {
			var cc = $.data(jq[0], 'datametapick');
			if (cc) {
				cc.setDataId(id);
			}
		},
		remove: function(jq) {
			var cc = $.data(jq[0], 'datametapick');
			if (cc) {
				cc.remove();
			}
		}
	};
})(jQuery);