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
            if (Request.Form["submit"] == null)
                return;

            string fileName = "usersDB.mdf";
            string tableName = "adminTbl";
            bool loggedIn = false;

            try
            {
                // A fresh database may not contain the admin table yet. Create it
                // (with a default admin account) so the page works instead of
                // throwing "Invalid object name 'adminTbl'".
                EnsureAdminTable(fileName, tableName);

                string mName = Request.Form["mName"];
                string mPw = Request.Form["mPw"];

                sqlLogin = $"SELECT * FROM {tableName} WHERE mName = '{mName}' AND mPw = '{mPw}'";
                DataTable table = Helper.ExecuteDataTable(fileName, sqlLogin);

                if (table.Rows.Count == 0)
                {
                    msg += "<div style='text-align:center;'>";
                    msg += "<h3>you are not admin, you dont have the permission to enter this page</h3>";
                    msg += "<a href='" + ResolveUrl("~/html1/mainpage.aspx") + "'>[   continue   ]</a>";
                    msg += "</div>";
                }
                else
                {
                    Session["admin"] = "yes";
                    Session["userFName"] = "admin";
                    loggedIn = true;
                }
            }
            catch (Exception)
            {
                msg = "<h3 style='text-align:center;'>Login is temporarily unavailable. Please try again later.</h3>";
            }

            // Redirect outside the try so it isn't swallowed by the catch.
            if (loggedIn)
                Response.Redirect("~/html1/AdminPage.aspx");
        }

        // Creates the admin table and a default 'admin' / 'admin' account when
        // they don't exist yet, so a brand-new database doesn't crash the page.
        // Change the seeded password (or add admins) via the admin-setup.sql script.
        private static void EnsureAdminTable(string fileName, string tableName)
        {
            string sql =
                "IF OBJECT_ID('" + tableName + "', 'U') IS NULL " +
                "BEGIN " +
                "  CREATE TABLE [" + tableName + "] (mName NVARCHAR(50) NOT NULL, mPw NVARCHAR(50) NOT NULL); " +
                "  INSERT INTO [" + tableName + "] (mName, mPw) VALUES ('admin', 'admin'); " +
                "END";

            Helper.DoQuery(fileName, sql);
        }
    }
}
