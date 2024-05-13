<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dsbd_Account_MS.aspx.cs" Inherits="ERP_Login.Dsbd_css.Dsbd_Account_MS" %>

<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <metaname="keywords"content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Matrix lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Matrix admin lite design, Matrix admin lite dashboard bootstrap 5 dashboard template" />
    <metaname="description"content="Matrix Admin Lite Free Version is powerful and clean admin dashboard template, inpired from Bootstrap Framework"/>
    <meta name="robots" content="noindex,nofollow" />
    <title>AMS Dashboard</title> 
      <link href="assets/libs/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet" />
      <link href="assets/extra-libs/calendar/calendar.css" rel="stylesheet" />
      <link href="dist/css/style.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href='https://unpkg.com/css.gg@2.0.0/icons/css/menu.css' rel='stylesheet'>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
  </head>
  <body>
    <div class="preloader">
      <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
      </div>
    </div>
    <div
      id="main-wrapper"
      data-layout="vertical"
      data-navbarbg="skin5"
      data-sidebartype="full"
      data-sidebar-position="absolute"
      data-header-position="absolute"
      data-boxed-layout="full"
    >
      <header class="topbar" data-navbarbg="skin5">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark">
          <div class="navbar-header" data-logobg="skin5">
            <a class="navbar-brand" href="#">

              <b class="logo-icon ps-2">
          
                <img
                  src="assets/images/accounting.png"
                  alt="homepage"
                  class="light-logo"
                  width="55" height="50px"
                />
              </b>
             
              <span class="logo-text ms-2">
               
                AMS Dashboard
              </span>
            </a>
            <a
              class="nav-toggler waves-effect waves-light d-block d-md-none"
              href="javascript:void(0)"
              ><i class="ti-menu ti-close"></i
            ></a>
          </div>
          
          <div
            class="navbar-collapse collapse"
            id="navbarSupportedContent"
            data-navbarbg="skin5">
            <ul class="navbar-nav float-start me-auto">
              <li class="nav-item d-none d-lg-block">
                <a
                  class="nav-link sidebartoggler waves-effect waves-light"
                  href="javascript:void(0)"
                  data-sidebartype="mini-sidebar"
                  ><i class="mdi mdi-menu font-24"></i
                ></a>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  <span class="d-none d-md-block"
                    >Search </span>
                  <span class="d-block d-md-none"
                    ><i class="fa fa-plus"></i
                  ></span>
                </a>
              
              </li>
              
              <li class="nav-item search-box">
                <a
                  class="nav-link waves-effect waves-dark"
                  href="javascript:void(0)"
                  ><i class="mdi mdi-magnify fs-4"></i
                ></a>
                <form class="app-search position-absolute">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="Search &amp; enter"
                  />
                  <a class="srh-btn"><i class="mdi mdi-window-close"></i></a>
                </form>
              </li>
            </ul>
            <ul class="navbar-nav float-end">
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  <i class="mdi mdi-bell font-24"></i>
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="#">Action</a></li>
                  <li><a class="dropdown-item" href="#">Another action</a></li>
                  <li><hr class="dropdown-divider" /></li>
                  <li>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle waves-effect waves-dark"
                  href="#"
                  id="2"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  <i class="font-24 mdi mdi-comment-processing"></i>
                </a>
                <ul
                  class="
                    dropdown-menu dropdown-menu-endmailbox animated bounceInDown"
                  aria-labelledby="2">
                  <ul class="list-style-none">
                    <li>
                      <div class="">
                        <a href="javascript:void(0)" class="link border-top">
                          <div class="d-flex no-block align-items-center p-10">
                            <span
                              class="
                                btn btn-success btn-circle
                                d-flex
                                align-items-center
                                justify-content-center
                              "
                              ><i class="mdi mdi-calendar text-white fs-4"></i
                            ></span>
                            <div class="ms-2">
                              <h5 class="mb-0">Event today</h5>
                              <span class="mail-desc"
                                >Just a reminder that event</span
                              >
                            </div>
                          </div>
                        </a>
                       
                        <a href="javascript:void(0)" class="link border-top">
                          <div class="d-flex no-block align-items-center p-10">
                            <span
                              class="
                                btn btn-info btn-circle
                                d-flex
                                align-items-center
                                justify-content-center
                              "
                              ><i class="mdi mdi-settings fs-4"></i
                            ></span>
                            <div class="ms-2">
                              <h5 class="mb-0">Settings</h5>
                              <span class="mail-desc"
                                >You can customize this template</span
                              >
                            </div>
                          </div>
                        </a>

                        <a href="javascript:void(0)" class="link border-top">
                          <div class="d-flex no-block align-items-center p-10">
                            <span
                              class="
                                btn btn-primary btn-circle
                                d-flex
                                align-items-center
                                justify-content-center
                              "
                              ><i class="mdi mdi-account fs-4"></i
                            ></span>
                            <div class="ms-2">
                              <h5 class="mb-0">Pavan kumar</h5>
                              <span class="mail-desc"
                                >Just see the my admin!</span
                              >
                            </div>
                          </div>
                        </a>
                        
                        <a href="javascript:void(0)" class="link border-top">
                          <div class="d-flex no-block align-items-center p-10">
                            <span
                              class="
                                btn btn-danger btn-circle
                                d-flex
                                align-items-center
                                justify-content-center
                              "
                              ><i class="mdi mdi-link fs-4"></i
                            ></span>
                            <div class="ms-2">
                              <h5 class="mb-0">Luanch Admin</h5>
                              <span class="mail-desc"
                                >Just see the my new admin!</span
                              >
                            </div>
                          </div>
                        </a>
                      </div>
                    </li>
                  </ul>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="
                    nav-link
                    dropdown-toggle
                    text-muted
                    waves-effect waves-dark
                    pro-pic
                  "
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  <img
                    src="assets/images/users/1.jpg"
                    alt="user"
                    class="rounded-circle"
                    width="31"
                  />
                </a>
                <ul
                  class="dropdown-menu dropdown-menu-end user-dd animated"
                  aria-labelledby="navbarDropdown"
                >
                  <a class="dropdown-item" href="javascript:void(0)"
                    ><i class="mdi mdi-account me-1 ms-1"></i> My Profile</a
                  >
                  <a class="dropdown-item" href="javascript:void(0)"
                    ><i class="mdi mdi-email me-1 ms-1"></i> Inbox</a
                  >
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="settings.html"
                    ><i class="mdi mdi-settings me-1 ms-1"></i>
                    Setting</a
                  >
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="javascript:void(0)"
                    ><i class="fa fa-power-off me-1 ms-1"></i> Logout</a
                  >
                  <div class="dropdown-divider"></div>
                  <div class="ps-4 p-10">
                    <a
                      href="javascript:void(0)"
                      class="btn btn-sm btn-success btn-rounded text-white"
                      >View Profile</a
                    >
                  </div>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <aside class="left-sidebar" data-sidebarbg="skin5">
        <div class="scroll-sidebar">
          <nav class="sidebar-nav">
            <ul id="sidebarnav" class="pt-4">
              <li class="sidebar-item">
                <h4>My Business</h4>
                                     <li class="sidebar-item">
   <a class="sidebar-link has-arrow waves-effect waves-dark"
     href="javascript:void(0)"
     aria-expanded="false">
     <img src="assets/images/users/self-service.png"  style="width:40px;"/>
     <span class="hide-menu">Service</span></a>
<ul aria-expanded="false" class="collapse first-level">
 <li class="sidebar-item">
   <a
     class="sidebar-link waves-effect waves-dark sidebar-link"
     href="Service.aspx"
     aria-expanded="false">
       <img src="assets/images/users/public-service.png" style="width:40px;" />
     <span class="hide-menu">Service</span></a>
 </li>
    <li class="sidebar-item">
  <a
    class="sidebar-link waves-effect waves-dark sidebar-link"
    href="GridView_Service.aspx"
    aria-expanded="false">
      <img src="assets/images/users/view.png" style="width:40px;" />
    <span class="hide-menu">Service GridView</span></a>
</li>

    </ul>
                       </li>


              </li>



                              <li class="sidebar-item">
                <a
                  class="sidebar-link has-arrow waves-effect waves-dark"
                  href="javascript:void(0)"
                  aria-expanded="false">
                  <img src="assets/images/shopping-cart (1).png"style="width:40px;">
                  <span class="hide-menu">Purchase</span></a>
                  <ul aria-expanded="false" class="collapse first-level">
                  <li class="sidebar-item">
        <a href="Add_Item.aspx" class="sidebar-link">
            <img src="assets/images/users/add-item.png" style="width:30px;" />
          <span class="hide-menu">Add Items</span></a>         
</li>
                    <li class="sidebar-item">
                      <a href="Purchase.aspx" class="sidebar-link">
                        <img src="assets/images/receipt.png"style="width:30px;">
                        <span class="hide-menu">Purchase Invoice</span></a>    
              </li>

                            <li class="sidebar-item">
        <a href="Purchase_GridView.aspx" class="sidebar-link">
            <img src="assets/images/users/view.png"  style="width:30px;"/>
          <span class="hide-menu">GridView Purchase Invoice</span></a>    
</li>
              
        <li class="sidebar-item">
          <a href="Sales_Invoice.aspx" class="sidebar-link">
            <img src="assets/images/exchange.png"style="width:30px;">
            <span class="hide-menu">Purchase Return</span></a>
          
  </li>
  <li class="sidebar-item">
    <a href="salespage.html" class="sidebar-link">
      <img src="assets/images/booking.png"style="width:30px;">
      <span class="hide-menu">Purchase Order</span></a>
    
</li>
        </ul>

              </li>



                <li class="sidebar-item">
                <a
                  class="sidebar-link has-arrow waves-effect waves-dark"
                  href="javascript:void(0)"
                  aria-expanded="false">
                 <img src="assets/images/economy.png"style="width:40px;">
                  <span class="hide-menu">Sale</span></a>
                  <ul aria-expanded="false" class="collapse first-level">
                    <li   >
                      <a href="sales_Invoice.aspx" class="sidebar-link">
                        <img src="assets/images/bill.png"style="width:30px;">
                        <span class="hide-menu">Sale Invoice</span></a>
              </li>
            <li class="sidebar-item">
              <a href="Sales_Invoice_GridView.aspx" class="sidebar-link"
                > <img src="assets/images/money01.png"style="width:30px;">
                <span class="hide-menu">Sales_Invoice Gridview</span></a
              ></li>
             <%-- <li class="sidebar-item">
                <a href="SaleReturn.aspx" class="sidebar-link"
                  > <img src="assets/images/exchange (1).png"style="width:30px;">
                  <span class="hide-menu">Sale Return(Credit Note)</span></a
                ></li>--%>
                <%--<li class="sidebar-item">
                  <a href="Estimate.aspx" class="sidebar-link"
                    > <img src="assets/images/quotation.png"style="width:30px;color:white;">
                    <span class="hide-menu">Estimate Quotation</span></a
                  ></li>--%>
                  <%--<li class="sidebar-item">
                    <a href="Sale_Order.aspx" class="sidebar-link"
                      > <img src="assets/images/order.png"style="width:30px;">
                      <span class="hide-menu">Sale Order</span></a
                    ></li>--%>
                   <%-- <li class="sidebar-item">
                      <a href="Delivery_Challan.aspx" class="sidebar-link"
                        > <img src="assets/images/charge.png"style="width:30px;">
                        <span class="hide-menu">Delivery Challan</span></a
                      ></li>--%>
              </ul>
                    </li>
              

                   
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="Expenses.aspx"
                  aria-expanded="false">
                  <img src="assets/images/expenses.png"style="width:40px;">
                  <span class="hide-menu">Expenses</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="Stock_GridView.aspx"
                  aria-expanded="false">
                  <img src="assets/images/store.png"style="width:40px;">
                  <span class="hide-menu">Stock</span></a
                >
              </li>
                
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false">
                  <img src="assets/images/report.png"style="width:40px;">
                  <span class="hide-menu">Reports</span></a
                >
              </li>
                 <li class="sidebar-item">
   <a
     class="sidebar-link waves-effect waves-dark sidebar-link"
     href="Profit.aspx"     
     aria-expanded="false">
       <img src="assets/images/users/profit.png" style="width:40px;" />
     <span class="hide-menu">Profit</span></a
   >
 </li>
              <li class="sidebar-item">
                <h4>Cash & Bank</h4>
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="grid.html"
                  aria-expanded="false">
                  <img src="assets/images/bank.png"style="width:40px;">
                  <span class="hide-menu">Bank Accounts</span></a>
                
              </li>

                  <li class="sidebar-item">
  <a
    class="sidebar-link waves-effect waves-dark sidebar-link"
    href="Bank_Reconciliation.aspx"
    aria-expanded="false">
      <img src="assets/images/users/finance.png" style="width:40px;" />
    <span class="hide-menu">Bank Reconciliation</span></a>
</li>
                                  <li class="sidebar-item">
  <a
    class="sidebar-link waves-effect waves-dark sidebar-link"
    href="Bank_Reconciliation_GridView.aspx"
    aria-expanded="false">
      <img src="assets/images/users/view.png" style="width:40px;"/>
    <span class="hide-menu">GridView Bank Reconciliation</span></a>
</li>
                    

                                                  <li class="sidebar-item">
  <a
    class="sidebar-link waves-effect waves-dark sidebar-link"
    href="Balance_Sheet.aspx"
    aria-expanded="false">
      <img src="assets/images/users/report.png" style="width:40px;" />
    <span class="hide-menu">Balance Sheet</span></a>
</li>


              <%--<li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="grid.html"
                  aria-expanded="false">
                  <img src="assets/images/money.png"style="width:40px;">
                  <span class="hide-menu">Cash in-Hand </span></a>
                
              </li>--%>
              <%--<li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="grid.html"
                  aria-expanded="false">
                  <img src="assets/images/cheque.png"style="width:40px;">
                  <span class="hide-menu">Cheques </span></a>
              </li>--%>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false">
                  <img src="assets/images/loan.png"style="width:40px;">
                  <span class="hide-menu">Loan Account </span></a>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false">
                  <img src="assets/images/request-money.png"style="width:40px;">
                  <span class="hide-menu">Apply for Loan</span></a>
              </li>
             <%-- <li class="sidebar-item">
                <h4>Important Utilities</h4>
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false">
                  <img src="assets/images/sync.png"style="width:40px;">
                  <span class="hide-menu">Sync & share</span></a>
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false"
                  ><i class='fas fa-gear fa-spin'></i>
                  <span class="hide-menu">Manage Companies</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false">
                  <img src="assets/images/restore.png"style="width:40px;">
                  <span class="hide-menu">Backup & Restore</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false"
                  ><i class="fa fa-briefcase"></i>
                  <span class="hide-menu">Utilities</span></a
                >
              </li>--%>
              <li class="sidebar-item">
                <h4>Others</h4>
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false"
                  ><i class='fas fa-gem'></i>
                  <span class="hide-menu">Ahts Premium</span></a
                >
              </li>
              <%--<li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false">
                  <img src="assets/images/invoice.png"style="width:35px;">
                  <span class="hide-menu">Billing Software</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false"
                  ><i class='fas fa-cubes'></i>
                  <span class="hide-menu">Other Product</span></a
                >
              </li>--%>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false">
                  <img src="assets/images/handshake.png"style="width:40px;">
                  <span class="hide-menu">Greetings & Offers</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false"
                  ><i class='fas fa-gear'></i>
                  <span class="hide-menu">Settings</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false"
                  ><img src="assets/images/giftbox.png"style="width:40px;">
                  <span class="hide-menu">Refer & Earn</span></a
                >
              </li>
              <li class="sidebar-item">
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="tables.html"
                  aria-expanded="false"
                  ><img src="assets/images/customer-service.png"style="width:40px;">
                  <span class="hide-menu">Help & Support</span></a
                >
              </li>
                </ul>
            </ul>
          </nav>
        </div>
      </aside>
      <div class="page-wrapper">
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
              <h4 class="page-title">Accounts Manegement System</h4>
              <div class="ms-auto text-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    
                  </ol>
                </nav>
              </div>
            </div>
          </div>
        </div>
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-6 col-lg-3">
              <div class="card card-hover">
                <div class="box bg-cyan text-center">
                  <h1 class="font-light text-white">
                    <i class="mdi mdi-view-dashboard"></i>
                  </h1>
                  <h6 class="text-white">Dashboard</h6>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3">
              <div class="card card-hover">
                <div class="box bg-success text-center">
                  <h1 class="font-light text-white">
                    <img src="assets/images/store.png"style="width:40px;">
                  </h1>
                  <h6 class="text-white">My Online Store</h6>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3">
              <div class="card card-hover">
                <div class="box bg-warning text-center">
                  <h1 class="font-light text-white">
                    <img src="assets/images/bank.png"style="width:40px;">
                  </h1>
                  <a href="Bank_Reconciliation.aspx" class="text-white">Bank Account</a>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-3">
              <div class="card card-hover">
                <div class="box bg-danger text-center">
                  <h1 class="font-light text-white">
                    <img src="assets/images/expenses.png"style="width:40px;">
                  </h1>
                    <a href="Expenses.aspx" class="text-white">Expenses</a>
                  
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
        <script src="assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="dist/js/jquery.ui.touch-punch-improved.js"></script>
        <script src="dist/js/jquery-ui.min.js"></script>
        <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <script src="dist/js/waves.js"></script>
    <script src="dist/js/sidebarmenu.js"></script>
    <script src="dist/js/custom.min.js"></script>
    <script src="assets/libs/moment/min/moment.min.js"></script>
    <script src="assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="dist/js/pages/calendar/cal-init.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
  </body>
</html>

