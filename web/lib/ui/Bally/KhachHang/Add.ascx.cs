using System;
using System.Collections.Generic;
using docsoft.entities;
using pmSpa.entities;

public partial class lib_ui_Bally_KhachHang_Add : System.Web.UI.UserControl
{
    public List<DanhMuc> KhuVuc { get; set; }
    public List<DanhMuc> LinhVuc { get; set; }
    public List<DanhMuc> NguonGoc { get; set; }
    public bool TiemNang { get; set; }
    public KhachHang Item { get; set; }
    public string Id { get; set; }
    public string Ret { get; set; }
    public List<ChamSoc> ChamSocs { get; set; }
    public List<SuKien> SuKiens { get; set; }
    public List<TuVanDichVu> DichVus { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
        Ret = Request["ret"];
        if (!string.IsNullOrEmpty(Ret)) Ret = Server.UrlDecode(Ret);
        Add1.NguonGoc = NguonGoc;
        Add1.LinhVuc = LinhVuc;
        Add1.KhuVuc = KhuVuc;
        Add1.Item = Item;
        DanhSach1.List = ChamSocs;
        DanhSach2.List = SuKiens;
        Add1.TiemNang = TiemNang;
        DanhSach3.List = DichVus;
    }
}