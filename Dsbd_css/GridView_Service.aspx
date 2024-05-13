<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Service.aspx.cs" Inherits="ERP_Login.Dsbd_css.GridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function GetPrint() {
            window.print();
        }
    </script>
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            width: 80%;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            text-align: center;
        }

        .even {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn-print {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-left: 78%;
        }

            .btn-print:hover {
                background-color: #0056b3;
            }

        #btnBack {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            margin-left: 15px;
        }


        #btnRefresh {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            margin-left: 15px;
        }

        #GridView1 {
            width: 100%;
            margin-top: 30px;
        }

        #txtSearch {
            padding: 8px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #btnSearch {
            background-color: #4CAF50;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            #btnSearch:hover {
                background-color: #45a049;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h2>Service GridView</h2>
                    <div class="even">
                        <div>
                            <img src="assets/images/users/AHTS.jpg" style="width: 200px;" />
                        </div>
                        <div>
                            <h3>Ahts</h3>
                            <p>
                                Plot no-1117/3315/4728 ,<br>
                                Makundaprasad, By pass Chow,<br>
                                post office -P.N college ,Pin-752057<br>
                                +91 8847875548 / 9776796852<br>
                                connectahts@gmail.com
                            </p>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn-print" onclick="GetPrint()">Print</button>
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
                <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                <hr>
                <div>
                    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="Sl_No" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ButtonType="Button">
                                <ControlStyle BackColor="#3366FF"></ControlStyle>
                            </asp:CommandField>
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button">
                                <ControlStyle BackColor="#FF3300" ForeColor="White"></ControlStyle>
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
