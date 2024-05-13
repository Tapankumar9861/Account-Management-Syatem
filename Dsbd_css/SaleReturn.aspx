<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SaleReturn.aspx.cs" Inherits="ERP_Login.Dsbd_css.SaleReturn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Sale Return</title>
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
        }
        .btn{
          width:35%;
          height:30px ;
          font-size:15px;
        }
        .btn2{
          font-size:20px;
          background-color:lightseagreen;
        }
        .d1{
      width:100%;
      height:600px;
      border:2px solid black;
      border-radius:20px;
      
        }
        .cd1{
          display:flex;
          justify-content: space-around;
        }
       fieldset{
        width:33%;
        height:30px;
       }
    </style>
</head>
<body>
  <div class="d1">
    <div class="container">
        <h2>Credit Note</h2>

        <i class="fa fa-gear"style="font-size:35px;"></i>
    </div>
  
<hr>
<center>
  <div class="cd1">
    <p>Return No.<br>
    <input type="text"style="border:none; width:25px;"></p>
    <p>Date
      <input type="date">
    </p>
  </div>
  <hr>
<div class="center">
<input type="text"placeholder="Customer Name"style="width:35%;height:30px;"><br><br>
<input type="text"Placeholder="Phone Number"style="width:35%;height:30px;"><br><br>
<input type="text"Placeholder="Invoice Number"style="width:35%;height:30px;"><br><br>
<fieldset>
    <legend>Invoice date</legend>
<input type="date"placeholder="Invoice Date"style="width:100%; border:none;"></fieldset><br><br>
<button class="btn"><a href="Additems.html"><i class="fa fa-plus-circle"></i>Add Item</a></button>
</div>

<hr>
<div class="box">
  <p>Total Amount</p>
  <p>₹
  <input type="text"style="border:none;"placeholder="............">
  </p>
</div><br><br>
<button class="btn2"><a href="#">Save</a></button>
</center>
</div>
</body>
</html>
