using System;
using docsoft.entities;
using linh.core.dal;

public partial class lib_pages_ChamSoc_Default : System.Web.UI.Page
{
    public string paging { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        var q = Request["q"];
        var tt_id = Request["TT_ID"];
        var loai_id = Request["LOAI_ID"];
        var size = Request["size"];
        if (string.IsNullOrEmpty(size)) size = "10";
        using (var con = DAL.con())
        {
            var pg = ChamSocDal.pagerNormal(con, string.Format("?q={0}&size={1}&TT_ID={2}&LOAI_ID={3}&"
                , q, size, tt_id, loai_id) + "{1}={0}", false, "CS_NgayTao desc", q, 100, tt_id, loai_id);
            DanhSach1.List = pg.List;
            paging = pg.Paging;
            var tinhTrangList = DanhMucDal.SelectByLDMMa(con, "CsTT");
            var loaiList = DanhMucDal.SelectByLDMMa(con, "CsLoai");

            LOAI_ID.List = loaiList;
            TT_ID.List = tinhTrangList;
        }
    }
}