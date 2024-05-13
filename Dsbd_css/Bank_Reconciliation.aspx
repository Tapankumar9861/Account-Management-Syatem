<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bank_Reconciliation.aspx.cs" Inherits="ERP_Login.Dsbd_css.Bank_Reconciliation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Book Reconciliation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function GetPrint() {
            window.print();
        }
        //function BtnAdd() {
        //    var v = $("#TRow").clone().appendTo("#TBody");
        //    $(v).find("input").val('');
        //    $(v).removeClass("d-none");
        //}
        //function BtnDel(v) {
        //    $(v).parent().parent().remove();

        //}
        function Calc(v) {
            var index = $(v).parent().parent().index();
            GetTotal();

        }
        function GetTotal() {
            var sum = 0;
            var amts = document.getElementsByName("amt");

            for (let index = 0; index < amts.length; index++) {
                var amt = amts[index].value;
                sum = +(sum) + +(amt);
            }
            document.getElementsByName("FTotal")[0].value = sum;
        }
        function updateDigitalClock() {
            var now = new Date();
            var currentDate = now.toLocaleDateString('en-US');

            var hours = now.getHours().toString().padStart(2, '0');
            var minutes = now.getMinutes().toString().padStart(2, '0');
            var seconds = now.getSeconds().toString().padStart(2, '0');

            var digitalClock = document.getElementById('digitalClocklbl');
            digitalClock.textContent = currentDate + ' ' + hours + ':' + minutes + ':' + seconds;
            setTimeout(updateDigitalClock, 1000);
        }
        updateDigitalClock();
    </script>
    <style>
        .input-group-text {
            width: 85px;
        }

        @media print {
            .btn {
                display: none;
            }

            .No print {
                display: none;
            }

            .form-control {
                border: 0px;
            }

            .form-select {
                border: 0px;
            }

            .input-group-text {
                border: 0px;
                background-color: white;
            }
        }

        .even {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container text-center">

            <div class="card">
                <div class="card-header text-center">
                    <h2>Bank Reconciliation</h2>
                    <div style="text-align: right;">
                        <asp:Button ID="btnRefresh" class="btn btn-primary" Style="margin-right: 10px;" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                        <button type="button" class="btn btn-primary" onclick="GetPrint()">Print</button>
                    </div>
                    <hr>
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
                <div class="card-body">

                    <div class="row">
                        <div class="col-6">
                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" ID="lblMode">Mode</asp:Label>
                                <asp:DropDownList runat="server" CssClass="form-select" ID="ddlMode" AutoPostBack="true">
                                    <asp:ListItem Text="Select" />
                                    <asp:ListItem Text="Cash" />
                                    <asp:ListItem Text="Online" />
                                </asp:DropDownList>
                            </div>

                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" ID="Label1">Status</asp:Label>
                                <asp:DropDownList runat="server" CssClass="form-select" ID="ddlStatus" AutoPostBack="true">
                                    <asp:ListItem Text="Received" />
                                    <asp:ListItem Text="Send" />
                                </asp:DropDownList>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Date</span>
                                <asp:Label runat="server" CssClass="form-control" ID="digitalClocklbl" aria-describedby="basic-addon1"></asp:Label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" ID="lblOpeningBalance" AssociatedControlID="txtOpeningBalance" Style="padding-right: 25%;">Opening Balance</asp:Label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtOpeningBalance" placeholder="Opening Balance" aria-label="Username" aria-describedby="basic-addon1"></asp:TextBox>
                            </div>



                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" ID="lblTotalBalance" AssociatedControlID="txtTotalBalance" Style="padding-right: 25%;">Total Balance</asp:Label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtTotalBalance" placeholder="Total Balance" aria-label="Username" aria-describedby="basic-addon1"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1" style="padding-right: 20%">Sl_No</span>
                                <asp:TextBox ID="txtTotal" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>


                        </div>
                    </div>

                    <table class="table table-bordered">
                        <thead class="table-dark">
                            <tr>
                                <%-- <th scope="col">Sl_No</th>--%>
                                <th scope="col">Particular</th>
                                <th scope="col">Reference</th>
                                <th scope="col" class="text-end">Payment Type</th>
                                <th scope="col">Bank Name</th>
                                <th scope="col" class="text-end">Amount</th>
                                <%--<th scope="col" class="NoPrint">--%>
                                <%--<button type="button" class="btn btn-warning" onclick="BtnAdd()">+</button></th>--%>
                            </tr>
                        </thead>
                        <tbody id="TBody" runat="server">
                            <tr id="TRow">
                                <%--<th scope="row" class="serial-number">1</th>--%>
                                <td>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="Particular"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="Reference"></asp:TextBox>
                                </td>
                                <%--<td>
                <asp:DropDownList runat="server" CssClass="form-select" ID="paymentMethodDropDown" AutoPostBack="true">
                    <asp:ListItem Text="Select" Value="" Selected="True" />
                    <asp:ListItem Text="UPI" Value="1" />
                    <asp:ListItem Text="CARD" Value="2" />
                    <asp:ListItem Text="CASH" Value="3" />
                </asp:DropDownList>
                <asp:TextBox ID="paymentMethodDropDown" CssClass="form-select" runat="server"></asp:TextBox>
            </td>--%>
                                <%--<td>
                                    <asp:TextBox ID="paymentType" CssClass="form-control text-end" runat="server"></asp:TextBox>
                                </td>--%>
                                <td>
                                    <asp:DropDownList ID="ddlPayment_Type" CssClass="form-select" runat="server" AutoPostBack="true">
                                        <asp:ListItem Text="Cash" />
                                        <asp:ListItem Text="Online" />
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="BankNametxt" CssClass="form-control text-end" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" CssClass="form-control text-end" ID="amt" onchange="Calc(this);"></asp:TextBox>
                                </td>
                                <%--<td>

                                    <button type="button" class="btn btn-danger" class="btn btn-danger" onclick="BtnDel(this)">X</button></td>--%>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-8" style="margin-top: auto;">
                            <h3 style="margin-right: 60%; margin-bottom: 15%;">Thank You !</h3>
                            <div>
                                <asp:Button ID="btnSave" Style="margin-top: 5%" class="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                                <asp:Button ID="btnShare" Style="margin-top: 5%; margin-left: 10px;" class="btn btn-primary" runat="server" Text="Share" />
                                <asp:Button ID="btnBack" Style="margin-top: 5%; margin-left: 10px;" class="btn btn-primary" runat="server" Text="Back" OnClick="btnBack_Click"/>

                            </div>
                        </div>
                        <div class="col-4">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1" style="padding-right: 25%">Total</span>
                                <asp:TextBox ID="FTotal" name="FTotal" class="form-control" runat="server"></asp:TextBox>
                            </div>

                        </div>
                    </div>

                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
                
    </form>
</body>
</html>
