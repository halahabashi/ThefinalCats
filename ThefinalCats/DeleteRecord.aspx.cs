using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DbDemo_MSSite;
namespace ThefinalCats
{
    public partial class DeleteRecord : System.Web.UI.Page
    {
        public string msg = "";  // status / error message
        public string st = "";   // table showing the user that was deleted

        protected void Page_Load(object sender, EventArgs e)
        {
            // A username can arrive from the form (POST) or a querystring link
            // (GET, e.g. DeleteRecord.aspx?uName=foo). When none is supplied we
            // just render the empty form instead of crashing.
            string uName = Request["uName"];
            if (string.IsNullOrWhiteSpace(uName))
                return;

            // Admin-only. Null-safe: a fresh session may not have the key set yet.
            string admin = Session["admin"] as string ?? "no";
            if (admin != "yes")
            {
                msg += "<div style='text-align:center; color:red;'>";
                msg += "<h3>You are not an admin — you don't have permission to delete users</h3>";
                msg += "<a href='" + ResolveUrl("~/html1/mainpage.aspx") + "'>[ continue ]</a>";
                msg += "</div>";
                return;
            }

            string fileName = "usersDB.mdf";
            string tableName = "UsersTbl";
            string safeName = uName.Replace("'", "''"); // avoid breaking on quotes

            // Show the user first and only delete when it actually exists.
            string sqlSelect = "SELECT * FROM " + tableName + " WHERE uName = N'" + safeName + "'";
            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

            if (table.Rows.Count == 0)
            {
                msg = "<h3 style='text-align:center;'>No user named \"" + Server.HtmlEncode(uName) + "\" was found.</h3>";
                return;
            }

            st = Helper.BuildUsersTable(table);

            string sqlDelete = "DELETE FROM " + tableName + " WHERE uName = N'" + safeName + "'";
            Helper.DoQuery(fileName, sqlDelete);

            msg = "<h3 style='text-align:center; color:green;'>Deleted user \"" + Server.HtmlEncode(uName) + "\".</h3>";
        }
    }
}
