using System;
using System.Collections.Generic;
using docsoft.entities;

public partial class lib_ui_Bally_Log_DanhSach : System.Web.UI.UserControl
{
    public List<Log> List { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (List == null) return;
        rpt.DataSource = List;
        rpt.DataBind();
    }
}