<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="ERP_Login.Dsbd_css.Settings" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=<device-width>, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="icon" type="image/x-icon" href="../assets/images/fac01.png">
    <linkhref="assets/libs/fullcalendar/dist/fullcalendar.min.css"rel="stylesheet"/>

    <link href="assets/extra-libs/calendar/calendar.css" rel="stylesheet" />
    <link href="dist/css/style.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href='https://unpkg.com/css.gg@2.0.0/icons/css/menu.css' rel='stylesheet'>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <title>Document</title>
    <style>
        .container{
            border:1px solid black;
            border-radius: 10px;
            width:50%;
            height:750px;
}
.box{
    display:flex;
    justify-content: space-between;
}
    </style>
</head>
<body>
    <div class="container">
        <div class="box">
            <a href="AMS.html"> <i class="fa fa-arrow-left"style="font-size:20px;"></i></a>
          <h2>Settings</h2>
          <i class="fa fa-search"style="font-size:25px;"></i>
        </div>
        <hr>
        <div class="box2">
            <a
         class="sidebar-link has-arrow waves-effect waves-dark"
                  href="General.html"
                  aria-expanded="false">
                 <img src="assets/images/settings.png"style="width:20px;">
                  <span class="hide-menu">General</span></a>
                 <a href="General.html"><i class='fas fa-angle-right'style="margin-left:95%;"></i></a>
        </div>
        <hr>
        <div>
            <a
         class="sidebar-link has-arrow waves-effect waves-dark"
                  href="Transaction.html"
                  aria-expanded="false">
                 <img src="assets/images/money-transfer.png"style="width:20px;">
                  <span class="hide-menu">Tranasation</span></a>
                  <a href="#"><i class='fas fa-angle-right'style="margin-left:95%;"></i></a>
        </div>
        <hr>
        <div>
          <p><a
         class="sidebar-link has-arrow waves-effect waves-dark"
                  href="javascript:void(0)"
                  aria-expanded="false">
                 <img src="assets/images/printer.png"style="width:20px;">
                  <span class="hide-menu">Invoice Print</span></a>
                  <i class='fas fa-angle-right'style="margin-left:95%;"></i></p>
        </div>
        <hr>
        <div>
            <a
         class="sidebar-link has-arrow waves-effect waves-dark"
                  href="javascript:void(0)"
                  aria-expanded="false">
                 <img src="assets/images/tax.png"style="width:20px;">
                  <span class="hide-menu"> Taxes & GST</span></a>
                  <a href="#"><i class='fas fa-angle-right'style="margin-left:95%;"></i></a>
        </div>
        <hr>
        <div>
            <a
            class="sidebar-link has-arrow waves-effect waves-dark"
                     href="javascript:void(0)"
                     aria-expanded="false">
                    <img src="assets/images/img0011.png"style="width:20px;">
                     <span class="hide-menu"> User Management</span></a>
                     <a href="#"><i class='fas fa-angle-right'style="margin-left:95%;"></i></a>
        </div>
        <hr>
        <div>
            <a
            class="sidebar-link has-arrow waves-effect waves-dark"
                     href="javascript:void(0)"
                     aria-expanded="false">
                    <img src="assets/images/conversation.png"style="width:20px;">
                     <span class="hide-menu"> Tranasaction SMS</span></a>
                     <a href="#"><i class='fas fa-angle-right'style="margin-left:95%;"></i></a>
        </div>
        <hr>
        <div>
            <a
            class="sidebar-link has-arrow waves-effect waves-dark"
                     href="javascript:void(0)"
                     aria-expanded="false">
                    <img src="assets/images/tax-reminder.png"style="width:20px;">
                     <span class="hide-menu"> Payment Reminder</span></a>
                     <a href="#"><i class='fas fa-angle-right'style="margin-left:95%;"></i></a>
        </div>
        <hr>
        <div>
            <a
            class="sidebar-link has-arrow waves-effect waves-dark"
                     href="javascript:void(0)"
                     aria-expanded="false">
                    <img src="assets/images/man.png"style="width:20px;">
                     <span class="hide-menu">Party</span></a>
            
                     <a href="#"><i class='fas fa-angle-right'style="margin-left:95%;"></i></a>
        </div>
        <hr>
        <div>
            <a
            class="sidebar-link has-arrow waves-effect waves-dark"
                     href="javascript:void(0)"
                     aria-expanded="false">
                    <img src="assets/images/man.png"style="width:20px;">
                     <span class="hide-menu">Item</span></a>
                     <a href="#"><i class='fas fa-angle-right'style="margin-left:95%;"></i></a>
        </div>
    </div>
</body>
</html>
