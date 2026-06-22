<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="ThefinalCats.LoginAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h1{text-align: center; color:#ee2424; }
        table{margin: 0px auto; direction: rtl; text-align: center;}
        input{text-align: center; }
        h2{text-align:center; direction: ltr;  }
        h3{text-align:center; color:maroon; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form method="post" runat="server">
        <h1>כניסת מנהל</h1>
        <table>
            <tr>
                <td>שם מנהל:</td>
                <td><input type="text" name="MName" /></td>
            </tr>
            <tr>
                <td>סיסמה:</td>
                <td><input type="password" name="mPw" /></td>
            </tr>
            <tr>
                <!-- חשוב! לא לשכוח לתת תכרית name -->
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="submit" value="   connect   " />
                </td>
            </tr>
        </table>
        <h2><%= sqlLogin %></h2>
        <h3><%= msg %></h3>
</asp:Content>
