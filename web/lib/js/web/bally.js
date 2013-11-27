$(function () {
    bally.init();
});

var bally = {
    url: domain + '/lib/ajax/Default.aspx?ref=' + Math.random()
    , init: function () {
        bally.PageFn();
        bally.KhachHangFn();
        bally.KhachHangHeader();
        bally.TiemNangFn();
        bally.ChamSocFn();
    }
    , PageFn: function () {
        var logout = $('.logoutbtn');
        logout.click(function () {
            var data = { act: 'Logout' };
            $.ajax({
                url: bally.url
                , data: data
                , success: function () {
                    document.location.reload();
                }
            });
        });
    }
    , KhachHangHeader: function () {
        var pnl = $('.ModuleHeader');

        if ($(pnl).length < 1) return;

        var txt = pnl.find('[name="q"]');
        var searchBtn = pnl.find('.searchBtn');

        searchBtn.click(function () {
            var data = pnl.find(':input').serialize();
            document.location.href = '?' + data;
        });
        txt.focus(function () {
            txt.unbind('keypress').bind('keypress', function (evt) {
                if (evt.keyCode == 13) {
                    evt.preventDefault();
                    var data = pnl.find(':input').serialize();
                    document.location.href = '?' + data;
                    return false;
                }
            });
        });
    }
    , KhachHangFn: function () {

        var pnl = $('.KhachHang-Pnl-Add');
        var savebtn = pnl.find('.savebtn');
        var xoaBtn = pnl.find('.xoaBtn');
        xoaBtn.click(function () {
            var con = confirm('Bạn có muốn xóa?');
            if (con) {
                var data = pnl.find(':input').serializeArray();
                data.push({ name: 'act', value: 'KhachHang-Xoa' });
                $.ajax({
                    url: bally.url
                    , data: data
                    , success: function (ret) {
                        if (ret == '0') {
                            alert('Chỉ người tạo mới có quyền xóa! Vui lòng thử lại');
                        } else {
                            document.location.href = domain + '/lib/pages/KhachHang/Default.aspx';
                        }
                    }
                });
            }
        });


        savebtn.click(function () {
            var item = $(this);
            var returnUrl = item.attr('data-ret');
            var data = pnl.find(':input').serializeArray();
            data.push({ name: 'act', value: 'KhachHang-Add' });
            $.ajax({
                url: bally.url
                , data: data
                , success: function (ret) {
                    
                    if (returnUrl != '') {
                        if (returnUrl.indexOf('?') < 0) {
                            returnUrl = returnUrl + '?';
                        }
                        returnUrl = domain + returnUrl + '&KH_ID=' + ret;
                    } else {
                        returnUrl = domain + '/lib/pages/KhachHang/Add.aspx?ID=' + ret;
                    }
                    //document.location.href = returnUrl;
                }
                , error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(xhr.responseText);
                    alert(thrownError);
                }
            });
        });

        var ngaySinhPicker = pnl.find('#NgaySinhPicker');
        ngaySinhPicker.datetimepicker({
            language: 'vi-Vn'
        });

        var imgChange = $('.imgfinder-changeBtn');
        var imgRemove = $('.imgfinder-removeBtn');
        common.imgfinder(imgChange, 'Images:/', function (item, url) {
            $('.Anh').val(url);
            $('.imgfinder-img').attr('src', url);
        });
        imgRemove.click(function () {
            $('.Anh').val('');
            $('.imgfinder-img').attr('src', '');
        });
    }
    , TiemNangFn: function () {

        var pnl = $('.TiemNang-Pnl-Add');
        var savebtn = pnl.find('.savebtn');
        var xoaBtn = pnl.find('.xoaBtn');
        var upgradebtn = pnl.find('.upgradebtn');

        xoaBtn.click(function () {
            var con = confirm('Bạn có muốn xóa?');
            if (con) {
                var data = pnl.find(':input').serializeArray();
                data.push({ name: 'act', value: 'KhachHang-Xoa' });
                $.ajax({
                    url: bally.url
                    , data: data
                    , success: function (ret) {
                        if (ret == '0') {
                            alert('Chỉ người tạo mới có quyền xóa! Vui lòng thử lại');
                        } else {
                            document.location.href = 'Default.aspx';
                        }
                    }
                });
            }
        });

        upgradebtn.click(function () {
            var data = pnl.find(':input').serializeArray();
            data.push({ name: 'act', value: 'KhachHang-UpgradeFromTiemNang' });
            $.ajax({
                url: bally.url
                , data: data
                , success: function (ret) {
                    document.location.href = domain + '/lib/pages/KhachHang/Add.aspx?ID=' + ret;
                }
                , error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(xhr.responseText);
                    alert(thrownError);
                }
            });
        });

        savebtn.click(function () {
            var data = pnl.find(':input').serializeArray();
            data.push({ name: 'act', value: 'KhachHang-Add' });
            $.ajax({
                url: bally.url
                , data: data
                , success: function (ret) {
                    document.location.href = domain + '/lib/pages/TiemNang/Add.aspx?ID=' + ret;
                }
                , error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(xhr.responseText);
                    alert(thrownError);
                }
            });
        });

        var ngaySinhPicker = pnl.find('#NgaySinhPicker');
        ngaySinhPicker.datetimepicker({
            language: 'vi-Vn'
        });

        var imgChange = $('.imgfinder-changeBtn');
        var imgRemove = $('.imgfinder-removeBtn');
        common.imgfinder(imgChange, 'Images:/', function (item, url) {
            $('.Anh').val(url);
            $('.imgfinder-img').attr('src', url);
        });
        imgRemove.click(function () {
            $('.Anh').val('');
            $('.imgfinder-img').attr('src', '');
        });
    }
    , ChamSocFn:function () {
        var pnl = $('.ChamSoc-Pnl-Add');
        if ($(pnl).length < 1) return;
        
        var savebtn = pnl.find('.savebtn');
        var xoaBtn = pnl.find('.xoaBtn');
        
        var khId = pnl.find('.KH_ID');
        var khTen = pnl.find('.KH_Ten');
        var btnHintKh = pnl.find('.btnHintKH');
        
        adm.regType(typeof (DanhSachKhachHangFn), 'appStore.pmSpa.khachHangMgr.DanhSachKhachHang.Class1, appStore.pmSpa.khachHangMgr', function () {
            DanhSachKhachHangFn.autoCompleteSearch(khTen, function (event, ui) {
                khId.val(ui.item.id);
            });
            khTen.unbind('click').click(function () {
                khTen.autocomplete('search', '');
            });
            btnHintKh.unbind('click').click(function () {
                khTen.autocomplete('search', '');
            });
        });
        
        xoaBtn.click(function () {
            var data = pnl.find(':input').serializeArray();
            data.push({ name: 'act', value: 'ChamSoc-Xoa' });
            $.ajax({
                url: bally.url
                , data: data
                , success: function (ret) {
                    if (ret == '0') {
                        alert('Chỉ người tạo mới có quyền xóa! Vui lòng thử lại');
                    } else {
                        document.location.href = domain + '/lib/pages/ChamSoc/Default.aspx';
                    }
                }
            });
        });

        savebtn.click(function () {
            var item = $(this);
            var returnUrl = item.attr('data-ret');
            var data = pnl.find(':input').serializeArray();
            data.push({ name: 'act', value: 'ChamSoc-Add' });
            $.ajax({
                url: bally.url
                , data: data
                , success: function (ret) {
                    
                    if (returnUrl != '') {
                        if (returnUrl.indexOf('?') < 0) {
                            returnUrl = returnUrl + '?';
                        }
                        returnUrl = domain + returnUrl;
                    } else {
                        returnUrl = domain + '/lib/pages/ChamSoc/Add.aspx?ID=' + ret;
                    }
                    document.location.href = returnUrl;
                }
            });
        });
    }
};