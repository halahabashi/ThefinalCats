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
    public partial class SelectGmailAndCity : System.Web.UI.Page
    {
        public string st = "";
        public string msg = "";
        public string sqlSelect = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                msg += "<div style='text-align: center; color: red;'>";
                msg += "<h3>You are not an admin &mdash; you don't have permission to view this page</h3>";
                msg += "<a href='" + ResolveUrl("~/html1/mainpage.aspx") + "'>[ continue ]</a>";
                msg += "</div>";
            }
            else
            {
                string fileName = "usersDB.mdf";
                string tableName = "UsersTbl";

                sqlSelect = "SELECT * FROM " + tableName + " where (city = 'Haifa' OR city = 'Nazareth' OR city = 'TelAviv') AND email LIKE '%gmail%'";

                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

                int length = table.Rows.Count;
                if (length == 0) msg = "no registers";
                else
                {
                    st = Helper.BuildUsersTable(table);
                    msg = "registered: " + length + " people";
                }
            }
        }
    }
}
