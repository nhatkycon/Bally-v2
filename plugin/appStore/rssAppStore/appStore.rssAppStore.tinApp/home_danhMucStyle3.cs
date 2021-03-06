﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using linh.frm;
using System.Data.SqlClient;
using linh.core.dal;
using docsoft;
using System.Web.UI;
using System.Web;
using linh.controls;
using linh.common;
using docbao.entitites;
namespace appStore.rssAppStore.tinApp
{
    public class home_danhMucStyle3 : PlugUI
    {
        public string Ma { get; set; }
        public string Css { get; set; }
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
            Tab1Settings1.Title = "Url header";
            this.Tabs[0].Settings.Add(Tab1Settings1);
        }
        public override void ImportPlugin()
        {
            if (Ma == null) Ma = "12";
            if (Top == null) Top = "5";
            if (Ten == null) Ten = "Tên Module";
            if (Css == null) Css = "";
            if (Header_Url == null) Header_Url = "";
            base.ImportPlugin();
        }
        protected override void Render(HtmlTextWriter writer)
        {
            KhoiTao(DAL.con());
            writer.Write(Html);
            base.Render(writer);
        }
        public override void KhoiTao(SqlConnection con)
        {
            StringBuilder sb = new StringBuilder();
            bool login = Security.IsAuthenticated();
            sb.AppendFormat(@"
<div class=""box2"" style=""{0}"">
    <div class=""box-header"">{3}
        <a href=""{2}"" class=""box-header-label"">{1}</a>
    </div>
        <div class=""box-body"">", Css, Ten, Header_Url, login ? string.Format(@"
<div class=""box-header-task"" _Top=""{0}"" _Type=""{1}"">
    <a href=""javascript:;"" class=""box-header-task-icon box-header-task-add""></a>
    <a href=""javascript:;"" class=""box-header-task-icon box-header-task-minus""></a>
</div>
", Top, typeof(home_danhMucStyle3).AssemblyQualifiedName) : "");
            List<Tin> List = TinDal.SelectNoiBatDanhMuc(con,Convert.ToInt32(Top), Ma);
            int i = 0;
            #region tin noi bat
            StringBuilder sb1 = new StringBuilder();
            StringBuilder sb2 = new StringBuilder();
            StringBuilder sb3 = new StringBuilder();
            foreach (Tin item in List)
            {
                switch (i)
                {
                    case 0:
                        sb1.Append(TinDal.formatDanhMucStyle3Big(item, domain));
                        break;
                    case 1:
                        sb3.Append(TinDal.formatDanhMucStyle3Medium(item, domain));
                        break;
                    case 2:
                        sb3.Append(TinDal.formatDanhMucStyle3Medium(item, domain));
                        break;
                    case 3:
                        sb3.Append(TinDal.formatDanhMucStyle3Medium(item, domain));
                        break;
                    default:
                        sb2.Append(TinDal.formatDanhMucStyle3Tiny(item, domain));
                        break;
                }
                i++;
            }
            sb.AppendFormat(@"<div class=""danhMucStyle3-header"">");
            sb.Append(sb1);
            sb.AppendFormat(@"<div class=""danhMucStyle3-header-leftPnl"">");
            sb.Append(sb3);
            sb.AppendFormat(@"</div>");
            sb.AppendFormat(@"</div>");
            sb.Append(sb2);
            #endregion
            sb.AppendFormat(@"
        </div>
</div>");
            Html = sb.ToString();
            base.KhoiTao(con);
        }
    }   
}
