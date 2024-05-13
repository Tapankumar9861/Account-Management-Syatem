<%@ Page Language="C#" AutoEventWireup="true" CodeFile="service.aspx.cs" Inherits="ERP_Login.Dsbd_css.service" %>

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
        .card{
            width:100%vw;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container text-center">
            <div class="card">
                <div class="card-header text-center">
                    <h2>Service</h2>
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
                        <div class="col-6">
                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" Style="padding-right: 20%" Text="Student"></asp:Label>
                                <asp:TextBox ID="Studenttxt" runat="server" CssClass="form-control" placeholder="Student Name"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" style="padding-right: 20%" id="basic-addon1">Branch</span>
                                <asp:DropDownList runat="server" CssClass="form-select" ID="branchDropDown">
                                    <asp:ListItem Text="Select" Value="" Selected="True" />
                                    <asp:ListItem Text="MCA" />
                                    <asp:ListItem Text="MBA" />
                                    <asp:ListItem Text="M.SC" />
                                    <asp:ListItem Text="BBA" />
                                    <asp:ListItem Text="BCA" />
                                    <asp:ListItem Text="B.SC" />
                                    <asp:ListItem Text="B.TECH" />
                                </asp:DropDownList>
                            </div>
                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" Style="padding-right: 20%" Text="Place"></asp:Label>
                                <asp:TextBox ID="Placetxt" runat="server" CssClass="form-control" value="BBSR"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <asp:Button ID="BtnSearch" runat="server" style="margin-left:90%;margin-top:3%" class="btn btn-primary" Text="Search" OnClick="BtnSearch_Click" />
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1" style="padding-right: 20%">Student ID</span>
                                <asp:TextBox ID="Student_IDtxt" CssClass="form-control" runat="server" placeholder="Student ID"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1" style="padding-right: 20%">Date</span>
                                <asp:Label runat="server" CssClass="form-control" style="text-align:start" ID="digitalClocklbl" aria-describedby="basic-addon1"></asp:Label>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1" style="padding-right: 20%">Course Fee</span>
                                <%--<asp:TextBox ID="FCourse" name="FCourse" runat="server" CssClass="form-control" required onchange="Calc(this);" ></asp:TextBox>--%>
                                <asp:TextBox runat="server" CssClass="form-control" placeholder="Course Fee" ID="Course" onchange="Calc(this);"></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <asp:Label runat="server" CssClass="input-group-text" Style="padding-right: 20%" Text="Total Deposit"></asp:Label>
                                <asp:TextBox ID="txtTotal_Deposit" runat="server" CssClass="form-control" Disabled=""></asp:TextBox>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1" style="padding-right: 20%">Remaining Amt</span>
                                <asp:TextBox ID="txtRemaining" CssClass="form-control" runat="server" disabled=""></asp:TextBox>
                            </div>
                        </div>
                    </div>


                    <table class="table table-bordered">
                        <thead class="table-dark">
                            <tr>
                                <%--<th scope="col">Sl_No</th>--%>
                                <th scope="col">Particular</th>
                                <th scope="col" class="text-end">Deposit Amount</th>
                                <th scope="col" class="text-end">Payment Mode</th>
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
                                    <asp:TextBox runat="server" CssClass="form-control text-end" ID="Deposit" onchange="Calc(this);"></asp:TextBox>
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
                                <td>
                                    <asp:TextBox ID="paymentMethod" CssClass="form-control text-end" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox runat="server" CssClass="form-control text-end" ID="amt"></asp:TextBox>
                                </td>
                                <%--<td>

                                    <button type="button" class="btn btn-danger" class="btn btn-danger" onclick="BtnDel(this)">X</button></td>--%>
                            </tr>



                        </tbody>
                    </table>
                    <div class="row">

                        <div class="col-8" style="">
                            <asp:Button ID="btnSave" Style="margin-top: 15%" class="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                            <%--<button type="button" style="margin-top:15%" class="btn btn-primary">Save</button>--%>
                            <button type="button" style="margin-top: 15%;margin-left:10px;" class="btn btn-primary">Share</button>
                            <asp:Button ID="btnView" Style="margin-top: 15%;margin-left:10px;" class="btn btn-primary" runat="server" Text="Update" OnClick="btnView_Click"/>
                            <asp:Button ID="btnBack" Style="margin-top: 15%;margin-left:10px;" class="btn btn-primary" runat="server" Text="Back" OnClick="btnBack_Click"/>
                        </div>
                        <div class="col-4">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1" style="padding-right: 25%">Deposit</span>
                                <asp:TextBox ID="FTotal" name="FTotal" class="form-control" runat="server"></asp:TextBox>
                            </div>
                           
                        </div>
                    </div>
                    <div>
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


            var Deposit = document.getElementsByName("Deposit")[index].value;
            /*var rate = document.getElementsByName("rate")[index].value;*/
            var amt = Deposit;
            document.getElementsByName("amt")[index].value = Deposit;
            GetTotal();
        }
        function GetTotal() {
            var sum = 0;
            var amts = document.getElementsByName("amt");

            for (let index = 0; index < amts.length; index++) {
                var amt = parseFloat(amts[index].value);
                if (!isNaN(amt)) {
                    sum += amt;
                }
            }
            //var Total_Deposit = document.getElementById("FTotal").value;
            //var add_Deposit = Number(Total_Deposit) + sum;
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
</body>
</html>

