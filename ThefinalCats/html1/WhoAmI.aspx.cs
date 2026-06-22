using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThefinalCats.html1
{
    public partial class WhoAmI : System.Web.UI.Page
    {
        // The game is only available to logged-in visitors.
        protected bool LoggedIn = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            string uName = Session["uName"] as string ?? "";
            string admin = Session["admin"] as string ?? "";
            LoggedIn = (uName != "" && uName != "guest") || admin == "yes";
        }
    }
}
