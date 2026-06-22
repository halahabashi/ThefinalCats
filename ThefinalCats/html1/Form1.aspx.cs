using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DbDemo_MSSite;

namespace ThefinalCats.html1
{
    public partial class Form1 : System.Web.UI.Page
    {
        public string st = "";
        public string yrBorn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["Submit"] != null)
            {
                st += "<table dir='rtl' border='1'>";
                st += "<tr><th colspan= '2'>Recieved Details</th></tr>";
                string uName = Request.Form["uName"];
                string fName = Request.Form["fName"];
                string lName = Request.Form["lName"];
                string email = Request.Form["email"];
                string yearBorn = Request.Form["yearBorn"];
                string gender = Request.Form["gender"];
                string prefix = Request.Form["prefix"];
                string phone = Request.Form["phoneNum"];
                string city = Request.Form["city"];
                string hobies = Request.Form["hobies"];
                string passw = Request.Form["pw"];

                //convert the birth year to a number
                int yearB = int.Parse(yearBorn);

                //check the hobbies and convert them to T/F
                char hob1 = 'F', hob2 = 'F', hob3 = 'F', hob4 = 'F' ,hob5 = 'F';
                if (hobies != null)
                {
                    if (hobies.Contains("football")) hob1 = 'T';
                    if (hobies.Contains("swimming")) hob2 = 'T';
                    if (hobies.Contains("dancing")) hob3 = 'T';
                    if (hobies.Contains("music")) hob4 = 'T';
                    if (hobies.Contains("computer games")) hob5 = 'T';
                }

                //connect to the database
                string fileName = "usersDB.mdf";
                string tableName = "usersTbl";

                //check whether the username is already taken
                string sqlSelect = "SELECT * FROM " + tableName + " WHERE uName='" + uName + "'";
                string sqlInsert;

                if (Helper.IsExist(fileName, sqlSelect))
                {
                    st = "user name has been taken";
                }
                else
                {
                    sqlInsert = "INSERT INTO " + tableName;
                    sqlInsert += " VALUES('" + uName + "','" + fName + "','" + lName + "','" + yearB + "','";
                    sqlInsert += email  + "','" + prefix + "','" + phone + "','" + hob1 + "','" + hob2 + "','" + hob3 + "','";
                    sqlInsert += hob4 + "', '"+ hob5 + "','" + passw + "','" + gender + "','" + city + "')";
                    Helper.DoQuery(fileName, sqlInsert);
                }

                st += "<table dir='ltr' align='center' border='1'>";

                st += "<tr><th colspan='2'>Received details</th></tr>";

                st += "<tr><td>User Name:</td><td>" + uName + "</td></tr>";
                st += "<tr><td>First Name:</td><td>" + fName + "</td></tr>";
                st += "<tr><td>Last Name:</td><td>" + lName + "</td></tr>";
                st += "<tr><td>Email:</td><td>" + email + "</td></tr>";
                st += $"<tr><td>yearBorn:</td><td> {yearBorn} </td></tr>";
                st += $"<tr><td>gender:</td><td> {gender} </td></tr>";
                st += $"<tr><td>phoneNum:</td><td> {prefix}-{phone} </td></tr>";
                st += $"<tr><td>city:</td><td> {city} </td></tr>";
                st += $"<tr><td>hobies:</td><td> {hobies} </td></tr>";
                st += "</table>";
            }
            int year = DateTime.Now.Year;
            int from = year - 80;
            int to = year - 15;
            for (int i = from; i < to; i++)
            {
                yrBorn += "<option value = '" + i + "'>" + i + "</option>";
            }
        }
    }
}