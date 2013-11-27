using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft.entities;
using pmSpa.entities;

public partial class lib_ui_Bally_KhachHang_templates_Add : System.Web.UI.UserControl
{
    public List<DanhMuc> KhuVuc { get; set; }
    public List<DanhMuc> LinhVuc { get; set; }
    public List<DanhMuc> NguonGoc { get; set; }
    public bool TiemNang { get; set; }
    public KhachHang Item { get; set; }
    public string Id { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
        NguonGocDdl.List = NguonGoc;
        LinhVucDdl.List = LinhVuc;
        KhuVucDdl.List = KhuVuc;
    }
}