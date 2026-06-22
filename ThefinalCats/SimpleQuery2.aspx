<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SimpleQuery2.aspx.cs" Inherits="ThefinalCats.SimpleQuery2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        h1{ color:red; text-align:center;}
        h2{text-align:center;direction:ltr;}
        h3{text-align:center;}
        .tableDB{border:1px solid black; margin:0px auto;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <script>
        function detectField(fieldNum)
        {
            var selectElement = document.getElementById("field"+ fieldNum);
            var divElement = document.getElementById("query" + fieldNum);
            var selectValue = selectElement.value;
            if (selectValue == "") {
                divElement.innerHTML = "";
                return;
            }
            if (selectValue == "gender") {
                divElement.innerHTML = 
                    "<input type='radio' name='value' + fieldNum + '' value='male' checked='checked'/>male" +
                    "<input type='radio' name='value' + fieldNum + '' value='female'/>female";
            }
            else {
                if (selectValue == "yearBorn") {
                    var yearStr = "<select name='value' + fieldNum + ''><option value='0'>yearBorn</option>";
                    var currYear = new Date().getFullYear();
                    var fromYear = currYear - 40;
                    var toYear = currYear - 10;
                    for (var i = fromYear; i < toYear; i++) {
                        yearStr += "<option value='" + i + "'>" + i + "</option>\n";
                    }
                    divElement.innerHTML = yearStr + "</select>";
                }
                else if (selectValue == "prefix") {
                    var prefixStr = "<select name='value' + fieldNum + ''>";
                    prefixStr += "<option value='050'>050</option>";
                    prefixStr += "<option value='052'>052</option>";
                    prefixStr += "<option value='054'>054</option>";
                    prefixStr += "<option value='057'>057</option>";
                    prefixStr += "<option value='077'>077</option>";
                    prefixStr += "<option value='03'>03</option>";
                    prefixStr += "<option value='02'>02</option>";
                    prefixStr += "<option value='04'>04</option>";
                    prefixStr += "<option value='08'>08</option>";
                    prefixStr += "<option value='09'>09</option>";
                    prefixStr += "</select>";
                    divElement.innerHTML = prefixStr;
                }
                else if (selectValue == "city") {
                    var prefixStr = "< select name = 'value'>";

                    cityStr += "<option value = 'haifa'>haifa</option>";
                    cityStr += "<option value = 'nazareth'>nazareth</option>";
                    cityStr += "<option value = 'yafa'>yafa</option>";
                    cityStr += "<option value = 'TelAviv'>TelAviv</option>";
                    cityStr += "<option value = 'iksal'>iksal</option>";
                    cityStr += "<option value = 'jerusalem'>jerusalem</option>";
                    cityStr += "<option value = 'center'>center</option>";
                    cityStr += "<option value = 'north'>north</option>";
                    cityStr += "<option value = 'south'>south</option>";
                    cityStr += "</select>";
                    divElement.innerHTML = cityStr;
                }
                else if (selectValue == "hobby") {
                    var hobbyStr = "<select name='value' + fieldNum + ''>";
                    hobbyStr += "<option value='1'>football</option>";
                    hobbyStr += "<option value='2'>swimming</option>";
                    hobbyStr += "<option value='3'>dancing</option>";
                    hobbyStr += "<option value='4'>music</option>";
                    hobbyStr += "<option value='5'>computer games</option>";
                    hobbyStr += "</select>";
                    divElement.innerHTML = hobbyStr;
                }
                else {
                    divElement.innerHTML = "<input type='text' name='value' + fieldNum + '' />";
                }
            }
        }
    </script>

    <h1>displaying data by cross-section</h1>
    <div style="text-align:center;">
        <a href="AdminPage.aspx">back to the management page</a>
    </div>

    <form method="post" runat="server">
        <select name="field1" id="field1" onchange="detectField(1);">
            <option value="">--- ללא סינון נוסף ---</option>
            <option value ="lName"> last name</option>
            <option value ="fName"> first name</option>
            <option value ="email"> email</option>
            <option value ="gender"> gender</option>
            <option value ="yearBorn"> yearBorn</option>
            <option value ="prefix"> prefix</option>
            <option value ="phone"> phone</option>
            <option value ="city"> city</option>
            <option value ="hobby"> hobby</option>
        </select>

        <div id="query1" style="display:inline-block; margin-right:10px;"></div>
        <br />
        
        <div id="div">
            <input type="radio" name="cond" value="or" />or
            <input type="radio" name="cond" value="and" />and
        </div>
        
        <label>בחרו חתך שני</label>
        <select name="field2" id="field2" onchange="detectField(2);">
            <option value="">--- ללא סינון נוסף ---</option>
            <option value ="lName"> last name</option>
            <option value ="fName"> first name</option>
            <option value ="email"> email</option>
            <option value ="gender"> gender</option>
            <option value ="yearBorn"> yearBorn</option>
            <option value ="prefix"> prefix</option>
            <option value ="phone"> phone</option>
            <option value ="city"> city</option>
            <option value ="hobby"> hobby</option>
        </select>

        <div id="query2" style="display:inline-block; margin-right:10px;"></div>
        <br /><br />
        <input type="submit" name="submit" value="search" />
    </form>

    <h2><%= sql %></h2>
    <table style="border:1px solid black; margin:0px auto;">
        <%= st %>
    </table>
    <h3><%= msg %></h3>

    <script>detectField(1);</script>
    <script>detectField(2);</script>
</center>
</asp:Content>
