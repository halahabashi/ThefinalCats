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
        public string st = "";   // the users table with a delete button per row

        protected void Page_Load(object sender, EventArgs e)
        {
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

            // A per-row delete button links here as DeleteRecord.aspx?uName=foo;
            // when that parameter is present we remove that single user.
            string uName = Request["uName"];
            if (!string.IsNullOrWhiteSpace(uName))
            {
                string safeName = uName.Replace("'", "''"); // avoid breaking on quotes
                Helper.DoQuery(fileName, "DELETE FROM " + tableName + " WHERE uName = N'" + safeName + "'");
                msg = "<h3 style='text-align:center; color:#16a34a;'>Deleted user \"" + Server.HtmlEncode(uName) + "\".</h3>";
            }

            // Always (re)render the current list of users with a delete button.
            string sqlSelect = "SELECT uName, fName, lName FROM " + tableName + " ORDER BY uName";
            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);
            st = BuildDeletableUsersTable(table);
        }

        // Builds a users table (user name / first name / last name) with a
        // Delete button in the last column of every row.
        private string BuildDeletableUsersTable(DataTable dt)
        {
            string thStyle = "border:0; padding:11px 14px; background:#7c3aed; color:#ffffff; font-weight:700; text-align:center; white-space:nowrap;";
            string tdStyle = "border:0; border-top:1px solid #e6e3ef; padding:9px 14px; text-align:center;";

            string s = "<div style='overflow-x:auto;'>";
            s += "<table style='border:0; margin:0 auto; border-collapse:collapse; background:#ffffff; border-radius:14px; overflow:hidden; box-shadow:0 6px 20px rgba(31,36,48,.10);'>";

            s += "<tr>";
            s += "<th style='" + thStyle + "'>user name</th>";
            s += "<th style='" + thStyle + "'>first name</th>";
            s += "<th style='" + thStyle + "'>last name</th>";
            s += "<th style='" + thStyle + "'>action</th>";
            s += "</tr>";

            if (dt.Rows.Count == 0)
                s += "<tr><td style='" + tdStyle + "' colspan='4'>No users yet.</td></tr>";

            int i = 0;
            foreach (DataRow r in dt.Rows)
            {
                string rowBg = (i % 2 == 1) ? " background:#faf8ff;" : "";
                string uName = r["uName"].ToString();
                string deleteUrl = ResolveUrl("~/DeleteRecord.aspx") + "?uName=" + Server.UrlEncode(uName);

                s += "<tr>";
                s += "<td style='" + tdStyle + rowBg + "'>" + Server.HtmlEncode(uName) + "</td>";
                s += "<td style='" + tdStyle + rowBg + "'>" + Server.HtmlEncode(r["fName"].ToString()) + "</td>";
                s += "<td style='" + tdStyle + rowBg + "'>" + Server.HtmlEncode(r["lName"].ToString()) + "</td>";
                s += "<td style='" + tdStyle + rowBg + "'>"
                   + "<a class=\"del-btn\" href=\"" + deleteUrl + "\" onclick=\"return confirm('Are you sure you want to delete this user?');\">Delete</a>"
                   + "</td>";
                s += "</tr>";
                i++;
            }
            s += "</table></div>";
            return s;
        }
    }
}
