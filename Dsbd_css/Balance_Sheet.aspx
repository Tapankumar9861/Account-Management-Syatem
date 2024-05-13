<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Balance_Sheet.aspx.cs" Inherits="ERP_Login.Dsbd_css.Balance_Sheet" %>


<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>XYZ Corporation Balance Sheet</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 50%;
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #dddddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .amount {
            text-align: right;
        }

        .total {
            font-weight: bold;
        }

        #one {
        }

        #btnBack {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-left: 80%;
        }

        #btnPrint {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin-left:10px ;
        }

        .button-container {
            display: flex;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>AHTS Corporation</h1>
            <h2>Balance Sheet</h2>
            <div class="button-container">
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
                <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" />
            </div>
            <p>As of <%= DateTime.Now.ToString("MMMM dd, yyyy") %></p>

            <asp:Table ID="tblBalanceSheet" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Assets</asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="amount">Amount (₹)</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Liabilities and Equity</asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="amount">Amount (₹)</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>Current Assets:</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>Current Liabilities:</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Cash and Cash Equivalents" />
                    <asp:TableCell CssClass="amount">
                        <asp:TextBox ID="txtCashEquivalents" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Accounts Payable" />
                    <asp:TableCell CssClass="amount">
                        <asp:TextBox ID="txtAccountsPayable" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Accounts Receivable" />
                    <asp:TableCell CssClass="amount">₹10000</asp:TableCell>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Short-term Loans" />
                    <asp:TableCell CssClass="amount">₹599</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Inventory" />
                    <asp:TableCell CssClass="amount">₹11200</asp:TableCell>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Accrued Expenses" />
                    <asp:TableCell CssClass="amount">₹4376</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Prepaid Expenses" />
                    <asp:TableCell CssClass="amount">₹50000</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
               <input type="button" value="Add Row" onclick="addRow();" />
                    </asp:TableCell>
                    <asp:TableCell>
               <input type="button" value="Cancel" onclick="cancelRow();" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="total">
                    <asp:TableCell Text="Total Current Assets" />
                    <asp:TableCell CssClass="amount">₹XXX,XXX</asp:TableCell>
                    <asp:TableCell Text="Total Current Liabilities" />
                    <asp:TableCell CssClass="amount">₹XXX,XXX</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Fixed Assets:</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>Long-term Liabilities:</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Property, Plant, and Equipment" />
                    <asp:TableCell CssClass="amount">₹XXX,XXX</asp:TableCell>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Long-term Debt" />
                    <asp:TableCell CssClass="amount">₹XXX,XXX</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Less: Accumulated Depreciation" />
                    <asp:TableCell CssClass="amount">-₹XX,XXX</asp:TableCell>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Deferred Tax Liability" />
                    <asp:TableCell CssClass="amount">₹XX,XXX</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                 <input type="button" value="Add Row" onclick="addRow();" />
                    </asp:TableCell>
                    <asp:TableCell>
                 <input type="button" value="Cancel" onclick="cancelRow();" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="total">
                    <asp:TableCell Text="Total Fixed Assets" />
                    <asp:TableCell CssClass="amount">₹XXX,XXX</asp:TableCell>
                    <asp:TableCell Text="Total Long-term Liabilities" />
                    <asp:TableCell CssClass="amount">₹XXX,XXX</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Other Assets:</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>Equity:</asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Investments" />
                    <asp:TableCell CssClass="amount">₹XX,XXX</asp:TableCell>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Common Stock" />
                    <asp:TableCell CssClass="amount">₹XXX,XXX</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Intangible Assets" />
                    <asp:TableCell CssClass="amount">₹XX,XXX</asp:TableCell>
                    <asp:TableCell Text="&nbsp;&nbsp;&nbsp;Retained Earnings" />
                    <asp:TableCell CssClass="amount">₹XXX,XXX</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
            <input type="button" value="Add Row" onclick="addRow();" />
                    </asp:TableCell>
                    <asp:TableCell>
            <input type="button" value="Cancel" onclick="cancelRow();" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="total">
                    <asp:TableCell Text="Total Other Assets" />
                    <asp:TableCell CssClass="amount">₹XXX,XXX</asp:TableCell>
                    <asp:TableCell Text="Total Equity" />
                    <asp:TableCell CssClass="amount">₹X,XXX,XXX</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="total">
                    <asp:TableCell Text="Total Assets" />
                    <asp:TableCell CssClass="amount">₹X,XXX,XXX</asp:TableCell>
                    <asp:TableCell Text="Total Liabilities and Equity" />
                    <asp:TableCell CssClass="amount">₹X,XXX,XXX</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>

    <script>
        function addRow() {
            var table = document.getElementById('tblBalanceSheet');
            var row = table.insertRow(table.rows.length - 13);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = '<input type="text" />';
            cell2.innerHTML = '<input type="text" />';
            cell3.innerHTML = '<input type="text" />';
            cell4.innerHTML = '<input type="text" />';
        }

        function cancelRow() {
            var table = document.getElementById('tblBalanceSheet');
            if (table.rows.length > 3)
                table.deleteRow(table.rows.length - 14);
        }
    </script>


</body>
</html>

