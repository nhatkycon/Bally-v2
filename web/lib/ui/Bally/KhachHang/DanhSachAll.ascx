<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhSachAll.ascx.cs" Inherits="lib_ui_Bally_KhachHang_DanhSachAll" %>
<%@ Register src="templates/Item.ascx" tagname="Item" tagprefix="uc2" %>
<table class="table table-striped table-bordered table-hover">
    <thead>
        <tr>
            <th class="">
                Mã
            </th>
            <th class="">
                Tên
            </th>
            <th class="hidden-xs">
                Đ/chỉ
            </th>
            <th class="hidden-xs">
                Khu vực
            </th>
            <th class="">
                Nguồn
            </th>
            <th class="hidden-xs">
                Ngày
            </th>
        </tr>    
    </thead>
    <asp:Repeater runat="server" ID="rpt">
        <ItemTemplate>
            <uc2:Item ID="Item2" TargetUrl="<%# Target %>" runat="server" Item='<%# Container.DataItem %>' />
        </ItemTemplate>
    </asp:Repeater>    
</table>
