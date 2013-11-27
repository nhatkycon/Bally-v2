<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Bally.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="lib_pages_ChamSoc_Default" %>
<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc2" %>
<%@ Register src="../../ui/Bally/ChamSoc/DanhSach.ascx" tagname="DanhSach" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ModuleHeader panel panel-default">
        <div class="panel-body" role="form">
            <div class="form-inline">
            <div class="row">
                <div class="col-sm-2">
                    <div class="form-group">
                        <a href="/lib/pages/ChamSoc/Add.aspx" class="btn btn-primary">Thêm</a>
                        <a href="/lib/pages/ChamSoc/Default.aspx" class="btn btn-success">
                            <i class="glyphicon glyphicon-refresh"></i>
                        </a>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <uc2:DanhMucListByLdmMa ControlName="TT_ID" ControlId="TT_ID" ID="TT_ID" runat="server" />                
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <uc2:DanhMucListByLdmMa ControlName="LOAI_ID" ControlId="LOAI_ID" ID="LOAI_ID" runat="server" />                    
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="pull-right">
                        <div class="input-group">
                          <input name="q" type="text" value="<%=Request["q"] %>" class="form-control">
                          <div class="input-group-btn">
                            <a type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:;" class="searchBtn">
                                      <i class="glyphicon glyphicon-search"></i> Tìm
                                  </a></li>
                              <li><a href="/lib/pages/KhachHang/Default.aspx">
                                      <i class="glyphicon glyphicon-remove"></i> Bỏ lọc
                                  </a></li>
                            </ul>
                          </div>
                        </div>            
                    </div>                    
                </div>
            </div>
            </div>
        </div>               
    </div>
    <uc1:DanhSach ID="DanhSach1" runat="server" />
    <ul class="PagingList">
        <%=paging %>
    </ul>
</asp:Content>

