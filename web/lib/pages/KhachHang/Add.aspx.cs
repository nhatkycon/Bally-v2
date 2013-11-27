using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft.entities;
using linh.core.dal;
using pmSpa.entities;
using HangHoaDal = pmSpa.entities.HangHoaDal;

public partial class lib_pages_KhachHang_Add : System.Web.UI.Page
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
            }

            var nguonGocList = DanhMucDal.SelectByLDMMa(con, "NGUON-KH");
            var khuVucList = DanhMucDal.SelectByLDMMa(con, "KHUVUC");
            var linhVucList = DanhMucDal.SelectByLDMMa(con, "LINHVUC-KH");

            Add1.NguonGoc = nguonGocList;
            Add1.KhuVuc = khuVucList;
            Add1.LinhVuc = linhVucList;

        }
    }
}