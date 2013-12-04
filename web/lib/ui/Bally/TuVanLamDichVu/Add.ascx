<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add.ascx.cs" Inherits="lib_ui_Bally_TuVanLamDichVu_Add" %>
<%@ Import Namespace="docsoft" %>
<div class="panel panel-default TuVanDichVu-Pnl-Add">
    <div class="panel-heading">
        
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/TuVanLamDichVu/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <% }else{ %>
            <a href="<%=Ret %>" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%} %>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
            <a href="javascript:;" data-id="<%=Item.ID %>" class="btn btn-warning xoaBtn">Xóa</a>
        <%}
        else
        {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
        <%} %>                    
    </div>
    <div class="panel-body">
        <div class="form-horizontal" role="form">
            <input id="Id" style="display: none;" value="<%=Item.ID == Guid.Empty ? string.Empty  : Item.ID.ToString() %>" name="Id" type="text" />
            <%if (!string.IsNullOrEmpty(Id))
            {%>
                <div class="help-block">
                    <div class="well well-sm">
                        <a href="/lib/pages/TuVanDichVu/Add.aspx?ID=<%=Item.TVDV_ID %>">
                        <i class="glyphicon glyphicon-info-sign"></i> <%=Item._TuVanDichVu.Ma %>
                        </a>
                    </div>
                </div>
            <%} %>  
            <div class="form-group">
                <label for="NhanVien_Ten" class="col-sm-2 control-label">Nhân viên</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon btn btnHintNv">
                            <i class="glyphicon glyphicon-chevron-down"></i>
                        </span>
                        <input type="text" name="NhanVien_Ten" id="NhanVien_Ten" value="<%=Item.NhanVien_Ten %>" class="form-control NhanVien_Ten">
                        <input type="text" name="NhanVien" id="NhanVien" value="<%=Item.NhanVien %>" class="form-control NhanVien" style="display: none;">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="ThuTu" class="col-sm-2 control-label">Thứ tự</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control ThuTu" name="ThuTu" id="ThuTu" value="<%=Item.ThuTu %>" />
                </div>
            </div>
            <div class="form-group">
                <label for="NgayLam" class="col-sm-2 control-label">Ngày</label>
                <div class="col-sm-10">
                    <div id="NgayLamPicker" class="input-append date input-group">
                        <input 
                            value="<%=Item.NgayLam == DateTime.MinValue ?  DateTime.Now.ToString("dd/MM/yyyy") : Item.NgayLam.ToString("dd/MM/yyyy") %>"
                            data-format="dd/MM/yyyy" 
                            class="form-control NgayLam" 
                            id="NgayLam" 
                            name="NgayLam" 
                            type="text"/>
                        <span class="add-on input-group-addon">
                            <i data-time-icon="icon-time" data-date-icon="icon-calendar" class="glyphicon glyphicon-calendar">
                            </i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-footer">
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/TuVanLamDichVu/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <% }else{ %>
            <a href="<%=Ret %>" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%} %>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
            <a href="javascript:;" data-id="<%=Item.ID %>" class="btn btn-warning xoaBtn">Xóa</a>
        <%}
        else
        {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
        <%} %>
    </div>
</div>