using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft;
using docsoft.entities;
using linh.common;
using linh.core;
using linh.core.dal;
using pmSpa.entities;

public partial class lib_ajax_Default : BasedPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var act = Request["act"];
        var logged = Security.IsAuthenticated();
        var Id = Request["Id"];
        var IdNull = string.IsNullOrEmpty(Id);
        var Ten = Request["Ten"];
        var Ma = Request["Ma"];
        var DanhGia = Request["DanhGia"];
        var Mobile = Request["Mobile"];
        var Ym = Request["Ym"];
        var FacebookUid = Request["FacebookUid"];
        var NguonGoc_ID = Request["NguonGoc_ID"];
        var KhuVuc_ID = Request["KhuVuc_ID"];
        var LinhVuc_ID = Request["LinhVuc_ID"];
        var NgungTheoDoi = Request["NgungTheoDoi"];
        var ThoiGianGoiDien = Request["ThoiGianGoiDien"];
        var DiaChi = Request["DiaChi"];
        var Anh = Request["Anh"];
        var NgaySinh = Request["NgaySinh"];
        var TiemNang = Request["TiemNang"];
        var KH_ID = Request["KH_ID"];
        var TT_ID = Request["TT_ID"];
        var LOAI_ID = Request["LOAI_ID"];
        var NoiDung = Request["NoiDung"];
        var NgayBatDau = Request["NgayBatDau"];
        var DM_ID = Request["DM_ID"];
        var NhanVien = Request["NhanVien"];
        var MoTa = Request["MoTa"];
        var BoQua = Request["BoQua"];
        var ThanhCong = Request["ThanhCong"];
        var refUrl = Request["refUrl"];
        var DV_ID = Request["DV_ID"];
        var Gia = Request["Gia"];
        var CK = Request["CK"];
        var ThanhToan = Request["ThanhToan"];
        var ConNo = Request["ConNo"];
        var BaoHanh_ID = Request["BaoHanh_ID"];
        var NgayLap = Request["NgayLap"];
        var NgayLam = Request["NgayLam"];
        var TVDV_ID = Request["TVDV_ID"];
        var ThuTu = Request["ThuTu"];
        var SoLan = Request["SoLan"];
        var GhiChu = Request["GhiChu"];
        if (!string.IsNullOrEmpty(refUrl))
            refUrl = Server.UrlDecode(refUrl);
        NgungTheoDoi = !string.IsNullOrEmpty(NgungTheoDoi) ? "true" : "false";
        BoQua = !string.IsNullOrEmpty(BoQua) ? "true" : "false";
        ThanhCong = !string.IsNullOrEmpty(ThanhCong) ? "true" : "false";
        switch (act)
        {
            case "KhachHang-Add":
            #region Thêm khách hàng
                if(logged)
                {
                    var item = IdNull ? new KhachHang() : KhachHangDal.SelectById(new Guid(Id));
                    item.Ten = Ten;
                    item.Ma = Ma;
                    item.Anh = Anh;
                    item.ThoiGianGoiDien = ThoiGianGoiDien;
                    item.Mobile = Mobile;
                    item.FacebookUid = FacebookUid;
                    item.NgungTheoDoi = Convert.ToBoolean(NgungTheoDoi);
                    item.NguoiCapNhat = Security.Username;
                    item.NgayCapNhat = DateTime.Now;
                    item.DiaChi = DiaChi;
                    item.Ym = Ym;
                    item.TiemNang = Convert.ToBoolean(TiemNang);
                    if (!string.IsNullOrEmpty(NgaySinh))
                    {
                        item.NgaySinh = Convert.ToDateTime(NgaySinh, new CultureInfo("vi-vn"));
                    }
                    if (!string.IsNullOrEmpty(NguonGoc_ID))
                    {
                        item.NguonGoc_ID = new Guid(NguonGoc_ID);
                    }
                    if (!string.IsNullOrEmpty(KhuVuc_ID))
                    {
                        item.KhuVuc_ID = new Guid(KhuVuc_ID);
                    }
                    if (!string.IsNullOrEmpty(LinhVuc_ID))
                    {
                        item.LinhVuc_ID = new Guid(LinhVuc_ID);
                    }
                    item.DanhGia = Convert.ToInt16(DanhGia);
                    if (IdNull)
                    {
                        item.NgayTao = DateTime.Now;
                        item.NguoiTao = Security.Username;
                        item.ID = Guid.NewGuid();
                        item = KhachHangDal.Insert(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{2} thêm mới khách hàng {1}-{0}", item.Ten, item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ten
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 1
                            ,
                            Ten = "Thêm"
                        });
                        #endregion
                    }
                    else
                    {
                        item = KhachHangDal.Update(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{2} sửa khách hàng {1}-{0}", item.Ten, item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ten
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 2
                            ,
                            Ten = "Sửa"
                        });
                        #endregion
                    }
                    TimKiemDal.Add(item,item.ID);
                    rendertext(item.ID.ToString());
                }
                break;
            #endregion
            case "KhachHang-Xoa":
            #region Xóa khách hàng
                if(logged && !IdNull)
                {
                    var item = KhachHangDal.SelectById(new Guid(Id));
                    if(item.NguoiTao==Security.Username)
                    {
                        KhachHangDal.DeleteById(new Guid(Id));
                        TimKiemDal.DeleteByPRowId(DAL.con(), item.ID);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{2} xóa khách hàng {1}-{0}", item.Ten, item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ten
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 3
                            ,
                            Ten = "Xóa"
                        });
                        #endregion
                        rendertext("1");
                    }
                    else
                    {
                        rendertext("0");
                    }
                }
                break;
            #endregion
            case "KhachHang-UpgradeFromTiemNang":
                #region Nâng cấp tiềm năng thành khách hàng
                if (logged && !IdNull)
                {
                    var item = KhachHangDal.SelectById(new Guid(Id));
                    item.TiemNang = false;
                    item.NgayCapNhat = DateTime.Now;
                    KhachHangDal.Update(item);
                    
                    #region log
                    LogDal.log(item, new Log()
                    {
                        Checked = false
                        ,
                        Info =
                            string.Format("{2} chuyển đổi tiềm năng thành khách hàng {1}-{0}", item.Ten, item.Ma,
                                          Security.Username)
                        ,
                        NgayTao = DateTime.Now
                        ,
                        Username = Security.Username
                        ,
                        PRowId = item.ID
                        ,
                        PTen = item.Ten
                        ,
                        RequestIp = Request.UserHostAddress
                        ,
                        RawUrl = refUrl
                        ,
                        LLOG_ID = 4
                        ,
                        Ten = "Chuyển đổi"
                    });
                    #endregion
                    rendertext(Id);
                }
                break;
                #endregion
            case "ChamSoc-Add":
                #region Thêm chăm sóc

                if (Security.IsAuthenticated())
                {
                    ChamSoc item;
                    if (IdNull)
                    {
                        item = new ChamSoc {ID = Guid.NewGuid(), NgayTao = DateTime.Now, NguoiTao = Security.Username};
                        item.NgayTao = DateTime.Now;
                    }
                    else
                    {
                        item = ChamSocDal.SelectById(new Guid(Id));

                    }
                    item.Ma = Ma;

                    if (!string.IsNullOrEmpty(KH_ID))
                    {
                        item.KH_ID = new Guid(KH_ID);
                    }
                    if (!string.IsNullOrEmpty(TT_ID))
                    {
                        item.TT_ID = new Guid(TT_ID);
                    }
                    if (!string.IsNullOrEmpty(LOAI_ID))
                    {
                        item.LOAI_ID = new Guid(LOAI_ID);
                    }
                    item.NoiDung = NoiDung;
                    if (IdNull)
                    {
                        item = ChamSocDal.Insert(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} thêm mới chăm sóc {0}", item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ma
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 1
                            ,
                            Ten = "Thêm"
                        });
                        #endregion
                    }
                    else
                    {
                        item = ChamSocDal.Update(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} sửa chăm sóc {0}", item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ma
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 2
                            ,
                            Ten = "Sửa"
                        });
                        #endregion
                    }
                    TimKiemDal.Add(item, item.ID);
                    rendertext(item.ID.ToString());
                }
                break;

                #endregion
            case "ChamSoc-Xoa":
                #region Xóa chăm sóc

                if (Security.IsAuthenticated())
                {
                    var item = ChamSocDal.SelectById(new Guid(Id));
                    if (item.NguoiTao == Security.Username)
                    {
                        ChamSocDal.DeleteById(new Guid(Id));
                        TimKiemDal.DeleteByPRowId(DAL.con(), item.ID);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} xóa chăm sóc {0}",  item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ma
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 3
                            ,
                            Ten = "Xóa"
                        });
                        #endregion
                        rendertext("1");
                    }
                    else
                    {
                        rendertext("0");
                    }
                }
                break;
                #endregion
            case "LichHen-Add":
                #region Thêm lịch hẹn

                if (Security.IsAuthenticated())
                {
                    SuKien item;
                    if (IdNull)
                    {
                        item = new SuKien { ID = Guid.NewGuid(), NgayTao = DateTime.Now, NguoiTao = Security.Username, NguoiCapNhat = Security.Username, NgayCapNhat = DateTime.Now};
                    }
                    else
                    {
                        item = SuKienDal.SelectById(new Guid(Id));

                    }
                    item.Ten = Ten;
                    item.MoTa = MoTa;
                    if (!string.IsNullOrEmpty(NgayBatDau))
                    {
                        item.NgayBatDau = Convert.ToDateTime(NgayBatDau, new CultureInfo("vi-vn"));
                    }
                    if (!string.IsNullOrEmpty(KH_ID))
                    {
                        item.KH_ID = new Guid(KH_ID);
                    }
                    if (!string.IsNullOrEmpty(DM_ID))
                    {
                        item.DM_ID = new Guid(DM_ID);
                    }
                    item.BoQua = Convert.ToBoolean(BoQua);
                    item.ThanhCong = Convert.ToBoolean(ThanhCong);
                    item.NhanVien = NhanVien;
                    if (IdNull)
                    {
                        item = SuKienDal.Insert(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} thêm mới lịch hẹn: {0}", item.Ten,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ten
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 1
                            ,
                            Ten = "Thêm"
                        });
                        #endregion
                    }
                    else
                    {
                        item = SuKienDal.Update(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} sửa lịch hẹn: {0}", item.Ten,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ten
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 2
                            ,
                            Ten = "Sửa"
                        });
                        #endregion
                    }
                    TimKiemDal.Add(item, item.ID);
                    rendertext(item.ID.ToString());
                }
                break;

                #endregion
            case "LichHen-Xoa":
                #region Xóa lịch hẹn

                if (Security.IsAuthenticated())
                {
                    var item = SuKienDal.SelectById(new Guid(Id));
                    if (item.NguoiTao == Security.Username)
                    {
                        ChamSocDal.DeleteById(new Guid(Id));
                        TimKiemDal.DeleteByPRowId(DAL.con(), item.ID);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} xóa lịch hẹn: {0}", item.Ten,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ten
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 3
                            ,
                            Ten = "Xóa"
                        });
                        #endregion
                        rendertext("1");
                    }
                    else
                    {
                        rendertext("0");
                    }
                }
                break;
                #endregion
            case "TuVanDichVu-Add":
                #region Thêm tư vấn dịch vụ

                if (Security.IsAuthenticated())
                {
                    TuVanDichVu item;
                    if (IdNull)
                    {
                        item = new TuVanDichVu { ID = Guid.NewGuid(), NgayTao = DateTime.Now, NguoiTao = Security.Username };
                    }
                    else
                    {
                        item = TuVanDichVuDal.SelectById(new Guid(Id));

                    }
                    item.Ma = Ma;
                    item.Gia = Convert.ToDouble(Gia);
                    item.CK = Convert.ToDouble(CK);
                    item.ThanhToan = Convert.ToDouble(ThanhToan);
                    item.ConNo = Convert.ToDouble(ConNo);
                    item.SoLan = Convert.ToInt32(SoLan);
                    if (!string.IsNullOrEmpty(NgayLap))
                    {
                        item.NgayLap = Convert.ToDateTime(NgayLap, new CultureInfo("vi-vn"));
                    }
                    if (!string.IsNullOrEmpty(KH_ID))
                    {
                        item.KH_ID = new Guid(KH_ID);
                    }
                    if (!string.IsNullOrEmpty(BaoHanh_ID))
                    {
                        item.BaoHanh_ID = new Guid(BaoHanh_ID);
                    }
                    if (!string.IsNullOrEmpty(DV_ID))
                    {
                        item.DV_ID = new Guid(DV_ID);
                    }
                    item.GhiChu = GhiChu;
                    item.NhanVien = NhanVien;
                    if (IdNull)
                    {
                        item = TuVanDichVuDal.Insert(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} thêm mới tư vấn dịch vụ: {0}", item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ma
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 1
                            ,
                            Ten = "Thêm"
                        });
                        #endregion
                    }
                    else
                    {
                        item = TuVanDichVuDal.Update(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} sửa tư vấn dịch vụ: {0}", item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ma
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 2
                            ,
                            Ten = "Sửa"
                        });
                        #endregion
                    }
                    TimKiemDal.Add(item, item.ID);
                    rendertext(item.ID.ToString());
                }
                break;

                #endregion
            case "TuVanDichVu-Xoa":
                #region Xóa tư vấn dịch vụ

                if (Security.IsAuthenticated())
                {
                    var item = TuVanDichVuDal.SelectById(new Guid(Id));
                    if (item.NguoiTao == Security.Username)
                    {
                        TuVanDichVuDal.DeleteById(new Guid(Id));
                        TimKiemDal.DeleteByPRowId(DAL.con(), item.ID);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} xóa tư vấn dịch vụ: {0}", item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ma
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 3
                            ,
                            Ten = "Xóa"
                        });
                        #endregion
                        rendertext("1");
                    }
                    else
                    {
                        rendertext("0");
                    }
                }
                break;
                #endregion
            case "TuVanLamDichVu-Add":
                #region Thêm làm dịch vụ

                if (Security.IsAuthenticated())
                {
                    TuVanLamDichVu item;
                    if (IdNull)
                    {
                        item = new TuVanLamDichVu();
                    }
                    else
                    {
                        item = TuVanLamDichVuDal.SelectById(new Guid(Id));

                    }
                    item.ThuTu = Convert.ToInt32(ThuTu);
                    if (!string.IsNullOrEmpty(NgayLam))
                    {
                        item.NgayLam = Convert.ToDateTime(NgayLam, new CultureInfo("vi-vn"));
                    }
                    item.NhanVien = NhanVien;
                    if (IdNull)
                    {
                        item = TuVanLamDichVuDal.Insert(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} thêm mới làm dịch vụ: {0}", item.ID,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = string.Format("{1} thêm mới làm dịch vụ: {0}", item.ID,
                                              Security.Username)
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 1
                            ,
                            Ten = "Thêm"
                        });
                        #endregion
                    }
                    else
                    {
                        item = TuVanLamDichVuDal.Update(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{1} sửa làm dịch vụ: {0}", item.ID,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = string.Format("{1} sửa làm dịch vụ: {0}", item.ID,
                                              Security.Username)
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = refUrl
                            ,
                            LLOG_ID = 2
                            ,
                            Ten = "Sửa"
                        });
                        #endregion
                    }
                    rendertext(item.ID.ToString());
                }
                break;

                #endregion
            case "TuVanLamDichVu-Xoa":
                #region Xóa làm dịch vụ

                if (Security.IsAuthenticated())
                {
                    var item = TuVanLamDichVuDal.SelectById(new Guid(Id));
                    TuVanDichVuDal.DeleteById(new Guid(Id));
                    #region log
                    LogDal.log(item, new Log()
                    {
                        Checked = false
                        ,
                        Info =
                            string.Format("{1} xóa làm dịch vụ: {0}", item.ID,
                                          Security.Username)
                        ,
                        NgayTao = DateTime.Now
                        ,
                        Username = Security.Username
                        ,
                        PRowId = item.ID
                        ,
                        PTen = item.ID.ToString()
                        ,
                        RequestIp = Request.UserHostAddress
                        ,
                        RawUrl = refUrl
                        ,
                        LLOG_ID = 3
                        ,
                        Ten = "Xóa"
                    });
                    #endregion
                    rendertext("1");
                }
                break;
                #endregion
            case "Logout":
                #region logout this system
                Security.LogOut();
                break;
                #endregion
            default:break;
        }
        
    }
}