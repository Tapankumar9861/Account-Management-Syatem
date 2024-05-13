<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Expenses.aspx.cs" Inherits="ERP_Login.Dsbd_css.Expenses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Save Details</title>
    <script>
        function GetPrint()     
        {
            window.print();
        }
    </script>
    <style>
        @media print {
            .cld, .input-field, .icon, #searchInput {
                display: none;
                background-color: orange;
            }

            .No print {
                display: none;
            }

            body {
                background-color: aqua;
            }
        }

        body {
            border: 1px solid black;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        .icon {
            padding: 10px;
            background: green;
            color: white;
            min-width: 50px;
            height: 35px;
            text-align: center;
            margin-right: 5px;
        }

        .input-field {
            outline: none;
            height: 40px;
        }

        .di {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }

        .cls {
            height: 30px;
            background-color: dodgerblue;
        }

        h2 {
            text-align: center;
            padding: 20px;
        }
        /* New CSS for search bar */
        .search-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

            .search-container input[type=text] {
                padding: 10px;
                margin-right: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

        .cld {
            margin-left: 50%;
            margin-top: 30px;
            font-size: 15px;
        }

        h3 {
            font-size: 35px;
        }

        .ml {
            display: flex;
            justify-content: space-between;
        }

        .e1 {
            padding: 20px;
            display: flex;
            justify-content: space-around;
        }

        .one {
            display: flex;
            justify-content: center;
        }

        .btn-print {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 10px;
            cursor: pointer;
            border-radius: 5px;
            margin-left: 70%;
            display: inline-block;
        }

            .btn-print:hover {
                background-color: #0056b3;
            }

        #btnRefresh {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 10px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 20px;
            margin-top: 20px;
        }

        .btnRefresh:hover {
            background-color: #0056b3;
        }

        #btnBack {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            margin-right: 20px;
            cursor: pointer;
            font-size: 10px;
            padding: 5px 15px;
            margin-top: 20px;
        }

        .btnBack:hover {
            background-color:#0c66ed;
        }

        #btnSave {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 10px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 20px;
            margin-top: 20px;
        }

        .btnPrint {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 10px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 20px;
            margin-top: 20px;
            height:40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="e1">
            <img src="assets/images/users/AHTS.jpg" ID="imgExpense" style="width: 100px;" />
            <%--<asp:Image ID="imgExpense" runat="server" ImageUrl="AHTS.jpg" Style="width:100px;" />--%>
            <h3>Expense</h3>
            <button type="button" class="btnPrint" onclick="GetPrint()">Print</button>
        </div>
        <div class="di">
            <div>
                <img class ="icon" src="assets/images/users/Expense.png" style="width:20px; height:40px"/>
                <asp:TextBox ID="name" runat="server" CssClass="input-field" placeholder="Expense Name"  name="name"></asp:TextBox>
            </div>
            <div>
                <img class ="icon" src="assets/images/users/calendar.png" style="width:20px; height:35px"/ />
                <asp:TextBox ID="date" runat="server" CssClass="input-field" TextMode="Date" placeholder="Date" name="date"></asp:TextBox>

            </div>
            <div>
                <img class ="icon" src="assets/images/users/Payment_mode.png" style="width:20px; height:35px" />
                <asp:TextBox ID="Payment_Mode" runat="server" CssClass="input-field" placeholder="Payment_Mode" name="PaymentMode"></asp:TextBox>
            </div>
            <div>
                <img class ="icon" src="assets/images/users/money.png" style="width:20px; height:35px" />
                <asp:TextBox ID="amount" runat="server" CssClass="input-field" placeholder="Amount" name="amount"></asp:TextBox>

            </div>
        </div >
        <div class="one">
            <asp:Button ID="btnSave" runat="server"  Text="Save" OnClick="btnSave_Click"/>
            <asp:Button ID="btnRefresh" runat="server"  CssClass="Refresh" Text="Refresh" OnClick="btnRefresh_Click"/>
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click"/>
        </div>
        
        <div class="ml">
            <h2 style="text-align:center">Expense Record</h2>
        </div>
    <div class="search-container">
        <i class="fa fa-search icon" style="height:35px;"></i>
        <input type="text"style="height:35px;" id="searchInput" onkeyup="searchTable()" placeholder="Search for names..."/>
     </div>
        <br />
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Sl_No" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Sl_No" HeaderText="Sl_No" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="Expense_Name" HeaderText="Expense_Name"></asp:BoundField>
                <asp:BoundField DataField="Date" HeaderText="Date"></asp:BoundField>
                <asp:BoundField DataField="Payment_Mode" HeaderText="Payment_Mode"></asp:BoundField>
                <asp:BoundField DataField="Amount" HeaderText="Amount"></asp:BoundField>
                <asp:CommandField ShowEditButton="True" ButtonType="Button">
                    <ControlStyle BackColor="#3366FF"></ControlStyle>
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True" ButtonType="Button">
                    <ControlStyle BackColor="Red"></ControlStyle>
                </asp:CommandField>
            </Columns>

        </asp:GridView>
    </div>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </form>
</body>
</html>
