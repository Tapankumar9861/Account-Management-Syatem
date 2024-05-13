<%@ Page Language="C#" AutoEventWireup="true" CodeFile="POPUP.aspx.cs" Inherits="ERP_Login.Dsbd_css.POPUP" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Popup Example</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
            
            
        }

        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 40%;
            height: 40%;

        }

        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            border-color: #fefefe;
            margin-top: 5%;
            background-color: aqua;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        .h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="myModal" class="modal" runat="server">
            <div class="modal-content">
                <center>
                    <img src="assets/images/users/download1.jpeg" style="width: 80px;" />
                </center>
                <h2 class="h1">Thank You For Register!</h2>
                <p class="h1"> Successful! Click OK to visit the Dashboard Page</p>
                <asp:Button ID="btnOK" runat="server" CssClass="close" Text="OK" OnClick="btnOK_Click1"/>
            </div>
        </div>
    </form>

    <script>
        window.onload = function () {
            var modal = document.getElementById('<%= myModal.ClientID %>');
            modal.style.display = "block";

            var span = document.getElementById('<%= btnOK.ClientID %>');

            span.onclick = function () {
                modal.style.display = "none";
            }

            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        }
    </script>
</body>
</html>

