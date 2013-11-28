<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Bally.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="lib_pages_KhachHang_Default" %>

<%@ Register src="~/lib/ui/Bally/KhachHang/DanhSachAll.ascx" tagname="DanhSachAll" tagprefix="uc1" %>

<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="ModuleHeader">
    <div class="panel panel-default">
        <div class="panel-body" role="form">
            <div class="form-inline">
                <div class="form-group pull-left">
                    <a href="/lib/pages/KhachHang/Add.aspx" class="btn btn-primary">Thêm</a>      
                    <a href="/lib/pages/KhachHang/Default.aspx" class="btn btn-success">
                        <i class="glyphicon glyphicon-refresh"></i>
                    </a>
                </div>
                <div class="form-group pull-right">
                    <a href="javascript:;" class="btn btn-default" data-toggle="collapse" data-target="#filtering">
                        <i class="glyphicon glyphicon-search"></i>
                    </a>
                </div>
            </div>
        </div>               
    </div>
    <div id="filtering" class="panel panel-default collapse">
        <div class="panel-body">
            <div class="form-inline">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <uc2:DanhMucListByLdmMa ControlName="NguonGoc_Id" ControlId="NguonGoc_Id" ID="NguonGoc" runat="server" />                
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <uc2:DanhMucListByLdmMa ControlName="KhuVuc_Id" ControlId="KhuVuc_Id" ID="KhuVuc" runat="server" />                    
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <uc2:DanhMucListByLdmMa ID="LinhVuc" ControlName="LinhVuc_Id" ControlId="LinhVuc_Id" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="pull-right">
                            <div class="input-group">
                              <input name="q" type="text" value="<%=Request["q"] %>" class="form-control">
                              <div class="input-group-btn">
                                <a class="btn btn-default searchBtn">
                                    <i class="glyphicon glyphicon-search"></i>
                                </a>                                
                              </div>
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

