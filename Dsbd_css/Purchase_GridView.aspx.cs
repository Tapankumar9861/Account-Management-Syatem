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
    public partial class Purchase_GridView : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data source=TAPAN;initial catalog=Account_MS;integrated security=true");
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
                string query = "SELECT * FROM Purchase_Invoice";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows == true)
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

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            
            string Product_Name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string Qty          = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string Rate         = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string Amount       = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Tax          = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text;
            string Net_Amount   = ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
            string Date         = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text;

            

            

            try
            {
                string query = "UPDATE Purchase_Invoice SET Qty = '" + Qty + "',Rate ='" + Rate + "',Amount='" + Amount + "',Tax='" + Tax + "',Net_Amount='" + Net_Amount + "' WHERE Sl_No ='" + id + "' ";
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
            
            catch (Exception ex)
            {

            }
            finally
            {
                Response.Redirect("Purchase_GridView.aspx");
            }
        }

        

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                string query = "DELETE FROM Purchase_Invoice WHERE Sl_No = '"+id+"'";
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
                }
            }
            catch (Exception ex)
            {
                
                Response.Write("<script>alert('An error occurred: " + ex.Message + "')</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Purchase_GridView.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }
    }
}