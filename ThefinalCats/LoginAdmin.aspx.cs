using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DbDemo_MSSite;

namespace ThefinalCats
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlLogin = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)
            {
                //--- שליפת הנתונים מהטופס ---
                string mName = Request.Form["mName"];
                string mPw = Request.Form["mPw"];
                //--- קישור למסד הנתונים ---
                string fileName = "usersDB.mdf";
                string tableName = "adminTbl";

                //--- שאילתת האיחזור ---
                sqlLogin = $"SELECT * FROM {tableName} WHERE mName = '{mName}' AND mPw = '{mPw}'";
                DataTable table = Helper.ExecuteDataTable(fileName, sqlLogin);

                int length = table.Rows.Count;
                if (length == 0)
                {
                    msg += "<div style='text-align:center;'>";
                    msg += "<h3>you are not admin, you dont have the permission to enter this page</h3>";
                    msg += "<a href='mainpage.aspx'>[   continue   ]</a>";
                    msg += "</div>";
                }
                else
                {
                    //--- יצירת Session אובריקט למשתמש ---
                    Session["admin"] = "yes";
                    Session["userFName"] = "admin";
                    Response.Redirect("mainpage.aspx");
                }
            }
        }
    }
}
    
