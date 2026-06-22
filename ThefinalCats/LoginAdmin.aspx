<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="ThefinalCats.LoginAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .app-main h1 { color: var(--brand-dark); }
        .login-card { max-width: 420px; }
        .login-card table { width:100%; margin:0; box-shadow:none; background:transparent; }
        .login-card td { padding:10px 8px !important; border:0 !important; background:transparent !important; vertical-align:middle; }
        .login-card tr > td:first-child { font-weight:600; color: var(--muted); width:130px; text-align:start; }
        .login-card input[type="text"], .login-card input[type="password"] { width:100%; }
        .login-actions { text-align:center; padding-top:12px !important; }
        .query-echo { color: var(--muted); font-size:.82rem; text-align:center; word-break:break-word; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Admin Login</h1>
    <form method="post" runat="server" class="card login-card">
        <table>
            <tr>
                <td>Admin name</td>
                <td><input type="text" name="MName" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="mPw" /></td>
            </tr>
            <tr>
                <td colspan="2" class="login-actions">
                    <input type="submit" name="submit" value="Connect" />
                </td>
            </tr>
        </table>
    </form>

    <h3 class="msg-error"><%= msg %></h3>
    <p class="query-echo"><%= sqlLogin %></p>
</asp:Content>
