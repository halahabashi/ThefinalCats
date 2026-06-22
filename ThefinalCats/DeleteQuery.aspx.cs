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
    public partial class DeleteQuery : System.Web.UI.Page
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
                msg += "<a href='mainPage.aspx'>continue</a>";
                msg += "</div>";
            }
            else
            {
                //--- store the selected field name and value ---
                string field = Request.Form["field"];
                string value = Request.Form["value"];

                //--- store the database file and table name for the query ---
                string fileName = "usersDB.mdf";
                string tableName = "UsersTbl";

                //--- build the query ---
                string sqlSelect;
                string sqlDelete;

                if (field == "gender" || field == "prefix" || field == "yearBorn" || field == "city")
                {
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " = N'" + value + "');";
                }
                else if (field == "hobby")
                {
                    var val = int.Parse(value);
                    switch (val)
                    {
                        case 1: field = "hob1"; break;
                        case 2: field = "hob2"; break;
                        case 3: field = "hob3"; break;
                        case 4: field = "hob4"; break;
                        case 5: field = "hob5"; break;
                    }
                    sqlSelect = "SELECT * FROM " + tableName + " where " + field + " = 'T';";
                }
                else if (field == "email")
                {
                    sqlSelect = "SELECT * FROM " + tableName + " where " + field + " like '%" + value + "%';";
                }
                else
                {
                    sqlSelect = "SELECT * FROM " + tableName + " where " + field + " like N'" + value + "%';";
                }

                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

                int length = table.Rows.Count;
                if (length == 0) msg = "no registrations;";
                else
                {
                    st = Helper.BuildUsersTable(table);

                    if (field == "gender" || field == "prefix" || field == "yearBorn" || field == "city")
                    {
                        sqlDelete = "DELETE FROM " + tableName + " where (" + field + " = N'" + value + "');";
                    }
                    else if (field == "hobby")
                    {
                        sqlDelete = "DELETE FROM " + tableName + " where " + field + " = 'T';";
                    }
                    else if (field == "email")
                    {
                        sqlDelete = "DELETE FROM " + tableName + " where " + field + " like '%" + value + "%';";
                    }
                    else
                    {
                        sqlDelete = "DELETE FROM " + tableName + " where " + field + " like N'" + value + "%';";
                    }

                    Helper.DoQuery(fileName, sqlDelete);

                    msg = length + " deleted people ;";
                }
            }
        }
    }
}
            
