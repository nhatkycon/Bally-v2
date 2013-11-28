<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Item.ascx.cs" Inherits="lib_ui_Bally_LichHen_templates_Item" %>
<tr>
    <td>
        <a href="/lib/pages/LichHen/Add.aspx?ID=<%=Item.ID %>&ret=<%=Server.UrlEncode(Request.Url.PathAndQuery) %>">
            <%=Item.Ten %>            
        </a>
    </td>
    <td>
        <%=Item.DM_Ten %>
    </td>
    <td class="hidden-xs">
        <%=Item.NhanVien_Ten %>
    </td>
    <td>
        <%=Item.NgayBatDau.ToString("hh:mm dd/MM/yyyy") %>
    </td>
</tr>