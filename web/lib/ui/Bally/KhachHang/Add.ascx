<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add.ascx.cs" Inherits="lib_ui_Bally_KhachHang_Add" %>
<%@ Import Namespace="docsoft" %>
<%@ Register src="~/lib/ui/Bally/KhachHang/templates/Add.ascx" tagname="Add" tagprefix="uc1" %>
<div class="panel panel-default KhachHang-Pnl-Add">
    <div class="panel-heading">
        <a href="/lib/pages/KhachHang/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" class="btn btn-primary btn-large savebtn">Lưu</a>
            <%if(Item.NguoiTao == Security.Username){ %>
                <a href="javascript:;" data-id="<%=Item.ID %>" class="btn btn-warning btn-large xoaBtn">Xóa</a>
            <%} %>
        <%}
        else
        {%>
            <a href="javascript:;" class="btn btn-primary btn-large savebtn">Lưu</a>
        <%} %>                    
    </div>
    <div class="panel-body">
        <uc1:Add ID="Add1" runat="server" />
    </div>
    <div class="panel-footer">
        <a href="/lib/pages/KhachHang/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" class="btn btn-primary btn-large savebtn">Lưu</a>
            <%if(Item.NguoiTao == Security.Username){ %>
                <a href="javascript:;" data-id="<%=Item.ID %>" class="btn btn-warning btn-large xoaBtn">Xóa</a>
            <%} %>
        <%}
        else
        {%>
            <a href="javascript:;" class="btn btn-primary btn-large savebtn">Lưu</a>
        <%} %>
    </div>
</div>
        <script src="/lib/js/ckfinder/ckfinder.js" type="text/javascript"></script>                
