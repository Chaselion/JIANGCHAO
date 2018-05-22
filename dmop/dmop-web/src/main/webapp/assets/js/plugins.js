var Plugins = function() {
    var g = function() {
        $.browser = {}; (function() {
            $.browser.msie = false;
            $.browser.version = 0;
            if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
                $.browser.msie = true;
                $.browser.version = RegExp.$1
            }
        })()
    };
    var applyDefaultNoty = function() {
        if ($.noty) {
            $.extend(true, $.noty.defaults, {
                type: "alert",
                timeout: false,
                maxVisible: 5,
                animation: {
                    open: {
                        height: "toggle"
                    },
                    close: {
                        height: "toggle"
                    },
                    easing: "swing",
                    speed: 200
                }
            })
        }
    };
    var m = function() {
        if ($.fn.dataTable) {
            $.extend(true, $.fn.dataTable.defaults, {
                language: {
                    search: ""
					//"url": "plugins/datatables/i18n/zh_CN.json"
                },
                dom: "<'row'<'dataTables_header clearfix'<'col-md-6'l><'col-md-6'f>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>",
                pageLength: 10,
                drawCallback: function() {
                    if ($.fn.uniform) {
                        $(":radio.uniform, :checkbox.uniform").uniform()
                    }
                    if ($.fn.select2) {
                        $(".dataTables_length select").select2({
                            minimumResultsForSearch: "-1"
                        })
                    }
                    var o = $(this).closest(".dataTables_wrapper").find("div[id$=_filter] input");
                    if (o.parent().hasClass("input-group")) {
                        return
                    }
                    o.addClass("form-control");
                    o.wrap('<div class="input-group"></div>');
                    o.parent().prepend('<span class="input-group-addon"><i class="icon-search"></i></span>')
                }
            });
            $.fn.dataTable.defaults.lengthMenu = [[10, 25, 50, 100], [10, 25, 50, 100]];
            $(".datatable").each(function() {
                var w = $(this);
                var y = {};
                var s = w.data("datatable");
                if (typeof s != "undefined") {
                    $.extend(true, y, s)
                }
                var x = w.data("displayLength");
                if (typeof x != "undefined") {
                    $.extend(true, y, {
                        pageLength: x
                    })
                }
				/*
                var r = w.data("horizontalWidth");
                if (typeof r != "undefined") {
                    $.extend(true, y, {
                        scrollX: "100%",
                        scrollXInner: r,
                        scrollCollapse: true
                    })
                }*/
                if (w.hasClass("table-checkable")) {
                    $.extend(true, y, {
                        columnDefs: [{
                            orderable: false,
                            targets: [0]
                        }]
                    })
                }
                if (w.hasClass("table-tabletools")) {
                    $.extend(true, y, {
                        sDom: "<'row'<'dataTables_header clearfix'<'col-md-4'l><'col-md-8'Tf>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>",
                        oTableTools: {
                            aButtons: ["copy", "print", "csv", "xls", "pdf"],
                            sSwfPath: "plugins/datatables/tabletools/swf/copy_csv_xls_pdf.swf"
                        }
                    })
                }
                if (w.hasClass("table-colvis")) {
                    $.extend(true, y, {
                        sDom: "<'row'<'dataTables_header clearfix'<'col-md-6'l><'col-md-6'Cf>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>",
                        oColVis: {
                            buttonText: "Columns <i class='icon-angle-down'></i>",
                            iOverlayFade: 0
                        }
                    })
                }
                if (w.hasClass("table-tabletools") && w.hasClass("table-colvis")) {
                    $.extend(true, y, {
                        sDom: "<'row'<'dataTables_header clearfix'<'col-md-6'l><'col-md-6'TCf>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>",
                    })
                }
                if (w.hasClass("table-checkable") && w.hasClass("table-colvis")) {
                    $.extend(true, y, {
                        oColVis: {
                            aiExclude: [0]
                        }
                    })
                }
                if (w.hasClass("table-responsive")) {
                    var q;
                    var p = {
                        tablet: 1024,
                        phone: 480
                    };
                    var t = $.fn.dataTable.defaults.fnDrawCallback;
                    $.extend(true, y, {
                        bAutoWidth: false,
                        fnPreDrawCallback: function() {
                            if (!q) {
                                q = new ResponsiveDatatablesHelper(this, p)
                            }
                        },
                        fnRowCallback: function(C, B, A, z) {
                            q.createExpandIcon(C)
                        },
                        fnDrawCallback: function(z) {
                            t.apply(this, z);
                            q.respond()
                        }
                    })
                }
                var v = w.data("datatableFunction");
                if (typeof v != "undefined") {
                    $.extend(true, y, window[v]())
                }
                if (w.hasClass("table-columnfilter")) {
                    var u = {};
                    var o = w.data("columnfilter");
                    if (typeof o != "undefined") {
                        $.extend(true, u, o)
                    }
                    $(this).dataTable(y).columnFilter(u);
                    w.find(".filter_column").each(function() {
                        var z = w.data("columnfilterSelect2");
                        if (typeof z != "undefined") {
                            $(this).children("input").addClass("form-control");
                            $(this).children("select").addClass("full-width-fix").select2({
                                placeholderOption: "first",
                                allowClear: true
                            })
                        } else {
                            $(this).children("input, select").addClass("form-control")
                        }
                    })
                } else {
                    $(this).dataTable(y)
                }
            })
        }
    };
    return {
        init: function() {
            g();
            applyDefaultNoty();
            m();
        }
    }
} ();