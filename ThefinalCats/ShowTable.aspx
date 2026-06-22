<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShowTable.aspx.cs" Inherits="ThefinalCats.ShowTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
         h1{color:red; text-align:center;}
         h2{text-align:center;direction:ltr;}
         h3{text-align:center;}
         .tableDB{border:1px solid black; margin:0px auto;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1> users table</h1>
    <div style="text-align:center;">
        <a href ="<%= ResolveUrl("~/html1/AdminPage.aspx") %>"> Back to administration</a>
    </div>
    <h2> <%= sqlSelect %></h2>
    <%= st %>
    <h3><%= msg %></h3>


</asp:Content>
