using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft.entities;
using pmSpa.entities;

public partial class lib_ui_Bally_TuVanDichVu_Add : System.Web.UI.UserControl
{
    public string Ret { get; set; }
    public string Id { get; set; }
    public string khId { get; set; }
    public TuVanDichVu Item { get; set; }
    public List<DanhMuc> BaoHanhList { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
        khId = Request["khId"];
        Ret = Request["ret"];
        BaoHanh_ID.List = BaoHanhList;
    }
}