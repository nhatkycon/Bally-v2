using System;
using docsoft.entities;
using linh.common;
using linh.core.dal;

public partial class lib_pages_Log_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var Id = Request["ID"];
        using (var con = DAL.con())
        {
            var Item = LogDal.SelectById(con, Convert.ToInt32(Id));
            View1.Item = Item;

            //var obj =(ChamSoc)Lib.XmlDeserializeFromString(Item.GiaTriMoi, typeof(ChamSoc));
            //Response.Write(obj.Ma);
        }
    }
}