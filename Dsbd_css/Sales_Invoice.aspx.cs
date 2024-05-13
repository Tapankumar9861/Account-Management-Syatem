using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Threading.Tasks;
using System.Reflection.Emit;

namespace ERP_Login.Dsbd_css
{
    public partial class Sales_Invoice : System.Web.UI.Page
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

                ddlParticular.DataSource = dataTable;
                ddlParticular.DataTextField = "Product_Name";
                ddlParticular.DataBind();
            }



            if (!IsPostBack)
            {
                string query = "SELECT TOP 1 Inv_No FROM Sales_Invoice ORDER BY Inv_No DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    int newInvNo = -1;
                    if (reader.Read())
                    {
                        int lastInvNo = Convert.ToInt32(reader["Inv_No"]);
                        newInvNo = lastInvNo + 1;
                    }
                    else
                    {
                        newInvNo = 1;
                    }
                    Inv1_Notxt.Text = newInvNo.ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)

        {
            if (Customer_Nametxt.Text == "" || Addresstxt.Text == "" || Citytxt.Text == "" || ddlParticular.SelectedValue == "" || qty.Text == "" || rate.Text == "" || amt.Text == "")
            {
                Response.Write("<script>alert('Must Fill The Field')</script>");
            }

            else
            {
                sqlquery1();
                sqlquery3();
                sqlquery4();
                Response.Redirect("POPUP.aspx");
            }

            //string particular = Particular.Text;
            //string[] particularArr = particular.Split(',');
            //string Qty = qty.Text;
            //string[] QtyArr = Qty.Split(',');
            //string Rate = rate.Text;
            //string[] rateArr = Rate.Split(',');
            //string Ammount = amt.Text;
            //string[] amtArr = Ammount.Split(',');
            //string invoiceNo = Inv1_Notxt.Text;            
            //sqlquery2();
            //for (int index = 0; index < particularArr.Length; index++)
            //{
            //    SaveData(particularArr[index], QtyArr[index], rateArr[index], amtArr[index], invoiceNo);
            //}








        }
        void sqlquery1()
        {
            string query = "INSERT INTO [Account_MS].[dbo].[Sales_Invoice] (Inv_No,Customer_Name,Address,City,Particular,Quantity,Rate,Amount,Total,Tax,Discount,Net_Amount) values (@Inv_No,@Customer_Name,@Address,@City,@Particular,@Quantity,@Rate,@Amount,@Total,@Tax,@Discount,@Net_Amount)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Inv_No", Inv1_Notxt.Text);
            cmd.Parameters.AddWithValue("@Customer_Name", Customer_Nametxt.Text);
            cmd.Parameters.AddWithValue("@Address", Addresstxt.Text);
            cmd.Parameters.AddWithValue("@Particular", ddlParticular.Text);
            cmd.Parameters.AddWithValue("@Quantity", qty.Text);
            cmd.Parameters.AddWithValue("@Rate", rate.Text);
            cmd.Parameters.AddWithValue("@Amount", amt.Text);
            cmd.Parameters.AddWithValue("@Total", FTotal.Text);
            cmd.Parameters.AddWithValue("@Tax", FGST.Text);
            cmd.Parameters.AddWithValue("@Discount", FDisc.Text);
            cmd.Parameters.AddWithValue("@Net_Amount", FNet.Text);
            con.Open();
            cmd.Parameters.AddWithValue("@City", Citytxt.Text);
            int t = Convert.ToInt32(cmd.ExecuteNonQuery());
            if (t > 0)
            {
                Response.Write("<script>alert('Data successfully Save!')</script>");
            }
            con.Close();

        }

        //void sqlquery2()
        //{
        //    string query = "INSERT INTO[Account_MS].[dbo].[Sales_Product](Inv_No,Particular,Quantity,Rate,Amount) values (@Inv_No,@Particular,@Quantity,@Rate,@Amount)";
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@Inv_No", Inv1_Notxt.Text);
        //    cmd.Parameters.AddWithValue("@Particular", ddlParticular.SelectedValue  );
        //    cmd.Parameters.AddWithValue("@Quantity", qty.Text);
        //    cmd.Parameters.AddWithValue("@Rate", rate.Text);
        //    cmd.Parameters.AddWithValue("@Amount", amt.Text);
        //    con.Open();
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //}



        //private void SaveData(string itemName, string itemQty, string itemRate, string itemAmount, string invNo)
        //{
        //    string query = "INSERT INTO [Account_MS].[dbo].[Sales_Product] (Inv_No,Particular,Quantity,Rate,Amount) values (@Inv_No,@Particular,@Quantity,@Rate,@Amount)";
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@Inv_No", invNo);
        //    cmd.Parameters.AddWithValue("@Particular", itemName);
        //    cmd.Parameters.AddWithValue("@Quantity", itemQty);
        //    cmd.Parameters.AddWithValue("@Rate", itemRate);
        //    cmd.Parameters.AddWithValue("@Amount", itemAmount);
        //    con.Open();
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //}


        void sqlquery3()
        {
            string query = "UPDATE StockSummary SET Sale_Product = (SELECT SUM(CONVERT(BIGINT, Quantity)) FROM Sales_Invoice WHERE StockSummary.Product_Name = Sales_Invoice.Particular)";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }


        void sqlquery4()
        {
            String query = "UPDATE Profit SET Sales_Qty = ISNULL(s.Sales_Qty, 0),Sales_Rate = ISNULL(s.Sales_Rate, 0),Sales_Net_Amount = ISNULL(s.Sales_Net_Amount, 0)FROM Profit p JOIN (SELECT Particular,SUM(Quantity) AS Sales_Qty,AVG(Rate) AS Sales_Rate, SUM(Net_Amount) AS Sales_Net_Amount FROM Sales_Invoice GROUP BY Particular) s ON p.Product_Name = s.Particular";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sales_Invoice_GridView.aspx");
            btnUpdate.Visible = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }

       
    }
}