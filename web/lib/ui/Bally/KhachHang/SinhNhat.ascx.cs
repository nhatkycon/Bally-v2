using System;
using System.Collections.Generic;
using pmSpa.entities;

public partial class lib_ui_Bally_KhachHang_SinhNhat : System.Web.UI.UserControl
{
    public List<KhachHang> List { get; set; }
    public string Target { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (List == null) return;
        rpt.DataSource = List;
        rpt.DataBind();
    }
}