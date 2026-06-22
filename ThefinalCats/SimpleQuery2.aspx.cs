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
    public partial class SimpleQuery2 : System.Web.UI.Page
    {
        public string st = "";  // holds the result table
        public string msg = ""; // shows how many rows match the query
        public string sql = ""; // holds the query text

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] == null)
                return;

            if (Session["admin"].ToString() == "no")
            {
                msg += "<div style='text-align: center; color: red;'>";
                msg += "<h3>You are not an admin &mdash; you don't have permission to view this page</h3>";
                msg += "<a href='" + ResolveUrl("~/html1/mainpage.aspx") + "'>[ continue ]</a>";
                msg += "</div>";
                return;
            }

            string fileName = "usersDB.mdf";
            string tableName = "UsersTbl";

            // Each filter is optional. An empty field means "no filter".
            string cond1 = BuildCondition(Request.Form["field1"], Request.Form["value1"]);
            string cond2 = BuildCondition(Request.Form["field2"], Request.Form["value2"]);
            string cond = Request.Form["cond"];

            sql = "SELECT * FROM " + tableName;
            if (cond1 != "" && cond2 != "")
            {
                string op = (cond == "or") ? "OR" : "AND";
                sql += " WHERE (" + cond1 + ") " + op + " (" + cond2 + ")";
            }
            else if (cond1 != "")
            {
                sql += " WHERE " + cond1;
            }
            else if (cond2 != "")
            {
                sql += " WHERE " + cond2;
            }
            // else: no filter chosen -> show all users

            DataTable table = Helper.ExecuteDataTable(fileName, sql);

            int length = table.Rows.Count;
            if (length == 0) msg = "no users match the search.";
            else
            {
                st = Helper.BuildUsersTable(table);
                msg = length + " user(s) match the search.";
            }
        }

        // Turns a (field, value) pair into a SQL condition, or "" when no
        // filter should be applied for that slot.
        private static string BuildCondition(string field, string value)
        {
            if (string.IsNullOrEmpty(field) || string.IsNullOrEmpty(value) || value == "0")
                return "";

            switch (field)
            {
                case "gender":
                case "prefix":
                case "yearBorn":
                case "city":
                    return field + " = N'" + value + "'";
                case "hobby":
                    return "hob" + value + " = 'T'";   // value is 1..5
                case "email":
                    return field + " LIKE '%" + value + "%'";
                default:
                    return field + " LIKE N'" + value + "%'";
            }
        }
    }
}
