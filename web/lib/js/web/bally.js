$(function () {
    bally.init();
});

var bally = {
    url: domain + '/lib/ajax/Default.aspx?ref=' + Math.random()
    , init: function () {
        bally.KhachHangFn();
        bally.KhachHangHeader();
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
            var data = pnl.find(':input').serializeArray();
            data.push({ name: 'act', value: 'KhachHang-Add' });
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
};