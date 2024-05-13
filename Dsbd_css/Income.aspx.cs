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
    public partial class Income1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data source=TAPAN;initial catalog=Account_MS;integrated security = true");
        protected void Page_Load(object sender, EventArgs e)
        {
            table();
        }


        protected void table()
        {
            DataTable dt = new DataTable();
            using (SqlDataAdapter adapter = new SqlDataAdapter("SELECT TOP(100) Product_Name FROM StockSummary ",con))
            {
                adapter.Fill(dt);   
            }
            ddllist.DataSource = dt;
            ddllist.DataTextField = "Product_Name";
            ddllist.DataBind();
        }
    }
}