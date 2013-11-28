<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhSach.ascx.cs" Inherits="lib_ui_Bally_Log_DanhSach" %>
<%@ Register src="templates/Item.ascx" tagname="Item" tagprefix="uc1" %>
<table class="table table-striped table-bordered table-hover">
    <thead>
        <tr>
            <th class="">
                Tên
            </th>
            <th>
                Thông tin
            </th>
            <th class="">
                User
            </th>
            <th class="hidden-xs">
                IP
            </th>
            <th class="hidden-xs">
                Ngày
            </th>
            <th>
                <i class="glyphicon glyphicon-info-sign"></i>
            </th>
        </tr>    
    </thead>
    <asp:Repeater runat="server" ID="rpt">
        <ItemTemplate>
            <uc1:Item ID="Item4" runat="server"  Item='<%# Container.DataItem %>' />
        </ItemTemplate>
    </asp:Repeater>    
</table>

