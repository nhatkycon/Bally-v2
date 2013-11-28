<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Bally.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="lib_pages_Default" %>

<%@ Register src="~/lib/ui/Bally/LichHen/Upcoming.ascx" tagname="Upcoming" tagprefix="uc1" %>

<%@ Register src="~/lib/ui/Bally/TiemNang/TiemNangMoi.ascx" tagname="TiemNangMoi" tagprefix="uc2" %>

<%@ Register src="~/lib/ui/Bally/KhachHang/SinhNhat.ascx" tagname="SinhNhat" tagprefix="uc3" %>

<%@ Register src="~/lib/ui/Bally/ChamSoc/ChamSocMoi.ascx" tagname="ChamSocMoi" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row home-panel">
        <div class="col-md-8 col-sm-12">
            <uc1:Upcoming ID="Upcoming1" runat="server" />
            <uc2:TiemNangMoi ID="TiemNangMoi1" runat="server" />
        </div>
        <div class="col-md-4 col-sm-12">
            <uc3:SinhNhat ID="SinhNhat1" runat="server" />
            <uc4:ChamSocMoi ID="ChamSocMoi1" runat="server" />
        </div>
    </div>
</asp:Content>

