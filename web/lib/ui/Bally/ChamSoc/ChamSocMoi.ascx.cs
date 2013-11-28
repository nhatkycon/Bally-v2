using System;
using System.Collections.Generic;
using docsoft.entities;

public partial class lib_ui_Bally_ChamSoc_ChamSocMoi : System.Web.UI.UserControl
{
    public List<ChamSoc> List { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        DanhSach1.List = List;
    }
}