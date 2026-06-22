<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ThefinalCats.html1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        h1{text-align: center; color:#ee2424;}
        table{margin: 0px auto; direction:rtl; text-align:center;}
        input{text-align:center;}
        h2{text-align:center; direction:ltr;}
        h3{text-align:center; color:maroon;}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form method="post" runat="server">
        <h1> Log In </h1>
        <table>
            <tr>
                <td> Username :</td>
                <td><input type="text" name="uname" /></td>
            </tr>
            <tr>
                <td> Password :</td>
                <td><input type="password" name="pw" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="submit" value=" Log In " />
                </td>
            </tr>
        </table>
        <h2><%= sqlLogin %></h2>
        <h3><%= msg %></h3>
    </form>
</asp:Content>
