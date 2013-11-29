<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add.ascx.cs" Inherits="lib_ui_Bally_TiemNang_Add" %>
<%@ Import Namespace="docsoft" %>
<%@ Register src="~/lib/ui/Bally/ChamSoc/DanhSach.ascx" tagname="DanhSach" tagprefix="uc2" %>
<%@ Register src="~/lib/ui/Bally/LichHen/DanhSach.ascx" tagname="DanhSach" tagprefix="uc3" %>
<%@ Register src="~/lib/ui/Bally/KhachHang/templates/Add.ascx" tagname="Add" tagprefix="uc1" %>
<div class="panel panel-default TiemNang-Pnl-Add">
    <div class="panel-heading">
        <a href="/lib/pages/TiemNang/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" data-ret="<%=Ret %>"  class="btn btn-primary btn-large savebtn">Lưu</a>
            
            <%if(Item.NguoiTao == Security.Username){ %>
                <a href="javascript:;" class="btn btn-success upgradebtn">
                    <i class="glyphicon glyphicon-share-alt"></i> Khách hàng
                </a>
                <a href="javascript:;" data-id="<%=Item.ID %>" class="btn btn-warning btn-large xoaBtn">Xóa</a>
            <%} %>
        <%}
        else
        {%>
            <a href="javascript:;" class="btn btn-primary btn-large savebtn">Lưu</a>
        <%} %>                    
    </div>
    <div class="panel-body">
        <uc1:Add ID="Add1" TiemNang="True" runat="server" />
    </div>
    <div class="panel-footer">
        <a href="/lib/pages/TiemNang/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" data-ret="<%=Ret %>"  class="btn btn-primary savebtn">Lưu</a>
            <%if(Item.NguoiTao == Security.Username){ %>
                <a href="javascript:;" class="btn btn-success upgradebtn">
                    <i class="glyphicon glyphicon-share-alt"></i> Khách hàng
                </a>
                <a href="javascript:;" data-id="<%=Item.ID %>" class="btn btn-warning btn-large xoaBtn">Xóa</a>
            <%} %>
        <%}
        else
        {%>
            <a href="javascript:;" class="btn btn-primary savebtn">Lưu</a>
        <%} %>
    </div>
</div>
<%if(!string.IsNullOrEmpty(Id)){ %>
<div class="panel panel-default">    
    <div class="panel-body">
        <h3>Chăm sóc</h3>        
        <hr/>
        <a href="/lib/pages/ChamSoc/Add.aspx?ret=<%=Server.UrlEncode(Request.Url.PathAndQuery) %>&KH_ID=<%=Item.ID %>" class="btn btn-primary">Thêm</a>
        <a href="" class="btn btn-success">
            <i class="glyphicon glyphicon-refresh"></i>
        </a>        
    </div>    
</div>
<uc2:DanhSach ID="DanhSach1" runat="server" />

<div class="panel panel-default">    
    <div class="panel-body">
        <h3>Lịch hẹn</h3>        
        <hr/>
        <a href="/lib/pages/LichHen/Add.aspx?ret=<%=Server.UrlEncode(Request.Url.PathAndQuery) %>&KH_ID=<%=Item.ID %>" class="btn btn-primary">Thêm</a>
        <a href="" class="btn btn-success">
            <i class="glyphicon glyphicon-refresh"></i>
        </a>        
    </div>    
</div>
<uc3:DanhSach ID="DanhSach2" runat="server" />
<%} %>
<script src="/lib/js/ckfinder/ckfinder.js" type="text/javascript"></script>     