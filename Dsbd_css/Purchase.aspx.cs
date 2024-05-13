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
    public partial class Purchase : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Account_MS;integrated security=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dataTable = new DataTable();

                using (SqlDataAdapter adapter = new SqlDataAdapter("SELECT TOP (1000) [Product_Name] FROM [Account_MS].[dbo].[StockSummary]", con))
                {
                    adapter.Fill(dataTable);
                }
                

                ddlProduct_Name.DataSource = dataTable;
                ddlProduct_Name.DataTextField = "Product_Name";
                ddlProduct_Name.DataBind();
            }
                
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlProduct_Name.SelectedValue == "" || qty.Text == "" || rate.Text == "" || amt.Text == "" || FGST.Text == "")
            {
                Response.Write("<script>alert('Must Fill The Field')</script>");
            }
            else
            {
                string query = "INSERT INTO Purchase_Invoice(Product_Name, Qty, Rate, Amount, Tax, Net_Amount) VALUES (@Product_Name, @Qty, @Rate, @Amount, @Tax, @Net_Amount)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {

                    cmd.Parameters.AddWithValue("@Product_Name", ddlProduct_Name.SelectedValue);
                    cmd.Parameters.AddWithValue("@Qty", Convert.ToInt32(qty.Text));
                    cmd.Parameters.AddWithValue("@Rate", Convert.ToDecimal(rate.Text));
                    cmd.Parameters.AddWithValue("@Amount", Convert.ToDecimal(amt.Text));
                    cmd.Parameters.AddWithValue("@Tax", Convert.ToDecimal(FGST.Text));
                    cmd.Parameters.AddWithValue("@Net_Amount", Convert.ToDecimal(FNet.Text));

                    con.Open();
                    int t = cmd.ExecuteNonQuery();
                    con.Close();
                    if (t > 0)
                    {
                        Response.Write("<script>alert('Purchase Successfully!')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Purchase not Complited!')</script>");
                    }
                }    
                sqlquery();
                sqlquery1();
            }
        }
        void sqlquery()
        {
            string query = "UPDATE StockSummary SET Stock = (SELECT SUM(Qty) FROM Purchase_Invoice WHERE StockSummary.Product_Name = Purchase_Invoice.Product_Name)";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close() ;

        }

        void sqlquery1()
        {
            string query = "INSERT INTO Profit(Product_Name,Qty,Rate,Net_Amount) values (@Product_Name,@Qty,@Rate,@Net_Amount)";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Product_Name", ddlProduct_Name.SelectedValue);
                cmd.Parameters.AddWithValue("@Qty", qty.Text);
                cmd.Parameters.AddWithValue("@Rate", rate.Text);
                cmd.Parameters.AddWithValue("@Net_Amount", FNet.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Purchase.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Purchase_GridView.aspx");
        }
    }
}