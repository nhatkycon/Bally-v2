<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChamSocMoi.ascx.cs" Inherits="lib_ui_Bally_ChamSoc_ChamSocMoi" %>
<%@ Register src="DanhSach.ascx" tagname="DanhSach" tagprefix="uc1" %>
<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
        <a href="/lib/pages/ChamSoc/Default.aspx">Chăm sóc khách hàng</a>
        </div>
    </div>
    <div class="panel-body">
        <uc1:DanhSach ID="DanhSach1" runat="server" />
    </div>
    <div class="panel-footer"></div>
</div>

