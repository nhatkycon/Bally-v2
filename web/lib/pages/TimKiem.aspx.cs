using System;
using docsoft.entities;
using linh.core.dal;
using pmSpa.entities;

public partial class lib_pages_TimKiem : System.Web.UI.Page
{
    public long TotalTiemNang { get; set; }
    public long TotalKhachHang { get; set; }
    public long TotalSuKien { get; set; }
    public long TotalChamSoc { get; set; }

    public string PagingTiemNang { get; set; }
    public string PagingKhachHang { get; set; }
    public string PagingSuKien { get; set; }
    public string PagingChamSoc { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        var q = Request["q"];
        var size = Request["size"];
        if (string.IsNullOrEmpty(size)) size = "10";
        using (var con = DAL.con())
        {
            var pgTiemNang = KhachHangDal.pagerAll(con, string.Format("?q={0}&size={1}&", q, size) + "{1}={0}", false, "KH_NgayTao desc", q, Convert.ToInt32(size), null, null, null, "1");
            var pgKhachHang = KhachHangDal.pagerAll(con, string.Format("?q={0}&", q) + "{1}={0}", false, "KH_NgayTao desc", q, Convert.ToInt32(size), null, null, null, "0");
            var pgLichHen = SuKienDal.pagerNormal(
                    string.Format("?q={0}&size={1}&", q, size) + "{1}={0}"
                    , false, "SK_NgayTao desc", q, Convert.ToInt32(size)
                    , null, null, null, null, null);
            var pgChamSSoc = ChamSocDal.pagerNormal(con, string.Format("?q={0}&size={1}&"
                , q, size) + "{1}={0}", false, "CS_NgayTao desc", q, 100, null, null);

            TiemNangList.List = pgTiemNang.List;
            KhachHangList.List = pgKhachHang.List;
            SuKienList.List = pgLichHen.List;
            ChamSocList.List = pgChamSSoc.List;


            TotalTiemNang = pgTiemNang.Total;
            TotalKhachHang = pgKhachHang.Total;
            TotalSuKien = pgLichHen.Total;
            TotalChamSoc = pgChamSSoc.Total;

            PagingTiemNang = pgTiemNang.Paging;
            PagingKhachHang = pgKhachHang.Paging;
            PagingSuKien = pgLichHen.Paging;
            PagingChamSoc = pgChamSSoc.Paging;
        }
    }
}