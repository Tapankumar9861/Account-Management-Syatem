using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ERP_Login.Dsbd_css
{
    public partial class Balance_Sheet : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data source=TAPAN;initial catalog=Account_MS;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            btnPrint.Visible = false;
            string script = "<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Print", script);
        }
    }
}