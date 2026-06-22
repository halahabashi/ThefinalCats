<%@ Page Title="Advanced query" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SimpleQuery2.aspx.cs" Inherits="ThefinalCats.SimpleQuery2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .app-main h1 { color: var(--brand-dark); }
        .query-form { max-width: 620px; }
        .query-form select, .query-form input[type="text"] { margin: 4px; }
        .query-row { margin: 10px 0; }
        .query-hint { color: var(--muted); font-size: .88rem; }
        .query-echo { color: var(--muted); font-size: .85rem; text-align: center; word-break: break-word; }
    </style>
    <script>
        function detectField(fieldNum) {
            var divElement = document.getElementById("query" + fieldNum);
            var selectValue = document.getElementById("field" + fieldNum).value;
            var name = "value" + fieldNum;

            if (selectValue == "") { divElement.innerHTML = ""; return; }

            if (selectValue == "gender") {
                divElement.innerHTML =
                    "<input type='radio' name='" + name + "' value='male' checked='checked'/> male " +
                    "<input type='radio' name='" + name + "' value='female'/> female";
            }
            else if (selectValue == "yearBorn") {
                var yearStr = "<select name='" + name + "'><option value='0'>year</option>";
                var currYear = new Date().getFullYear();
                for (var i = currYear - 40; i < currYear - 10; i++)
                    yearStr += "<option value='" + i + "'>" + i + "</option>";
                divElement.innerHTML = yearStr + "</select>";
            }
            else if (selectValue == "prefix") {
                var prefixes = ["050", "052", "054", "057", "077", "03", "02", "04", "08", "09"];
                var prefixStr = "<select name='" + name + "'>";
                for (var p = 0; p < prefixes.length; p++)
                    prefixStr += "<option value='" + prefixes[p] + "'>" + prefixes[p] + "</option>";
                divElement.innerHTML = prefixStr + "</select>";
            }
            else if (selectValue == "city") {
                var cities = ["Haifa", "Nazareth", "Yafa", "TelAviv", "iksal", "Jerusalem", "center", "north", "south"];
                var cityStr = "<select name='" + name + "'>";
                for (var c = 0; c < cities.length; c++)
                    cityStr += "<option value='" + cities[c] + "'>" + cities[c] + "</option>";
                divElement.innerHTML = cityStr + "</select>";
            }
            else if (selectValue == "hobby") {
                var hobbyStr = "<select name='" + name + "'>";
                hobbyStr += "<option value='1'>football</option>";
                hobbyStr += "<option value='2'>swimming</option>";
                hobbyStr += "<option value='3'>dancing</option>";
                hobbyStr += "<option value='4'>music</option>";
                hobbyStr += "<option value='5'>computer games</option>";
                divElement.innerHTML = hobbyStr + "</select>";
            }
            else {
                divElement.innerHTML = "<input type='text' name='" + name + "'/>";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Advanced query</h1>
    <div style="text-align:center;">
        <a href="<%= ResolveUrl("~/html1/AdminPage.aspx") %>">back to the management page</a>
    </div>

    <form method="post" runat="server" class="card query-form" style="text-align:center;">
        <p class="query-hint">Pick one or two filters &mdash; or leave them empty to show all users.</p>

        <div class="query-row">
            <select name="field1" id="field1" onchange="detectField(1);">
                <option value="">--- no filter ---</option>
                <option value="lName">last name</option>
                <option value="fName">first name</option>
                <option value="email">email</option>
                <option value="gender">gender</option>
                <option value="yearBorn">year born</option>
                <option value="prefix">prefix</option>
                <option value="phone">phone</option>
                <option value="city">city</option>
                <option value="hobby">hobby</option>
            </select>
            <span id="query1"></span>
        </div>

        <div class="query-row">
            <input type="radio" name="cond" value="and" checked="checked" /> and
            <input type="radio" name="cond" value="or" /> or
        </div>

        <div class="query-row">
            <select name="field2" id="field2" onchange="detectField(2);">
                <option value="">--- no second filter ---</option>
                <option value="lName">last name</option>
                <option value="fName">first name</option>
                <option value="email">email</option>
                <option value="gender">gender</option>
                <option value="yearBorn">year born</option>
                <option value="prefix">prefix</option>
                <option value="phone">phone</option>
                <option value="city">city</option>
                <option value="hobby">hobby</option>
            </select>
            <span id="query2"></span>
        </div>

        <input type="submit" name="submit" value="Search" />
    </form>

    <p class="query-echo"><%= sql %></p>
    <%= st %>
    <h3 style="text-align:center;"><%= msg %></h3>

    <script>detectField(1); detectField(2);</script>
</asp:Content>
