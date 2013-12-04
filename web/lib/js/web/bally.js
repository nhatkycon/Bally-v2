$(function () {
    bally.init();
});

var bally = {
    url: domain + '/lib/ajax/Default.aspx?ref=' + Math.random() + '&refUrl=' + encodeURIComponent(document.location.href)
    , init: function () {
        bally.PageFn();
        bally.KhachHangFn();
        bally.KhachHangHeader();
        bally.TiemNangFn();
        bally.ChamSocFn();
        bally.LichHenFn();
        bally.TuVanDichVuFn();
        bally.TuVanLamDichVuFn();
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

        var tuNgayPicker = pnl.find('#TuNgayPicker');
        if ($(tuNgayPicker).length > 0) {
            tuNgayPicker.datetimepicker({
                language: 'vi-Vn'
            });    
        }
        var denNgayPicker = pnl.find('#DenNgayPicker');
        if ($(denNgayPicker).length > 0) {
            denNgayPicker.datetimepicker({
                language: 'vi-Vn'
            });
        }
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
                    $('#DoneModal').modal();
                    if (returnUrl != '') {
                        if (returnUrl.indexOf('?') < 0) {
                            returnUrl = returnUrl + '?';
                        }
                        returnUrl = domain + returnUrl + '&KH_ID=' + ret;
                    } else {
                        returnUrl = domain + '/lib/pages/KhachHang/Add.aspx?ID=' + ret;
                    }
                    document.location.href = returnUrl;
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
                    $('#DoneModal').modal();
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
    , ChamSocFn: function () {
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
                    $('#DoneModal').modal();
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
    , LichHenFn: function () {
        var pnl = $('.LichHen-Pnl-Add');
        if ($(pnl).length < 1) return;

        var savebtn = pnl.find('.savebtn');
        var xoaBtn = pnl.find('.xoaBtn');


        var ngayBatDauPicker = pnl.find('#NgayBatDauPicker');
        ngayBatDauPicker.datetimepicker({
            language: 'vi-Vn'
        });

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


        var nhanVienTen = pnl.find('.NhanVien_Ten');
        var nhanVien = pnl.find('.NhanVien');
        var btnHintNv = pnl.find('.btnHintNv');

        adm.regType(typeof (thanhvien), 'docsoft.plugin.hethong.thanhvien.Class1, docsoft.plugin.hethong.thanhvien', function () {
            thanhvien.setAutocomplete(nhanVienTen, function (event, ui) {
                nhanVienTen.val(ui.item.label);
                nhanVien.val(ui.item.value);
            });
            nhanVienTen.unbind('click').click(function () {
                nhanVienTen.autocomplete('search', '');
            });
            btnHintNv.unbind('click').click(function () {
                nhanVienTen.autocomplete('search', '');
            });
        });

        xoaBtn.click(function () {
            var data = pnl.find(':input').serializeArray();
            data.push({ name: 'act', value: 'LichHen-Xoa' });
            $.ajax({
                url: bally.url
                , data: data
                , success: function (ret) {
                    if (ret == '0') {
                        alert('Chỉ người tạo mới có quyền xóa! Vui lòng thử lại');
                    } else {
                        document.location.href = domain + '/lib/pages/LichHen/Default.aspx';
                    }
                }
            });
        });

        savebtn.click(function () {
            var item = $(this);
            var returnUrl = item.attr('data-ret');
            var data = pnl.find(':input').serializeArray();
            data.push({ name: 'act', value: 'LichHen-Add' });
            $.ajax({
                url: bally.url
                , data: data
                , success: function (ret) {
                    $('#DoneModal').modal();
                    if (returnUrl != '') {
                        if (returnUrl.indexOf('?') < 0) {
                            returnUrl = returnUrl + '?';
                        }
                        returnUrl = domain + returnUrl;
                    } else {
                        returnUrl = domain + '/lib/pages/LichHen/Add.aspx?ID=' + ret;
                    }
                    document.location.href = returnUrl;
                }
            });
        });
    }
     , TuVanDichVuFn: function () {
         var pnl = $('.TuVanDichVu-Pnl-Add');
         if ($(pnl).length < 1) return;

         var savebtn = pnl.find('.savebtn');
         var xoaBtn = pnl.find('.xoaBtn');


         var ngayLapPicker = pnl.find('#NgayLapPicker');
         ngayLapPicker.datetimepicker({
             language: 'vi-Vn'
         });

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

         var dvId = pnl.find('.DV_ID');
         var dvTen = pnl.find('.DV_Ten');
         var btnHintDv = pnl.find('.btnHintDv');
         var gia = pnl.find('.Gia');
         var ck = pnl.find('.CK');
         var thanhToan = pnl.find('.ThanhToan');
         var conNo = pnl.find('.ConNo');

         pnl.find('.Gia, .CK, .ThanhToan, .ConNo').keyup(function () {
             var _ck = parseInt(ck.val());
             var _gia = parseInt(gia.val());
             var _thanhToan = parseInt(thanhToan.val());
             var _conNo = _gia - _ck - _thanhToan;
             conNo.val(_conNo);
             
         });

         adm.regType(typeof (danhMucDichVuMgr), 'appStore.pmSpa.danhMucDichVuMgr.Class1, appStore.pmSpa.danhMucDichVuMgr', function () {
             danhMucDichVuMgr.autoCompleteByQ(dvTen, function (event, ui) {
                 dvId.val(ui.item.id);
                 var giaValue = gia.val();
                 if (giaValue == '0') {
                     gia.val(ui.item.gia);
                 }
             }, function (ul, item) {
                 return $("<li></li>")
                                .data("item.autocomplete", item)
                                .append("<a><b>" + item.ma + '</b> ' + item.label + ' [' + item.gia + ']<br/>' + item.SoLan + ' lần, ' + item.ThoiGian + ' phút/ lần</a>')
                                .appendTo(ul);
             });
             dvTen.unbind('click').click(function () {
                 dvTen.autocomplete('search', '');
             });
             btnHintDv.unbind('click').click(function () {
                 dvTen.autocomplete('search', '');
             });
         });

         var nhanVienTen = pnl.find('.NhanVien_Ten');
         var nhanVien = pnl.find('.NhanVien');
         var btnHintNv = pnl.find('.btnHintNv');

         adm.regType(typeof (thanhvien), 'docsoft.plugin.hethong.thanhvien.Class1, docsoft.plugin.hethong.thanhvien', function () {
             thanhvien.setAutocomplete(nhanVienTen, function (event, ui) {
                 nhanVienTen.val(ui.item.label);
                 nhanVien.val(ui.item.value);
             });
             nhanVienTen.unbind('click').click(function () {
                 nhanVienTen.autocomplete('search', '');
             });
             btnHintNv.unbind('click').click(function () {
                 nhanVienTen.autocomplete('search', '');
             });
         });

         xoaBtn.click(function () {
             var data = pnl.find(':input').serializeArray();
             data.push({ name: 'act', value: 'TuVanDichVu-Xoa' });
             $.ajax({
                 url: bally.url
                , data: data
                , success: function (ret) {
                    if (ret == '0') {
                        alert('Chỉ người tạo mới có quyền xóa! Vui lòng thử lại');
                    } else {
                        document.location.href = domain + '/lib/pages/TuVanDichVu/Default.aspx';
                    }
                }
             });
         });

         savebtn.click(function () {
             var item = $(this);
             var returnUrl = item.attr('data-ret');
             var data = pnl.find(':input').serializeArray();
             data.push({ name: 'act', value: 'TuVanDichVu-Add' });
             $.ajax({
                 url: bally.url
                , data: data
                , success: function (ret) {
                    $('#DoneModal').modal();

                    if (returnUrl != '') {
                        if (returnUrl.indexOf('?') < 0) {
                            returnUrl = returnUrl + '?';
                        }
                        returnUrl = domain + returnUrl;
                    } else {
                        returnUrl = domain + '/lib/pages/TuVanDichVu/Add.aspx?ID=' + ret;
                    }
                    document.location.href = returnUrl;
                }
             });
         });
     }
     , TuVanLamDichVuFn: function () {
         var pnl = $('.TuVanLamDichVu-Pnl-Add');
         if ($(pnl).length < 1) return;
         
         var savebtn = pnl.find('.savebtn');
         var xoaBtn = pnl.find('.xoaBtn');


         var ngayLamPicker = pnl.find('#NgayLamPicker');
         ngayLamPicker.datetimepicker({
             language: 'vi-Vn'
         });
         
         var nhanVienTen = pnl.find('.NhanVien_Ten');
         var nhanVien = pnl.find('.NhanVien');
         var btnHintNv = pnl.find('.btnHintNv');

         adm.regType(typeof (thanhvien), 'docsoft.plugin.hethong.thanhvien.Class1, docsoft.plugin.hethong.thanhvien', function () {
             thanhvien.setAutocomplete(nhanVienTen, function (event, ui) {
                 nhanVienTen.val(ui.item.label);
                 nhanVien.val(ui.item.value);
             });
             nhanVienTen.unbind('click').click(function () {
                 nhanVienTen.autocomplete('search', '');
             });
             btnHintNv.unbind('click').click(function () {
                 nhanVienTen.autocomplete('search', '');
             });
         });
         
         xoaBtn.click(function () {
             var data = pnl.find(':input').serializeArray();
             data.push({ name: 'act', value: 'TuVanLamDichVu-Xoa' });
             $.ajax({
                 url: bally.url
                , data: data
                , success: function (ret) {
                    if (ret == '0') {
                        alert('Chỉ người tạo mới có quyền xóa! Vui lòng thử lại');
                    } else {
                        document.location.href = domain + '/lib/pages/TuVanLamDichVu/Default.aspx';
                    }
                }
             });
         });

         savebtn.click(function () {
             var item = $(this);
             var returnUrl = item.attr('data-ret');
             var data = pnl.find(':input').serializeArray();
             data.push({ name: 'act', value: 'TuVanLamDichVu-Add' });
             $.ajax({
                 url: bally.url
                , data: data
                , success: function (ret) {
                    $('#DoneModal').modal();

                    if (returnUrl != '') {
                        if (returnUrl.indexOf('?') < 0) {
                            returnUrl = returnUrl + '?';
                        }
                        returnUrl = domain + returnUrl;
                    } else {
                        returnUrl = domain + '/lib/pages/TuVanLamDichVu/Add.aspx?ID=' + ret;
                    }
                    document.location.href = returnUrl;
                }
             });
         });
     }
};