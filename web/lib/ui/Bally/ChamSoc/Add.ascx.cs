using System;
using System.Collections.Generic;
using docsoft.entities;

public partial class lib_ui_Bally_ChamSoc_Add : System.Web.UI.UserControl
{
    public string Id { get; set; }
    public string khId { get; set; }
    public ChamSoc Item { get; set; }
    public List<DanhMuc> ListTT { get; set; }
    public List<DanhMuc> ListLoai { get; set; }
    public string Ret { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
        khId = Request["khId"];
        Ret = Request["ret"];
        TT_ID.List = ListTT;
        LOAI_ID.List = ListLoai;
    }
}