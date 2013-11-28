using System;
using System.Collections.Generic;
using docsoft.entities;
using pmSpa.entities;

public partial class lib_ui_Bally_LichHen_Add : System.Web.UI.UserControl
{
    public string Id { get; set; }
    public string Ret { get; set; }
    public SuKien Item { get; set; }
    public List<DanhMuc> ListLoai { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
        Ret = Request["ret"];
        if (!string.IsNullOrEmpty(Ret)) Ret = Server.UrlDecode(Ret);
        DM_ID.List = ListLoai;
    }
}