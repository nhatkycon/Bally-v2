using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft;
using docsoft.entities;
using linh.common;
using linh.core;
using pmSpa.entities;

public partial class lib_ajax_Default : BasedPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var act = Request["act"];
        var logged = Security.IsAuthenticated();
        var Id = Request["Id"];
        var IdNull = string.IsNullOrEmpty(Id);
        var Ten = Request["Ten"];
        var Ma = Request["Ma"];
        var Mobile = Request["Mobile"];
        var Ym = Request["Ym"];
        var FacebookUid = Request["FacebookUid"];
        var NguonGoc_ID = Request["NguonGoc_ID"];
        var KhuVuc_ID = Request["KhuVuc_ID"];
        var LinhVuc_ID = Request["LinhVuc_ID"];
        var NgungTheoDoi = Request["NgungTheoDoi"];
        var DiaChi = Request["DiaChi"];
        var Anh = Request["Anh"];
        var NgaySinh = Request["NgaySinh"];

        NgungTheoDoi = !string.IsNullOrEmpty(NgungTheoDoi) ? "true" : "false";
        switch (act)
        {
            case "KhachHang-Add":
            #region Thêm khách hàng
                if(logged)
                {
                    var item = IdNull ? new KhachHang() : KhachHangDal.SelectById(new Guid(Id));
                    item.Ten = Ten;
                    item.Ma = Ma;
                    item.Anh = Anh;
                    item.Mobile = Mobile;
                    item.FacebookUid = FacebookUid;
                    item.NgungTheoDoi = Convert.ToBoolean(NgungTheoDoi);
                    item.NgayCapNhat = DateTime.Now;
                    item.DiaChi = DiaChi;
                    item.Ym = Ym;
                    if (!string.IsNullOrEmpty(NgaySinh))
                    {
                        item.NgaySinh = Convert.ToDateTime(NgaySinh, new CultureInfo("vi-vn"));
                    }
                    if (!string.IsNullOrEmpty(NguonGoc_ID))
                    {
                        item.NguonGoc_ID = new Guid(NguonGoc_ID);
                    }
                    if (!string.IsNullOrEmpty(KhuVuc_ID))
                    {
                        item.KhuVuc_ID = new Guid(KhuVuc_ID);
                    }
                    if (!string.IsNullOrEmpty(LinhVuc_ID))
                    {
                        item.LinhVuc_ID = new Guid(LinhVuc_ID);
                    }
                    if (IdNull)
                    {
                        item.NgayTao = DateTime.Now;
                        item.NguoiTao = Security.Username;
                        item.ID = Guid.NewGuid();
                        item = KhachHangDal.Insert(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{2} thêm mới khách hàng {1}-{0}", item.Ten, item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ten
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = Request.Url.PathAndQuery
                            ,
                            LLOG_ID = 1
                            ,
                            Ten = "Thêm"
                        });
                        #endregion
                    }
                    else
                    {
                        item = KhachHangDal.Update(item);
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{2} sửa khách hàng {1}-{0}", item.Ten, item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ten
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = Request.Url.PathAndQuery
                            ,
                            LLOG_ID = 2
                            ,
                            Ten = "Sửa"
                        });
                        #endregion
                    }
                    TimKiemDal.Add(item,item.ID);
                    rendertext(item.ID.ToString());
                }
                break;
            #endregion
            case "KhachHang-Xoa":
            #region Xóa khách hàng
                if(logged && !IdNull)
                {
                    var item = KhachHangDal.SelectById(new Guid(Id));
                    if(item.NguoiTao==Security.Username)
                    {
                        KhachHangDal.DeleteById(new Guid(Id));
                        #region log
                        LogDal.log(item, new Log()
                        {
                            Checked = false
                            ,
                            Info =
                                string.Format("{2} xóa khách hàng {1}-{0}", item.Ten, item.Ma,
                                              Security.Username)
                            ,
                            NgayTao = DateTime.Now
                            ,
                            Username = Security.Username
                            ,
                            PRowId = item.ID
                            ,
                            PTen = item.Ten
                            ,
                            RequestIp = Request.UserHostAddress
                            ,
                            RawUrl = Request.Url.PathAndQuery
                            ,
                            LLOG_ID = 3
                            ,
                            Ten = "Xóa"
                        });
                        #endregion
                        rendertext("1");
                    }
                    else
                    {
                        rendertext("0");
                    }
                }
                break;
            #endregion
            case "Logout":
                #region logout this system
                Security.LogOut();
                break;
                #endregion
            default:break;
        }
        
    }
}