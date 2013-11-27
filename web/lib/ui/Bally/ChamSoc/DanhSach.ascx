<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhSach.ascx.cs" Inherits="lib_ui_Bally_ChamSoc_DanhSach" %>
<%@ Register src="templates/Item.ascx" tagname="Item" tagprefix="uc1" %>
<table class="table table-striped table-bordered table-hover">
    <thead>
        <tr>
            <th>
                Mã
            </th>
            <th>
                Loại
            </th>
            <th class="hidden-xs hidden-sm">
                Nội dung
            </th>
            <th class="hidden-xs">
                Nhân viên
            </th>
            <th>
                Tình trạng
            </th>
            <th>
                Ngày tạo
            </th>
        </tr>    
    </thead>
    <asp:Repeater runat="server" ID="rpt">
        <ItemTemplate>
            <uc1:Item ID="Item2" runat="server" Item='<%# Container.DataItem %>' />
        </ItemTemplate>
    </asp:Repeater>    
</table>
