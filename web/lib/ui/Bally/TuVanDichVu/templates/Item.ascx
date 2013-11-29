<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Item.ascx.cs" Inherits="lib_ui_Bally_TuVanDichVu_templates_Item" %>
<tr class="">
    <td>
        <a href="/lib/pages/TuVanDichVu/Add.aspx?ID=<%=Item.ID %>">
            <%=Item.Ma %>
        </a>
    </td>
    <td>
        <%if(Item.KH_ID!=Guid.Empty){ %>
        <a href="/lib/pages/KhachHang/Add.aspx?ID=<%=Item.KH_ID %>&ret=<%=Server.UrlEncode(Request.Url.PathAndQuery) %>">
        <%=Item._KhachHang.Ten %>            
        </a>
        <%} %>
    </td>
    <td>
        <%=Item._DichVu.Ten %>
    </td>
    <td class="hidden-xs">
        <%=Item.Gia %>
    </td>
    <td class="hidden-xs">
        <%=Item.ThanhToan %>
    </td>
    <td class="hidden-xs">
        <%=Item.ConNo %>
    </td>
    <td class="hidden-xs">
        <%=Item.NgayLap.ToString("hh:mm dd/MM/yyyy") %>
    </td>
    <td>
        <%=Item.NhanVien_Ten %>
    </td>
</tr>