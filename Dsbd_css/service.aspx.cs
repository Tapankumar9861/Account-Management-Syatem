using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;

namespace ERP_Login.Dsbd_css
{
    public partial class service : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=TAPAN;initial catalog=Account_MS;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Studenttxt.Text == "" || Student_IDtxt.Text == "" || Course.Text == "" || Particular.Text == "" || Deposit.Text == "" || paymentMethod.Text == "")
            {
                Response.Write("<script>alert('Must Fill The Fields')</script>");
            }
            else
            {
                if (IsStudentExist(Student_IDtxt.Text))
                {
                    SaveData();

                    try
                    {
                        string updateQuery = "  UPDATE PS SET PS.[Deposit] = PD.TotalDepositAmount FROM [Account_MS].[dbo].[Payment_Service] PS JOIN (SELECT SUM([Deposit_Amount]) AS TotalDepositAmount FROM [Account_MS].[dbo].[Payment_Service_Table] where Student_Id=@StudentId) PD ON PS.[Student_Id] = @StudentId";
                        //string query1 = "UPDATE PS SET PS.[Deposit] = PD.TotalDepositAmount FROM [Account_MS].[dbo].[Payment_Service] PS JOIN (SELECT [Student_Id],SUM([Deposit_Amount]) AS TotalDepositAmount FROM [Account_MS].[dbo].[Payment_Service_Table] GROUP BY [Student_Id]) PD ON PS.[Student_Id] = PD.[Student_Id]";
                        SqlCommand cmd1 = new SqlCommand(updateQuery, con);
                        con.Open();
                        cmd1.Parameters.Clear();
                        cmd1.Parameters.AddWithValue("@StudentId", Student_IDtxt.Text);
                        cmd1.ExecuteNonQuery();
                        con.Close();
                    }
                    catch
                    {
                        throw;
                    }
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    
                    sqlquery1();
                    SaveData();
                    Total_Money();
                    Total_Cash();
                    Total_Online();


                

                    Response.Redirect(Request.RawUrl);
                    void sqlquery1()
                    {
                        string query = "INSERT INTO Payment_Service(Student_Name,Student_Id,Branch,Place,Course_Fee,Deposit) values (@Student_Name,@Student_Id,@Branch,@Place,@Course_Fee,@Deposit)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Student_Name", Studenttxt.Text);
                        cmd.Parameters.AddWithValue("@Student_Id", Student_IDtxt.Text);
                        cmd.Parameters.AddWithValue("@Branch", branchDropDown.Text);
                        cmd.Parameters.AddWithValue("@Place", Placetxt.Text);
                        cmd.Parameters.AddWithValue("@Course_Fee", Course.Text);
                        cmd.Parameters.AddWithValue("@Deposit", FTotal.Text);
                        con.Close();
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                void SaveData()
                {
                    string query = "INSERT INTO Payment_Service_Table(Student_Id,Student_Name,Particular,Deposit_Amount,Payment_Mode,Amount) VALUES(@Student_Id,@Student_Name,@Particular,@Deposit_Amount,@Payment_Mode,@Amount)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Student_Id", Student_IDtxt.Text);
                    cmd.Parameters.AddWithValue("@Student_Name", Studenttxt.Text);
                    cmd.Parameters.AddWithValue("@Particular", Particular.Text);
                    cmd.Parameters.AddWithValue("@Deposit_Amount", Deposit.Text);
                    cmd.Parameters.AddWithValue("@Payment_Mode", paymentMethod.Text);
                    cmd.Parameters.AddWithValue("@Amount", amt.Text);
                    con.Open();
                    int t= Convert.ToInt32(cmd.ExecuteNonQuery());
                    if(t > 0)
                    {
                        Response.Write("<script>alert('Data successfully Save!')</script>");
                    }
                    con.Close();
                }
                 
            }
        }


        private bool IsStudentExist(string student_id)
        {
            try
            {
                string query = "Select * From Payment_Service where Student_Id=@student_Id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    student_id = Student_IDtxt.Text;
                    cmd.Parameters.AddWithValue("@student_Id", student_id);
                    using (SqlDataReader userReader = cmd.ExecuteReader())
                    {
                        if (userReader.Read())
                        {
                            con.Close();
                            return true;
                        }
                            
                    }
                }
            }catch (Exception ex)
            {
                
            }
            return false;
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            
            string student_Id = Student_IDtxt.Text;
            string query = "select Student_Name,Place,Course_Fee,Deposit,Remaining_AMT from Payment_Service where Student_Id=@student_Id";
            using (SqlCommand cmd=new SqlCommand(query,con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@student_Id", student_Id);

                using (SqlDataReader userReader = cmd.ExecuteReader())
                {
                    if (userReader.Read())
                    {
                        string Name= userReader["Student_Name"].ToString();
                        Studenttxt.Text= Name;
                        string place = userReader["Place"].ToString();
                        Placetxt.Text= place;
                        string course_Fee = userReader["Course_Fee"].ToString() ;
                        Course.Text= course_Fee;
                        string deposit = userReader["Deposit"].ToString();
                        txtTotal_Deposit.Text= deposit;
                        string remaining_amount = userReader["Remaining_AMT"].ToString();
                        txtRemaining.Text= remaining_amount;

                    }
                    else
                    {
                        Response.Write("<script>alert('Your Data Are Not Found')</script>");
                    }
                }
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Dsbd_css/GridView_service.aspx");
        }


        void Total_Money()
        {
            string query = "UPDATE ps SET ps.Total_Money = ISNULL((SELECT SUM(Deposit) FROM Payment_Service), 0) FROM Payment_Service ps";
           SqlCommand cmd = new SqlCommand(query,con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        void Total_Cash()
        {
            string query = "UPDATE Payment_Service_Table SET Total_Cash = (SELECT SUM(Amount)   FROM Payment_Service_Table WHERE Payment_Mode='Cash' GROUP BY Payment_Mode)";
            SqlCommand cmd = new SqlCommand(query,con);
            con.Open();
                cmd.ExecuteNonQuery();
            con.Close();
        }

         void Total_Online()
         {
            string query = "UPDATE Payment_Service_Table SET Total_Online = (SELECT SUM(Amount) FROM Payment_Service_Table WHERE Payment_Mode='Online' GROUP BY Payment_Mode)";
            SqlCommand cmd = new SqlCommand(query,con);
            con.Open();    
            cmd.ExecuteNonQuery();
            con.Close();

         }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dsbd_Account_MS.aspx");
        }
    }
}