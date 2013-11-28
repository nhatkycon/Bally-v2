<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Bally.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="lib_pages_Log_View" %>
<%@ Register src="../../ui/Bally/Log/View.ascx" tagname="View" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:View ID="View1" runat="server" />
</asp:Content>

