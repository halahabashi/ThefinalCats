using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThefinalCats
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        // Exposed to the master markup to render the header user area.
        protected bool LoggedIn = false;
        protected string DisplayName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string uName = Session["uName"] as string ?? "";
            string fName = Session["userFName"] as string ?? "";
            string admin = Session["admin"] as string ?? "";

            // A visitor is "logged in" once they have a real user name (the
            // default for guests is "guest"), or once they are an admin.
            LoggedIn = (uName != "" && uName != "guest") || admin == "yes";

            // Prefer the friendly first name; fall back to the user name.
            DisplayName = (fName != "" && fName != "guest") ? fName : uName;
        }
    }
}