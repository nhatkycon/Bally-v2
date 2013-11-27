<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Banner.ascx.cs" Inherits="lib_ui_Bally_HeThong_Banner" %>
<%@ Import Namespace="docsoft" %>
<div class="navbar-wrapper">
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">T/Năng<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Thêm</a></li>
                        <li><a href="#">Mới</a></li>
                        <li><a href="#">Danh sách</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">K/Hàng<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Thêm</a></li>
                        <li><a href="#">Mới</a></li>
                        <li><a href="#">Danh sách</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">L/Hẹn<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Thêm</a></li>
                        <li><a href="#">Mới</a></li>
                        <li><a href="#">Danh sách</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">H/Động<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Dịch vụ</a></li>
                        <li><a href="#">Làm dịch vụ</a></li>
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
                  <li><a href="/lib/pages/Rek/My.aspx">Rek của tôi</a></li>
                  <li class="divider"></li>
                  <li>
                      <a href="#about" data-toggle="modal">Rek là gì?</a>
                  </li>
                    <li>
                        <a href="javascript:;" class="logoutbtn">
                              Thoát
                              <i class="icon icon-signout"></i>
                          </a>
                    </li>
                </ul>
              </li>
            <%} %>
            </ul>
            
        </div>
        </div>
    </div>
</div>