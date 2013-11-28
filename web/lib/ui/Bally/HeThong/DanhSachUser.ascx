<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhSachUser.ascx.cs" Inherits="lib_ui_Bally_HeThong_DanhSachUser" %>
<%@ Register src="templates/UserItem.ascx" tagname="UserItem" tagprefix="uc1" %>
<select name="<%=ControlName %>" class="form-control <%=ControlId %>">
    <asp:Repeater runat="server" ID="rpt">
        <ItemTemplate>
            <uc1:UserItem ID="UserItem1" runat="server" Item='<%# Container.DataItem %>' />
        </ItemTemplate>
    </asp:Repeater>    
</select>

