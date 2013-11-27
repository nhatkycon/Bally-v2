﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add.ascx.cs" Inherits="lib_ui_Bally_ChamSoc_Add" %>
<%@ Import Namespace="docsoft" %>
<%@ Import Namespace="linh.controls" %>
<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc1" %>
<div class="panel panel-default ChamSoc-Pnl-Add">
    <div class="panel-heading">
        
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/ChamSoc/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
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
        <div class="form-horizontal" role="form">
            
            <div class="form-group">
                <label for="KH_Ten" class="col-sm-2 control-label">Khách hàng</label>
                <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon btn btnHintKH">
                          <i class="glyphicon glyphicon-chevron-down"></i>
                      </span>
                        <input type="text" name="KH_Ten" id="KH_Ten" value="<%=Item.KH_Ten %>" class="form-control KH_Ten">
                        <input type="text" name="KH_ID" id="KH_ID" value="<%=Item.KH_ID %>" class="form-control KH_ID" style="display: none;">
                      <a href="/lib/pages/KhachHang/Add.aspx?ret=<%=Server.UrlEncode(Request.Url.PathAndQuery) %>" class="input-group-addon btn btn-default btnThemNhanhKH">
                          <i class="glyphicon glyphicon-user"></i> Thêm
                      </a>
                    </div>
                    <%if (!string.IsNullOrEmpty(Item.KH_Ten)){ %>
                        <span class="help-block">
                            <a class="btn btn-link" href="/lib/pages/KhachHang/Add.aspx?ID=<%=Item.KH_ID %>">
                                <%=Item.KH_Ten %>
                            </a>
                        </span>
                    <%} %>
                </div>
            </div>
            <div class="form-group">
                <label for="Ma" class="col-sm-2 control-label">Mã</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="Ma" id="Ma" value="<%=Item.ID == Guid.Empty ? CaptchaImage.GenerateRandomCode(CaptchaType.AlphaNumeric, 10)  : Item.Ma.ToString() %>" />
                </div>
            </div>
            <div class="form-group">
                <label for="LOAI_ID" class="col-sm-2 control-label">Loại</label>
                <div class="col-sm-10">
                    <uc1:DanhMucListByLdmMa ClientIDMode="Static" ControlId="LOAI_ID" ID="LOAI_ID" ControlName="LOAI_ID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="TT_ID" class="col-sm-2 control-label">Tình trạng</label>
                <div class="col-sm-10">
                    <uc1:DanhMucListByLdmMa ClientIDMode="Static" ControlId="TT_ID" ID="TT_ID" ControlName="TT_ID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="NoiDung" class="col-sm-2 control-label">Nội dung</label>
                <div class="col-sm-10">
                    <textarea id="NoiDung" name="NoiDung" type="text" rows="3" class="form-control"><%=Item.NoiDung %></textarea>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-footer">
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/ChamSoc/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
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