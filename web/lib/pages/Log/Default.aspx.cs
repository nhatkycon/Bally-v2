using System;
using docsoft.entities;
using linh.core.dal;

public partial class lib_pages_Log_Default : System.Web.UI.Page
{
    public string paging { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request["ID"];
        var username = Request["Username"];
        var q = Request["q"];
        var size = Request["size"];
        if (string.IsNullOrEmpty(size)) size = "10";
        using (var con = DAL.con())
        {
            var pg = LogDal.pagerNormal(con, string.Format("?q={0}&Username={1}&size={2}&", q, username, size) + "{1}={0}"
                                        , false, "LOG_NgayTao desc", q, Convert.ToInt32(size), username);
            paging = pg.Paging;
            DanhSach1.List = pg.List;
            Username.List = MemberDal.SelectAll();
        }
    }
}