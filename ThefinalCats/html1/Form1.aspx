<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Form1.aspx.cs" Inherits="ThefinalCats.html1.Form1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../javaScript/CheckForm.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Sign-up Form</h1>
<form method="post" runat="server" onsubmit="return CheckForm();">
    <table>
        <tr>
            <td>user name</td>
            <td><input type="text" id="uName" name="uName" /></td>
            <td>
                <input type ="text" id ="mUName" size="30"
                    style =" display:none; background-color:silver; font-weight:bold;"
                    disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>first name</td>
            <td><input type="text" id="fName" name="fName" /></td>
            <td><input type="text" id="mFName" size="30"
                style=" display:none; background-color:silver; font-weight:bold;"
                    disabled="disabled" /></td>
        </tr>
        <tr>
            <td>last name</td>
            <td><input type="text" id="lName" name="lName" /></td>
            <td><input type="text" id="mLName" size="30"
               style=" display:none; background-color:silver; font-weight:bold;"
                   disabled="disabled" /></td>
        </tr>
        <tr>
            <td>mail</td>
            <td><input type="text" id="email" name="email" /></td>
            <td><input type="text" id="mEmail" size="30"
              style=" display:none; background-color:silver; font-weight:bold;"
                  disabled="disabled" /></td>
        </tr>
      
        <tr>
            <td>gender</td>
            <td>
                <input type="radio" name="gender" value="male" checked /> male
                <input type="radio" name="gender" value="female" /> female
           </td>
        </tr>
        <tr>
            <td>year born</td>
            <td><select name ="yearBorn"><%= yrBorn %></select></td>
        </tr>
        <tr>
            <td>phone number</td>
            <td>
                <input type="text" name="phoneNum" id="phoneNum" />
                &nbsp; - &nbsp;
                <select name="prefix">
                    <option value="050">050</option>
                    <option value="052">052</option>
                    <option value="053">053</option>
                    <option value="054">054</option>
                    <option value="055">055</option>
                    <option value="057">057</option>
                    <option value="058">058</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="077">077</option>
                </select>
            </td>
            <td>
                <input type="text" name="mPhone" id="mPhone" size="30"
                    style="display:none; background-color:silver; font-weight:bold;"
                    disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>city</td>
            <td>
                <select name="city" id="city">
                    <option value="other">choose city</option>
                    <option value="haifa">haifa</option>
                    <option value="nazareth">nazareth</option>
                    <option value="yafa">yafa</option>
                    <option value="TelAviv">TelAviv</option>
                    <option value="iksal">iksal</option>
                    <option value="jerusalem">jerusalem</option>
                    <option value="center">center</option>
                    <option value="north">north</option>
                    <option value="south">south</option>
                </select>
            </td>
            <td>
                <input type="text" name="mCity" id="mCity" 
                    style="display:none; background-color:silver; font-weight:bold;"
                      disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td>hobies</td>
            <td> <input type ="checkbox" name ="hobies" value="football" />football &nbsp
                 <input type ="checkbox" name ="hobies" value="swimming" />swimming &nbsp
                 <input type ="checkbox" name ="hobies" value="dancing" />dancing &nbsp
                 <input type ="checkbox" name ="hobies" value="music" />music &nbsp
                 <input type ="checkbox" name ="hobies" value="computer games" />computer games &nbsp

            </td>
             <td>
                <input type="text"  id="mHobies" size="30"
                  style="display:none; background-color:silver; font-weight:bold;"
                     disabled="disabled" />
            </td>

        </tr>
        <tr>
            <td>password</td>
            <td>
                <input type ="password" id="pw" name="pw" size="10" />
                <span style ="color:red;"> 6-10 characters</span>
            </td>
            <td> <input type="text" id="mPw" size="50" style="display:none; background-color:silver; font-weight
                     :bold;" disabled = "disabled" />

            </td>
        </tr>
        <tr>
            <td>confirm password</td>
            <td><input type="password" id="rePw" name="rePw" size="10" /></td>
              <td> <input type="text" id="mRePw" size="50" style="display:none; background-color:silver; font-weight
                       :bold;" disabled="disabled" />

              </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="submit" name="submit" value="  send  " />
            </td>
        </tr>
    </table>
</form>
    <br /><br />
    <div style="text-align:center;">
        <%=st %>
    </div>
</asp:Content>
