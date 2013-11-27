jQuery(function () {
    var slideShowTimer;
    var slideShowInterval = 2000;
    var slideShowInt = 0;
    jQuery.each(jQuery('.cate-home-li'), function (i, _item) {
        var item = jQuery(_item);
        var flyOut = item.find('.cate-flyOut');
        var aItem = item.find('.cate-item');
        var fBox = item.find('.cate-flyOut-featured-box');
        if (jQuery(flyOut).length > 0) {
            item.mouseenter(function () {
                aItem.addClass('cate-item-focus');
                var _loaded = fBox.attr('_loaded');
                var _DM_ID = fBox.attr('_DM_ID');
                if (_loaded == '0') {
                    fBox.html('nạp...');
                    jQuery.ajax({
                        url: domain + '/lib/pages/San_pham_menu_ajax.aspx?ref=' + Math.random(),
                        data: { 'DM_ID': _DM_ID },
                        success: function (dt) {
                            fBox.html(dt);
                            fBox.attr('_loaded', '1')
                        }
                    });
                }
                getEl(item, function (_t, _l, _w) {
                    //flyOut.show().css({ 'left': (_l + _w - 3) + 'px', 'top': _t + 'px' });
                    flyOut.show().css({ 'left': (_l + _w - 4) + 'px', 'top': _t + 'px' });
                    item.mouseleave(function () {
                        flyOut.hide();
                        aItem.removeClass('cate-item-focus');
                    });
                });
            });
        }
    });

    jQuery.each(jQuery('.menu-li'), function (i, _item) {
        var item = jQuery(_item);
        var flyOut = item.find('.menu-flyOut');
        var aItem = item.find('.menu-item');
        item.mouseenter(function () {
            aItem.addClass('menu-item-focus');
            getEl(item, function (_t, _l, _w, _t1) {
                flyOut.show().css({ 'left': _l + 'px', 'top': (_t1 - 1) + 'px' });
                item.mouseleave(function () {
                    flyOut.hide();
                    aItem.removeClass('menu-item-focus');
                });
            });
        });
    });

    jQuery.each(jQuery('.slides-ten-item'), function (i, _item) {
        var item = jQuery(_item);
        item.mouseenter(function () {
            var item = jQuery(_item);
            var _ref = item.attr('ref');
            var p = item.parent();
            if (item.hasClass('slides-ten-item-focus')) return false;
            p.find('.slides-ten-item-focus').removeClass('slides-ten-item-focus');
            item.addClass('slides-ten-item-focus');
            p.prev().find('.slides-panel-item-focus').removeClass('slides-panel-item-focus');
            p.prev().find('.slides-panel-item[ref=\'' + _ref + '\']').addClass('slides-panel-item-focus');
            slideShowInt = 0;
            if (slideShowTimer) { clearTimeout(slideShowTimer); }
            slideShowTimer = setTimeout(function () {
                playSlidesShow();
            }, slideShowInterval);
        });
    });


    function playSlidesShow() {
        if (slideShowTimer) { clearTimeout(slideShowTimer); }
        if (slideShowInt < 4) { slideShowInt++; }
        else { slideShowInt = 0; }
        slideShowTimer = setTimeout(function () {
            playSelectedShow(slideShowInt);
        }, slideShowInterval);
        //        console.log(slideShowTimer);
        //        console.log(slideShowInt);
    }
    function playSelectedShow(i) {
        var item = jQuery('.slides-ten-item').eq(i);
        var _ref = item.attr('ref');
        var p = item.parent();
        if (item.hasClass('slides-ten-item-focus')) return false;
        p.find('.slides-ten-item-focus').removeClass('slides-ten-item-focus');
        item.addClass('slides-ten-item-focus');
        p.prev().find('.slides-panel-item-focus').removeClass('slides-panel-item-focus');
        p.prev().find('.slides-panel-item[ref=\'' + _ref + '\']').addClass('slides-panel-item-focus');
        if (slideShowTimer) { clearTimeout(slideShowTimer); }
        slideShowTimer = setTimeout(function () {
            playSlidesShow();
        }, slideShowInterval);
    }
    playSlidesShow();

    function getEl(el, fn) {
        var _offset = jQuery(el).offset();
        var _t = _offset.top;
        var _l = _offset.left;
        var _w = el.width();
        var _h = el.height();
        var _pt = parseInt(el.css('padding-top').toString().toLowerCase().replace('px', ''));
        var _pb = parseInt(el.css('padding-bottom').toString().toLowerCase().replace('px', ''));
        var _mt = parseInt(el.css('margin-top').toString().toLowerCase().replace('px', ''));
        var _mb = parseInt(el.css('margin-bottom').toString().toLowerCase().replace('px', ''));
        var _bb = parseInt(el.css('border-bottom-width').toString().toLowerCase().replace('px', ''));
        var _bt = parseInt(el.css('border-top-width').toString().toLowerCase().replace('px', ''));
        var _t1 = 0;
        _t1 = _t + _h + ((_pt == NaN) ? _pt : 0) + ((_pb == NaN) ? _pb : 0) + ((_mt == NaN) ? _mt : 0) + ((_mb == NaN) ? _mb : 0) + ((_bb == NaN) ? _bb : 0) + ((_bt == NaN) ? _bt : 0);
        if (typeof (fn) == 'function') { fn(_t, _l, _w, _t1); }
    }
    var txtSearch = jQuery('.top-search-txt');
    txtSearch.focus(function () {
        var item = jQuery('.top-search-box');
        item.addClass('top-search-box-focus');
        txtSearch.blur(function () {
            item.removeClass('top-search-box-focus');
        });
    });

    jQuery.each(jQuery('.home-regPanel-header-item'), function (i, _item) {
        var item = jQuery(_item);
        item.click(function () {
            item.parent().find('.home-regPanel-header-item-active').removeClass('home-regPanel-header-item-active');
            item.addClass('home-regPanel-header-item-active');
            item.parent().next().find('.home-regPanel-body-active').removeClass('home-regPanel-body-active');
            item.parent().next().find('.home-regPanel-body').eq(i).addClass('home-regPanel-body-active');
        });
    });

    jQuery.each(jQuery('.home-ktnn-header-item'), function (i, _item) {
        var item = jQuery(_item);
        item.click(function () {
            item.parent().find('.home-ktnn-header-item-focus').removeClass('home-ktnn-header-item-focus');
            item.addClass('home-ktnn-header-item-focus');
            item.parent().next().find('.home-ktnn-body-focus').removeClass('home-ktnn-body-focus');
            item.parent().next().find('.home-ktnn-body').eq(i).addClass('home-ktnn-body-focus');
        });
    });


    jQuery.each(jQuery('.product-details-tab-header-item'), function (i, _item) {
        var item = jQuery(_item);
        item.click(function () {
            item.parent().find('.product-details-tab-header-item-focus').removeClass('product-details-tab-header-item-focus');
            item.addClass('product-details-tab-header-item-focus');
            item.parent().next().find('.product-details-tab-body-focus').removeClass('product-details-tab-body-focus');
            item.parent().next().find('.product-details-tab-body').eq(i).addClass('product-details-tab-body-focus');
        });
    });


    jQuery.each(jQuery('.home-rv-panel-header-item'), function (i, _item) {
        var item = jQuery(_item);
        item.click(function () {
            item.parent().find('.home-rv-panel-header-item-focus').removeClass('home-rv-panel-header-item-focus');
            item.addClass('home-rv-panel-header-item-focus');
            item.parent().next().find('.home-rv-panel-body-focus').removeClass('home-rv-panel-body-focus');
            item.parent().next().find('.home-rv-panel-body').eq(i).addClass('home-rv-panel-body-focus');
            //eq lây phần tử thứ i của mảng
        });
    });

    jQuery.each(jQuery('.doanhNghiep-tabs-ltv-header-item'), function (i, _item) {
        var item = jQuery(_item);
        item.click(function () {
            item.parent().find('.doanhNghiep-tabs-ltv-header-item-focus').removeClass('doanhNghiep-tabs-ltv-header-item-focus');
            item.addClass('doanhNghiep-tabs-ltv-header-item-focus');
            item.parent().next().find('.doanhNghiep-tabs-ltv-body-focus').removeClass('doanhNghiep-tabs-ltv-body-focus');
            item.parent().next().find('.doanhNghiep-tabs-ltv-body').eq(i).addClass('doanhNghiep-tabs-ltv-body-focus');
        });
    });

    jQuery.each(jQuery('.doanhNghiep-tabs-home-header-item'), function (i, _item) {
        var item = jQuery(_item);
        item.click(function () {
            item.parent().find('.doanhNghiep-tabs-home-header-item-focus').removeClass('doanhNghiep-tabs-home-header-item-focus');
            item.addClass('doanhNghiep-tabs-home-header-item-focus');
            item.parent().next().find('.doanhNghiep-tabs-home-body-focus').removeClass('doanhNghiep-tabs-home-body-focus');
            item.parent().next().find('.doanhNghiep-tabs-home-body').eq(i).addClass('doanhNghiep-tabs-home-body-focus');
        });
    });



    jQuery.each(jQuery('.tintuc-tabs-home-header-item'), function (i, _item) {
        var item = jQuery(_item);
        item.click(function () {
            item.parent().find('.tintuc-tabs-home-header-item-focus').removeClass('tintuc-tabs-home-header-item-focus');
            item.addClass('tintuc-tabs-home-header-item-focus');
            item.parent().next().find('.tintuc-tabs-home-body-focus').removeClass('tintuc-tabs-home-body-focus');
            item.parent().next().find('.tintuc-tabs-home-body').eq(i).addClass('tintuc-tabs-home-body-focus');
        });
    });

    jQuery.each(jQuery('.giaothuong-tabs-home-header-item'), function (i, _item) {
        var item = jQuery(_item);
        item.click(function () {
            item.parent().find('.giaothuong-tabs-home-header-item-focus').removeClass('giaothuong-tabs-home-header-item-focus');
            item.addClass('giaothuong-tabs-home-header-item-focus');
            item.parent().next().find('.giaothuong-tabs-home-body-focus').removeClass('giaothuong-tabs-home-body-focus');
            item.parent().next().find('.giaothuong-tabs-home-body').eq(i).addClass('giaothuong-tabs-home-body-focus');
        });
    });

    var searchBtn = jQuery('.top-search-btn');
    searchBtn.click(function () {
        var searchTxt = jQuery('.top-search-txt');
        var _txt = searchTxt.val();
        var searchSlt = jQuery('.top-search-slt');
        var __domain = jQuery(searchBtn).attr('_domain');
        document.location.href = __domain + '/lib/pages/Tim_kiem.aspx?q=' + _txt + '&type=' + searchSlt.val();
    });

    var searchTxt = jQuery('.top-search-txt');
    searchTxt.focus(function () {
        searchTxt.unbind('keypress').bind('keypress', function (evt) {
            if (evt.keyCode == 13) {
                var _txt = searchTxt.val();
                if (_txt == '') { alert('Vui lòng nhập từ khóa để tìm kiếm'); searchTxt.focus(); return false; }
                var searchSlt = jQuery('.top-search-slt');
                var __domain = jQuery(searchBtn).attr('_domain');
                document.location.href = __domain + '/lib/pages/Tim_kiem.aspx?q=' + _txt + '&type=' + searchSlt.val();
            }
        });
    });

//    var searchBtn1 = jQuery('.top-search-btn1');
//    searchBtn1.click(function () {
//        var searchTxt1 = jQuery('.top-search-txt1');
//        var _txt1 = searchTxt1.val();
//        var searchSlt1 = jQuery('.top-search-slt1');
//        var __domain1 = jQuery(searchBtn1).attr('_domain');
//        document.location.href = __domain1 + '/lib/pages/store/TimKiemGianHang.aspx?q=' + _txt1 + '&type=' + searchSlt1.val();
//    });

//    var searchTxt1 = jQuery('.top-search-txt1');
//    searchTxt1.focus(function () {
//        searchTxt1.unbind('keypress').bind('keypress', function (evt) {
//            if (evt.keyCode == 13) {
//                var _txt1 = searchTxt1.val();
//                if (_txt1 == '') { alert('Vui lòng nhập từ khóa để tìm kiếm'); searchTxt1.focus(); return false; }
//                var searchSlt1 = jQuery('.top-search-slt1');
//                var __domain1 = jQuery(searchBtn1).attr('_domain');
//                document.location.href = __domain1 + '/lib/pages/store/TimKiemGianHang.aspx?q=' + _txt1 + '&type=' + searchSlt1.val();
//            }
//        });
//    });


    var searchRsPnl = jQuery('.search-leftPnl');
    if (jQuery(searchRsPnl).length > 0) {
        jQuery.each(searchRsPnl.find('.search-sType-item'), function (i, _item) {
            var item = jQuery(_item);
            item.click(function () {
                var _ref = item.attr('_ref');
                var p = item.parent();
                if (item.hasClass('search-sType-item-active')) return false;
                p.find('.search-sType-item-active').removeClass('search-sType-item-active');
                item.addClass('search-sType-item-active');
                p.next().find('.search-rsPnl-focus').removeClass('search-rsPnl-focus');
                p.next().find('.search-rsPnl[_ref=\'' + _ref + '\']').addClass('search-rsPnl-focus');
            });
        });
    }

    //    jQuery.each(jQuery('img'), function (i, _item) {
    //        var item = jQuery(_item);
    //        item.error(function () {
    //            item.attr('src', domain + '/lib/css/web/i/chonongnghiep.png');
    //        });
    //    });


    jQuery('form').submit(function () {
        return false;
    });


    var pagingItems = jQuery('.PagingItem', '.search-rightPnl');
    jQuery.each(pagingItems, function (i, _item) {
        var item = jQuery(_item);
        item.click(function () {
            if (item.hasClass('PagingItemActive')) { return false; }
            item.parent().find('.PagingItemActive').removeClass('PagingItemActive');
            var _txt = item.html();
            var _href = item.attr('href');
            item.html('.');
            item.addClass('PagingItemLoading');
            jQuery.ajax({
                url: _href,
                success: function (_dt) {
                    item.addClass('PagingItemActive');
                    item.parent().parent().find('.search-rsPnl-body').html(_dt);
                    item.removeClass('PagingItemLoading');
                    item.html(_txt);
                }
            });
            return false;
        });
    });
});