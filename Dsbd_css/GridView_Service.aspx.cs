using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERP_Login.Dsbd_css
{
    public partial class GridView : System.Web.UI.Page
    {
        SqlConnection con =new SqlConnection("data source=TAPAN;initial catalog=Account_MS;integrated security=true");
        
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
                
                int selectedIndex = GridView1.SelectedIndex;

                
                
                GridViewRow selectedRow = GridView1.Rows[selectedIndex];

                
                Console.WriteLine("Student_Name: " + selectedRow.Cells[0].Text);
                Console.WriteLine("Student_Id: " + selectedRow.Cells[1].Text);
                Console.WriteLine("Branch: " + selectedRow.Cells[2].Text);
                Console.WriteLine("Date: " + selectedRow.Cells[3].Text);
                Console.WriteLine("Place: " + selectedRow.Cells[4].Text);
                Console.WriteLine("Course_Fee: " + selectedRow.Cells[5].Text);
                Console.WriteLine("Deposit: " + selectedRow.Cells[6].Text);
                Console.WriteLine("Remaining_Amount: " + selectedRow.Cells[7].Text);
            }
        }
        private void BindGridView()
        {
            string query = "  SELECT Sl_No,Student_Name,Student_Id,Branch,Date,Place,Course_Fee,Deposit,Remaining_AMT FROM Payment_Service";
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

        

        

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            string Student_Name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Branch = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Place = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Course_Fee = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Deposit = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string Remaining_AMT = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            string query = "UPDATE Payment_Service SET Student_Name = '"+ Student_Name + "',Branch = '"+ Branch + "', Place = '"+ Place + "', Course_Fee = '"+ Course_Fee + "', Deposit = '"+ Deposit + "', Remaining_AMT = '"+ Remaining_AMT + "' WHERE Sl_No = '"+id+"' ";
            using (SqlCommand cmd = new SqlCommand(query,con))
            {
                con.Open();
                int t = cmd.ExecuteNonQuery();
                if( t> 0 )
                {
                    Response.Write("<script>alert('Data Updated Successfully!')</script>");
                    GridView1.EditIndex = -1;
                    BindGridView();
                }
                else
                {
                    Response.Write("<script>alert('Data Not Updated!')</script>");
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

            string query = "DELETE  FROM Payment_Service WHERE Sl_No = '"+id+"' ";
            using (SqlCommand cmd = new SqlCommand(query,con))
            {
                con.Open() ;
                int t = cmd.ExecuteNonQuery();
                if( t> 0 )
                {
                    Response.Write("<script>alert('Data Delete Successfully ')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Data Not Delete  ')</script>");
                }
                con.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string Student_Id = txtSearch.Text.Trim();
            if(!string.IsNullOrEmpty(Student_Id))
            {
                string query = "SELECT * FROM Payment_Service WHERE Student_Id = @Student_Id ";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Student_Id", Student_Id);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                    con.Close();
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
            Response.Redirect("GridView_Service.aspx");
        }
    }
}