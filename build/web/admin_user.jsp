<%-- 
    Document   : admin_user.jsp
    Created on : Mar 4, 2024, 5:59:11 PM
    Author     : Anh Quan
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>Portal - Bootstrap 5 Admin Dashboard Template For Developers</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta name="description" content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
        <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
        <link rel="shortcut icon" href="favicon.ico"> 

        <!-- FontAwesome JS-->
        <script defer src="assets1/plugins/fontawesome/js/all.min.js"></script>

        <!-- App CSS -->  
        <link id="theme-style" rel="stylesheet" href="assets1/css/portal.css">
        <script type="text/javascript">

        </script>
    </head> 

    <body class="app">   	
        <jsp:include page="admin-header.jsp"/>

        <div class="app-wrapper">

            <div class="app-content pt-3 p-md-3 p-lg-4">
                <div class="container-xl">

                    <div class="row g-3 mb-4 align-items-center justify-content-between">
                        <div class="col-auto">
                            <h1 class="app-page-title mb-0">Users</h1>
                        </div>
                        <div class="col-auto">
                            <div class="page-utilities">
                                <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
                                    <div class="col-auto">
                                     
                                    </div><!--//col-->
                                    <div class="col-auto">
                                    </div>                                 
                                </div><!--//row-->
                            </div><!--//table-utilities-->
                        </div><!--//col-auto-->
                           <div class="col-auto">
                                        <a class="btn app-btn-primary" href="admin_createAccount.jsp"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-upload me-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                            <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
                                            </svg>Create Account</a>
                                    </div>
                    </div><!--//row-->
                    

                    <nav id="orders-table-tab" class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
                        <a class="flex-sm-fill text-sm-center nav-link active" id="orders-all-tab" data-bs-toggle="tab" href="#orders-all" role="tab" aria-controls="orders-all" aria-selected="true">Admin</a>
                        <a class="flex-sm-fill text-sm-center nav-link"  id="orders-paid-tab" data-bs-toggle="tab" href="#orders-paid" role="tab" aria-controls="orders-paid" aria-selected="false">Customer</a>                       
                    </nav>

                    
                    <div class="tab-content" id="orders-table-tab-content">
                        <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
                            <div class="app-card app-card-orders-table shadow-sm mb-5">
                                <div class="app-card-body">
                                    <div class="table-responsive">
                                        <table class="table app-table-hover mb-0 text-left">
                                            <thead>
                                                <tr>
                                                    <th class="cell">ID</th>
                                                    <th class="cell">Username</th>
                                                    <th class="cell">FullName</th>
                                                    <th class="cell">Phone</th>
                                                    <th class="cell">Email</th>
                                                    <th class="cell"></th>        
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="cell">#15346</td>
                                                    <td class="cell"><span class="truncate">Lorem ipsum dolor sit amet eget volutpat erat</span></td>
                                                    <td class="cell">John Sanders</td>
                                                    <td class="cell"><span>17 Oct</span><span class="note">2:16 PM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$259.35</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td class="cell">#15345</td>
                                                    <td class="cell"><span class="truncate">Consectetur adipiscing elit</span></td>
                                                    <td class="cell">Dylan Ambrose</td>
                                                    <td class="cell"><span class="cell-data">16 Oct</span><span class="note">03:16 AM</span></td>
                                                    <td class="cell"><span class="badge bg-warning">Pending</span></td>
                                                    <td class="cell">$96.20</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td class="cell">#15344</td>
                                                    <td class="cell"><span class="truncate">Pellentesque diam imperdiet</span></td>
                                                    <td class="cell">Teresa Holland</td>
                                                    <td class="cell"><span class="cell-data">16 Oct</span><span class="note">01:16 AM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$123.00</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>

                                                <tr>
                                                    <td class="cell">#15343</td>
                                                    <td class="cell"><span class="truncate">Vestibulum a accumsan lectus sed mollis ipsum</span></td>
                                                    <td class="cell">Jayden Massey</td>
                                                    <td class="cell"><span class="cell-data">15 Oct</span><span class="note">8:07 PM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$199.00</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>

                                                <tr>
                                                    <td class="cell">#15342</td>
                                                    <td class="cell"><span class="truncate">Justo feugiat neque</span></td>
                                                    <td class="cell">Reina Brooks</td>
                                                    <td class="cell"><span class="cell-data">12 Oct</span><span class="note">04:23 PM</span></td>
                                                    <td class="cell"><span class="badge bg-danger">Cancelled</span></td>
                                                    <td class="cell">$59.00</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>

                                                <tr>
                                                    <td class="cell">#15341</td>
                                                    <td class="cell"><span class="truncate">Morbi vulputate lacinia neque et sollicitudin</span></td>
                                                    <td class="cell">Raymond Atkins</td>
                                                    <td class="cell"><span class="cell-data">11 Oct</span><span class="note">11:18 AM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$678.26</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div><!--//table-responsive-->

                                </div><!--//app-card-body-->		
                            </div><!--//app-card-->                          

                        </div><!--//tab-pane-->

                        <div class="tab-pane fade" id="orders-paid" role="tabpanel" aria-labelledby="orders-paid-tab">
                            <div class="app-card app-card-orders-table mb-5">
                                <div class="app-card-body">
                                    <div class="table-responsive">

                                        <table class="table mb-0 text-left">
                                            <thead>
                                                <tr>
                                                    <th class="cell">Order</th>
                                                    <th class="cell">Product</th>
                                                    <th class="cell">Customer</th>
                                                    <th class="cell">Date</th>
                                                    <th class="cell">Status</th>
                                                    <th class="cell">Total</th>
                                                    <th class="cell"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="cell">#15346</td>
                                                    <td class="cell"><span class="truncate">Lorem ipsum dolor sit amet eget volutpat erat</span></td>
                                                    <td class="cell">John Sanders</td>
                                                    <td class="cell"><span>17 Oct</span><span class="note">2:16 PM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$259.35</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>

                                                <tr>
                                                    <td class="cell">#15344</td>
                                                    <td class="cell"><span class="truncate">Pellentesque diam imperdiet</span></td>
                                                    <td class="cell">Teresa Holland</td>
                                                    <td class="cell"><span class="cell-data">16 Oct</span><span class="note">01:16 AM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$123.00</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>

                                                <tr>
                                                    <td class="cell">#15343</td>
                                                    <td class="cell"><span class="truncate">Vestibulum a accumsan lectus sed mollis ipsum</span></td>
                                                    <td class="cell">Jayden Massey</td>
                                                    <td class="cell"><span class="cell-data">15 Oct</span><span class="note">8:07 PM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$199.00</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>


                                                <tr>
                                                    <td class="cell">#15341</td>
                                                    <td class="cell"><span class="truncate">Morbi vulputate lacinia neque et sollicitudin</span></td>
                                                    <td class="cell">Raymond Atkins</td>
                                                    <td class="cell"><span class="cell-data">11 Oct</span><span class="note">11:18 AM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$678.26</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div><!--//table-responsive-->
                                </div><!--//app-card-body-->		
                            </div><!--//app-card-->
                        </div><!--//tab-pane-->

                        <div class="tab-pane fade" id="orders-pending" role="tabpanel" aria-labelledby="orders-pending-tab">
                            <div class="app-card app-card-orders-table mb-5">
                                <div class="app-card-body">
                                    <div class="table-responsive">
                                        <table class="table mb-0 text-left">
                                            <thead>
                                                <tr>
                                                    <th class="cell">Order</th>
                                                    <th class="cell">Product</th>
                                                    <th class="cell">Customer</th>
                                                    <th class="cell">Date</th>
                                                    <th class="cell">Status</th>
                                                    <th class="cell">Total</th>
                                                    <th class="cell"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="cell">#15345</td>
                                                    <td class="cell"><span class="truncate">Consectetur adipiscing elit</span></td>
                                                    <td class="cell">Dylan Ambrose</td>
                                                    <td class="cell"><span class="cell-data">16 Oct</span><span class="note">03:16 AM</span></td>
                                                    <td class="cell"><span class="badge bg-warning">Pending</span></td>
                                                    <td class="cell">$96.20</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!--//table-responsive-->
                                </div><!--//app-card-body-->		
                            </div><!--//app-card-->
                        </div><!--//tab-pane-->
                        <div class="tab-pane fade" id="orders-cancelled" role="tabpanel" aria-labelledby="orders-cancelled-tab">
                            <div class="app-card app-card-orders-table mb-5">
                                <div class="app-card-body">
                                    <div class="table-responsive">
                                        <table class="table mb-0 text-left">
                                            <thead>
                                                <tr>
                                                    <th class="cell">Order</th>
                                                    <th class="cell">Product</th>
                                                    <th class="cell">Customer</th>
                                                    <th class="cell">Date</th>
                                                    <th class="cell">Status</th>
                                                    <th class="cell">Total</th>
                                                    <th class="cell"></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <tr>
                                                    <td class="cell">#15342</td>
                                                    <td class="cell"><span class="truncate">Justo feugiat neque</span></td>
                                                    <td class="cell">Reina Brooks</td>
                                                    <td class="cell"><span class="cell-data">12 Oct</span><span class="note">04:23 PM</span></td>
                                                    <td class="cell"><span class="badge bg-danger">Cancelled</span></td>
                                                    <td class="cell">$59.00</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div><!--//table-responsive-->
                                </div><!--//app-card-body-->		
                            </div><!--//app-card-->
                        </div><!--//tab-pane-->
                    </div><!--//tab-content-->



                </div><!--//container-fluid-->
            </div><!--//app-content-->

            <footer class="app-footer">
                <div class="container text-center py-3">
                    <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
                    <small class="copyright">Designed with <span class="sr-only">love</span><i class="fas fa-heart" style="color: #fb866a;"></i> by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>

                </div>
            </footer><!--//app-footer-->

        </div><!--//app-wrapper-->    									


        <!-- Javascript -->          
        <script src="assets1/plugins/popper.min.js"></script>
        <script src="assets1/plugins/bootstrap/js/bootstrap.min.js"></script>  


        <!-- Page Specific JS -->
        <script src="assets1/js/app.js"></script> 

    </body>
</html> 


