<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment_In.aspx.cs" Inherits="ERP_Login.Dsbd_css.Payment_In" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Payment-In</title>
    <style>
        .container {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .center {
            align-items: center;
        }

        .box {
            display: flex;
            justify-content: space-evenly;
        }

        .box2 {
            display: flex;
            justify-content: space-around;
            position: fixed;
            margin-left: 40%;
        }

        .btn {
            width: 25%;
            height: 30px;
            font-size: 15px;
        }

        .btn2 {
            font-size: 20px;
            background-color: lightseagreen;
        }

        .d1 {
            width: 90%;
            height: 600px;
            border: 2px solid black;
            border-radius: 20px;
            margin-left: 5%;
        }

        .cd1 {
            display: flex;
            justify-content: space-around;
        }

        fieldset {
            width: 23%;
            height: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="d1">
            <div class="container">
                <h1>Payment In</h1>
                <i class="fa fa-gear" style="font-size: 35px;"></i>
            </div>

            <hr>
            <center>
                <div class="cd1">
                    <p>
                        Invoice No.<br>
                        <asp:TextBox ID="Invoicetxt" runat="server" Style="border: none; width: 100%;"></asp:TextBox>
                    </p>
                    <p>
                        Date
      <asp:Label runat="server"  ID="digitalClocklbl" aria-describedby="basic-addon1"></asp:Label>
                    </p>
                </div>
                <hr>
                <div class="center">
                    <fieldset>
                        <legend>Customer Name</legend>
                        <asp:TextBox ID="Nametxt" runat="server" type="text" Style="width: 100%; height: 30px; border: none;"></asp:TextBox>
                    </fieldset>
                    <asp:TextBox ID="Phone_Notxt" runat="server" type="text" Placeholder="Phone Number" Style="width: 25%; height: 30px; margin-top: 15px;"></asp:TextBox><br />
                    <br>
                    <fieldset>
                        <legend>Payment Mode</legend>
                        <asp:DropDownList runat="server" Style="width: 100%; height: 30px; border: none;" ID="paymentMethodDropDown" AutoPostBack="true">
                            <asp:ListItem Text="Select" Value="" Selected="True" />
                            <asp:ListItem Text="Online" Value="2" />
                            <asp:ListItem Text="CASH" Value="3" />
                        </asp:DropDownList>
                    </fieldset>


              </div>

                <hr>
                <div class="box">
                    <p style="font-size: 20px;">
                        Received
                    </p>
                    <p>
                        ₹
                        <asp:TextBox ID="Receivedtxt" runat="server" onInput="getvalue()" placeholder=".........." Style="border: none; font-size: 20px;"></asp:TextBox>
                    </p>
                </div>
                <hr>
                <div class="box2">
                    <p style="font-size: 20px;">Total :</p>
                    <p style="font-size: 20px;">
                        &nbsp;₹ <span id="Result"></span>
                        <asp:Label ID="Resultlbl" runat="server"></asp:Label>
                    </p>
                </div>

                <br>
                <br>
                <br>
                <br>
                <button style="font-size: 25px;"><a href="#">Save</a></button>
                <script>
                    function getvalue() {
                        let txt = document.getElementById("Receivedtxt");
                        let textvalue = txt.value;

                        let result = document.getElementById("Resultlbl");
                        result.innerText = textvalue;
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
    </form>
</body>
</html>
