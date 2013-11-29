using System;
using docsoft.entities;
using linh.core.dal;
using pmSpa.entities;

public partial class lib_pages_TiemNang_Default : System.Web.UI.Page
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
                    nguonGocId, linhVucId, "1", tuNgay, denNgay);
            DanhSachAll1.List = pg.List;
            paging = pg.Paging;

            var nguonGocList = DanhMucDal.SelectByLDMMa(con, "NGUON-KH");
            var khuVucList = DanhMucDal.SelectByLDMMa(con, "KHUVUC");
            var linhVucList = DanhMucDal.SelectByLDMMa(con, "LINHVUC-KH");
            LinhVuc.List = linhVucList;
            NguonGoc.List = nguonGocList;
            KhuVuc.List = khuVucList;

        }
    }
}