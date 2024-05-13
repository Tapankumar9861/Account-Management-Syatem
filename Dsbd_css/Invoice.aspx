<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="ERP_Login.Dsbd_css.Invoice" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Document</title>
    <style>
        #inventory-invoice{
    padding: 30px;
}
#inventory-invoice a{text-decoration:none ! important;}
.invoice {
    position: relative;
    background-color: #FFF;
    min-height: 680px;
    padding: 15px
}

.invoice header {
    padding: 10px 0;
    margin-bottom: 20px;
    border-bottom: 1px solid #3989c6
}

.invoice .company-details {
    text-align: right
}

.invoice .company-details .name {
    margin-top: 0;
    margin-bottom: 0
}

.invoice .contacts {
    margin-bottom: 20px
}

.invoice .invoice-to {
    text-align: left
}

.invoice .invoice-to .to {
    margin-top: 0;
    margin-bottom: 0
}

.invoice .invoice-details {
    text-align: right
}

.invoice .invoice-details .invoice-id {
    margin-top: 0;
    color: #3989c6
}

.invoice main {
    padding-bottom: 50px
}

.invoice main .thanks {
    margin-top: -100px;
    font-size: 2em;
    margin-bottom: 50px
}

.invoice main .notices {
    padding-left: 6px;
    border-left: 6px solid #3989c6
}

.invoice main .notices .notice {
    font-size: 1.2em
}

.invoice table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    margin-bottom: 20px
}

.invoice table td,.invoice table th {
    padding: 15px;
    background: #eee;
    border-bottom: 1px solid #fff
}

.invoice table th{
    white-space: nowrap;
    font-weight: 400;
    font-size: 16px;
    border:1px solid #fff;
}
.invoice table td{
    border:1px solid #fff;
}
.invoice table td h3 {
    margin: 0;
    font-weight: 400;
    color: #3989c6;
    font-size: 1.2em
}

.invoice table .tax,.invoice table .total,.invoice table .unit {
    text-align: right;
    font-size: 1.2em
}

.invoice table .no {
    color: #fff;
    font-size: 1.6em;
    background: #17a2b8
}

.invoice table .unit {
    background: #ddd
}

.invoice table .total {
    background: #17a2b8;
    color: #fff
}

.invoice table tfoot td {
    background: 0 0;
    border-bottom: none;
    white-space: nowrap;
    text-align: right;
    padding: 10px 20px;
    font-size: 1.2em;
    border-top: 1px solid #aaa
}

.invoice table tfoot tr:first-child td {
    border-top: none
}

.invoice table tfoot tr:last-child td {
    color: #3989c6;
    font-size: 1.4em;
    border-top: 1px solid #3989c6
}

.invoice table tfoot tr td:first-child {
    border: none
}

.invoice footer {
    width: 100%;
    text-align: center;
    color: #777;
    border-top: 1px solid #aaa;
    padding: 8px 0
}

@media print {
    .invoice {
        font-size: 11px!important;
        overflow: hidden!important
    }

    .invoice footer {
        position: absolute;
        bottom: 10px;
        page-break-after: always
    }

    .invoice>div:last-child {
        page-break-before: always
    }
}
    </style>
</head>
<body>
    <div id="inventory-invoice">

        <div class="toolbar hidden-print">
            <div class="text-right">
                <button id="printInvoice" class="btn btn-info"><i class="fa fa-print"></i> Print</button>
                <button class="btn btn-info"><i class="fa fa-file-pdf-o"></i> Export as PDF</button>
            </div>
            <hr>
        </div>
        <div class="invoice overflow-auto">
            <div style="min-width: 600px">
                <header>
                    <div class="row">
                        <div class="col">
                            <a target="_blank" href="#">
                                <img src="../assets/images/img14.jpg" style="height:50%;">
                                </a>
                        </div>
                        <div class="col company-details">
                            <h2 class="name">
                                <a target="_blank" href="#">
                               Ahts
                                </a>
                            </h2>
                            <div>Plot no-1117/3315/4728 ,Makundaprasad,</div><div> By pass Chow,post office -P.N college ,</div><div>Pin-752057</div>
                            <div>+91 8847875548 / 9776796852</div>
                            <div>connectahts@gmail.com</div>
                        </div>
                    </div>
                </header>
                <main>
                    <div class="row contacts" >
                        <div class="col invoice-to">
                            <div class="text-gray-light">INVOICE TO:</div>
                            <h2 class="to">Rohit Chauhan</h2>
                            <div class="address">1117/3315/4728 ,Makundaprasad,Khordha,Odisha - India</div>
                            <div class="email"><a href="mailto:test@example.com">connectahts@gmail.com</a></div>
                        </div>
                        <div class="col invoice-details">
                            <h1 class="invoice-id">INVOICE 121</h1>
                            <div class="date">Date of Invoice: 28/11/2018</div>
                            <div class="date">Due Date: 28/11/2018</div>
                        </div>
                    </div>
                    <table border="0" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th>SR NO.</th>
                                <th class="text-left">DESCRIPTION</th>
                                <th class="text-right">PRICE</th>
                                <th class="text-right">TAX (13%)</th>
                                <th class="text-right">TOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="no">01</td>
                                <td class="text-left"><h3>Description 1</h3>Testing Description 1</td>
                                <td class="unit">₹ 0.00</td>
                                <td class="tax">10%</td>
                                <td class="total">₹ 0.00</td>
                            </tr>
                            <tr>
                                <td class="no">02</td>
                                <td class="text-left"><h3>Description 2</h3>Testing Description 2</td>
                                <td class="unit">₹ 40.00</td>
                                <td class="tax">13%</td>
                                <td class="total">₹ 1,200.00</td>
                            </tr>
                            <tr>
                                <td class="no">03</td>
                                <td class="text-left"><h3>Description 3</h3>Testing Description 3</td>
                                <td class="unit">₹ 40.00</td>
                                <td class="tax">13%</td>
                                <td class="total">₹ 3,200.00</td>
                            </tr>
                            <tr>
                                <td class="no">04</td>
                                <td class="text-left"><h3>Description 4</h3>Testing Description 4</td>
                                <td class="unit">₹ 40.00</td>
                                <td class="tax">13%</td>
                                <td class="total">₹ 800.00</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2"></td>
                                <td colspan="2">SUBTOTAL</td>
                                <td>₹ 5,200.00</td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                                <td colspan="2">TAX 25%</td>
                                <td>₹ 1,300.00</td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                                <td colspan="2">GRAND TOTAL</td>
                                <td>₹ 6,500.00</td>
                            </tr>
                        </tfoot>
                    </table>
                    <div class="thanks">Thank you!</div>
                    <div class="notices">
                        <div>NOTICE:</div>
                        <div class="notice">System Generated Invoice.</div>
                    </div>
                </main>
                <footer>
                    Invoice was generated on a computer and is valid without the signature and seal.
                </footer>
            </div>
            <div></div>
        </div>
    </div>
    <script>
         $('#printInvoice').click(function(){
            Popup($('.invoice')[0].outerHTML);
            function Popup(data) 
            {
                window.print();
                return true;
            }
        });
    </script>
</body>
</html>
