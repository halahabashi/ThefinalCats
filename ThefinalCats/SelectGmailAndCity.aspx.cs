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
                msg += "<h3>You are not an admin — you don't have permission to view this page</h3>";
                msg += "<a href='" + ResolveUrl("~/html1/mainpage.aspx") + "'>[ continue ]</a>";
                msg += "</div>";
            }
            else
            {
                string fileName = "usersDB.mdf";
                string tableName = "UsersTbl";

                sqlSelect = "SELECT * FROM " + tableName;
                sqlSelect += " where (city = 'Haifa' OR city = 'Nazareth' OR city = 'TelAviv') AND email LIKE '%gmail%'";

                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

                int length = table.Rows.Count;
                if (length == 0) msg = "no registers";
                else
                {
                    st += "<tr>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 100px;'>user name</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 80px;'>password</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 60px;'>last name</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 140px;'>email</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 60px;'>gender</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 100px;'>prefix</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 100px;'>phoneNum</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 60px;'>yearBorn</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 100px;'>city</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 100px;'>football</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 100px;'>swimming</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 100px;'>dancing</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 100px;'>music</th>";
                    st += "<th style='text-align: center; border: 1px solid black; width: 100px;'>computer games</th>";
                    st += "</tr>";
                }

                for (int i = 0; i < length; i++)
                {
                    st += "<tr>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["uName"] + "</td>";
                    st += "<td style = 'border: 1px solid black;'>" + table.Rows[i]["fName"] + "</td>";
                    st += "<td style = 'border: 1px solid black;'>" + table.Rows[i]["lName"] + "</td>";
                    st += "<td style = 'border: 1px solid black; width: 60; text-align:left;'>" + table.Rows[i]["email"] + "</td>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["yearBorn"] + "</td>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["gender"] + "</td>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["prefix"] + table.Rows[i]["phone"] + "</td>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["city"] + "</td>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["hob1"] + "</td>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["hob2"] + "</td>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["hob3"] + "</td>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["hob4"] + "</td>";
                    st += "<td style = 'text-align: center; border: 1px solid black;'>" + table.Rows[i]["pw"] + "</td>";
                    st += "</tr>";
                }
                msg = "registered: " + length + " people";
            }
        }
    }
}
