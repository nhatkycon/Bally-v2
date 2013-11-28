<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Upcoming.ascx.cs" Inherits="lib_ui_Bally_LichHen_Upcoming" %>
<%@ Register src="templates/Item.ascx" tagname="Item" tagprefix="uc1" %>
<div class="panel panel-default">
    <div class="panel-heading">Lịch hẹn</div>
    <div class="panel-body">
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
    </div>
    <div class="panel-footer"></div>
</div>


