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
    public partial class Expenses : System.Web.UI.Page
        
    {
        SqlConnection con = new SqlConnection("Data source=TAPAN;initial catalog=Account_MS;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridView();
            }
            
        }


        void clear()
        {
            name.Text = "";
            date.Text = "";
            Payment_Mode.Text = "";
            amount.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (name.Text == "" || Payment_Mode.Text == "" || amount.Text == "")
            {
                Response.Write("<script>alert('Must Fill The Field')</script>");
            }
            else
            {
                try
                {
                    string query = "INSERT INTO Expense(Expense_Name, Payment_Mode, Amount) values (@Expense_Name, @Payment_Mode, @Amount)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Expense_Name", name.Text);
                        cmd.Parameters.AddWithValue("@Payment_Mode", Payment_Mode.Text);
                        cmd.Parameters.AddWithValue("@Amount", amount.Text);

                        con.Open();
                        int t = cmd.ExecuteNonQuery();
                        if (t > 0)
                        {
                            Response.Write("<script>alert('Data Saved Successfully')</script>");
                            clear();
                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to save data')</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    
                    Response.Write("<script>alert('An error occurred while saving data')</script>");
                }
                finally
                {
                    con.Close();
                    BindGridView();
                }
            }
        }

       
        protected void BindGridView()
        {
            try
            {
                string query = " SELECT * FROM Expense";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows == true)
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                    }
                }
            }
              
            catch (Exception ex)
            { 

            }
            finally
            {
                con.Close();
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

           
            string Expense_Name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string Date = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string Payment_Mode = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string Amount = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;


            string query = "UPDATE Expense SET Expense_Name = '"+ Expense_Name + "',Payment_Mode = '"+ Payment_Mode + "',Amount = '"+ Amount + "' WHERE Sl_No='"+id+"'"; 
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('Updated Successfully')</script>");
                    GridView1.EditIndex = -1;
                    BindGridView();
                    Response.Redirect("Expenses.aspx");

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
            string query = "DELETE FROM Expense WHERE Sl_No = '" + id + "' ";
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

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            
            
                name.Text = "";
                date.Text = "";
                Payment_Mode.Text = "";
                amount.Text = "";
            Response.Redirect("Expenses.aspx");
           
        }


        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }
    }
}