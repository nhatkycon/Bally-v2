<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Bally.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="lib_pages_KhachHang_Default" %>

<%@ Register src="~/lib/ui/Bally/KhachHang/DanhSachAll.ascx" tagname="DanhSachAll" tagprefix="uc1" %>

<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ModuleHeader panel panel-default">
        <div class="panel-body" role="form">
            <div class="form-inline">
            <div class="row">
                <div class="col-sm-2">
                    <div class="form-group">
                        <a href="/lib/pages/KhachHang/Add.aspx" class="btn btn-primary">Thêm</a>      
                        <a href="/lib/pages/KhachHang/Default.aspx" class="btn btn-success">
                             <i class="glyphicon glyphicon-refresh"></i>
                        </a>                                  
                    </div>
                    
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <uc2:DanhMucListByLdmMa ControlName="NguonGoc_Id" ControlId="NguonGoc_Id" ID="NguonGoc" runat="server" />                
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <uc2:DanhMucListByLdmMa ControlName="KhuVuc_Id" ControlId="KhuVuc_Id" ID="KhuVuc" runat="server" />                    
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <uc2:DanhMucListByLdmMa ID="LinhVuc" ControlName="LinhVuc_Id" ControlId="LinhVuc_Id" runat="server" />
                    </div>
                </div>
                <div class="col-sm-4">
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
    <uc1:DanhSachAll Target="KhachHang" ID="DanhSachAll1" runat="server" />
    <ul class="PagingList">
        <%=paging %>
    </ul>
</asp:Content>

