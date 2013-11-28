using System;
using docsoft.entities;
using linh.core.dal;
using pmSpa.entities;

public partial class lib_pages_LichHen_Default : System.Web.UI.Page
{
    public string paging { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        var q = Request["q"];
        var dm_id = Request["DM_ID"];
        var khId = Request["KH_ID"];
        var size = Request["size"];
        if (string.IsNullOrEmpty(size)) size = "10";
        using (var con = DAL.con())
        {
            var ListLoai = DanhMucDal.SelectByLDMMa(con, "NHOM-SK");
            DM_ID.List = ListLoai;
            var pg =
                SuKienDal.pagerNormal(
                    string.Format("?q={0}&size={1}&DM_ID={2}&KH_ID={3}&", q, size, dm_id, khId) + "{1}={0}"
                    , false, "SK_NgayTao desc", q, Convert.ToInt32(size)
                    , dm_id, khId, null, null, null);
            paging = pg.Paging;
            DanhSach1.List = pg.List;
        }

    }
}