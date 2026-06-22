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
    public partial class UpdateUsers : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlMsg = "";
        public string sqlSelect = "";
        public string sqlUpdate = "";
        public string yearList = "";
        public string cityStr = "";

        public string yearBorn = "";
        public string uName, fName, lName, email, prefix, phone, gender, pw;
        public string cities, city, hob1, hob2, hob3, hob4, hob5;
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "usersDB.mdf";
            uName = Session["uName"].ToString();

            if (uName == "guest")
            {
                msg = "You aren't registerd in the system";
                msg += "<a href = 'LogIn.aspx'><[continue]</a>";
            }
            else
            {
                sqlSelect = "SELCET * FROM UsersTbl WHERE uName= '" + uName + "'";
                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);
                sqlMsg = sqlSelect;

                int length = table.Rows.Count;
                if (length == 0)
                {
                    msg = "You aren't registerd in the system";
                    msg += "<a href = 'Login.aspx'><[continue]</a>";
                }
                else
                {
                    fName = table.Rows[0]["fName"].ToString().Trim();
                    lName = table.Rows[0]["lName"].ToString().Trim();
                    email = table.Rows[0]["email"].ToString().Trim();
                    prefix = table.Rows[0]["prefix"].ToString().Trim();
                    phone = table.Rows[0]["phone"].ToString().Trim();
                    gender = table.Rows[0]["gender"].ToString().Trim();
                    city = table.Rows[0]["city"].ToString().Trim();
                    hob1 = table.Rows[0]["hob1"].ToString().Trim();
                    hob2 = table.Rows[0]["hob2"].ToString().Trim();
                    hob3 = table.Rows[0]["hob3"].ToString().Trim();
                    hob4 = table.Rows[0]["hob4"].ToString().Trim();
                    hob5 = table.Rows[0]["hob5"].ToString().Trim();

                    int yBorn = Convert.ToInt16(table.Rows[0]["yearBorn"].ToString().Trim());

                    pw = table.Rows[0]["pw"].ToString().Trim();

                    int year = DateTime.Now.Year;
                    int from = year - 50;
                    int to = year - 7;

                    for (int i = from; i < to; i++)
                    {
                        if (i == yBorn)
                            yearBorn += $"<option value = '{i}' selected> {i} </option>";
                        else
                            yearBorn += $"<option value = '" + i + "'>" + i + "</option";
                    }
                }


                string[] cities = { "Haifa", "Nazareth", "Yafa", "TelAviv","iksal" , "Jerusalem", "center","north" , "south" };
                for (int i = 0; i < cities.Length; i++)
                {
                    if (cities[i] == city)
                        cityStr += $"<option value ='{cities[i]}' selected>{cities[i]}</option>";
                    else
                        cityStr += $"<option value ='{cities[i]}'>{cities[i]}</option>";
                }

                if (this.IsPostBack)
                {
                    fName = Request.Form["fName"];
                    lName = Request.Form["LName"];
                    email = Request.Form["email"];
                    gender = Request.Form["gender"];
                    prefix = Request.Form["prefix"];
                    phone = Request.Form["phone"];
                    city = Request.Form["city"];
                    int yearBrn = int.Parse(Request.Form["yearBorn"]);

                    pw = Request.Form["pw"];

                    string hobby = Request.Form["hobby"].ToString();

                    hob1 = "F";
                    hob2 = "F";
                    hob3 = "F";
                    hob4 = "F";
                    hob5 = "F";

                    if (hobby.Contains("1")) hob1 = "T";
                    if (hobby.Contains("2")) hob2 = "T";
                    if (hobby.Contains("3")) hob3 = "T";
                    if (hobby.Contains("4")) hob4 = "T";
                    if (hobby.Contains("5")) hob5 = "T";

                    sqlUpdate = "UPDATE UsersTbl ";
                    sqlUpdate += "WHERE uName = '" + uName + "'";
                    sqlUpdate += "SET fName =N'" + fName + "', ";
                    sqlUpdate += "lName = N'" + lName + "', ";
                    sqlUpdate += "yearBorn = " + yearBrn.ToString() + ", ";
                    sqlUpdate += "email = '" + email + "', ";
                    sqlUpdate += "prefix = '" + prefix + "', ";
                    sqlUpdate += "phone = '" + phone + "', ";
                    sqlUpdate += "hob1 = '" + hob1 + "', ";
                    sqlUpdate += "hob2 = '" + hob2 + "', ";
                    sqlUpdate += "hob3 = '" + hob3 + "', ";
                    sqlUpdate += "hob4 = '" + hob4 + "', ";
                    sqlUpdate += "hob4 = '" + hob5 + "', ";
                    sqlUpdate += "pw = '" + pw + "' ";
                    sqlUpdate += "gender = '" + gender + "', ";
                    sqlUpdate += "city = N'" + city + "', ";
                   



                    Helper.DoQuery(fileName, sqlUpdate);

                    msg = "Succsess ";

                }
            }
        }
    }
}


