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
    public partial class Bank_Reconciliation : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Account_MS;integrated security=true");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(!IsPostBack)
            //{
            //    string query5 = "SELECT TOP 1 Sl_No FROM Bank_Reconciliation ORDER BY Sl_No DESC";
            //    SqlCommand cmd = new SqlCommand(query5);
            //    con.Open();
            //}



            string query = "data source=TAPAN;initial catalog=Account_MS;integrated security=true";
            SqlConnection con = new SqlConnection(query);

            string query3 = "SELECT  top 1 Total_Money  FROM Payment_Service order by Sl_No desc ";
            SqlCommand cmd1 = new SqlCommand(query3, con);
            con.Open();
            using (SqlDataReader userReader = cmd1.ExecuteReader())
            {
                if(userReader.Read())
                {
                    string Total_Money = userReader["Total_Money"].ToString();
                    txtTotalBalance.Text = Total_Money;
                }
            }
            con.Close();

                String Select_Mode = ddlMode.Text;
            if(Select_Mode == "Cash")
            {
                string query1 = "SELECT TOP 1 Total_Cash  FROM Payment_Service_Table";
                SqlCommand cmd = new SqlCommand(query1, con);
                con.Open();
                using (SqlDataReader userRead = cmd.ExecuteReader())
                {
                    if (userRead.Read())
                    {
                        string OpeningBalance = userRead["Total_Cash"].ToString();
                        txtOpeningBalance.Text = OpeningBalance;
                    }
                }
                con.Close();
            }
            else if(Select_Mode =="Online")
            {
               string query2 = "SELECT TOP 1 Total_Online  FROM Payment_Service_Table;";
               SqlCommand cmd = new SqlCommand(query2, con);
               con.Open();
                using (SqlDataReader userRead = cmd.ExecuteReader())
                {
                    if(userRead.Read())
                    {
                        string OpeningBalance = userRead["Total_Online"].ToString();
                        txtOpeningBalance.Text = OpeningBalance;
                    }
                }

            }
            
            if(!IsPostBack)
            {
                ddlPayment_Type.SelectedValue = "SelectedValueOnInitialLoad";
            }
           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //if(ddlMode.SelectedValue == "" || ddlStatus.SelectedValue == "" || Particular.Text =="" || Reference.Text == "" || ddlPayment_Type.SelectedValue == "" || amt.Text == "")
            //{
            //    Response.Write("<script>alert('Must Fill The Field')</script>");
            //}

            if(string.IsNullOrEmpty(ddlMode.SelectedValue) || string.IsNullOrEmpty(ddlStatus.SelectedValue) || string.IsNullOrEmpty(Particular.Text) || string.IsNullOrEmpty(Reference.Text) || string.IsNullOrEmpty(ddlPayment_Type.SelectedValue))
            {
                //Response.Write("<script>alert('Must Fill The Field')</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Must fill in all fields.');", true);
                return;
            }
            else
            {
                string query = "INSERT INTO Bank_Reconciliation(Payment_Mode,Status,Opening_Balance,Total_Balance,Particular,Referance,Payment_Type,Bank_Name,Amount,Total) Values(@Payment_Mode,@Status,@Opening_Balance,@Total_Balance,@Particular,@Referance,@Payment_Type,@Bank_Name,@Amount,@FTotal)";
                SqlCommand cmd = new SqlCommand (query, con);
                cmd.Parameters.AddWithValue("@Payment_Mode", ddlMode.SelectedValue);
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@Opening_Balance", txtOpeningBalance.Text);
                cmd.Parameters.AddWithValue("@Total_Balance", txtTotalBalance.Text);
                cmd.Parameters.AddWithValue("@Particular", Particular.Text);
                cmd.Parameters.AddWithValue("@Referance", Reference.Text);
                cmd.Parameters.AddWithValue("@Payment_Type", ddlPayment_Type.SelectedValue);
                cmd.Parameters.AddWithValue("@Bank_Name", BankNametxt.Text);
                cmd.Parameters.AddWithValue("@Amount", amt.Text);
                cmd.Parameters.AddWithValue("@FTotal", FTotal.Text);
                con.Open ();
                cmd.ExecuteNonQuery ();
                con.Close ();
                //Response.Redirect(Request.RawUrl);
            }

            string Select_Status = ddlStatus.SelectedValue;

            if(Select_Status == "Received")
            {
                string query = "UPDATE Payment_Service SET Total_Money = (Total_Money + (SELECT top 1 Total FROM Bank_Reconciliation order by Sl_No desc))";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close ();

                string SelectedValue = ddlPayment_Type.SelectedValue;

                if (SelectedValue == "Cash")
                {
                    string query1 = "UPDATE Payment_Service_Table SET Total_Cash = (Total_Cash + (SELECT top 1 Total FROM Bank_Reconciliation order by Sl_No desc))";
                    SqlCommand cmd1 = new SqlCommand (query1, con);
                    con.Open();
                    cmd1.ExecuteNonQuery ();
                    con.Close ();
                }
                else
                {
                    string query1 = "UPDATE Payment_Service_Table SET Total_Online = (Total_Online + (SELECT top 1 Total FROM Bank_Reconciliation order by Sl_No desc))";
                    SqlCommand cmd1 = new SqlCommand(query1, con);
                    con.Open();
                    cmd1.ExecuteNonQuery ();
                    con.Close ();
                }
            }
            else  
            {
                string query = "UPDATE Payment_Service SET Total_Money = (Total_Money - (SELECT top 1 Total FROM Bank_Reconciliation order by Sl_No desc))";
                SqlCommand cmd = new SqlCommand (query, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close ();

                string SelectedValue = ddlPayment_Type.SelectedValue;

                if (SelectedValue == "Cash")
                {
                    string query1 = "UPDATE Payment_Service_Table SET Total_Cash =(Total_Cash - (SELECT top 1 Total FROM Bank_Reconciliation order by Sl_No desc))";
                    SqlCommand cmd1 = new SqlCommand (query1 , con);
                    con.Open();
                    cmd1.ExecuteNonQuery ();
                    con.Close ();
                }
                else
                {
                    string query1 = "UPDATE Payment_Service_Table SET Total_Online =(Total_Online - (SELECT top 1 Total FROM Bank_Reconciliation order by Sl_No desc))";
                    SqlCommand cmd1 = new SqlCommand(query1 ,con);
                    con.Open();
                    cmd1.ExecuteNonQuery ();
                    con.Close ();
                }
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bank_Reconciliation.aspx");
        }

        //private dynamic TotalDepositAmount()
        //{
        //    dynamic totalDepositAmount = 0;
        //    string query = "SELECT SUM(Deposit) FROM Payment_Service";
        //    using (SqlCommand cmd = new SqlCommand(query, con))
        //    {
        //        con.Open ();
        //        using(SqlDataReader reader = cmd.ExecuteReader())
        //        {
        //            if(reader.Read())
        //            {
        //                totalDepositAmount = Int32.Parse(reader[""].ToString());
        //                return totalDepositAmount;
        //            }
        //        }
        //    }
        //    return totalDepositAmount;
        //}

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }
    }
}