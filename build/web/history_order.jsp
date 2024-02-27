<%-- 
    Document   : history-order.jsp
    Created on : Feb 24, 2024, 9:14:45 PM
    Author     : Anh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <script type="text/javascript">
            function doRate(id) {
                
                    window.location = "review?orderId=" + id; /// trỏ vào href
                
            }
        </script>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">User Profile</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="home">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">User Profile</p>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="list-group">
                        <a href="profile.jsp" class="list-group-item list-group-item-action ">Cập nhật Hồ Sơ</a>
                        <a href="updatepassword.jsp" class="list-group-item list-group-item-action">Đổi Mật Khẩu</a>
                        <a href="addressAccount.jsp" class="list-group-item list-group-item-action">Địa Chỉ</a>
                        <a href="account?action=order-product&status=Đang" class="list-group-item list-group-item-action">Đơn Hàng</a>
                        <a href="account?action=history-order" class="list-group-item list-group-item-action">Lịch Sử Mua Hàng</a>
                        <a href="login?action=logout" class="list-group-item list-group-item-action">Log Out</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <h3>Đơn hàng</h3>
                    <h4 style="color: red;">${requestScope.alert}</h4>
                    <div class="container-fluid">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr> 
                                    <th rowspan="2" class="align-middle">Mã đơn hàng</th>
                                    <th rowspan="2" class="align-middle">Sản phẩm</th>
                                    <th rowspan="2" class="align-middle">Giá</th>
                                    <th rowspan="2" class="align-middle">Trạng thái</th>
                                    <th rowspan="2" class="align-middle">Thao tác</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="i" value="0"/>
                                <c:set value="${requestScope.orderList}" var="orderList"/>
                                <c:set value="${requestScope.orderdetailList}" var="orderdetailList"/>
                                <jsp:useBean id="laptopdao" class="com.model.laptop.LaptopDAO"/>

                                <c:forEach items="${orderList}" var="order">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>
                                            <c:forEach items="${orderdetailList[i]}" var="orderdetail">
                                                <img src="images/${laptopdao.getImagesbyLaptopId(orderdetail.laptopId).get(0)}" alt="alt" width="50px"/>${laptopdao.getLaptopbyLaptopId(orderdetail.laptopId).name}<a style="color: red; border: 1px;">X${orderdetail.quantity}</a><hr>
                                            </c:forEach>
                                        </td>
                                        <fmt:formatNumber value="${order.totalMoney}" pattern="#,##0" var="price" />
                                        <td>${price}đ</td>
                                        <td style="text-align: center;">${order.status}</td>
                                        <td class="text-center">
                                            <c:if test="${order.status eq 'Đã nhận hàng'}">
                                                <div class="btn-group-vertical" role="group" aria-label="Thao tác">
                                                <button type="button" class="btn btn-danger btn-sm" onclick="doRate(${order.id})">Đánh giá</button>                                                                                                                                 
                                            </div>
                                            </c:if>
                                            
                                        </td>

                                    </tr>
                                    <c:set var="i" value="${i+1}"/>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp"/>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>

