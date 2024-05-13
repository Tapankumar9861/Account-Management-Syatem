using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_Login.Dsbd_css
{
    public partial class POPUP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
        }

        protected void myBtn_Click(object sender, EventArgs e)
        {

        }

        protected void btnOK_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }
    }
}