<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhSach.ascx.cs" Inherits="lib_ui_Bally_LichHen_DanhSach" %>
<%@ Register src="templates/Item.ascx" tagname="Item" tagprefix="uc1" %>
<table class="table table-striped table-bordered table-hover">
    <thead>
        <tr>
            <th class="">
                Tên
            </th>
            <th>
                Loại
            </th>
            <th class="hidden-xs">
                Nhân viên
            </th>
            <th>
                Ngày
            </th>
        </tr>    
    </thead>
    <asp:Repeater runat="server" ID="rpt">
        <ItemTemplate>
            <uc1:Item ID="Item3" runat="server"  Item='<%# Container.DataItem %>' />
        </ItemTemplate>
    </asp:Repeater>    
</table>

