<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sales_Invoice.aspx.cs" Inherits="ERP_Login.Dsbd_css.Sales_Invoice" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>INVOICE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>

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
                    <h2>SALE INVOICE</h2>
                    <button type="button" class="btn btn-primary" onclick="GetPrint()" style="margin-left: 90%">Print</button>
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
                        <div class="col-8">
                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" Text="Customer"></asp:Label>
                                <asp:TextBox ID="Customer_Nametxt" runat="server" CssClass="form-control" placeholder="Customer Name" ></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" Text="Address"></asp:Label>
                                <asp:TextBox ID="Addresstxt" runat="server" CssClass="form-control" placeholder="Address" ></asp:TextBox>

                            </div>
                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" Text="City"></asp:Label>
                                <asp:TextBox ID="Citytxt" runat="server" CssClass="form-control" placeholder="City" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" Text="Inv.No"></asp:Label>
                                <asp:TextBox ID="Inv1_Notxt" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Inv. Date</span>
                                <asp:Label runat="server" CssClass="form-control" ID="digitalClocklbl" aria-describedby="basic-addon1"></asp:Label>
                            </div>
                        </div>
                    </div>


                    <table class="table table-bordered">
                        <thead class="table-dark">
                            <tr>

                                <th scope="col">Particular</th>
                                <th scope="col" class="text-end">Qty</th>
                                <th scope="col" class="text-end">Rate</th>
                                <th scope="col" class="text-end">Amount</th>


                            </tr>
                        </thead>
                        <tbody id="TBody" runat="server">
                            <tr id="TRow">
                                <%--<th scope="row" class="serial-number">1</th>--%>
                                <td>
                                    <asp:DropDownList ID="ddlParticular" CssClass="form-control text-center" runat="server" AutoPostBack="true">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" CssClass="form-control text-end" ID="qty" onchange="Calc(this);"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" CssClass="form-control text-end" ID="rate" onchange="Calc(this);"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" CssClass="form-control text-end" ID="amt"></asp:TextBox>
                                </td>

                            </tr>



                        </tbody>
                    </table>
                    <div class="row">

                        <div class="col-8" style="">
                            <button type="button" style="margin-top: 15%;margin-right: 15px" class="btn btn-primary">Share</button>
                            <asp:Button ID="btnUpdate" Style="margin-top: 15%;margin-right: 15px" class="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnBack" Style="margin-top: 15%;margin-right: 15px" class="btn btn-primary" runat="server" Text="Back" OnClick="btnDelete_Click" />
                            <asp:Button ID="btnSave" Style="margin-top: 15%; margin-right: 0px" class="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                        </div>
                        <div class="col-4">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Total</span>
                                <asp:TextBox ID="FTotal" name="FTotal" class="form-control" runat="server"></asp:TextBox>

                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Tax %</span>
                                <asp:TextBox ID="FGST" name="FGST" class="form-control" runat="server" onchange="GetTotal()"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Disc. %</span>
                                <asp:TextBox ID="FDisc" name="FDisc" class="form-control" runat="server" onchange="GetTotal()"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">NET AMT</span>
                                <asp:TextBox ID="FNet" name="FNet" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
    </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script>
        function GetPrint() {
            window.print();
        }
        //function BtnAdd() {

        //    var newRow = document.getElementById('TRow').cloneNode(true);
        //    //newRow.classList.remove('d-none');
        //    var serialNumber = document.querySelectorAll('#TBody tr').length + 1;
        //    newRow.querySelector('.serial-number').textContent = serialNumber;
        //    newRow.querySelectorAll('input[type="text"]').forEach(function (input) {
        //        input.value = '';
        //    });
        //    document.getElementById('TBody').appendChild(newRow);
        //}

        //function BtnDel(button) {
        //    var row = button.parentNode.parentNode;
        //    row.parentNode.removeChild(row);
        //    var rows = document.querySelectorAll('#TBody tr');
        //    rows.forEach(function (row, index) {
        //        row.querySelector('.serial-number').textContent = index + 1;
        //    });
        //}
        function Calc(v) {
            var index = $(v).parent().parent().index();


            var qty = document.getElementsByName("qty")[index].value;
            var rate = document.getElementsByName("rate")[index].value;
            var amt = qty * rate;
            document.getElementsByName("amt")[index].value = amt;
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
            var gst = ((document.getElementById("FGST").value) / 100) * sum;
            var disc = ((document.getElementById("FDisc").value) / 100) * sum;

            var net = sum + gst - disc;
            document.getElementById("FNet").value = net;

            document.getElementById('refresh').style.cursor = "pointer";
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
</body>
</html>
