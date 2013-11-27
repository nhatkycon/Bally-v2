using System;
using docsoft.entities;
using linh.common;
using linh.core.dal;
using pmSpa.entities;

public partial class lib_pages_ChamSoc_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request["ID"];
        var khId = Request["KH_ID"];
        ChamSoc Item;
        using (var con = DAL.con())
        {
            if (string.IsNullOrEmpty(id))
            {
                Item = new ChamSoc();
                if (!string.IsNullOrEmpty(khId))
                {
                    if(khId.Length>36)
                    {
                        khId = khId.Substring(khId.LastIndexOf(',') + 1);
                    }
                    var kh = KhachHangDal.SelectById(new Guid(khId), con);
                    Item.KH_Ten = kh.Ten;
                    Item.KH_ID = kh.ID;
                }
                Add1.Item = Item;
            }
            else
            {
                Item = ChamSocDal.SelectById(con, new Guid(id));
                Item.KH_Ten = maHoa.DecryptString(Item.KH_Ten, Item.KH_ID.ToString());
                Add1.Item = Item;
            }
            var tinhTrangList = DanhMucDal.SelectByLDMMa(con, "CsTT");
            var loaiList = DanhMucDal.SelectByLDMMa(con, "CsLoai");
            Add1.ListTT = tinhTrangList;
            Add1.ListLoai = loaiList;
        }
    }
}