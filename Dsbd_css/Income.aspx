<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Income.aspx.cs" Inherits="ERP_Login.Dsbd_css.Income1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <style>
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .card {
        width: 100%;
        text-align: center;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .card-header {
        text-align: center;
    }

    .even {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .btn-print {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 15px;
        font-size: 10px;
        cursor: pointer;
        border-radius: 5px;
        margin-left: 79%;
        display: inline-block;
    }

        .btn-print:hover {
            background-color: #0056b3;
        }


    #GridView1 {
        width: 100%;
        margin-top: 30px;
    }

    #txtSearch {
        padding: 8px;
        padding-right: 50px;
        margin-left: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    #btnSearch {
        background-color: #4CAF50;
        color: white;
        padding: 8px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

        #btnSearch:hover {
            background-color: #45a049;
        }

    #btnRefresh {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 15px;
        font-size: 10px;
        cursor: pointer;
        border-radius: 5px;
        margin-left:20px;
    }
    #btnBack{
        background-color: #007bff;
        color: #fff;
        border:none;
        border-radius:5px;
        margin-left:20px;
        cursor:pointer;
        font-size:10px;
        padding:10px 15px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
                <div class="container">
    <div class="card">
        <div class="card-header">
            <h1>Income Report</h1>
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
        <%= DateTime.Now.ToString("MMMM dd, yyyy") %>
        <asp:Button ID="BtnPrint" class="btn btn-print" runat="server" Text="Print"/>
<%--        <asp:Button ID="btnRefresh"  CssClass="refresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />--%>
        <asp:Button ID="btnBack" runat="server" Text="Back"/>
        <%--<div>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary"/>
        </div>--%>

        <asp:DropDownList ID="ddllist" runat="server">

        </asp:DropDownList>

        <div>
            <asp:GridView ID="GridView1" runat="server">

            </asp:GridView>
        </div>
        </div>
       </div>

    </form>
</body>
</html>
