<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateUsers.aspx.cs" Inherits="ThefinalCats.html1.UpdateUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .app-main h1 { color: var(--brand-dark); }
        .profileBanner { text-align:center; margin: 0 auto 22px; }
        .profileBanner img {
            width:100%; max-width:520px; height:auto;
            border-radius:16px; box-shadow: var(--shadow-lg);
        }
        .form-card { max-width: 640px; }
        .form-card table { width:100%; margin:0; box-shadow:none; background:transparent; }
        .form-card td { padding:9px 10px !important; vertical-align:middle; border:0 !important; background:transparent !important; }
        .form-card tr > td:first-child { font-weight:600; color: var(--muted); width:170px; text-align:start; }
        .form-card input[type="text"], .form-card input[type="password"], .form-card select { width:100%; }
        .form-card .phone-row { display:flex; align-items:center; gap:8px; }
        .form-card .phone-row .prefix { flex:0 0 90px; width:auto; }
        .form-card .phone-row input[type="text"] { flex:1; width:auto; }
        .form-card .hobbies { display:flex; flex-wrap:wrap; gap:6px 18px; }
        .form-card .cbhob { display:inline-flex; align-items:center; gap:6px; font-size:.92rem; white-space:nowrap; }
        .form-card .cbhob input { width:auto; }
        .form-actions { text-align:center; padding-top:14px !important; }
        .query-echo { color: var(--muted); font-size:.82rem; word-break:break-word; text-align:center; margin:2px 0; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1> Update Details </h1>

    <div class="profileBanner">
        <img src="<%= ResolveUrl("~/html1/Pics/update-banner.jpg") %>" alt="Cats" />
    </div>

    <form method="post" runat="server" class="card form-card">
        <table border="0">
            <tr>
                <td>Username</td>
                <td><input type="text" name="uName" disabled="disabled" value="<%= uName %>" /></td>
            </tr>
            <tr>
                <td>First name</td>
                <td><input type="text" id="fName" name="fName" value="<%= fName %>" /></td>
            </tr>
            <tr>
                <td>Last name</td>
                <td><input type="text" id="lName" name="lName" value="<%= lName %>" /></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" id="email" name="email" value="<%= email %>" /></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <% if (gender == "male") { %>
                        <label class="cbhob"><input type="radio" name="gender" value="male" checked /> male</label>
                        <label class="cbhob"><input type="radio" name="gender" value="female" /> female</label>
                    <% } else { %>
                        <label class="cbhob"><input type="radio" name="gender" value="male" /> male</label>
                        <label class="cbhob"><input type="radio" name="gender" value="female" checked /> female</label>
                    <% } %>
                </td>
            </tr>
            <tr>
                <td>Year of birth</td>
                <td><select name="yearBorn"><%= yearBorn %></select></td>
            </tr>
            <tr>
                <td>Phone number</td>
                <td>
                    <div class="phone-row" dir="ltr">
                        <select name="prefix" id="prefix" class="prefix">
                            <%if (prefix == "02") { %><option value="02" selected>02</option><%} else { %><option value="02">02</option><%} %>
                            <%if (prefix == "03") { %><option value="03" selected>03</option><%} else { %><option value="03">03</option><%} %>
                            <%if (prefix == "04") { %><option value="04" selected>04</option><%} else { %><option value="04">04</option><%} %>
                            <%if (prefix == "08") { %><option value="08" selected>08</option><%} else { %><option value="08">08</option><%} %>
                            <%if (prefix == "09") { %><option value="09" selected>09</option><%} else { %><option value="09">09</option><%} %>
                            <%if (prefix == "050") { %><option value="050" selected>050</option><%} else { %><option value="050">050</option><%} %>
                            <%if (prefix == "052") { %><option value="052" selected>052</option><%} else { %><option value="052">052</option><%} %>
                            <%if (prefix == "053") { %><option value="053" selected>053</option><%} else { %><option value="053">053</option><%} %>
                            <%if (prefix == "054") { %><option value="054" selected>054</option><%} else { %><option value="054">054</option><%} %>
                            <%if (prefix == "055") { %><option value="055" selected>055</option><%} else { %><option value="055">055</option><%} %>
                            <%if (prefix == "057") { %><option value="057" selected>057</option><%} else { %><option value="057">057</option><%} %>
                            <%if (prefix == "058") { %><option value="058" selected>058</option><%} else { %><option value="058">058</option><%} %>
                            <%if (prefix == "077") { %><option value="077" selected>077</option><%} else { %><option value="077">077</option><%} %>
                        </select>
                        <span>-</span>
                        <input type="text" name="phone" id="phoneNum" value="<%= phone %>" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>Residential settlement</td>
                <td><select name="city" id="city"><%= cityStr %></select></td>
            </tr>
            <tr>
                <td>Hobbies</td>
                <td>
                    <div class="hobbies">
                        <label class="cbhob"><input type="checkbox" name="hobby" value="1" <%= hob1 == "T" ? "checked" : "" %> /> football</label>
                        <label class="cbhob"><input type="checkbox" name="hobby" value="2" <%= hob2 == "T" ? "checked" : "" %> /> swimming</label>
                        <label class="cbhob"><input type="checkbox" name="hobby" value="3" <%= hob3 == "T" ? "checked" : "" %> /> dancing</label>
                        <label class="cbhob"><input type="checkbox" name="hobby" value="4" <%= hob4 == "T" ? "checked" : "" %> /> music</label>
                        <label class="cbhob"><input type="checkbox" name="hobby" value="5" <%= hob5 == "T" ? "checked" : "" %> /> computer games</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" id="pw" name="pw" value="<%= pw %>" maxlength="8" /></td>
            </tr>
            <tr>
                <td>Password verification</td>
                <td><input type="password" id="rePw" name="rePw" value="<%= pw %>" maxlength="8" /></td>
            </tr>
            <tr>
                <td colspan="2" class="form-actions">
                    <input type="submit" name="submit" value="Update" />
                </td>
            </tr>
        </table>
    </form>

    <h3 class="msg-ok"><%= msg %></h3>
    <p class="query-echo"><%= sqlMsg %></p>
    <p class="query-echo"><%= sqlUpdate %></p>
</asp:Content>
