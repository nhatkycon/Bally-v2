<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhMucListByLdmMa.ascx.cs" Inherits="lib_ui_Bally_HeThong_DanhMucListByLdmMa" %>
<%@ Register src="templates/DanhMucItem.ascx" tagname="DanhMucItem" tagprefix="uc1" %>
<select name="<%=ControlName %>" class="form-control <%=ControlId %>">
    <asp:Repeater runat="server" ID="rpt">
        <ItemTemplate>
            <uc1:DanhMucItem ID="DanhMucItem2" runat="server" Item='<%# Container.DataItem %>' />
        </ItemTemplate>
    </asp:Repeater>    
</select>
