﻿<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Bally.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="lib_pages_TiemNang_Add" %>

<%@ Register src="../../ui/Bally/TiemNang/Add.ascx" tagname="Add" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Add ID="Add1" TiemNang="True" runat="server" />
</asp:Content>

