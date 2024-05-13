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
    public partial class Stock : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Account_MS;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {

            try
            {
                string query = "SELECT * from StockSummary";
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

                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                

                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
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
                Console.WriteLine("Stock:" + selectedRow.Cells[2].Text);
                Console.WriteLine("Sale_Product:" + selectedRow.Cells[3].Text);
                Console.WriteLine("Avl_Product:" + selectedRow.Cells[4].Text);
                
            }
        }



        protected void BtnPrint_Click(object sender, EventArgs e)
        {
            BtnPrint.Visible = false;
            string script = "<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Print", script);
        }





        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            string Product_Name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
         
            string query = "UPDATE StockSummary SET  Product_Name = '" + Product_Name + "' WHERE Sl_No ='" + id + "' ";
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
            string query = "DELETE FROM StockSummary WHERE Sl_No ='" + id + "'";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('Delete Successfully')</script>");
                    GridView1.EditIndex = -1;
                    BindGridView();
                }
                con.Close();
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Stock_GridView.aspx");
            Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Item.aspx");
            Visible = false;
        }
    }
}