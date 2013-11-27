var desktopFn = {
    dangky: function () {
        if (!loggedIn) {
            alert('Bạn cần đăng nhập'); return false;
        }
        common.regPlug(typeof (dangKyFn), 'appStore.pmSpa.desktop.controls.KHang.DangKy, appStore.pmSpa.desktop.controls', function () {
            dangKyFn.Show();
        });
    },    
    timKhachHang: function () {
        common.regPlug(typeof (dangKyFn), 'appStore.pmSpa.desktop.controls.KHang.DangKy, appStore.pmSpa.desktop.controls', function () {
            dangKyFn.timKhachHangPopup();
        });
    },
    thoat:function() {
        adm.loadPlug('docsoft.plugin.authentication.Class1, docsoft.plugin.authentication', { 'subact': 'logout' }, function (data) {
            document.location.href = domain;
        });
    },
    login: function () {
        jQuery.post(adm.urlDefault, { 'act': 'loadPlug', 'rqPlug': 'docsoft.hethong.preload.Class1, docsoft.hethong.preload', 'subAct': 'loginSmall' }, function (data) {
        }, 'script');
    },
    init: function () {
        desktopFn.fullScrollPanel();
        desktopFn.dichVuDanhSachFn();

        $('.kq-item-ten').click(function () {
            var item = $(this);
            item.unbind('click').click(function () {
                var nDung = item.parent().find('.kq-item-noiDung');
                if (nDung.css('display') == 'none') {
                    nDung.show();
                }
                else {
                    nDung.hide();
                }
            });
        });
        
        // Mobile Safari in standalone mode
        if (("standalone" in window.navigator) && window.navigator.standalone) {

            // If you want to prevent remote links in standalone web apps opening Mobile Safari, change 'remotes' to true
            var noddy, remotes = false;

            document.addEventListener('click', function (event) {

                noddy = event.target;

                // Bubble up until we hit link or top HTML element. Warning: BODY element is not compulsory so better to stop on HTML
                while (noddy.nodeName !== "A" && noddy.nodeName !== "HTML") {
                    noddy = noddy.parentNode;
                }

                if ('href' in noddy && noddy.href.indexOf('http') !== -1 && (noddy.href.indexOf(document.location.host) !== -1 || remotes)) {
                    event.preventDefault();
                    document.location.href = noddy.href;
                }

            }, false);
        }
    },
    fullScrollPanel: function () {
        //$('.desktop-pnl').css({ 'height': ($(window).height() - 70) + 'px' });
        //$(window).resize(function () {
        //    var h1 = $(window).height() - 70;
        //    $('.desktop-pnl').css({ 'height': h1 + 'px' });
        //});

        //$('.fullScrollPanel').css({ 'height': ($(window).height() - 85) + 'px' });
        //$(window).resize(function () {
        //    var h1 = $(window).height() - 85;
        //    $('.fullScrollPanel').css({ 'height': h1 + 'px' });
        //});
    },
    dichVuDanhSachFn: function () {
        var items = $('.dv-item-header', '.dv-pnl-left');
        $.each(items, function (i, jitem) {
            var item = $(jitem);
            item.unbind('click').click(function () {
                console.log(_ref);
                if (!item.hasClass('dv-item-header-active')) {
                    items.removeClass('dv-item-header-active');
                    item.addClass('dv-item-header-active');
                    var _ref = item.attr('_ref');
                    if (_ref != '0') {
                        $('.dv-item[_pRef]').hide();
                        $('.dv-item[_pRef="' + _ref + '"]').fadeIn(500);
                    } else {
                        $('.dv-item[_pRef]').show();
                    }
                }
            });
        });
    }
}
$(function () {
    desktopFn.init();
});


jQuery.fn.hammer = function (options) {
    return this.each(function () {
        var hammer = new Hammer(this, options);

        var $el = jQuery(this);
        $el.data("hammer", hammer);

        var events = ['hold', 'tap', 'doubletap', 'transformstart', 'transform', 'transformend', 'dragstart', 'drag', 'dragend', 'swipe', 'release'];

        for (var e = 0; e < events.length; e++) {
            hammer['on' + events[e]] = (function (el, eventName) {
                return function (ev) {
                    el.trigger(jQuery.Event(eventName, ev));
                };
            })($el, events[e]);
        }
    });
};

var throttle = function(func, wait) {
    var context, args, timeout, result;
    var previous = 0;
    var later = function() {
        previous = new Date;
        timeout = null;
        result = func.apply(context, args);
    };
    return function() {
        var now = new Date;
        var remaining = wait - (now - previous);
        context = this;
        args = arguments;
        if (remaining <= 0) {
            clearTimeout(timeout);
            timeout = null;
            previous = now;
            result = func.apply(context, args);
        } else if (!timeout) {
            timeout = setTimeout(later, remaining);
        }
        return result;
    };
};