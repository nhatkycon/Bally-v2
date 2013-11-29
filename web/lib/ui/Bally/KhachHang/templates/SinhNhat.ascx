<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SinhNhat.ascx.cs" Inherits="lib_ui_Bally_KhachHang_templates_SinhNhat" %>
<tr>
    <td class="">
        <a href="/lib/pages/<%=Item.TiemNang ? "TiemNang" : "KhachHang" %>/Add.aspx?ID=<%=Item.ID %>">
            <%=Item.Ma %>
        </a>
    </td>
    <td class="">
        <a href="/lib/pages/<%=Item.TiemNang ? "TiemNang" : "KhachHang" %>/Add.aspx?ID=<%=Item.ID %>">
            <%=Item.Ten %>
        </a>
    </td>
    <td class="">
        <%=Item.NgaySinh.ToString("dd/MM") %>
    </td>
    <td class="hidden-xs">
        <%=Item.Tuoi %>
    </td>
    <td class="hidden-xs">
        <%=Item.NguonGoc_Ten %>
    </td>
</tr>