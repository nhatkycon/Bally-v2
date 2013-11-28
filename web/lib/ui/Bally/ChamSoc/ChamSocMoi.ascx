<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChamSocMoi.ascx.cs" Inherits="lib_ui_Bally_ChamSoc_ChamSocMoi" %>
<%@ Register src="DanhSach.ascx" tagname="DanhSach" tagprefix="uc1" %>
<div class="panel panel-default">
    <div class="panel-heading">
        <div class="panel-title">
        Chăm sóc khách hàng          
        </div>
    </div>
    <div class="panel-body">
        <uc1:DanhSach ID="DanhSach1" runat="server" />
    </div>
    <div class="panel-footer"></div>
</div>

