<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Bally.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="lib_pages_ChamSoc_Default" %>
<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc2" %>
<%@ Register src="../../ui/Bally/ChamSoc/DanhSach.ascx" tagname="DanhSach" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="ModuleHeader">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="form-inline">
                <div class="form-group pull-left">
                    <a href="/lib/pages/ChamSoc/Add.aspx" class="btn btn-primary">Thêm</a>
                    <a href="/lib/pages/ChamSoc/Default.aspx" class="btn btn-success">
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
                    <div class="col-sm-4">
                        <div class="form-group">
                            <uc2:DanhMucListByLdmMa ControlName="TT_ID" ControlId="TT_ID" ID="TT_ID" runat="server" />                
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <uc2:DanhMucListByLdmMa ControlName="LOAI_ID" ControlId="LOAI_ID" ID="LOAI_ID" runat="server" />                    
                        </div>
                    </div>
                    <div class="col-sm-4">
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
    <uc1:DanhSach ID="DanhSach1" runat="server" />
    <ul class="pagination">
        <%=paging %>
    </ul>
</asp:Content>

