using System;
using docsoft.entities;
using linh.core.dal;
using pmSpa.entities;

public partial class lib_pages_TiemNang_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request["ID"];

        using (var con = DAL.con())
        {
            if (string.IsNullOrEmpty(id))
            {
                Add1.Item = new KhachHang(); ;
            }
            else
            {
                Add1.Item = KhachHangDal.SelectById(new Guid(id));
                var listChamSoc = ChamSocDal.SelectByKhId(con, id);
                Add1.ChamSocs = listChamSoc;
                var listSuKien = SuKienDal.SelectByKhId(con, null, "100", id);
                Add1.SuKiens = listSuKien;
            }

            var nguonGocList = DanhMucDal.SelectByLDMMa(con, "NGUON-KH");
            var khuVucList = DanhMucDal.SelectByLDMMa(con, "KHUVUC");
            var linhVucList = DanhMucDal.SelectByLDMMa(con, "LINHVUC-KH");
            var dichVus = TuVanDichVuDal.pagerNormal(con, null, false, "TVDV_NgayLap desc", null, 20, null, id, null,
                                                     null, null);

            Add1.NguonGoc = nguonGocList;
            Add1.KhuVuc = khuVucList;
            Add1.LinhVuc = linhVucList;
            Add1.DichVus = dichVus.List;
        }
    }
}