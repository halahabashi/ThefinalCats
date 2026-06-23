<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DeleteRecord.aspx.cs" Inherits="ThefinalCats.DeleteRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        h1 { color:#7c3aed; text-align:center; }
        .del-btn {
            display:inline-block; padding:6px 14px; background:#e11d48; color:#fff;
            border-radius:8px; text-decoration:none; font-weight:600;
        }
        .del-btn:hover { background:#be123c; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Delete a user</h1>
        <div style="text-align:center;">
            <a href="<%= ResolveUrl("~/html1/AdminPage.aspx") %>">back to the management page</a>
        </div>

        <%= msg %>
        <%= st %>

        <div style="text-align:center; margin-top:18px;">
            <a href="<%= ResolveUrl("~/html1/AdminPage.aspx") %>">back to the management page</a>
        </div>
    </center>
</asp:Content>
