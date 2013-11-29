<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add.ascx.cs" Inherits="lib_ui_Bally_KhachHang_templates_Add" %>
<%@ Import Namespace="linh.controls" %>
<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc1" %>
<div class="form-horizontal" role="form">
    <input id="Id" style="display: none;" value="<%=Item.ID == Guid.Empty ? string.Empty  : Item.ID.ToString() %>" name="Id" type="text" />
    <input name="TiemNang" value="<%=TiemNang.ToString() %>" style="display: none;"/>
    <div class="form-group">
        <label for="Ma" class="col-sm-2 control-label">Mã</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="Ma" id="Ma" value="<%=Item.ID == Guid.Empty ? CaptchaImage.GenerateRandomCode(CaptchaType.AlphaNumeric, 10)  : Item.Ma.ToString() %>" />
        </div>
    </div>
    <div class="form-group">
        <label for="Ten" class="col-sm-2 control-label">Họ và Tên</label>
        <div class="col-sm-10">
            <input id="Ten" type="text" class="form-control" value="<%=Item.Ten %>" name="Ten"/>
        </div>
    </div>
    <div class="form-group">
        <label for="Mobile" class="col-sm-2 control-label">Mobile</label>
        <div class="col-sm-10">
            <input id="Mobile" type="text" class="form-control" value="<%=Item.Mobile %>" name="Mobile"/>
        </div>
    </div>
    <div class="form-group">
        <label for="FacebookUid" class="col-sm-2 control-label">Facebook</label>
        <div class="col-sm-10">
            <input id="FacebookUid" name="FacebookUid" type="text" value="<%=Item.FacebookUid %>" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label for="Ym" class="col-sm-2 control-label">Ym</label>
        <div class="col-sm-10">
            <input id="Ym" name="Ym" type="text" value="<%=Item.Ym %>" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label for="Anh" class="col-sm-2 control-label">Ảnh</label>
        <div class="col-sm-10">
            <input id="Anh" class="Anh" name="Anh" value="<%=Item.Anh %>" type="text" style="display: none;" />
            <div class="imgfinder-box">
                <div class="imgfinder-cover">
                    <div class="imgfinder-overlay">
                        <span title="Chọn ảnh" class="btn btn-primary imgfinder-changeBtn">Chọn</span><br/>
                        <span title="xóa ảnh" class="btn btn-default imgfinder-removeBtn">
                            <i class="glyphicon glyphicon-remove"></i>
                        </span>
                    </div>
                </div>
                <img src="<%=Item.Anh %>" class="img-rounded img-thumbnail imgfinder-img"/>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="NgaySinh" class="col-sm-2 control-label">Ngày sinh</label>
        <div class="col-sm-10">
            <div id="NgaySinhPicker" class="input-append date input-group">
                <input 
                    value="<%=Item.NgaySinh == DateTime.MinValue ?  DateTime.Now.ToString("hh:mm dd/MM/yyyy") : "" %>"
                    data-format="hh:mm dd/MM/yyyy" 
                    class="form-control NgaySinh" 
                    id="NgaySinh" 
                    name="NgaySinh" 
                    type="text"/>
                <span class="add-on input-group-addon">
                    <i data-time-icon="icon-time" data-date-icon="icon-calendar" class="glyphicon glyphicon-calendar">
                    </i>
                </span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="NguonGocDdl" class="col-sm-2 control-label">Phân loại</label>
        <div class="col-sm-10">
            <select id="DanhGia" name="DanhGia" class="form-control DanhGia">
                <option value="4">Vàng</option>
                <option value="3">Bạc</option>
                <option value="2">Đồng</option>
                <option value="1">Triển vọng</option>
                <option value="0">Kém</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="NguonGocDdl" class="col-sm-2 control-label">Nguồn gốc</label>
        <div class="col-sm-10">
            <uc1:DanhMucListByLdmMa ClientIDMode="Static" ControlId="NguonGoc_ID" ID="NguonGocDdl" ControlName="NguonGoc_ID" runat="server" />
        </div>
    </div>
    <div class="form-group">
        <label for="KhuVucDdl" class="col-sm-2 control-label">Khu vực</label>
        <div class="col-sm-10">
            <uc1:DanhMucListByLdmMa ClientIDMode="Static" ControlId="KhuVuc_ID" ID="KhuVucDdl" ControlName="KhuVuc_ID" runat="server" />
        </div>
    </div>
    <div class="form-group">
        <label for="LinhVucDdl" class="col-sm-2 control-label">Lĩnh vực</label>
        <div class="col-sm-10">
            <uc1:DanhMucListByLdmMa ClientIDMode="Static" ControlId="LinhVuc_ID" ID="LinhVucDdl" ControlName="LinhVuc_ID" runat="server" />
        </div>
    </div>
    <div class="form-group">
        <label for="NgungTheoDoi" class="col-sm-2 control-label">Dừng theo dõi</label>
        <div class="col-sm-10">
            <%if (Item.NgungTheoDoi)
            {%>
                <input class="NgungTheoDoi input-sm" id="NgungTheoDoi" checked="checked" name="NgungTheoDoi" type="checkbox"/>
            <%}
            else
            {%>
                <input class="NgungTheoDoi input-sm" id="NgungTheoDoi" name="NgungTheoDoi" type="checkbox"/>
            <% } %>
        </div>
    </div>
    <div class="form-group">
        <label for="DiaChi" class="col-sm-2 control-label">Địa chỉ</label>
        <div class="col-sm-10">
            <textarea id="DiaChi" name="DiaChi" type="text" rows="3" class="form-control"><%=Item.DiaChi %></textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="ThoiGianGoiDien" class="col-sm-2 control-label">Thời gian gọi điện</label>
        <div class="col-sm-10">
            <textarea id="ThoiGianGoiDien" name="ThoiGianGoiDien" type="text" rows="3" class="form-control"><%=Item.ThoiGianGoiDien %></textarea>
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
<%if (!string.IsNullOrEmpty(Id))
{%>
<script>
    $(function () {
        $('.NguonGoc_ID').val('<%=Item.NguonGoc_ID %>');
        $('.KhuVuc_ID').val('<%=Item.KhuVuc_ID %>');
        $('.LinhVuc_ID').val('<%=Item.LinhVuc_ID %>');
        $('.DanhGia').val('<%=Item.DanhGia %>');
    })
</script>
<%} %>