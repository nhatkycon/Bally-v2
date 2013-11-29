using System;
using System.Collections.Generic;
using pmSpa.entities;

public partial class lib_ui_Bally_TuVanDichVu_DanhSach : System.Web.UI.UserControl
{
    public List<TuVanDichVu> List { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (List == null) return;
        rpt.DataSource = List;
        rpt.DataBind();
    }
}