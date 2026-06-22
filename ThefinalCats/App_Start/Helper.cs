
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Hosting;

/// <summary>
/// Summary description for Helper
/// </summary>
/// 

namespace DbDemo_MSSite
{
    public class Helper
    {
        public static SqlConnection ConnectToDb(string fileName)
        {
            //string path = HttpContext.Current.Server.MapPath("App_Data/usersDB.mdf");
            //string connString = @"Data Source=.\SQLEXPRESS;AttachDbFileName=" + path + ";Integrated Security=True;User Instance=True";
            //string connString = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = |DataDirectory|\" + fileName + " Integrated Security = True";
            //string connString = @"";

            //string connString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + path + ";Integrated Security=True;Connect Timeout=30";
            
			string dbName = fileName;
			//string dbName = "usersDB.mdf";
            string connString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" + HostingEnvironment.ApplicationPhysicalPath + "App_Data\\"+ dbName + ";Integrated Security=True";


            SqlConnection conn = new SqlConnection(connString);
            return conn;
        }

        public static void DoQuery(string fileName, string sql)
        {
            SqlConnection conn = ConnectToDb(fileName);
            conn.Open();
            SqlCommand com = new SqlCommand(sql, conn);
            com.ExecuteNonQuery();
            conn.Close();
        }



        public static bool IsExist(string fileName, string sql)
        {

            SqlConnection conn = ConnectToDb(fileName);
            conn.Open();
            SqlCommand com = new SqlCommand(sql, conn);
            SqlDataReader data = com.ExecuteReader();

            bool found = Convert.ToBoolean(data.Read());
            conn.Close();
            return found;

        }

        public static DataTable ExecuteDataTable(string fileName, string sql)
        {
            SqlConnection conn = ConnectToDb(fileName);
            conn.Open();

            DataTable dt = new DataTable();

            SqlDataAdapter tableAdapter = new SqlDataAdapter(sql, conn);

            tableAdapter.Fill(dt);
            conn.Close();

            return dt;
        }

        // Builds the &lt;tr&gt; header + data rows for a DataTable. Headers and
        // cells are generated from the SAME column order, so they can never
        // become misaligned. Known columns get a friendly label.
        public static string BuildUsersTable(DataTable dt)
        {
            string thStyle = "border:0; padding:11px 14px; background:#7c3aed; color:#ffffff; font-weight:700; text-align:center; white-space:nowrap;";
            string tdStyle = "border:0; border-top:1px solid #e6e3ef; padding:9px 14px; text-align:center;";

            string s = "<div style='overflow-x:auto;'>";
            s += "<table style='border:0; margin:0 auto; border-collapse:collapse; background:#ffffff; border-radius:14px; overflow:hidden; box-shadow:0 6px 20px rgba(31,36,48,.10);'>";

            s += "<tr>";
            foreach (DataColumn c in dt.Columns)
                s += "<th style='" + thStyle + "'>" + PrettyLabel(c.ColumnName) + "</th>";
            s += "</tr>";

            int i = 0;
            foreach (DataRow r in dt.Rows)
            {
                string rowBg = (i % 2 == 1) ? " background:#faf8ff;" : "";
                s += "<tr>";
                foreach (DataColumn c in dt.Columns)
                    s += "<td style='" + tdStyle + rowBg + "'>" + r[c] + "</td>";
                s += "</tr>";
                i++;
            }
            s += "</table></div>";
            return s;
        }

        private static string PrettyLabel(string col)
        {
            switch (col.ToLower())
            {
                case "uname": return "user name";
                case "fname": return "first name";
                case "lname": return "last name";
                case "email": return "email";
                case "gender": return "gender";
                case "yearborn": return "year born";
                case "city": return "city";
                case "prefix": return "prefix";
                case "phone": return "phone";
                case "hob1": return "football";
                case "hob2": return "swimming";
                case "hob3": return "dancing";
                case "hob4": return "music";
                case "hob5": return "computer games";
                case "pw": return "password";
                default: return col;
            }
        }

    }
}



