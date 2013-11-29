<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add.ascx.cs" Inherits="lib_ui_Bally_LichHen_Add" %>
<%@ Import Namespace="docsoft" %>
<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc1" %>
<div class="panel panel-default LichHen-Pnl-Add">
    <div class="panel-heading">
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/LichHen/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <% }else{ %>
            <a href="<%=Ret %>" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%} %>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
            <a href="/lib/pages/TuVanDichVu/Add.aspx?KH_ID=<%=Item.KH_ID %>" class="btn btn-success taoDichVubtn">
                <i class="glyphicon glyphicon-share-alt"></i> D/vụ
            </a>
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
            <input id="Id" style="display: none;" value="<%=Item.ID == Guid.Empty ? string.Empty  : Item.ID.ToString() %>" name="Id" type="text" />
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
                        <div class="help-block">
                            <a class="btn btn-link" href="/lib/pages/KhachHang/Add.aspx?ID=<%=Item.KH_ID %>&ret=<%=Server.UrlEncode(Request.Url.PathAndQuery) %>">
                                <i class="glyphicon glyphicon-info-sign"></i> <%=Item.KH_Ten %>
                            </a>
                        </div>
                    <%} %>
                </div>
            </div>
            <div class="form-group">
                <label for="DM_ID" class="col-sm-2 control-label">Loại</label>
                <div class="col-sm-10">
                    <uc1:DanhMucListByLdmMa ClientIDMode="Static" 
                    ControlId="DM_ID" ID="DM_ID" 
                    ControlName="DM_ID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="Ten" class="col-sm-2 control-label">Tên</label>
                <div class="col-sm-10">
                    <input id="Ten" type="text" class="form-control" value="<%=Item.Ten %>" name="Ten"/>
                </div>
            </div>
            <div class="form-group">
                <label for="NgayBatDau" class="col-sm-2 control-label">Ngày</label>
                <div class="col-sm-10">
                    <div id="NgayBatDauPicker" class="input-append date input-group">
                        <input 
                            value="<%=Item.NgayBatDau == DateTime.MinValue ?  DateTime.Now.ToString("hh:mm dd/MM/yyyy") : Item.NgayBatDau.ToString("hh:mm dd/MM/yyyy") %>"
                            data-format="hh:mm dd/MM/yyyy" 
                            class="form-control NgayBatDau" 
                            id="NgayBatDau" 
                            name="NgayBatDau" 
                            type="text"/>
                        <span class="add-on input-group-addon">
                            <i data-time-icon="icon-time" data-date-icon="icon-calendar" class="glyphicon glyphicon-calendar">
                            </i>
                        </span>
                    </div>
                </div>
            </div>
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
                <label for="MoTa" class="col-sm-2 control-label">Mô tả</label>
                <div class="col-sm-10">
                    <textarea id="MoTa" name="MoTa" type="text" rows="3" class="form-control"><%=Item.MoTa%></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="BoQua" class="col-sm-2 control-label">Bỏ qua</label>
                <div class="col-sm-10">
                    <%if (Item.BoQua)
                    {%>
                        <input class="BoQua input-sm" id="BoQua" checked="checked" name="BoQua" type="checkbox"/>
                    <%}
                    else
                    {%>
                        <input class="BoQua input-sm" id="BoQua" name="BoQua" type="checkbox"/>
                    <% } %>
                </div>
            </div>
            <div class="form-group">
                <label for="ThanhCong" class="col-sm-2 control-label">Thành công</label>
                <div class="col-sm-10">
                    <%if (Item.ThanhCong)
                    {%>
                        <input class="ThanhCong input-sm" id="ThanhCong" checked="checked" name="ThanhCong" type="checkbox"/>
                    <%}
                    else
                    {%>
                        <input class="ThanhCong input-sm" id="ThanhCong" name="ThanhCong" type="checkbox"/>
                    <% } %>
                </div>
            </div>
            <%if (!string.IsNullOrEmpty(Id)){ %>
                <div class="help-block">
                    <div class="well well-sm">
                        <i class="glyphicon glyphicon-info-sign"></i>
                        <strong><%=Item.NguoiTao %></strong> tạo ngày <%=Item.NgayTao.ToString("HH:mm dd/MM/yyyy") %>.
                        <strong><%=Item.NguoiCapNhat %></strong> sửa lúc <%=Item.NgayCapNhat.ToString("HH:mm dd/MM/yyyy") %>
                    </div>
                </div>
            <%} %>
        </div>
    </div>
    <div class="panel-footer">
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/LichHen/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <% }else{ %>
            <a href="<%=Ret %>" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%} %>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
            <a href="/lib/pages/TuVanDichVu/Add.aspx?KH_ID=<%=Item.KH_ID %>" class="btn btn-success taoDichVubtn">
                <i class="glyphicon glyphicon-share-alt"></i> D/vụ
            </a>
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

<%if (!string.IsNullOrEmpty(Id))
{%>
<script>
    $(function () {
        $('.DM_ID').val('<%=Item.DM_ID %>');
    })
</script>
<%} %>