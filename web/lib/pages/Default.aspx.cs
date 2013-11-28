using System;
using docsoft.entities;
using linh.core.dal;
using pmSpa.entities;

public partial class lib_pages_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var con = DAL.con())
        {
            var list = SuKienDal.SelectUpcoming(con, "20");
            Upcoming1.List = list;

            var pg =KhachHangDal.pagerAll(con, "", false, "KH_NgayTao desc", null, 10, null,
                                  null, null, "1");
            TiemNangMoi1.List = pg.List;

            var pgSn = KhachHangDal.pagerSinhNhat("", false, "a.KH_NgayTao desc", null, 20, null, null);
            SinhNhat1.Visible = pgSn.List.Count > 0;
            SinhNhat1.List = pgSn.List;

            var pgChamSoc = ChamSocDal.pagerNormal(con, string.Empty, false, "CS_NgayTao desc", null, 100, null, null);
            ChamSocMoi1.List = pgChamSoc.List;
        }

    }
}