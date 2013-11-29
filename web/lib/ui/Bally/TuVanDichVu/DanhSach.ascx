<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhSach.ascx.cs" Inherits="lib_ui_Bally_TuVanDichVu_DanhSach" %>
<%@ Register src="templates/Item.ascx" tagname="Item" tagprefix="uc1" %>
<table class="table table-striped table-bordered table-hover">
    <thead>
        <tr>
            <th class="">
                Mã
            </th>
            <th>
                Khách
            </th>
            <th class="">
                D/Vụ
            </th>
            <th class="hidden-xs">
                Giá
            </th>
            <th class="hidden-xs">
                Thanh toán
            </th>
            <th class="hidden-xs">
                Còn nợ
            </th>
            <th class="hidden-xs">
                Ngày
            </th>
            <th>
                N/Viên
            </th>
        </tr>    
    </thead>
    <asp:Repeater runat="server" ID="rpt">
        <ItemTemplate>
            <uc1:Item ID="Item1" runat="server"  Item='<%# Container.DataItem %>' />
        </ItemTemplate>
    </asp:Repeater>    
</table>