<%@ Control Language="C#" AutoEventWireup="true" CodeFile="View.ascx.cs" Inherits="lib_ui_Bally_Log_View" %>
<%@ Import Namespace="docsoft" %>
<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc1" %>
<div class="panel panel-default LichHen-Pnl-Add">
    <div class="panel-heading">
        <a href="/lib/pages/Log/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
    </div>
    <div class="panel-body">
        <div class="form-horizontal" role="form">
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">Tên</label>
                <div class="col-sm-10">
                    <%=Item.Ten %>
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">Thông tin</label>
                <div class="col-sm-10">
                    <%=Item.Info %>
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">User</label>
                <div class="col-sm-10">
                    <%=Item.Username %>
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">IP</label>
                <div class="col-sm-10">
                    <%=Item.RequestIp %>
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">Ngày</label>
                <div class="col-sm-10">
                    <%=Item.NgayTao.ToString("HH:mm:ss dd/MM/yyyy") %>
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">ID đối tượng</label>
                <div class="col-sm-10">
                    <%=Item.PRowId %>
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">Tên đối tượng</label>
                <div class="col-sm-10">
                    <%=Item.PTen %>
                </div>
            </div>
            <div class="form-group">
                <label for="" class="col-sm-2 control-label">Giá trị</label>
                <div class="col-sm-10">
                    <pre>
                        <%=Server.HtmlEncode(Item.GiaTriMoi) %>                        
                    </pre>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-footer">
        <a href="/lib/pages/Log/Default.aspx" class="btn btn-default"><i class="glyphicon glyphicon-chevron-left"></i></a>
    </div>
</div>