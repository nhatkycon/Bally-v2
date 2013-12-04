using System;
using pmSpa.entities;

public partial class lib_ui_Bally_TuVanLamDichVu_Add : System.Web.UI.UserControl
{
    public TuVanLamDichVu Item { get; set; }
    public string Ret { get; set; }
    public string Id { get; set; }
    public string TvDvId { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
        TvDvId = Request["TVDV_ID"];
        Ret = Request["ret"];
    }
}