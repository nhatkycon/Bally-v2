<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Item.ascx.cs" Inherits="lib_ui_Bally_ChamSoc_templates_Item" %>
<tr>
    <td>
        <a href="/lib/pages/ChamSoc/Add.aspx?ID=<%=Item.ID %>">
            <%=Item.Ma %>            
        </a>
    </td>
    <td>
        <%=Item.LOAI_Ten %>
    </td>
    <td class="hidden-xs hidden-sm">
        <%=Item.NoiDung %>
    </td>
    <td class="hidden-xs">
        <%=Item.NguoiTao %>
    </td>
    <td>
        <%=Item.TT_Ten %>
    </td>
    <td>
        <%=Item.NgayTao.ToString("hh:mm dd/MM") %>
    </td>
</tr>