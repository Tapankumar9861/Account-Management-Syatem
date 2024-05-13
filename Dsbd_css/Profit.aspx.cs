using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ERP_Login.Dsbd_css
{
    public partial class Profit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Account_MS;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                BindGridView();
            }
        }




        protected void BindGridView()
        {
            try
            {
                string query = "SELECT * FROM Profit";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            GridView1.DataSource = reader;
                            GridView1.DataBind();
                        }
                    }
                    con.Close();
                }
            }

            catch(Exception ex)
            {

            }
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                int selectedindex = GridView1.SelectedIndex;
                GridViewRow selectedRow = GridView1.Rows[selectedindex];
                Console.WriteLine("Sl_No:" + selectedRow.Cells[0].Text);
                Console.WriteLine("Product_Name:" + selectedRow.Cells[1].Text);
                Console.WriteLine("Qty:" + selectedRow.Cells[2].Text);
                Console.WriteLine("Rate:" + selectedRow.Cells[3].Text);
                Console.WriteLine("Net_Amount:" + selectedRow.Cells[4].Text);
                Console.WriteLine("Sales_Qty:" + selectedRow.Cells[5].Text);
                Console.WriteLine("Sales_Rate:" + selectedRow.Cells[6].Text);
                Console.WriteLine("Sales_Net_Amount:" + selectedRow.Cells[7].Text);
                Console.WriteLine("Stock_Qty:" + selectedRow.Cells[8].Text);
                Console.WriteLine("Stock_Amount:" + selectedRow.Cells[9].Text);
                Console.WriteLine("Profit_Amount:" + selectedRow.Cells[10].Text);
                
            }
        }

        

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //try
            //{
            //    int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            //    string query = "DELETE FROM Profit   WHERE Sl_No ='" + id + "'";
            //    using (SqlCommand cmd = new SqlCommand(query, con))
            //    {
            //        con.Open();
            //        int t = cmd.ExecuteNonQuery();
            //        if (t > 0)
            //        {
            //            Response.Write("<script>alert('Delete Successfully')</script>");
            //            GridView1.EditIndex = -1;
            //            BindGridView();
            //        }
            //        con.Close();
            //    }
            //}

            //catch(Exception ex)
            //{

            //}
            
        }

        //protected void BtnPrint_Click(object sender, EventArgs e)
        //{
            
        //    BtnPrint.Visible = false;
            
        //    string script = "<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
        //    ClientScript.RegisterStartupScript(this.GetType(), "Print", script);
        //}

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profit.aspx");
        }



        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }
    }
}