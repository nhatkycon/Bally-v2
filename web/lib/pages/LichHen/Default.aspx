<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Bally.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="lib_pages_LichHen_Default" %>
<%@ Register src="~/lib/ui/Bally/HeThong/DanhMucListByLdmMa.ascx" tagname="DanhMucListByLdmMa" tagprefix="uc2" %>
<%@ Register src="~/lib/ui/Bally/LichHen/DanhSach.ascx" tagname="DanhSach" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">       
    <div class="panel panel-default ModuleHeader">
        <div class="panel-body" role="form">
            <div class="form-inline">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <a href="/lib/pages/LichHen/Add.aspx" class="btn btn-primary">Thêm</a>      
                        <a href="" class="btn btn-success">
                             <i class="glyphicon glyphicon-refresh"></i>
                        </a>                                  
                    </div>
                    
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <uc2:DanhMucListByLdmMa ControlName="DM_ID" ControlId="DM_ID" ID="DM_ID" runat="server" />                
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
    <uc1:DanhSach ID="DanhSach1" runat="server" />
    <ul class="pagination">
        <%=paging %>
    </ul>
</asp:Content>

