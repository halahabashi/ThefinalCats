<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateUsers.aspx.cs" Inherits="ThefinalCats.html1.UpdateUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        h1 { text-align:center; color:blueviolet;}
        h2 { text-align:center; direction:ltr; }
        h3 { text-align:center; direction:ltr; }
        td { width: 150px; }
        th { color:red; font-family:'Guttman Yad-Brush'; }
        table { margin:0px auto;}
        cbhob { width: 100px;}
    </style> 
                <link href="../Style%20Sheet/StyleSheet.css" rel="stylesheet" />
    <script src="Scipts/Checkform.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1> Update Details </h1>
    
    <form method="post" runat="server" onsubmit="return CheckForm();">
        <table border="0">
            <tr>
                <td> Username </td>
                <td><input type="text" name="uName" disabled="disabled" value="<%= uName %>" /></td>
            </tr>
            <tr>
                <td> Firstname </td>
                <td><input type="text" id="FName" name="fName" value="<%= fName %>" /></td>
                <td><input type="text" id="mFName" name="mFName" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td> Lastname </td>
                <td><input type="text" id="LName" name="lName" value="<%= lName %>" /></td>
                <td><input type="text" id="mLName" name="mLName" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td> Email </td>
                <td><input type="text" id="email" name="email" value="<%= email %>" /></td>
                <td><input type="text" id="mEmail" name="mEmail" size="30"
                    style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td> Gender </td>
                <td>
                    <% if (gender == "male") {  %>
                        <input type="radio" name="gender" value="male" checked /> male
                        <input type="radio" name="gender" value="female" /> female
                        <%}
                            else
                              { %>
                        <input type="radio" name="gender" value="male" /> male
                        <input type="radio" name="gender" value="female" checked /> female
                    <%} %>
                </td>
                      <td></td>
                </tr>
            <tr>
                <td> Year of birth </td>
                <td><select name="yearBorn">
                    <%= yearBorn %>
                    </select>
                </td>
            </tr>
            <tr>
                <td> Phone number </td>

                <td dir="rtl">
                    <input type="text" name="phone" id="phoneNum" size="7" value="<%= phone %>" />
                    &nbsp; - &nbsp;
                    <select name="prefix" id="prefix">
                        <%if (prefix == "02")
                            { %>
                            <option value=02 selected>02</option>
                        <%}
                            else
                            { %>
                               <option value=02>02</option><%} %>

                            <%if (prefix == "04")
                                { %>
                            <option value=04 selected>04</option>
                            <%}
                            else
                            { %> <option value=04 >04</option><%} %>

                            <%if (prefix == "03")
                                 { %>
                                <option value=03 selected>03</option>
                            <%}
                            else
                            { %> <option value=03 >03</option><%} %>

                            <%if (prefix == "08")
                                { %>
                                <option value=08 selected>08</option>
                            <%}
                            else
                                { %>
                                <option value=08 >08</option><%} %>

                            <%if (prefix == "09")
                                { %>
                                <option value=09 selected>09</option>
                            <%}
                            else
                                { %> 
                                <option value=09 >09</option><%} %>

                            <%if (prefix == "077")
                                 { %>
                                <option value=077 selected>077</option>
                            <%}
                            else
                                { %>
                                <option value=077 >077</option><%} %>

                            <%if (prefix == "050")
                                { %>
                                <option value=050 selected>050</option>
                            <%}
                            else
                                { %>
                                <option value=050 >050</option><%} %>

                            <%if (prefix == "052")
                                { %>
                                <option value=052 selected>052</option>
                            <%}
                            else
                                { %> 
                                <option value=052 >052</option><%} %>

                            <%if (prefix == "053")
                                { %>
                                <option value=053 selected>053</option>
                            <%}
                            else
                                { %> 
                                <option value=053 >053</option><%} %>

                            <%if (prefix == "054")
                                { %>
                                <option value=054 selected>054</option>
                            <%}
                            else
                                { %> 
                                <option value=054 >054</option><%} %>

                            <%if (prefix == "055")
                                { %>
                                <option value=055 selected>055</option>
                            <%}
                            else
                                { %> 
                                <option value=055 >055</option><%} %>

                            <%if (prefix == "057")
                                { %>
                                <option value=057 selected>057</option>
                            <%}
                            else
                                { %> 
                                <option value=057 >057</option><%} %>

                            <%if (prefix == "058")
                                { %>
                                <option value=058 selected>058</option>
                            <%}
                            else
                                { %> 
                                <option value=058 >058</option><%} %>

                    </select>

                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td> Resedintal settelment </td>
                <td>
                    <select name="city">
                        <%= cityStr %>
                    </select>
                </td>
                <td>
                </td>
            </tr>

            <tr>
                <td> Hobbies </td>
                <td>
                    <table style="width : 550px;">
                        <tr>
                            <td class="cbhob">
                                <% if (hob1 == "T") { %>
                                    <input type= "checkbox" name = "hobby" value = "1" checked= "checked" />
                                <% } else { %>
                                    <input type= "checkbox" name= "hobby" value= "1" />
                                <% } %> football
                            </td>
                            <td class="cbhob">
                                <% if (hob2 == "T")
                                    { %>
                                    <input type= "checkbox" name = "hobby" value = "2" checked= "checked" />
                                <% } else { %>
                                    <input type= "checkbox" name= "hobby" value= "2"/>
                                <% } %> swimming
                            </td>
                            <td class="cbhob">
                                <% if (hob3 == "T") { %>
                                    <input type= "checkbox" name = "hobby" value = "3" checked= "checked" />
                                <% } else { %>
                                    <input type= "checkbox" name= "hobby" value= "3"/>
                                <% } %> dancing
                            </td>
                            <td class="cbhob">
                                <% if (hob4 == "T") { %>
                                    <input type= "checkbox" name = "hobby" value = "4" checked= "checked" />
                                <% } else { %>
                                    <input type= "checkbox" name= "hobby" value= "4"/>
                                <% } %> music
                            </td>
                            <td class="cbhob">
                                <% if (hob5 == "T") { %>
                                    <input type= "checkbox" name = "hobby" value = "5" checked= "checked" />
                                <% } else { %>
                                    <input type= "checkbox" name= "hobby" value= "5"/>
                                <% } %> computer games


                            </td>
                        </tr>
                    </table>

                </td>

                <td> Password </td>
                <td><input type="password" id="pw" value="<%= pw %>" maxlength="8" /></td>

                <td><input type="text" id="mPw" size="50" style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td> Password Verificaton </td>
                <td><input type="password" id="rePw" name="rePw" value="<%= pw %>" maxlength="8" /></td>
                <td><input type="text" id="mRePw" size="50" style="display:none; background-color:silver; font-weight:bold;" disabled="disabled" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="submit" value=" Update " />
                </td>
            </tr>
        </table>
    </form>
    <br /><br />
        <h2><%= sqlMsg %></h2>
        <h3><%= sqlUpdate %></h3>
        <h3><%= msg %></h3>
</asp:Content>
