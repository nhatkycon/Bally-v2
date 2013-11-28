using System;
using System.Collections.Generic;
using pmSpa.entities;

public partial class lib_ui_Bally_LichHen_Upcoming : System.Web.UI.UserControl
{
    public List<SuKien> List { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (List == null) return;
        rpt.DataSource = List;
        rpt.DataBind();
    }
}