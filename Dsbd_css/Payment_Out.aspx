<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment_Out.aspx.cs" Inherits="ERP_Login.Dsbd_css.Payment_Out" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Sales</title>
    <style>
        .container{
           display: flex;
           justify-content: space-around;
            align-items: center;
        }
        .center{
         align-items: center;
        
        }
        .box{
          display: flex;
          justify-content: space-evenly;
          font-size: 25px;
        }
        .btn{
          width:25%;
          height:30px ;
          font-size:15px;
        }
        .btn2{
          font-size:25px;
          background-color:lightseagreen;
        }
        .d1{
      width:100%;
      height:600px;
      border:2px solid black;
      border-radius:20px;
     color:white;
     background-color:cadetblue;
     
        }
        .cd1{
          display:flex;
          justify-content: space-around;
        }
       
    </style>
</head>
<body>
  <div class="d1">
    <div class="container">
        <h2>Payment-Out</h2>
       
        <i class="fa fa-gear"style="font-size:35px;"></i>
    </div>
  
<hr>
<center>
  <div class="cd1">
    <p>Invoice No.<br>
    <input type="text"style="border:none; width:25px;"></p>
    <p>Date
      <input type="date">
    </p>
  </div>
  <hr>
<div class="center">
<input type="text"placeholder="Customer Name"style="width:25%;height:30px;"><br><br>
<input type="text"Placeholder="Phone Number"style="width:25%;height:30px;"><br><br>
<button class="btn"><a href="Additems.html"><i class="fa fa-plus-circle"></i>Add Item</a></button>
</div>

<hr>
<div class="box">
  <p>Total Amount</p>
  <p>₹
  <input type="text"style="border:none;"placeholder="............">
  </p>
</div><br><br>
<div class="box">
  <p>TAX Amount</p>
  <p>₹
  <input type="text"style="border:none;"placeholder="............">
  </p>
</div><br><br>
<button class="btn2"><a href="Invoice.html">Save</a></button>
</center>
</div>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
</body>
</html>
