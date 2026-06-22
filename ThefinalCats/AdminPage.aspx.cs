using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ThefinalCats
{
    public partial class AdminPage : System.Web.UI.Page
    {
        public string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                msg += "<div style='text-align: center; color: red;'>";
                msg += "<h3>אינך מנהל! אין לך הרשאה לצפות בדף זה</h3>";
                msg += "<a href='mainpage.aspx'>[ המשך ]</a>";
                msg += "</div>";
            }
            else
            {
                msg += "<h3><a href='SimpleQuery.aspx'>שאילתה פשוטה</a></h3>";
                msg += "<h3><a href='SimpleQuery2.aspx'>שאילתה מורכבת</a></h3>";
                msg += "<h3><a href='DeleteUser.aspx'>מחיקת משתמש</a></h3>";
                msg += "<h3><a href='DeleteQuery.aspx'>מחיקת משתמש/ים לפי תנאי</a></h3>";
                msg += "<h3><a href='ShowTable.aspx'>הצגת טבלת משתמשים</a></h3>";

                msg += "<br /><br />";

                msg += "<h3><a href='SelectByLastName.aspx'>כל המשתמשים ששם המשפחה שלהם מכיל האות-ו'</a></h3>";
                msg += "<h3><a href='SelectByFirstName.aspx'>כל המשתמשים שהשם הפרטי שלהם מתחיל ב-ר'</a></h3>";

                msg += "<h3><a href='SelectGmailAndCity.aspx'>Gmail כל המשתמשים שגרים בחיפה, נצרת או תל-אביב וכתובתם</a></h3>";
                msg += "<h3><a href='SelectByGenderAndYearB.aspx'>כל המשתמשים הבנים ששנת הלידה שלהם בין 2005 ל-2008 Gmail</a></h3>";
            }
        }
    }
}
    
