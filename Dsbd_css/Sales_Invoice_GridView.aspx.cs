using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace ERP_Login.Dsbd_css
{
    public partial class Sales_Invoice_GridView : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Account_MS;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                int selectedindex = GridView1.SelectedIndex;

                GridViewRow selectedRow = GridView1.Rows[selectedindex];
                Console.WriteLine("Sl_No:" + selectedRow.Cells[0].Text);
                Console.WriteLine("Inv_No" + selectedRow.Cells[1].Text);
                Console.WriteLine("Customer_Name :" + selectedRow.Cells[2].Text);
                Console.WriteLine("Address:" + selectedRow.Cells[3].Text);
                Console.WriteLine("Inv_Date:" + selectedRow.Cells[4].Text);
                Console.WriteLine("City:" + selectedRow.Cells[5].Text);
                Console.WriteLine("Particular:" + selectedRow.Cells[6].Text);
                Console.WriteLine("Quantity:" + selectedRow.Cells[7].Text);
                Console.WriteLine("Rate:" + selectedRow.Cells[8].Text);
                Console.WriteLine("Amount:" + selectedRow.Cells[9].Text);
                Console.WriteLine("Total:" + selectedRow.Cells[10].Text);
                Console.WriteLine("Tax:" + selectedRow.Cells[11].Text);
                Console.WriteLine("Discount:" + selectedRow.Cells[12].Text);
                Console.WriteLine("Net_Amount:" + selectedRow.Cells[13].Text);
            }
        }

        

        private void BindGridView()
        {
            try
            {
                string query = "SELECT * FROM Sales_Invoice";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
              
                Console.WriteLine("An error occurred: " + ex.Message);
            }
            finally
            {
               
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }




        }


        

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
               GridView1.EditIndex = e.NewEditIndex;
               BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
           
                string Customer_Name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
                string City = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
                string Particular = ((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text;
                string Quantity = ((TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Text;
                string Rate = ((TextBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[0]).Text;
                string Amount = ((TextBox)GridView1.Rows[e.RowIndex].Cells[11].Controls[0]).Text;
                string Total = ((TextBox)GridView1.Rows[e.RowIndex].Cells[12].Controls[0]).Text;
                string Tax = ((TextBox)GridView1.Rows[e.RowIndex].Cells[13].Controls[0]).Text;
                string Discount = ((TextBox)GridView1.Rows[e.RowIndex].Cells[14].Controls[0]).Text;
                string Net_Amount = ((TextBox)GridView1.Rows[e.RowIndex].Cells[15].Controls[0]).Text;
            

            


            string query = "Update Sales_Invoice set Customer_Name='" + Customer_Name + "',Particular='" + Particular + "',Quantity = '" + Quantity + "',Rate = '" + Rate + "',Amount='" + Amount + "',Total='" + Total + "',Tax='" + Tax + "',Discount='" + Discount + "',Net_Amount='" + Net_Amount + "' WHERE Inv_No='"+id+"' ";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('Updated Successfully')</script>");
                    GridView1.EditIndex = -1;
                    BindGridView();
                }
                con.Close();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string query = "DELETE FROM Sales_Invoice WHERE Inv_No='"+id+"'";
            using (SqlCommand cmd = new SqlCommand(query,con))
            {
                con.Open();
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('Delete Successfully')</script>");
                    GridView1.EditIndex = -1;
                    BindGridView();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(searchText))
            {
                string query = "SELECT * FROM Sales_Invoice WHERE Inv_No = @Inv_No ";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Inv_No", searchText);
                    con.Open();
                    SqlDataReader reader= cmd.ExecuteReader();
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                    
                }

            }
            else
            {
                Response.Write("<script>alert('Data Not Found')</script>");
                BindGridView();
            }
            
          
            
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sales_Invoice_GridView.aspx");
        }



        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }
    }
}