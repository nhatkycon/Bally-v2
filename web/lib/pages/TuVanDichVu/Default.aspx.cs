using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft.entities;
using linh.core.dal;
using pmSpa.entities;

public partial class lib_pages_TuVanDichVu_Default : System.Web.UI.Page
{
    public string paging { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        var Id = Request["ID"];
        var nhanVien = Request["NhanVien"];
        var dvId = Request["DV_ID"];
        var khId = Request["KH_ID"];
        var q = Request["q"];
        var tuNgay = Request["TuNgay"];
        var denNgay = Request["DenNgay"];
        var size = Request["size"];
        if (string.IsNullOrEmpty(size)) size = "10";
        using (var con = DAL.con())
        {
            var pg = TuVanDichVuDal.pagerNormal(con,
                                                string.Format(
                                                    "?q={0}&size={1}&DV_ID={2}&KH_ID={3}&NhanVien={4}&TuNgay={5}&DenNgay={6}&"
                                                    , q, size, dvId, khId, nhanVien, tuNgay, denNgay) +"{1}={0}"
                                                , false, "TVDV_NgayLap desc", q, Convert.ToInt32(size)
                                                , dvId, khId, nhanVien, tuNgay, denNgay);
            DanhSach1.List = pg.List;
            paging = pg.Paging;

            var users = new List<Member>();
            users.Add(new Member() { ID = 0, Ten = "" });
            var userList = MemberDal.SelectAll();
            users.AddRange(userList);
            Username.List = users;
        }
        
    }
}