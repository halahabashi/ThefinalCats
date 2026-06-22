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
        public string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"].ToString() == "no")
            {
                msg += "<h3>";
                msg += "you are not admin";
                msg += "you dont have permission to enter the administration page";
                msg += "</h3>";
                msg += "";
            }
            else
            {
                string fileName = "usersDB.mdf";
                string uName = Request.QueryString["uName"].ToString();
                string sqlDelete = "Delete from usersTbl where uName ='" + uName + "'";
                Helper.DoQuery(sqlDelete, fileName);
            }
            Response.Redirect("DeleteUser.aspx");
        }
    }
}