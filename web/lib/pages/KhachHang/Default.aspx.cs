using System;
using System.Globalization;
using docsoft;
using docsoft.entities;
using linh.common;
using linh.controls;
using linh.core.dal;
using pmSpa.entities;
using System.Linq;
public partial class lib_pages_KhachHang_Default : System.Web.UI.Page
{
    public string paging { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        var q = Request["q"];
        var size = Request["size"];
        if (string.IsNullOrEmpty(size)) size = "10";
        var khuVucId = Request["KhuVuc_Id"];
        var nguonGocId = Request["NguonGoc_Id"];
        var linhVucId = Request["LinhVuc_Id"];
        var tuNgay = Request["TuNgay"];
        var denNgay = Request["DenNgay"];
        using (var con = DAL.con())
        {
         
            var pg =
                KhachHangDal.pagerAll(con,
                    string.Format("?q={0}&size={1}&KhuVuc_Id={2}&NguonGoc_Id={3}&LinhVuc_Id={4}&TuNgay={5}&DenNgay={6}&", q, size, khuVucId,
                                  nguonGocId, linhVucId, tuNgay, denNgay) + "{1}={0}", false, null, q, Convert.ToInt32(size), khuVucId,
                    nguonGocId, linhVucId, "0", tuNgay, denNgay);
            DanhSachAll1.List = pg.List;
            paging = pg.Paging;

            var nguonGocList = DanhMucDal.SelectByLDMMa(con, "NGUON-KH");
            var khuVucList = DanhMucDal.SelectByLDMMa(con, "KHUVUC");
            var linhVucList = DanhMucDal.SelectByLDMMa(con, "LINHVUC-KH");
            LinhVuc.List = linhVucList;
            NguonGoc.List = nguonGocList;
            KhuVuc.List = khuVucList;



        }
        return;
        var listAll = KhachHangDal.SelectAll().Where(p => (p.NguoiTao == "nga" || p.NguoiTao == "huyen"));
        foreach (var item in listAll)
        {
            item.Ma = CaptchaImage.GenerateRandomCode(CaptchaType.AlphaNumeric, 10);
            TimKiemDal.AddObject(item, item.ID);
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
                RawUrl = string.Empty
                ,
                LLOG_ID = 1
                ,
                Ten = "Thêm"
            });
            #endregion
            KhachHangDal.Update(item);
        }
    }
}