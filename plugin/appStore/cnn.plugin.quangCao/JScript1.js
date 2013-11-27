﻿var quangcaofn = {
    urlDefault: adm.urlDefault + '&act=loadPlug&rqPlug=cnn.plugin.quangCao.Class1, cnn.plugin.quangCao',
    setup: function () {
    },
    loadgrid: function () {
        adm.loading('Đang lấy dữ liệu quảng cáo');
        adm.styleButton();
        $('#quangcaomdl-List').jqGrid({
            url: quangcaofn.urlDefault + '&subAct=get',
            height: 'auto',
            datatype: 'json',
            loadui: 'disable',
            colNames: ['ID', '#', 'Ảnh', 'Tên', 'Url', 'Vị Trí', 'Vị Trí', 'Mô tả', 'Trạng thái'],
            colModel: [
            { name: 'ADV_ID', key: true, sortable: true, hidden: true },
            { name: 'ADV_ThuTu', width: 5, resizable: true, sortable: true, align: "center" },
            { name: 'ADV_Anh', width: 30, resizable: true, sortable: true, align: "center" },
            { name: 'ADV_Ten', width: 30, resizable: true, sortable: true },
            { name: 'ADV_Url', width: 30, resizable: true, sortable: true },
            { name: 'ADV_ViTri', width: 10, resizable: true, sortable: true, align: "center", hidden: true },
            { name: 'ADV_ViTri_Ten', width: 10, resizable: true, sortable: true },
            { name: 'ADV_Ten', width: 10, resizable: true, sortable: true },
            { name: 'ADV_Active', width: 5, resizable: true, sortable: true, align: "center", formatter: 'checkbox' },
        ],
            caption: 'Danh sách quảng cáo',
            autowidth: true,
            sortname: 'ADV_ThuTu',
            sortorder: 'asc',
            rowNum: 50,
            rowList: [50, 100, 200, 300],
            multiselect: true,
            multiboxonly: true,
            pager: jQuery('#quangcaomdl-Pager'),
            onSelectRow: function (rowid) {

            },
            loadComplete: function () {
                adm.loading(null);
                //adm.regQS(searchTxt, 'tinmdl-List');
                var txtfilter = $('.mdl-head-filterdanhmucqcao');
                adm.watermarks(txtfilter, 'Nhập vị trí quảng cáo để lọc', function () {
                });
                adm.regType(typeof (danhmuc), 'docsoft.plugin.danhmuc.Class1, docsoft.plugin.danhmuc', function () {
                    danhmuc.autoCompleteByLoai('VITRI_QC', txtfilter, function (event, ui) {
                        $(txtfilter).val(ui.item.label);
                        $(txtfilter).attr('_value', ui.item.id);
                        quangcaofn.search();
                    });
                    $(txtfilter).unbind('click').click(function () {
                        $(txtfilter).autocomplete('search', '');
                    });
                });
            },
            grouping: false,
            groupingView: {
                groupField: ['ADV_ViTri_Ten'],
                groupColumnShow: [true],
                groupText: ['<b>{0}</b>  - <span style=\"color:red;\">Tổng số: {1}</span>'],
                groupCollapse: false,
                groupOrder: ['asc'],
                groupSummary: [true],
                groupColumnShow: [false],
                groupDataSorted: true
            }
        });

        var filterLoaiDanhMucID = $('.mdl-head-filterdanhmucqcao');
        var searchTxt = $('.mdl-head-search-quangcao');

        $('.mdl-head-filterdanhmucqcao').keyup(function () {
            if ($('.mdl-head-filterdanhmucqcao').val() == '') {
                $('.mdl-head-filterdanhmucqcao').attr('_value', '');
                if ($(searchTxt).val() == 'Tìm kiếm quảng cáo') {
                    $(searchTxt).val('');
                }
                quangcaofn.search();
                if ($(searchTxt).val() == '') {
                    $(searchTxt).val('Tìm kiếm quảng cáo');
                }
            }
        });

        $('.mdl-head-search-quangcao').keyup(function () {
            quangcaofn.search();
        });

        adm.watermark(searchTxt, 'Tìm kiếm quảng cáo', function () {
            $(searchTxt).val('');
            quangcaofn.search();
            $(searchTxt).val('Tìm kiếm quảng cáo');
        });
        adm.watermark(filterLoaiDanhMucID, 'Nhập vị trí quảng cáo để lọc', function () {
            if ($(searchTxt).val() == 'Tìm kiếm quảng cáo') {
                $(searchTxt).val('');
            }
            quangcaofn.search();
            if ($(searchTxt).val() == '') {
                $(searchTxt).val('Tìm kiếm quảng cáo');
            }
        });
    },
    add: function () {
        quangcaofn.loadHtml(function () {
            var newDlg = $('#quangcaomdl-dlgNew');
            $(newDlg).dialog({
                title: 'Thêm mới',
                width: 400,
                modal: true,
                buttons: {
                    'Lưu': function () {
                        quangcaofn.save(false, function () {
                            quangcaofn.clearform();
                        });
                    },
                    'Lưu và đóng': function () {
                        quangcaofn.save(false, function () {
                            $(newDlg).dialog('close');
                        });
                    },
                    'Đóng': function () {
                        $(newDlg).dialog('close');
                    }
                },
                open: function () {
                    adm.styleButton();
                    quangcaofn.clearform();
                    quangcaofn.addpopfn();
                }
            });
        });

    },
    edit: function () {
        var s = '';
        if (jQuery('#quangcaomdl-List').jqGrid('getGridParam', 'selrow') != null) {
            s = jQuery('#quangcaomdl-List').jqGrid('getGridParam', 'selrow').toString();
        }
        if (s == '') {
            alert('Chọn mẫu quảng cáo để sửa');
        }
        else {
            if (s.indexOf(',') != -1) {
                alert('Chọn một mẫu quảng cáo');
            }
            else {
                quangcaofn.loadHtml(function () {
                    var newDlg = $('#quangcaomdl-dlgNew');
                    $(newDlg).dialog({
                        title: 'Sửa',
                        width: 400,
                        modal: true,
                        buttons: {
                            'Lưu': function () {
                                quangcaofn.save(false, function () {
                                    quangcaofn.clearform();
                                });
                            },
                            'Lưu và đóng': function () {
                                quangcaofn.save(false, function () {
                                    $(newDlg).dialog('close');
                                });
                            },
                            'Đóng': function () {
                                $(newDlg).dialog('close');
                            }
                        },
                        open: function () {
                            adm.loading('Đang nạp dữ liệu');
                            adm.styleButton();
                            quangcaofn.clearform();
                            $.ajax({
                                url: quangcaofn.urlDefault + '&subAct=edit',
                                dataType: 'script',
                                data: {
                                    'ID': s
                                },
                                success: function (dt) {
                                    adm.loading(null);
                                    var data = eval(dt);
                                    var newDlg = $('#quangcaomdl-dlgNew');

                                    var txtID = $('.ID', newDlg);
                                    $(txtID).val(data.ID);
                                    var txtPID = $('.ViTri', newDlg);
                                    $(txtPID).val(data.ViTri_Ten);
                                    $(txtPID).attr('_value', data.ViTri);
                                    var txtTen = $('.Ten', newDlg);
                                    $(txtTen).val(data.Ten);
                                    var txtSTT = $('.ThuTu', newDlg);
                                    $(txtSTT).val(data.ThuTu);
                                    var ckbActive = $('.Active', newDlg);
                                    var TrangQuangCao_Ten = $('.TrangQuangCao_Ten', newDlg);
                                    TrangQuangCao_Ten.val(data.TrangQuangCao_Ten);
                                    if (data.Active.toString() == 'true') {
                                        $(ckbActive).attr('checked', 'checked');
                                    }
                                    else {
                                        $(ckbActive).removeAttr('checked');
                                    }
                                    var txtUrl = $('.Url', newDlg);
                                    $(txtUrl).val(data.Url);
                                    var lblAnh = $('.Anh', newDlg);
                                    var lblAnhPrv = $('.adm-upload-preview', newDlg);
                                    var lblAnhPrvImg = $(lblAnhPrv).find('img');
                                    $(lblAnh).attr('ref', data.Anh);
                                    if (data.Anh != '') {
                                        $(lblAnhPrvImg).attr('src', '../up/i/' + data.Anh + '?ref=' + Math.random());
                                    }
                                    quangcaofn.addpopfn();
                                    var spInfo = $('.admInfo', newDlg);
                                    var spbMsg = $('.admMsg', newDlg);
                                    $(spbMsg).html('');
                                }
                            });
                        }
                    });
                });
            }
        }
    },
    del: function (fn) {
        var s = '';
        s = jQuery("#quangcaomdl-List").jqGrid('getGridParam', 'selarrrow').toString();
        if (s == '') {
            alert('Chọn mẫu quảng cáo để xóa');
        }
        else {
            var ll = '';
            var ss = s.split(',');
            for (j = 0; j < ss.length; j++) {
                var treedata = $("#quangcaomdl-List").jqGrid('getRowData', ss[j]);
                ll += ss[j] + ',';
            }
            $.ajax({
                url: quangcaofn.urlDefault + '&subAct=del',
                dataType: 'script',
                data: {
                    'ID': ll
                },
                success: function (dt) {
                    jQuery("#quangcaomdl-List").trigger('reloadGrid');
                }
            });
        }
        if (typeof (fn) == 'function') {
            fn();
        }
    },
    duyet: function () {
        var s = '';
        s = jQuery("#quangcaomdl-List").jqGrid('getGridParam', 'selarrrow').toString();
        if (s == '') {
            alert('Chưa chọn mẫu quảng cáo nào');
        }
        else {
            var ll = '';
            var ss = s.split(',');
            for (j = 0; j < ss.length; j++) {
                var treedata = $("#quangcaomdl-List").jqGrid('getRowData', ss[j]);
                ll += ss[j] + ',';
            }
            $.ajax({
                url: quangcaofn.urlDefault + '&subAct=duyet',
                dataType: 'script',
                data: {
                    'ID': ll
                },
                success: function (dt) {
                    jQuery("#quangcaomdl-List").trigger('reloadGrid');
                }
            });
        }
        if (typeof (fn) == 'function') {
            fn();
        }
    },
    search: function () {
        var timerSearch;
        var filterDM = $('.mdl-head-search-quangcao');
        var searchTxt = $('.mdl-head-filterdanhmucqcao');
        var q = filterDM.val();
        if (q == 'Tìm kiếm quảng cáo') {
            q = '';
        }
        var dm = $(searchTxt).attr('_value');
        if (timerSearch) clearTimeout(timerSearch);
        timerSearch = setTimeout(function () {
            $('#quangcaomdl-List').jqGrid('setGridParam', { url: quangcaofn.urlDefault + "&subAct=get&q=" + q + "&DMID=" + dm }).trigger("reloadGrid");
        }, 500);
    },
    save: function (validate, fn) {
        var newDlg = $('#quangcaomdl-dlgNew');
        var txtID = $('.ID', newDlg);
        var id = $(txtID).val();

        var txtPID = $('.ViTri', newDlg);
        var pid = $(txtPID).attr('_value');
        var pten = $(txtPID).val();

        var txtTen = $('.Ten', newDlg);
        var ten = $(txtTen).val();

        var txtThuTu = $('.ThuTu', newDlg);
        var ThuTu = $(txtThuTu).val();

        var ckbPublish = $('.Publish', newDlg);
        var Publish = $(ckbPublish).val();
        var TrangQuangCao_Ten = $('.TrangQuangCao_Ten', newDlg);
        var _TrangQuangCao_Ten = TrangQuangCao_Ten.val();
        var txtUrl = $('.Url', newDlg);
        var QUrl = $(txtUrl).val();
        var lblAnh = $('.Anh', newDlg);
        var anh = $(lblAnh).attr('ref');

        var spbMsg = $('.admMsg', newDlg);
        var err = '';
        if (pid == '') {
            err += 'Nhập mục quảng cáo<br/>';
        }
        if (ThuTu == '') {
            err += 'Chưa nhập thứ tự<br/>';
        }
        if (!adm.isInt(ThuTu)) {
            err += 'Số thứ tự không đúng<br/>';
        }
        if (ten == '') {
            err += 'Nhập tên<br/>';
        }

        if (err != '') {
            spbMsg.html(err);
            return false;
        }
        if (validate) {
            if (typeof (fn) == 'function') {
                fn();
            }
            return false;
        }
        adm.loading('Đang lưu dữ liệu');
        $.ajax({
            url: quangcaofn.urlDefault + '&subAct=save',
            dataType: 'script',
            type: 'POST',
            data: {
                'ID': id,
                'DMID': pid,
                'DMTen': pten,
                'ThuTu': ThuTu,
                'Ten': ten,
                'QUrl': QUrl,
                'Public': Publish,
                'Anh': anh,
                'TrangQuangCao_Ten': _TrangQuangCao_Ten
            },
            success: function (dt) {
                adm.loading(null);
                if (dt == '1') {
                    if (typeof (fn) == 'function') {
                        fn();
                    }
                    jQuery('#quangcaomdl-List').trigger('reloadGrid');
                }
                else {
                    spbMsg.html('Lỗi máy chủ, chưa thể lưu được dữ liệu');
                }
            }
        })
    },
    clearform: function () {
        var newDlg = $('#quangcaomdl-dlgNew');
        var txtID = $('.ID', newDlg);
        $(txtID).val('');
        var txtPID = $('.DMID', newDlg);
        $(txtPID).val('');
        $(txtPID).attr('_value', '');
        var txtTen = $('.Ten', newDlg);
        $(txtTen).val('');
        var txtSTT = $('.ThuTu', newDlg);
        $(txtSTT).val('');
        var ckbPublish = $('.Active', newDlg);
        $(ckbPublish).removeAttr('checked');
        var txtUrl = $('.Url', newDlg);
        $(txtUrl).val('');
        var lblAnh = $('.Anh', newDlg);
        $(lblAnh).attr('ref', '');
        $(lblAnh).prev().find('img').attr('src', '');
        var spInfo = $('.admInfo', newDlg);
        var spbMsg = $('.admMsg', newDlg);
        $(spbMsg).html('');

        var TrangQuangCao_Ten = $('.TrangQuangCao_Ten', newDlg);
        TrangQuangCao_Ten.val('');
    },
    loadHtml: function (fn) {
        var dlg = $('#quangcaomdl-dlgNew');
        if ($(dlg).length < 1) {
            adm.loading('Dựng from');
            $.ajax({
                url: '<%=WebResource("cnn.plugin.quangCao.htm.htm")%>',
                success: function (dt) {
                    adm.loading(null);
                    $('body').append(dt);
                    if (typeof (fn) == 'function') {
                        fn();
                    }
                }
            });
        }
        else {
            if (typeof (fn) == 'function') {
                fn();
            }
        }
    },
    addpopfn: function () {
        var newDlg = $('#quangcaomdl-dlgNew');
        var txtID = $('.ID', newDlg);
        var txtViTri = $('.ViTri', newDlg);
        var ulpFn = function () {
            var uploadBtn = $('.adm-upload-btn', newDlg);
            var uploadView = $('.adm-upload-preview-img', newDlg);
            var _params = { 'oldFile': $(uploadBtn).attr('ref') };
            adm.upload(uploadBtn, 'anh', _params, function (rs) {
                $(uploadBtn).attr('ref', rs)
                $(uploadView).attr('src', '../up/i/' + rs + '?ref=' + Math.random());
                ulpFn();
            }, function (f) {
            });
        }
        ulpFn();
        adm.regType(typeof (danhmuc), 'docsoft.plugin.danhmuc.Class1, docsoft.plugin.danhmuc', function () {
            danhmuc.autoCompleteByLoai('VITRI_QC', txtViTri, function (event, ui) {
                $(txtViTri).attr('_value', ui.item.id);
            });
        });
    }
}