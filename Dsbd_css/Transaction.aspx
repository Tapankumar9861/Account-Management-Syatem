<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transaction.aspx.cs" Inherits="ERP_Login.Dsbd_css.Transaction" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Document</title>
    <style>
        .container{
            display: flex;
            justify-content: space-between;
        }
    select{
        border:none;
    }
   .container4{
    display: flex;
    justify-content: space-between;
   }
    </style>
</head>
<body>
    <div class="container">
        <div>     
 <h4>Transaction Header</h4>
    <hr>
    <input type="checkbox"><label for="name">Invoice/Bill No.<i class="fa fa-exclamation-circle"></i></label><br><br>
    <input type="checkbox"><label for="name">Add Time on Transaction.<i class="fa fa-exclamation-circle"></i></label><br><br>
    <input type="checkbox"><label for="name">Cash Sale by default
        <i class="fa fa-exclamation-circle"></i></label><br><br>
        <input type="checkbox"><label for="name">Billing Name of Parties
            <i class="fa fa-exclamation-circle"></i></label><br><br>
            <input type="checkbox"><label for="name">Customers P.O. Details on Transactions
                <i class="fa fa-exclamation-circle"></i></label><br><br>
       </div>
   <div class="container2">
<h4>Iteams Table</h4><hr>
<input type="checkbox"><label for="name">Inclusive/Exclusive Tax on Rate(Price/Unit)
    <i class="fa fa-exclamation-circle"></i></label><br><br>
    <input type="checkbox"><label for="name">Display Purchase Price of Items
        <i class="fa fa-exclamation-circle"></i></label><br><br>
        <input type="checkbox"><label for="name">Show last 5 Sale Price of Items
            <i class="fa fa-exclamation-circle"></i></label><br><br>
            <input type="checkbox"><label for="name">Free Item Quantity
                <i class="fa fa-exclamation-circle"></i></label><br><br>
                <input type="checkbox"><label for="name">Count                 
                    <i class="fa fa-exclamation-circle"></i></label><br><br>
   </div>
   <div class="containe3">
<h4>Taxes,Discount & Total</h4><hr>
<input type="checkbox"><label for="name">Transaction wise Tax         
    <i class="fa fa-exclamation-circle"></i></label><br><br>
    <input type="checkbox"><label for="name">Transaction wise Discount     
        <i class="fa fa-exclamation-circle"></i></label><br><br>
        <input type="checkbox"><label for="name">Round Off Total     
            <i class="fa fa-exclamation-circle"></i></label><br><br>
          <select> 
            <option>Nearest</option>
            <option>Down To</option>
            <option>Up To</option>
          </select>
          TO
          <select style="margin-left:10px;">
            <option>1</option>
            <option>10</option>
            <option>50</option>
            <option>100</option>
            <option>1000</option>
          </select>
   </div>
</div>
<div class="container">
    <div>
        <h4>More transaction Feature</h4><hr>
        <input type="checkbox"><label for="name">E-way bill no
            <i class="fa fa-exclamation-circle"></i></label><br><br>
            <input type="checkbox"><label for="name">Quick Entry
                <i class="fa fa-exclamation-circle"></i></label><br><br>
                <input type="checkbox"><label for="name">Do not Show Invoice Preview
                    <i class="fa fa-exclamation-circle"></i></label><br><br>
                    <input type="checkbox"><label for="name">Enable Passcode for transaction edit/delete
                        <i class="fa fa-exclamation-circle"></i></label><br><br>
                        <input type="checkbox"><label for="name">Discount During Payments
                            <i class="fa fa-exclamation-circle"></i></label><br><br>
                            <input type="checkbox"><label for="name">Link Payments to Invoices
                                <i class="fa fa-exclamation-circle"></i></label><br><br>
                                <input type="checkbox"><label for="name">Due Dates and Payment Terms
                                    <i class="fa fa-exclamation-circle"></i></label><br><br>
                                    <input type="checkbox"><label for="name">Show Profit while making Sale Invoice
                                        <i class="fa fa-exclamation-circle"></i></label><br><br>
    </div>
    <div>
        <h4>Transaction Prefixes</h4><hr>
        <fieldset>
            <legend>
                Firm
            </legend>
            <input type="text" style="border:none;">
        </fieldset>
        <fieldset style="width:93%;">
            <legend>Prefixes</legend>
            <div class="container4">
            <fieldset>
                <legend>Sale</legend>
                <input type="text"id="result"style="border:none;"placeholder="None"><i class="fa fa-caret-down"></i>
            </fieldset>
            <fieldset>
                <legend>Credit Note</legend>
                <input type="text"style="border:none;"placeholder="None"><i class="fa fa-caret-down"></i>
            </fieldset>
            </div><br>
            <div class="container4">
                <fieldset>
                    <legend>Sale order</legend>
                    <input type="text"style="border:none;"placeholder="None"><i class="fa fa-caret-down"></i>
                </fieldset>
                <fieldset>
                    <legend>Purchase order</legend>
                    <input type="text"style="border:none;"placeholder="None"><i class="fa fa-caret-down"></i>
                </fieldset>
            </div><br>
            <div class="container4">
                <fieldset>
                    <legend>Estimate</legend>
                    <input type="text"style="border:none;"placeholder="None"><i class="fa fa-caret-down"></i>
                </fieldset>
                <fieldset>
                    <legend>Delivery Challan</legend>
                    <input type="text"style="border:none;"placeholder="None"><i class="fa fa-caret-down"></i>
                </fieldset>
            </div><br>
            <div class="container4">
                <fieldset>
                    <legend>Payment In</legend>
                    <input type="text"style="border:none;"placeholder="None"><i class="fa fa-caret-down"></i>
                </fieldset>
               
            </div>
        </fieldset>
    </div>
    <div>

    </div>
   </div>
   
</body>
</html>



