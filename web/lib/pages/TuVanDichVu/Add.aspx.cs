using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft.entities;
using linh.common;
using linh.core.dal;
using pmSpa.entities;

public partial class lib_pages_TuVanDichVu_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var Id = Request["ID"];
        var khId = Request["KH_ID"];
        TuVanDichVu Item;
        using (var con = DAL.con())
        {
            if (string.IsNullOrEmpty(Id))
            {
                Item = new TuVanDichVu() {_DichVu = new DichVu(), _KhachHang = new KhachHang()};
                if (!string.IsNullOrEmpty(khId))
                {
                    if (khId.Length > 36)
                    {
                        khId = khId.Substring(khId.LastIndexOf(',') + 1);
                    }
                    var kh = KhachHangDal.SelectById(new Guid(khId), con);
                    Item._KhachHang = kh;
                    Item.KH_ID = kh.ID;
                }
                Add1.Item = Item;
            }
            else
            {
                Item = TuVanDichVuDal.SelectById(con, new Guid(Id));
                Item.KH_Ten = maHoa.DecryptString(Item.KH_Ten, Item.KH_ID.ToString());
                Add1.Item = Item;
            }

            var baoHanhList = DanhMucDal.SelectByLDMMa(con, "NHOM-BH");
            Add1.BaoHanhList = baoHanhList;
        }
    }
}