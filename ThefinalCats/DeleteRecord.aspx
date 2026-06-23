<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DeleteRecord.aspx.cs" Inherits="ThefinalCats.DeleteRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        h1 { color:#7c3aed; text-align:center; }
        .delete-form { text-align:center; margin:18px 0; }
        .delete-form input[type=text] { padding:8px 10px; }
        .delete-form input[type=submit] { padding:8px 16px; cursor:pointer; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Delete a user</h1>
        <div style="text-align:center;">
            <a href="<%= ResolveUrl("~/html1/AdminPage.aspx") %>">back to the management page</a>
        </div>

        <form method="post" runat="server" class="delete-form">
            <label>User name to delete:
                <input type="text" name="uName" />
            </label>
            <input type="submit" name="submit" value="Delete user" />
        </form>

        <%= msg %>
        <%= st %>

        <div style="text-align:center; margin-top:18px;">
            <a href="<%= ResolveUrl("~/html1/AdminPage.aspx") %>">back to the management page</a>
        </div>
    </center>
</asp:Content>
