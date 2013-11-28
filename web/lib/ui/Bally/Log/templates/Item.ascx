<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Item.ascx.cs" Inherits="lib_ui_Bally_Log_templates_Item" %>
<tr class="">
    <td>
        <a href="<%=Item.RawUrl %>">
            <%=Item.Ten %> <i class="glyphicon glyphicon-link"></i>
        </a>
    </td>
    <td>
        <%=Item.Info %>
    </td>
    <td>
        <%=Item.Username %>
    </td>
    <td class="hidden-xs">
        <%=Item.RequestIp %>
    </td>
    <td class="hidden-xs">
        <%=Item.NgayTao.ToString("hh:mm dd/MM/yyyy") %>
    </td>
    <td>
        <a href="/lib/pages/Log/View.aspx?ID=<%=Item.ID %>">
            <i class="glyphicon glyphicon-info-sign"></i>
        </a>
    </td>
</tr>