﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
        Add1.NguonGoc = NguonGoc;
        Add1.LinhVuc = LinhVuc;
        Add1.KhuVuc = KhuVuc;
        Add1.Item = Item;
        Add1.TiemNang = TiemNang;
    }
}