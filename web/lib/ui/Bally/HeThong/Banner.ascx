<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Banner.ascx.cs" Inherits="lib_ui_Bally_HeThong_Banner" %>
<%@ Import Namespace="docsoft" %>
<div class="navbar-wrapper">
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">
                <span class="logo">Bally</span>
            </a>            
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Thêm<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/lib/pages/TiemNang/Add.aspx">Tiềm năng</a></li>
                        <li><a href="/lib/pages/KhachHang/Add.aspx">Khách hàng</a></li>
                        <li><a href="/lib/pages/ChamSoc/Add.aspx">Chăm sóc</a></li>
                        <li><a href="/lib/pages/LichHen/Add.aspx">Lịch hẹn</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Marketing<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/lib/pages/TiemNang/Default.aspx">Tiềm năng</a></li>
                        <li><a href="/lib/pages/KhachHang/Default.aspx">Khách hàng</a></li>
                        <li><a href="/lib/pages/ChamSoc/Default.aspx">Chăm sóc</a></li>
                        <li><a href="/lib/pages/LichHen/Default.aspx">Lịch hẹn</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Hoạt động<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/lib/pages/DichVu/Default.aspx">Dịch vụ</a></li>
                        <li><a href="/lib/pages/LamDichVu/Default.aspx">Làm dịch vụ</a></li>
                    </ul>
                </li>
            </ul>
            <%--<div class="navbar-form navbar-left">
                <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Tìm</button>
            </div>--%>
            <ul class="nav navbar-nav navbar-right">
              <li>
                  <%if(Security.IsAuthenticated()){ %>
                  
                  <%}else{ %>
                  <a href="javascript:;" class="loginbtn">
                      Đăng nhập
                  </a>
                  <%} %>
                  
              </li>
            <%if(Security.IsAuthenticated()){ %>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=Security.Username %> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="divider"></li>
                    <li>
                        <a href="javascript:;" class="logoutbtn"> Thoát <i class="icon icon-signout"></i>
                          </a>
                    </li>
                </ul>
              </li>
            <%} %>
            </ul>            
        </div>
    </div>
</div>