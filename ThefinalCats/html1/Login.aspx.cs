using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DbDemo_MSSite;

namespace ThefinalCats.html1
{
    public partial class Login : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlLogin = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"]!=null) {
                string uName = Request.Form["uName"];
                string pw = Request.Form["pw"];

                string fileName = "usersDB.mdf";
                string tableName = "UsersTbl";

                sqlLogin = $"SELECT * from {tableName} WHERE uName ='{uName}' and pw = '{pw}'";
                DataTable table = Helper.ExecuteDataTable(fileName, sqlLogin);

                int length = table.Rows.Count;
                if (length == 0)
                    msg = "Username is not found";
                else
                {
                    Application.Lock();
                    Application["counter"] = (int)Application["counter"] + 1;
                    Application.UnLock();

                    Session["uName"] = table.Rows[0]["uName"];
                    Session["userFName"] = table.Rows[0]["fName"];
                    Response.Redirect("MainPage.aspx");
                }

            }
        }
    }
}
        
 