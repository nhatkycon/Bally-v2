using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using docsoft;
using docsoft.entities;
using linh.common;
using linh.core.dal;
using linh.frm;

namespace appStore.commonStore.hangHoaControls
{
    public class GioHang : docPlugUI
    {
        protected override void Render(HtmlTextWriter writer)
        {
            KhoiTao(DAL.con());
            writer.Write(Html);
            base.Render(writer);
        }
        public override void KhoiTao(SqlConnection con)
        {
            var sb = new StringBuilder();
            var c = HttpContext.Current;
            #region header
            sb.AppendFormat(@"
<div class=""{0}"">
    <div class=""box-header"">
        <a href=""{2}"" class=""box-header-label"">{1}</a>
    </div>
        <div class=""box-body"">", Css, Ten, Header_Url);
            #endregion

            #region cart
            sb.AppendFormat(@"
    <div class=""cart-top"">
    </div>
    <div class=""cart-body"">
        <div class=""cart-box"">
        </div>
        <div class=""cart-ship"">
            <span class=""cart-ship-gia"">5.000đ</span>
            <span class=""cart-ship-label"">Phí vận chuyển</span><br />
            <span class=""cart-ship-info"">Dưới 80k, quý khách vui lòng phụ thêm 5k vận chuyển</span>
        </div>
        <div class=""cart-tong"">
            Tổng cộng: <span class=""cart-tong-label"">25.000đ</span>
        </div>
        <div class=""cart-info"">
            <table style=""width:100%;"" cellpadding=""4"" cellspacing=""2"">
                <tr>
                    <td valign=""top"" class=""td-header"">Tên:</td>
                </tr>
                <tr>
                    <td valign=""top"">
                        <input class=""input-small Ten"" />
                    </td>
                </tr>
                <tr>
                    <td valign=""top"" class=""td-header"">Email:</td>
                </tr>
                <tr>
                    <td valign=""top"">
                        <input class=""input-small Email"" />
                    </td>
                </tr>
                <tr>
                    <td valign=""top"" class=""td-header"">Mobile:</td>
                </tr>
                <tr>
                    <td valign=""top"">
                        <input class=""input-small Mobile"" />
                    </td>
                </tr>
                <tr>
                    <td valign=""top"" class=""td-header"">Địa chỉ:</td>
                </tr>
                <tr>
                    <td valign=""top"">
                        <input class=""input-small DiaChi"" />
                    </td>
                </tr>
                <tr>
                    <td valign=""top"">
                        <textarea class=""textarea-tiny GhiChu"" ></textarea>
                    </td>                                                                                
                </tr>
                <tr>
                    <td colspan=""2"" valign=""top"">
                        <a href=""javascript:;"" class=""cart-send"">Gửi Đặt hàng</a>
                    </td>
                </tr>
            </table>
        </div>                            
    </div>
    <div class=""cart-foot"">
        <a href=""javascript:;"" class=""cart-checkOut"">Thanh toán</a>
    </div>
<script src=""{0}/lib/js/cart.js"" type=""text/javascript""></script>", domain);
            sb.Append(@"<script type=""text/javascript"">$(function() {cart.setup();});</script>");
            #endregion

            #region footer
            sb.AppendFormat(@"
        </div>
</div>");
            #endregion
            Html = sb.ToString();
            base.KhoiTao(con);
        }
        

        public string Ma { get; set; }
        public string Css { get; set; }
        public string ItemCss { get; set; }
        public string Ten { get; set; }
        public string Top { get; set; }
        public string Header_Url { get; set; }
        public override void LoadSetting(System.Xml.XmlNode SettingNode)
        {
            Ma = GetSetting("Ma", SettingNode);
            Ten = GetSetting("Ten", SettingNode);
            Css = GetSetting("Css", SettingNode);
            Top = GetSetting("Top", SettingNode);
            Header_Url = GetSetting("Header_Url", SettingNode);
            ItemCss = GetSetting("ItemCss", SettingNode);
            base.LoadSetting(SettingNode);
        }
        public override void AddTabs()
        {
            base.AddTabs();
            ModuleSetting Tab1Settings1 = new ModuleSetting();
            Tab1Settings1.Key = "Ma";
            Tab1Settings1.Type = "String";
            Tab1Settings1.Value = Ma;
            Tab1Settings1.Title = "Mã danh mục";
            this.Tabs[0].Settings.Add(Tab1Settings1);

            Tab1Settings1 = new ModuleSetting();
            Tab1Settings1.Key = "Ten";
            Tab1Settings1.Type = "String";
            Tab1Settings1.Value = Ten;
            Tab1Settings1.Title = "Tên";
            this.Tabs[0].Settings.Add(Tab1Settings1);

            Tab1Settings1 = new ModuleSetting();
            Tab1Settings1.Key = "Top";
            Tab1Settings1.Type = "String";
            Tab1Settings1.Value = Top;
            Tab1Settings1.Title = "Số lượng";
            this.Tabs[0].Settings.Add(Tab1Settings1);

            Tab1Settings1 = new ModuleSetting();
            Tab1Settings1.Key = "Css";
            Tab1Settings1.Type = "String";
            Tab1Settings1.Value = Css;
            Tab1Settings1.Title = "Css";
            this.Tabs[0].Settings.Add(Tab1Settings1);

            Tab1Settings1 = new ModuleSetting();
            Tab1Settings1.Key = "Header_Url";
            Tab1Settings1.Type = "String";
            Tab1Settings1.Value = Header_Url;
            Tab1Settings1.Title = "Url";
            this.Tabs[0].Settings.Add(Tab1Settings1);

            Tab1Settings1 = new ModuleSetting();
            Tab1Settings1.Key = "ItemCss";
            Tab1Settings1.Type = "String";
            Tab1Settings1.Value = ItemCss;
            Tab1Settings1.Title = "Class của hàng hóa";
            this.Tabs[0].Settings.Add(Tab1Settings1);
        }
        public override void ImportPlugin()
        {
            if (Ma == null) Ma = "";
            if (Top == null) Top = "5";
            if (Ten == null) Ten = "Tên Module";
            if (Css == null) Css = "";
            if (Header_Url == null) Header_Url = "";
            base.ImportPlugin();
        }
    }
}
