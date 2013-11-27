<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add.ascx.cs" Inherits="lib_ui_Bally_KhachHang_Add" %>
<%@ Import Namespace="docsoft" %>
<%@ Register src="~/lib/ui/Bally/KhachHang/templates/Add.ascx" tagname="Add" tagprefix="uc1" %>
<%@ Register src="../ChamSoc/DanhSach.ascx" tagname="DanhSach" tagprefix="uc2" %>
<div class="panel panel-default KhachHang-Pnl-Add">
    <div class="panel-heading">
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/KhachHang/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <% }else{ %>
            <a href="<%=Ret %>" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%} %>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" class="btn btn-primary savebtn">Lưu</a>
            <%if(Item.NguoiTao == Security.Username){ %>
                <a href="javascript:;" data-id="<%=Item.ID %>" class="btn btn-warning xoaBtn">Xóa</a>
            <%} %>
        <%}
        else
        {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
        <%} %>                    
    </div>
    <div class="panel-body">
        <uc1:Add ID="Add1" TiemNang="False" runat="server" />
    </div>
    <div class="panel-footer">
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/KhachHang/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <% }else{ %>
            <a href="<%=Ret %>" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%} %>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" class="btn btn-primary savebtn">Lưu</a>
            <%if(Item.NguoiTao == Security.Username){ %>
                <a href="javascript:;" data-id="<%=Item.ID %>" class="btn btn-warning xoaBtn">Xóa</a>
            <%} %>
        <%}
        else
        {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
        <%} %>
    </div>
</div>
<%if(!string.IsNullOrEmpty(Id)){ %>
<div class="panel panel-default">
    <div class="panel-heading">
        <a href="/lib/pages/ChamSoc/Add.aspx?ret=<%=Server.UrlEncode(Request.Url.PathAndQuery) %>&KH_ID=<%=Item.ID %>" class="btn btn-primary">Thêm</a>
        <a href="" class="btn btn-success">
            <i class="glyphicon glyphicon-refresh"></i>
        </a>
    </div>
    <div class="panel-body">
        <uc2:DanhSach ID="DanhSach1" runat="server" />
    </div>
    <div class="panel-footer">
        
    </div>
</div>
<%} %>
<script src="/lib/js/ckfinder/ckfinder.js" type="text/javascript"></script>                
