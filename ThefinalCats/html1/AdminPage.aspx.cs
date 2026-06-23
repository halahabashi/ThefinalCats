using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ThefinalCats
{
    public partial class AdminPage : System.Web.UI.Page
    {
        public string msg = "";
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
                msg += "<h3><a href='" + ResolveUrl("~/SimpleQuery.aspx") + "'>Simple query</a></h3>";
                msg += "<h3><a href='" + ResolveUrl("~/SimpleQuery2.aspx") + "'>Advanced query</a></h3>";
                msg += "<h3><a href='" + ResolveUrl("~/DeleteQuery.aspx") + "'>Delete users by condition</a></h3>";
                msg += "<h3><a href='" + ResolveUrl("~/ShowTable.aspx") + "'>Show users table</a></h3>";
                msg += "<h3><a href='" + ResolveUrl("~/DeleteRecord.aspx") + "'>Delete users </a></h3>";
                msg += "<br /><br />";

                msg += "<h3><a href='" + ResolveUrl("~/SelectByFirstName.aspx") + "'>Users whose first name starts with the letter a</a></h3>";
                msg += "<h3><a href='" + ResolveUrl("~/SelectByLastName.aspx") + "'>Users whose last name contains the letter m</a></h3>";

                msg += "<h3><a href='" + ResolveUrl("~/SelectGmailAndCity.aspx") + "'>Users living in Haifa, Nazareth or Tel-Aviv with a Gmail address</a></h3>";
                msg += "<h3><a href='" + ResolveUrl("~/SelectByGenderAndYearB.aspx") + "'>Male users born between 2005 and 2008</a></h3>";
            }
        }
    }
}
    
