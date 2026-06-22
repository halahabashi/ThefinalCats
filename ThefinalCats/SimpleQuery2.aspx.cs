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
        public string st = ""; // holds the result table
        public string msg = ""; // shows how many rows match the query
        public string sql = ""; // holds the query text
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] == null)
            {
                return;
            }
            if (Session["admin"].ToString() == "no")
            {
                msg += "<div style='text-align: center; color: red;'>";
                msg += "<h3>you are not admin, you dont have the permission to enter this page</h3>";
                msg += "<a href='Animals.aspx'>continue</a>";
                msg += "</div>";
            }
            else
            {
                //--- store the selected field name and value ---
                string field1 = Request.Form["field1"];
                string value1 = Request.Form["value1"];
                string field2 = Request.Form["field2"];
                string value2 = Request.Form["value2"];
                string cond = Request.Form["cond"];

                //--- store the database file and table name for the query ---
                string fileName = "usersDB.mdf";
                string tableName = "UsersTbl";

                //--- build the query ---
                string sqlSelect1;
                string sqlSelect2;

                if (field1 == "gender" || field1 == "prefix" || field1 == "yearBorn" || field1 == "city")
                    sqlSelect1 = field1 + " = '" + value1 + "'";
                else if (field1 == "hobby")
                {
                    var val = int.Parse(value1);
                    switch (val)
                    {
                        case 1: field1 = "hob1"; break;
                        case 2: field1 = "hob2"; break;
                        case 3: field1 = "hob3"; break;
                        case 4: field1 = "hob4"; break;
                        case 5: field1 = "hob5"; break;
                    }
                    sqlSelect1 = field1 + " = 'T'";
                }
                else if (field1 == "email")
                {
                    sqlSelect1 = field1 + " LIKE '%" + value1 + "%'";
                }
                else
                {
                    sqlSelect1 = field1 + " LIKE N'" + value1 + "%'";
                }

                if (field2 == "gender" || field2 == "prefix" || field2 == "yearBorn" || field2 == "city")
                    sqlSelect2 = field2 + " = '" + value2 + "'";
                else if (field2 == "hobby")
                {
                    var val = int.Parse(value2);
                    switch (val)
                    {
                        case 1: field2 = "hob1"; break;
                        case 2: field2 = "hob2"; break;
                        case 3: field2 = "hob3"; break;
                        case 4: field2 = "hob4"; break;
                        case 5: field2 = "hob5"; break;
                    }
                    sqlSelect2 = field2 + " = 'T'";
                }
                else if (field2 == "email")
                {
                    sqlSelect2 = field2 + " LIKE '%" + value2 + "%'";
                }
                else
                {
                    sqlSelect2 = field2 + " LIKE N'" + value2 + "%'";
                }

                sql = "SELECT * FROM " + tableName + " WHERE ";

                if (cond == "or")
                {
                    // parentheses are required inside the SQL (OR condition)
                    sql += "(" + sqlSelect1 + ") OR (" + sqlSelect2 + ")";
                }
                else if (cond == "and") // or any other "and" case
                {
                    // (AND condition)
                    sql += "(" + sqlSelect1 + ") AND (" + sqlSelect2 + ")";
                }
                else sql += sqlSelect1;

                DataTable table = Helper.ExecuteDataTable(fileName, sql);

                int length = table.Rows.Count;
                if (length == 0) msg = "no registrations;";
                else
                {
                    st = Helper.BuildUsersTable(table);
                    msg = length + " people respond to the search result ;";
                }
            }
        }
    }
}
        
  