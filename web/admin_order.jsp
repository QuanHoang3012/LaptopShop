<%-- 
    Document   : admin_order.jsp
    Created on : Mar 1, 2024, 12:38:32 AM
    Author     : Anh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>Orders</title>

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
            function doShip(id) {
                if (confirm("Shipping orders ?")) {
                    window.location = "admin_order?action=ship&id=" + id;
                }
            }
            function doCancel(id) {
                if (confirm("Cancel orders ?")) {
                    window.location = "admin_order?action=cancel&id=" + id;
                }
            }
        </script>
    </head> 

    <body class="app">   	
        <jsp:include page="admin-header.jsp"/>

        <div class="app-wrapper">

            <div class="app-content pt-3 p-md-3 p-lg-4">
                <div class="container-xl">

                    <div class="row g-3 mb-4 align-items-center justify-content-between">
                        <div class="col-auto">
                            <h1 class="app-page-title mb-0">Orders</h1>
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
                    </div><!--//row-->

                    <jsp:useBean id="laptopdao" class="com.model.laptop.LaptopDAO"/>
                    <jsp:useBean id="accountdao" class="com.model.account.AccountDAO"/>
                    <c:set value="${requestScope.orderList}" var="orderList"/>
                    <c:set value="${requestScope.orderdetailList}" var="orderdetailList"/>
                    <nav id="orders-table-tab" class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
                        <a class="flex-sm-fill text-sm-center nav-link active" id="orders-all-tab" data-bs-toggle="tab" href="#orders-all" role="tab" aria-controls="orders-all" aria-selected="true">All</a>
                        <a class="flex-sm-fill text-sm-center nav-link"  id="orders-paid-tab" data-bs-toggle="tab" href="#orders-paid" role="tab" aria-controls="orders-paid" aria-selected="false">Paid</a>
                        <a class="flex-sm-fill text-sm-center nav-link" id="orders-pending-tab" data-bs-toggle="tab" href="#orders-pending" role="tab" aria-controls="orders-pending" aria-selected="false">Pending</a>
                        <a class="flex-sm-fill text-sm-center nav-link" id="orders-cancelled-tab" data-bs-toggle="tab" href="#orders-cancelled" role="tab" aria-controls="orders-cancelled" aria-selected="false">Cancelled</a>
                    </nav>


                    <div class="tab-content" id="orders-table-tab-content">
                        <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
                            <div class="app-card app-card-orders-table shadow-sm mb-5">
                                <div class="app-card-body">
                                    <div class="table-responsive">
                                        <table class="table app-table-hover mb-0 text-left">
                                            <thead>
                                                <tr>
                                                    <th class="cell">Order</th>
                                                    <th  class="cell">Product</th>
                                                    <th class="cell">Customer</th>
                                                    <th class="cell">Date</th>
                                                    <th class="cell">Status</th>
                                                    <th class="cell">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="i" value="0"/>
                                                <c:forEach items="${orderList}" var="order">
                                                    <tr>
                                                        <td class="cell">${order.id}</td>
                                                        <td class="cell">
                                                            <c:forEach items="${orderdetailList[i]}" var="orderdetail">
                                                                <span class="">${laptopdao.getLaptopbyLaptopId(orderdetail.laptopId).name}</span><br>
                                                            </c:forEach>
                                                        </td>
                                                        <td class="cell">${accountdao.getAccountById(order.customerId).fullname}</td>
                                                        <td class="cell"><span>${order.date}</span><span class="note"></span></td>
                                                                <c:if test="${order.status eq 'Đang xử lý đơn hàng'}">
                                                            <td class="cell"><span class="badge bg-warning">${order.status}</span></td>
                                                            </c:if>
                                                            <c:if test="${order.status eq 'Đang vận chuyển'}">
                                                            <td class="cell"><span class="badge bg-info">${order.status}</span></td>
                                                            </c:if>
                                                            <c:if test="${order.status eq 'Đã hủy'}">
                                                            <td class="cell"><span class="badge bg-danger">${order.status}</span></td>
                                                            </c:if>
                                                            <c:if test="${order.status eq 'Đã nhận hàng'}">
                                                            <td class="cell"><span class="badge bg-success">${order.status}</span></td>
                                                            </c:if>
                                                            <c:if test="${order.status eq 'Đang xem xét hủy đơn'}">
                                                            <td class="cell"><span class="badge bg-secondary">${order.status}</span></td>
                                                            </c:if>

                                                        <fmt:formatNumber value="${order.totalMoney}" pattern="#,##0" var="price" />
                                                        <td class="cell">${price}đ</td>
                                                    </tr>      
                                                    <c:set var="i" value="${i+1}"/>
                                                </c:forEach>


                                            </tbody>
                                        </table>
                                    </div><!--//table-responsive-->

                                </div><!--//app-card-body-->		
                            </div><!--//app-card-->
                            <c:set var="page"   value="${requestScope.page}"/>
                            <c:set var="numPage" value="${requestScope.num}"/>
                            <nav class="app-pagination">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item  ${page==1?"disabled":""}"">
                                        <a class="page-link"  href="admin_order?page=${page-1}" tabindex="-1" aria-disabled="true">Previous</a>
                                    </li>
                                    <c:forEach  begin="${1}"  end="${numPage}" var="i">
                                        <li class="${i==page?'page-item active':' '}" "><a class="page-link" href="admin_order?page=${i}">${i}</a></li>    
                                        </c:forEach>

                                    <li class="page-item ${page==numPage?"disabled":""}">
                                        <a class="page-link" href="admin_order?page=${page+1}">Next</a>
                                    </li>
                                </ul>
                            </nav><!--//app-pagination-->

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
                                                <c:set var="y" value="0"/>
                                                <c:forEach items="${orderList}" var="order">
                                                    <c:if test="${order.status eq 'Đã nhận hàng'}">
                                                        <tr>
                                                            <td class="cell">${order.id}</td>
                                                            <td class="cell">
                                                                <c:forEach items="${orderdetailList[y]}" var="orderdetail">
                                                                    <span class="">${laptopdao.getLaptopbyLaptopId(orderdetail.laptopId).name}</span><br>
                                                                </c:forEach>
                                                            </td>
                                                            <td class="cell">${accountdao.getAccountById(order.customerId).fullname}</td>
                                                            <td class="cell"><span>${order.date}</span><span class="note"></span></td>
                                                            <td class="cell"><span class="badge bg-success">${order.status}</span></td>
                                                            <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                            <fmt:formatNumber value="${order.totalMoney}" pattern="#,##0" var="price" />
                                                            <td class="cell">${price}đ</td>
                                                        </tr>                                                        
                                                    </c:if>  
                                                    <c:set var="y" value="${y+1}"/>
                                                </c:forEach>                 


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
                                                <c:set var="z" value="0"/>
                                                <c:forEach items="${orderList}" var="order">
                                                    <c:if test="${order.status eq 'Đang xử lý đơn hàng' || order.status eq 'Đang vận chuyển' || order.status eq 'Đang xem xét hủy đơn'}">
                                                        <tr>

                                                            <td class="cell">${order.id}</td>
                                                            <td class="cell">
                                                                <c:forEach items="${orderdetailList[z]}" var="orderdetail">
                                                                    <span class="">${laptopdao.getLaptopbyLaptopId(orderdetail.laptopId).name}</span><br>
                                                                </c:forEach>
                                                            </td>
                                                            <td class="cell">${accountdao.getAccountById(order.customerId).fullname}</td>
                                                            <td class="cell"><span>${order.date}</span><span class="note"></span></td>
                                                                    <c:if test="${order.status eq 'Đang xử lý đơn hàng'}">
                                                                <td class="cell"><span class="badge bg-warning">${order.status}</span></td>
                                                                </c:if>
                                                                <c:if test="${order.status eq 'Đang vận chuyển'}">
                                                                <td class="cell"><span class="badge bg-info">${order.status}</span></td>
                                                                </c:if>
                                                                <c:if test="${order.status eq 'Đang xem xét hủy đơn'}">
                                                                <td class="cell"><span class="badge bg-secondary">${order.status}</span></td>
                                                                </c:if>
                                                                <fmt:formatNumber value="${order.totalMoney}" pattern="#,##0" var="price" />
                                                            <td class="cell">${price}đ</td>
                                                            <c:if test="${order.status eq 'Đang xử lý đơn hàng'}">
                                                                <td class="cell"><a class="btn-sm app-btn-secondary" href="#" onclick="doShip('${order.id}')">Ship</a></td>
                                                            </c:if>     
                                                            <c:if test="${order.status eq 'Đang xem xét hủy đơn'}">
                                                                <td class="cell"><a class="btn-sm app-btn-secondary" href="#" onclick="doShip('${order.id}')">Ship</a></td>
                                                                <td class="cell"><a class="btn-sm app-btn-secondary" href="#" onclick="doCancel('${order.id}')">Cancel</a></td>
                                                            </c:if>
                                                        </tr>
                                                    </c:if>
                                                    <c:set var="z" value="${z+1}"/>
                                                </c:forEach>

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

                                                </tr>


                                            </thead>
                                            <tbody>
                                                <c:set var="t" value="0"/>
                                                <c:forEach items="${orderList}" var="order">
                                                    <c:if test="${order.status eq 'Đã hủy'}">
                                                        <tr>
                                                            <td class="cell">${order.id}</td>
                                                            <td class="cell">
                                                                <c:forEach items="${orderdetailList[t]}" var="orderdetail">
                                                                    <span class="">${laptopdao.getLaptopbyLaptopId(orderdetail.laptopId).name}</span><br>
                                                                </c:forEach>
                                                            </td>
                                                            <td class="cell">${accountdao.getAccountById(order.customerId).fullname}</td>
                                                            <td class="cell"><span>${order.date}</span><span class="note"></span></td>
                                                                    <c:if test="${order.status eq 'Đã hủy'}">
                                                                <td class="cell"><span class="badge bg-danger">${order.status}</span></td>
                                                                </c:if>                                                      
                                                                <fmt:formatNumber value="${order.totalMoney}" pattern="#,##0" var="price" />
                                                            <td class="cell">${price}đ</td>

                                                        </tr>
                                                    </c:if>
                                                    <c:set var="t" value="${t+1}"/>
                                                </c:forEach>
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

