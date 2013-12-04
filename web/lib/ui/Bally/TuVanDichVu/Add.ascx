<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add.ascx.cs" Inherits="lib_ui_Bally_TuVanDichVu_Add" %>
<%@ Import Namespace="docsoft" %>
<%@ Import Namespace="linh.controls" %>
<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc1" %>
<div class="panel panel-default TuVanDichVu-Pnl-Add">
    <div class="panel-heading">
        
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/TuVanDichVu/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <% }else{ %>
            <a href="<%=Ret %>" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%} %>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
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
                <label for="Ma" class="col-sm-2 control-label">Mã</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="Ma" id="Ma" value="<%=Item.ID == Guid.Empty ? CaptchaImage.GenerateRandomCode(CaptchaType.AlphaNumeric, 10)  : Item.Ma.ToString() %>" />
                </div>
            </div>
            <div class="form-group">
                <label for="KH_Ten" class="col-sm-2 control-label">Khách hàng</label>
                <div class="col-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon btn btnHintKH">
                          <i class="glyphicon glyphicon-chevron-down"></i>
                      </span>
                        <input type="text" name="KH_Ten" id="KH_Ten" value="<%=Item._KhachHang.Ten %>" class="form-control KH_Ten">
                        <input type="text" name="KH_ID" id="KH_ID" value="<%=Item.KH_ID %>" class="form-control KH_ID" style="display: none;">
                      <a href="/lib/pages/KhachHang/Add.aspx?ret=<%=Server.UrlEncode(Request.Url.PathAndQuery) %>" class="input-group-addon btn btn-default btnThemNhanhKH">
                          <i class="glyphicon glyphicon-user"></i> Thêm
                      </a>
                    </div>
                    <%if (!string.IsNullOrEmpty(Item._KhachHang.Ten)){ %>
                        <span class="help-block">
                            <a class="btn btn-link" href="/lib/pages/KhachHang/Add.aspx?ID=<%=Item.KH_ID %>&ret=<%=Server.UrlEncode(Request.Url.PathAndQuery) %>">
                                <i class="glyphicon glyphicon-info-sign"></i> <%=Item._KhachHang.Ten%>
                            </a>
                        </span>
                    <%} %>
                </div>
            </div>
            <div class="form-group">
                <label for="DV_Ten" class="col-sm-2 control-label">Dịch vụ</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon btn btnHintDv">
                            <i class="glyphicon glyphicon-chevron-down"></i>
                        </span>
                        <input type="text" name="DV_Ten" id="DV_Ten" value="<%=Item._DichVu.Ten %>" class="form-control DV_Ten">
                        <input type="text" name="DV_ID" id="DV_ID" value="<%=Item.DV_ID %>" class="form-control DV_ID" style="display: none;">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="Gia" class="col-sm-2 control-label">Giá</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control Gia" name="Gia" id="Gia" value="<%=Item.Gia %>" />
                </div>
            </div>
            <div class="form-group">
                <label for="CK" class="col-sm-2 control-label">Chiết khấu</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control CK" name="CK" id="CK" value="<%=Item.CK %>" />
                </div>
            </div>
            <div class="form-group">
                <label for="ConNo" class="col-sm-2 control-label">Thanh toán</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control ThanhToan" name="ThanhToan" id="ThanhToan" value="<%=Item.ThanhToan %>" />
                </div>
            </div>
            <div class="form-group">
                <label for="ConNo" class="col-sm-2 control-label">Còn nợ</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control ConNo" name="ConNo" id="ConNo" value="<%=Item.ConNo %>" />
                </div>
            </div>
            <div class="form-group">
                <label for="SoLan" class="col-sm-2 control-label">Số lần làm</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="SoLan" id="SoLan" value="<%=Item.SoLan %>" />
                </div>
            </div>
            <div class="form-group">
                <label for="BaoHanh_ID" class="col-sm-2 control-label">Bảo hành</label>
                <div class="col-sm-10">
                    <uc1:DanhMucListByLdmMa ClientIDMode="Static" ControlId="BaoHanh_ID" ID="BaoHanh_ID" ControlName="BaoHanh_ID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label for="GhiChu" class="col-sm-2 control-label">Ghi chú</label>
                <div class="col-sm-10">
                    <textarea id="GhiChu" name="GhiChu" type="text" rows="3" class="form-control"><%=Item.GhiChu %></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="NgayLap" class="col-sm-2 control-label">Ngày</label>
                <div class="col-sm-10">
                    <div id="NgayLapPicker" class="input-append date input-group">
                        <input 
                            value="<%=Item.NgayLap == DateTime.MinValue ?  DateTime.Now.ToString("dd/MM/yyyy") : Item.NgayLap.ToString("dd/MM/yyyy") %>"
                            data-format="dd/MM/yyyy" 
                            class="form-control NgayLap" 
                            id="NgayLap" 
                            name="NgayLap" 
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
            <%if (!string.IsNullOrEmpty(Id)){ %>
                <div class="help-block">
                    <div class="well well-sm">
                        <i class="glyphicon glyphicon-info-sign"></i>
                        <strong><%=Item.NguoiTao %></strong> tạo ngày <%=Item.NgayTao.ToString("HH:mm dd/MM/yyyy") %>
                    </div>
                </div>
            <%} %>
        </div>
    </div>
    <div class="panel-footer">
        <%if (string.IsNullOrEmpty(Ret))
          { %>
            <a href="/lib/pages/TuVanDichVu/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <% }else{ %>
            <a href="<%=Ret %>" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <%} %>
        <%if (!string.IsNullOrEmpty(Id))
            {%>
            <a href="javascript:;" data-ret="<%=Ret %>" class="btn btn-primary savebtn">Lưu</a>
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
        $('.BaoHanh_ID').val('<%=Item.BaoHanh_ID %>');
    })
</script>
<%} %>