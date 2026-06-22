function CheckForm() {
    //בדיקת תקינות שם משתמש
    var uName = document.getElementById("uName").value;
    if (!userNameOK(uName))
        return false;
    //----------------------------------------------------------------------------
    // בדיקת תקינות שם פרטי
    var fName = document.getElementById("fName").value;
    if (fName.length < 2) {
        document.getElementById("mFName").value = "first name is too short or not existed";
        document.getElementById("mFName").style.display = "inline";
        return false;
    }
    else
        document.getElementById("mFName").style.display = "none";
    //---------------------------------------------------------------------------------------------
    //בדיקת תקינות שם משפחה
    var lName = document.getElementById("lName").value;
    if (lName.length < 2) {
        document.getElementById("mLName").value = "last name is too short or not existed";
        document.getElementById("mLName").style.display = "inline";
        return false;
    }
    else
        document.getElementById("mLName").style.display = "none";
    //----------------------------------------------------------------------------------------------
    //בדיקת דואר אלקטרוני
    var email = document.getElementById("email").value;
    emailOK(email)
    //----------------------------------------------------------------------------------------------------
    //בדיקת מספר טלפון
    var phone = document.getElementById("phoneNum").value;
    if (phone.length != 7) {
        document.getElementById("mPhone").value = "phone number must include 7 numbers only";
        document.getElementById("mPhone").style.display = "inline";
        return false;
    }
    else document.getElementById("mPhone").style.display = "none";
    if (isNaN(phone)) {
        document.getElementById("mPhone").value = "phone number should include numbers only";
        document.getElementById("mPhone").style.display = "inline";
        return false;

    }
    else document.getElementById("mPhone").style.display = "none";
    //----------------------------------------------------------------------------------------------------------
    //התשובה שסומנה
    var city = document.getElementById("city").value;

    //האם נבחרה התשובה הראשונה
    if (city == "other") {
        msg = "you should choose city or area";
        document.getElementById("mCity").value = msg;
        document.getElementById("mCity").style.display = "inline";
        msg = "";
        return false;

    }
    else document.getElementById("mCity").style.display = "none";

    //-----------------------------------------------------------------------------------------------------------------

    var hobies = document.getElementsByName("hobies"); //שמירת האפשרויות שסומנו במערך
    var hobChecked = false;  //אתחול משתנה לשקר

    //מעבר על המערך וחיפוש האפשרות שנבחנה
    for (var i = 0; i < hobies.length; i++)
        if (hobies[i].checked) hobChecked = true;

    // אם לא נבחרה אפשרות הצג הודעת שגיאה
    if (hobChecked == false) {
        document.getElementById("mHobies").value = "no chosen hobies";
        document.getElementById("mHobies").style.display = "inline";
        return false;

    }
    else document.getElementById("mHobies").style.display = "none";

    //--------------------------------------------------------------------------------------------------------------------

    // בדיקה עבור סיסמה
    var pw = document.getElementById("pw").value;
    var pw1 = document.getElementById("rePw").value;
    if (pw.length < 6 || pw.length > 8) {
        msg = "password should contain 6-8 characters"
        document.getElementById("mPw").value = msg;
        document.getElementById("mPw").style.display = "inline";
        return false;
    }
    else document.getElementById("mPw").style.display = "none";


    // בדיקת אם הסיסמא שווה לסיסמת האימות
    if (pw != pw1) {
        msg = "the password and confirm password are not the same";
        document.getElementById("mRePw").value = msg;
        document.getElementById("mRePw").style.display = "inline";
        msg = "";
        return false;
    }
    return true;
} // checkForm end



// פעולה המחזירה אמת אם המחרוזת לא מכילה עברית,סימני גרש,גרשיים,סימנים אסורים או שאורכה אינו בתחום של 6 עד 30 תווים ושקר אחרת

function userNameOK(name) {
    var msg = "";
    if (name.length < 6)
        msg = "username is too short or not existed";
    else if (name.length > 30)
        msg = "user name should contain 6-30 characters";
    else if (isHebrew(name))
        msg = "user name cant contain hebrew characters";
    else if (isQuot(name))
        msg = "user name cant contain quotation marks";
    else if (isBadChars(name))
        msg = "user name can contain english letters or/and numbers only";

    if (msg != "") {
        document.getElementById("mUName").value = msg;
        document.getElementById("mUName").style.display = "inline";
        return false;
    }
    else document.getElementById("mUName").style.display = "none";
    return true;
}

//-----------------------------------------------------------------------------------------------------------------------

function emailOK(mail) {

    var msg = "";
    var atSign = mail.indexOf('@');
    var dotSign = mail.indexOf('.', atSign);


    // בדיקת אורך או תווים אסורים

    if (mail.length < 6)
        msg = "this email is too short or not exicted";
    else if (mail.length > 30)
        msg = " email should include 6-30 characters only";
    else if (isHebrew(mail))
        msg = " email cant include hebrew characters ";
    else if (isQuot(mail) || isBadChars(mail))
        msg = " email includes illegal characters ";
    else if (atSign == -1 || atSign != mail.lastIndexOf('@'))
        msg = " email should include one @ exactly";
    else if (dotSign == -1)
        msg = " email should include at least one dot after the @";
    else if (dotSign - atSign < 2)
        msg = " the dot should be after 2 characters from the @";
    else if (dotSign == mail.length - 1 || mail.indexOf('.') == 0)
        msg = " the dot cant appear on the beginning or the ending of the email";
    else if (atSign == 0 || atSign == mail.length -1)
        msg = " @ cant appear on the beginning or the ending of the email";

    //  אם הכל תקין המחרוזת לא תהיה ריקה

    if (msg != "") {
        document.getElementById("mEmail").value = msg;
        document.getElementById("mEmail").style.display = "inline";
        return false;
    }
    else document.getElementById("mEmail").style.display = "none";

}

//אם מכיל גרש או גרשיים לא תקין
function isQuot(str) {

    var quot = '\"', quot1 = '\'';
    if (str.indexOf(quot) != -1 || str.indexOf(quot1) != -1)
        return true;
    return false;
}

//------------------------------------------------------------------------------------------------------------------------------------
// מכיל תווים אסורים

function isBadChars(str) {
    var badChr = "$%^&*()-! []{}<>?";
    var len = badChr.length;

    var i = 0, pos, ch;
    while (i < len) {
        ch = badChr.charAt(i);
        pos = str.indexOf(ch);
        if (pos != -1)
            return true;
        i++;
    }
    return false;
}


//-------------------------------------------------------------------------------------------------------------------
// מכיל תווים בעברית

function isHebrew(str) {

    for (var i = 0; i < str.length; i++) {
        if (str.charAt(i) >= 'א' && str.charAt(i) <= 'ת')
            return true;
    }
    return false;
}


