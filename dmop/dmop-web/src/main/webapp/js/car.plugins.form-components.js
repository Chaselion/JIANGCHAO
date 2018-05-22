var CarFormComponents = function() {
    
    var c = function() {
        if ($.fn.inputlimiter) {
            $.extend(true, $.fn.inputlimiter.defaults, {
                boxAttach: false,
                boxId: "limit-text",
                remText: "%n character%s remaining.",
                limitText: "Field limited to %n character%s.",
                zeroPlural: true
            });
            $("textarea.limited").each(function(m, n) {
                var o = $(this).attr("name");
                var l = $.fn.inputlimiter.defaults.limitText;
                var p = $(this).data("limit");
                l = l.replace(/\%n/g, p);
                l = l.replace(/\%s/g, (p <= 1 ? "": "s"));
                $.extend(true, $.fn.inputlimiter.defaults, {
                    boxId: "limit-text-" + o,
                });
                $(this).parent().find("#limit-text-" + o).html(l);
                $(this).inputlimiter({
                    limit: p
                })
            })
        }
    };
    var b = function() {
        if ($.fn.uniform) {
            $(":radio.uniform, :checkbox.uniform").uniform()
        }
    };
    var i = function() {
        if ($.fn.select2) {
            $.extend(true, $.fn.select2.defaults, {
                width: "resolve"
            });
            $(".select2").each(function() {
                var l = $(this);
                $(l).select2(l.data())
            });
            $(".dataTables_length select").select2({
                minimumResultsForSearch: "-1"
            })
        }
    };
    var d = function() {
        if ($.validator) {
            $.extend($.validator.defaults, {
                errorClass: "has-error",
                validClass: "has-success",
                highlight: function(o, m, n) {
                    if (o.type === "radio") {
                        this.findByName(o.name).addClass(m).removeClass(n)
                    } else {
                        $(o).addClass(m).removeClass(n)
                    }
                    if ($(o).closest("form").hasClass("form-vertical")) {
                        var p = "*[class^=col-]"
                    } else {
                        var p = ".form-group"
                    }
                    $(o).closest(p).addClass(m).removeClass(n)
                },
                unhighlight: function(o, m, n) {
                    if (o.type === "radio") {
                        this.findByName(o.name).removeClass(m).addClass(n)
                    } else {
                        $(o).removeClass(m).addClass(n)
                    }
                    if ($(o).closest("form").hasClass("form-vertical")) {
                        var p = "*[class^=col-]"
                    } else {
                        var p = ".form-group"
                    }
                    $(o).closest(p).removeClass(m).addClass(n);
                    $(o).closest(p).find('label[generated="true"]').html("")
                }
            });
            var l = $.validator.prototype.resetForm;
            $.extend($.validator.prototype, {
                resetForm: function() {
                    var m = this;
                    l.call(this);
                    $(this.currentForm).find(".form-group").each(function() {
                        $(this).removeClass(m.settings.errorClass + " " + m.settings.validClass)
                    });
                    $(this.currentForm).find(".select2-container").removeClass(m.settings.errorClass + " " + m.settings.validClass);
                    $(this.currentForm).find('label[generated="true"]').html("")
                },
                showLabel: function(n, o) {
                    var m = this.errorsFor(n);
                    if (m.length) {
                        m.removeClass(this.settings.validClass).addClass(this.settings.errorClass);
                        if (m.attr("generated")) {
                            m.html(o)
                        }
                    } else {
                        m = $("<" + this.settings.errorElement + "/>").attr({
                            "for": this.idOrName(n),
                            generated: true
                        }).addClass(this.settings.errorClass).addClass("help-block").html(o || "");
                        if (this.settings.wrapper) {
                            m = m.hide().show().wrap("<" + this.settings.wrapper + "/>").parent()
                        }
                        if (!this.labelContainer.append(m).length) {
                            if (this.settings.errorPlacement) {
                                this.settings.errorPlacement(m, $(n).parent())
                            } else {
                                m.insertAfter($(n).parent())
                            }
                        }
                    }
                    if (!o && this.settings.success) {
                        m.text("");
                        if (typeof this.settings.success === "string") {
                            m.addClass(this.settings.success)
                        } else {
                            this.settings.success(m, n)
                        }
                    }
                    this.toShow = this.toShow.add(m)
                }
            })
        }
    };
    return {
        init: function() {
            c();
            b();
            i();
            d();
        }
    }
} ();