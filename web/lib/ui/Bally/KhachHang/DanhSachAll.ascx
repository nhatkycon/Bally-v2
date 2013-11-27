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
            <th class="hidden-xs hidden-sm">
                Face
            </th>
            <th class="">
                Mobile
            </th>
            <th class="hidden-xs">
                Ym
            </th>
            <th class="hidden-xs">
                Địa chỉ
            </th>
            <th class="hidden-xs">
                Khu vực
            </th>
            <th class="hidden-xs">
                Nguồn gốc
            </th>
        </tr>    
    </thead>
    <asp:Repeater runat="server" ID="rpt">
        <ItemTemplate>
            <uc2:Item ID="Item2" TargetUrl="<%# Target %>" runat="server" Item='<%# Container.DataItem %>' />
        </ItemTemplate>
    </asp:Repeater>    
</table>
