<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TiemNangMoi.ascx.cs" Inherits="lib_ui_Bally_TiemNang_TiemNangMoi" %>
<%@ Register src="../KhachHang/templates/Item.ascx" tagname="Item" tagprefix="uc1" %>
<%@ Register src="../KhachHang/DanhSachAll.ascx" tagname="DanhSachAll" tagprefix="uc2" %>
<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
        Tiềm năng mới            
        </div>
    </div>
    <div class="panel-body">
        <uc2:DanhSachAll ID="DanhSachAll1" runat="server" />
    </div>
    <div class="panel-footer"></div>
</div>

