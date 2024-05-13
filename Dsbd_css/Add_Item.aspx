<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Item.aspx.cs" Inherits="ERP_Login.Dsbd_css.Add_Item" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Document</title>
    <style>
        .container {
            width: 50%;
            height: 300px;
            border-radius:50px;
            border: 1px solid black;
            background-color: rgba(112, 50, 228, 0.15);
             box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
             
        }

        .d1 {
            display: flex;
            justify-content: space-around;
        }

        fieldset {
            width: 32%;
        }

        select {
            width: 20%;
            height: 20px;
            border: 2px solid black;
        }

        input {
            border: 2px solid black;
        }

        .btn {
            width: 100%;
            height: 230px;
        }

        select {
            font-size: 18px;
            height: 50px;
            background-color: rgb(132, 229, 132)
        }

        .button {
            display: inline-block;
            padding: 10px 15px;
            font-size: 24px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: black;
            background-color:rgb(255, 102, 217);
            border: none;
            border-radius: 15px;
            box-shadow: 0 9px #999;
        }

            .button:hover {
                background-color:rgb(255, 255, 128);
            }

            .button:active {
                
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }
            
    </style>
</head>
<body>
    <center>
        <form runat="server">
            <div class="container">
                <div class="d1">
                    <p style="font-size: 20px;"><b>Add Items to Sale</b></p>
                </div>
                <hr>
                <center>
                    <fieldset>
                        <legend>Item Name</legend>
                        <asp:TextBox ID="txtItemName" runat="server" Style="border: none; width: 100%; font-size: 17px; height: 30px; background-color: rgba(112, 50, 228, 0.15);" ></asp:TextBox>
                    </fieldset>
                    <br />
                    <%--<div>
                        <br />
                        <asp:TextBox runat="server" ID="txtQuantity" placeholder="Quantity" Style="height: 35px; font-size: 15px; background-color: rgba(112, 50, 228, 0.15)"></asp:TextBox>
                        <asp:DropDownList runat="server" ID="ddlUnit" Style="font-size: 18px; height: 40px; background-color: rgba(112, 50, 228, 0.15)">
                            <asp:ListItem Text="Box"/>
                            <asp:ListItem Text="Package"/>
                            <asp:ListItem Text="Bag"/>
                            <asp:ListItem Text=""/>
                        </asp:DropDownList>
                    </div>
                    <br />
                    <br />
                    <asp:TextBox runat="server" ID="txtRate" placeholder="Rate(Price/Unit)" Style="height: 45px; background-color: rgba(112, 50, 228, 0.15)"></asp:TextBox>
                    <asp:DropDownList runat="server" ID="ddlTax" Style="font-size: 18px; height: 50px; background-color: rgba(112, 50, 228, 0.15)">
                        <asp:ListItem Text="With Tax" />
                        <asp:ListItem Text="Without Tax" />
                    </asp:DropDownList><br />
                    <br />--%>
                </center>

                <asp:Button runat="server" ID="btnSave" Class="button" Text="Save" Style="margin-top: 50px; font-size: 17px; background-color: rgb(255, 102, 217);" OnClick="btnSave_Click"/>
<%--                <asp:Button runat="server" ID="btnUpdate" Class="button" Text="Update" Style="margin-top: 50px; font-size: 17px; background-color: rgb(255, 102, 217);" OnClick="btnUpdate_Click"/>--%>
                <asp:Button ID="btnBack" runat="server" Class="button" Text="Back" Style="margin-top: 50px; font-size: 17px; background-color: rgb(255, 102, 217);" OnClick="btnBack_Click"/>
                <asp:Button ID="btnRefresh" runat="server" Class="button" Style="margin-top: 50px; font-size: 17px; background-color: rgb(255, 102, 217);" Text="Refresh" OnClick="btnRefresh_Click1"/>
            </div>
        </form>
    </center>
</body>
</html>
