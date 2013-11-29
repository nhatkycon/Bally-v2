<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Bally.master" AutoEventWireup="true" CodeFile="TimKiem.aspx.cs" Inherits="lib_pages_TimKiem" %>

<%@ Register src="../ui/Bally/KhachHang/DanhSachAll.ascx" tagname="DanhSachAll" tagprefix="uc1" %>

<%@ Register src="../ui/Bally/ChamSoc/DanhSach.ascx" tagname="DanhSach" tagprefix="uc2" %>
<%@ Register src="../ui/Bally/LichHen/DanhSach.ascx" tagname="DanhSach" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="home-panel">
    <div class="well-sm">
        Từ khóa: <strong><%=Request["q"] %></strong>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="panel-title">
            Tiềm năng <span class="badge"><%=TotalTiemNang %></span>
            </div>
        </div>
        <div class="panel-body">
            <uc1:DanhSachAll ID="TiemNangList" runat="server" />
        </div>
        <div class="panel-footer">
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="panel-title">
            Khách hàng <span class="badge"><%=TotalKhachHang %></span>
            </div>
        </div>
        <div class="panel-body">
            <uc1:DanhSachAll ID="KhachHangList" runat="server" />
        </div>
        <div class="panel-footer">
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="panel-title">
            Lịch hẹn <span class="badge"><%=TotalSuKien %></span>
            </div>
        </div>
        <div class="panel-body">
            <uc3:DanhSach ID="SuKienList" runat="server" />
        </div>
        <div class="panel-footer">
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="panel-title">
            Chăm sóc <span class="badge"><%=TotalChamSoc %></span>
            </div>
        </div>
        <div class="panel-body">
            <uc2:DanhSach ID="ChamSocList" runat="server" />
        </div>
        <div class="panel-footer">
        </div>
    </div>
</div>
</asp:Content>

