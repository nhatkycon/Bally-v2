using System;
using docsoft.entities;

public partial class lib_ui_Bally_Log_View : System.Web.UI.UserControl
{
    public string Id { get; set; }
    public Log Item { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
    }
}