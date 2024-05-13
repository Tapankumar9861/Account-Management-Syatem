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
    public partial class Bank_Reconciliation_GridView : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Account_MS;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }


        protected void BindGridView()
        {
            try
            {
                string query = "SELECT * FROM Bank_Reconciliation";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        GridView1.DataSource = dr;
                        GridView1.DataBind();

                    }
                }
                con.Close();
            }

            catch (Exception ex)
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
                Console.WriteLine("Payment_Mode:" + selectedRow.Cells[1].Text);
                Console.WriteLine("Status:" + selectedRow.Cells[2].Text);
                Console.WriteLine("Date:" + selectedRow.Cells[3].Text);
                Console.WriteLine("Opening_Balance:" + selectedRow.Cells[4].Text);
                Console.WriteLine("Total_Balance:" + selectedRow.Cells[5].Text);
                Console.WriteLine("Particular:" + selectedRow.Cells[6].Text);
                Console.WriteLine("Referance:" + selectedRow.Cells[7].Text);
                Console.WriteLine("Payment_Type:" + selectedRow.Cells[8].Text);
                Console.WriteLine("Bank_Name:" + selectedRow.Cells[9].Text);
                Console.WriteLine("Amount:" + selectedRow.Cells[10].Text);
                Console.WriteLine("Total:" + selectedRow.Cells[11].Text);
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


            string Payment_Mode = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string Status = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Particular = ((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text;
            string Referance = ((TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Text;
            string Payment_Type = ((TextBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[0]).Text;
            string Bank_Name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[11].Controls[0]).Text;
            string Amount = ((TextBox)GridView1.Rows[e.RowIndex].Cells[12].Controls[0]).Text;
            string Total = ((TextBox)GridView1.Rows[e.RowIndex].Cells[13].Controls[0]).Text;



            string query = "UPDATE Bank_Reconciliation SET Payment_Mode = '" + Payment_Mode + "',Status = '" + Status + "',Particular = '" + Particular + "', Referance = '" + Referance + "',Payment_Type ='" + Payment_Type + "',Bank_Name = '" + Bank_Name + "',Amount = '" + Amount + "',Total = '" + Total + "' WHERE Sl_No = '" + id + "' ";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('Data Update Successfully')</script>");
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
            try
            {
                int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                string query = "DELETE FROM Bank_Reconciliation WHERE Sl_No = '" + id + "'";
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

        protected void BtnPrint_Click(object sender, EventArgs e)
        {
            BtnPrint.Visible = false;
            string script = "<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Print", script);
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bank_Reconciliation_GridView.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }

        protected void btnBack_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }
    }
}