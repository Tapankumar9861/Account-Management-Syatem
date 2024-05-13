using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ERP_Login.Dsbd_css
{
    public partial class Add_Item : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN; initial catalog=Account_MS;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtItemName.Text == "")
            {
                Response.Write("<script>alert('Must Fill The Fields')</script>");
            }
            else
            {
                string productName = txtItemName.Text.Trim();

                if (IsProductExists(productName))
                {
                    Response.Write("<script>alert('Product Already Exist')</script>");
                   
                }
                else
                {

                    AddProductToDatabase(productName);
                    Response.Write("<script>alert('Product added successfully!')</script>");
                    
                }
            }
            
            

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Stock_GridView.aspx");

        }

        

        private bool IsProductExists(string productName)
        {
            string query = "SELECT COUNT(*) FROM StockSummary WHERE Product_Name = @ProductName";

            using (SqlConnection connection = new SqlConnection("data source=TAPAN; initial catalog=Account_MS;integrated security=true"))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ProductName", productName);
                    int count = Convert.ToInt32(command.ExecuteScalar());
                    return count > 0;
                }
            }
        }

        private void AddProductToDatabase(string productName)
        {
            string query = "INSERT INTO StockSummary(Product_Name) Values (@Product_Name)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Product_Name", productName);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            //query1();
        }


        //void query1()
        //{
        //    string query = "INSERT INTO Profit(Product_Name) values (@Product_Name)";
        //    using (SqlCommand cmd = new SqlCommand(query,con))
        //    {
        //        cmd.Parameters.AddWithValue("@Product_Name", txtItemName.Text);
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close() ;
        //    }
        //}

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }

        protected void btnRefresh_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Add_Item.aspx");

        }
    }
}