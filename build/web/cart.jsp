<%-- 
    Document   : cart.jsp
    Created on : Feb 18, 2024, 10:53:55 PM
    Author     : Anh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lamtop Shop</title>
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
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="home">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Shopping Cart</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Cart Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số Lượng</th>
                                <th>Tổng</th>
                                <th>Bỏ</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <c:set var="cart" value="${sessionScope.cart}"/>
                            <c:set var="t" value="0"/>
                            <c:set value="0" var="totalPrice"/>
                            <c:forEach items="${cart.items}" var="item">
                                <c:set var="t" value="${t+1}"/>
                                <tr>
                                    <td class="align-middle"><img src="images/${item.laptop.image.get(0)}" alt="" style="width: 50px;">${item.laptop.name}</td>
                                        <fmt:formatNumber value="${item.laptop.discount}" pattern="#,##0" var="discount" />
                                    <td class="align-middle">${discount}đ</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group quantity mx-auto" style="width: 100px;">
                                                <div class="input-group-prepend">
                                                    <a href="process?quantityLaptop=-1&id=${item.laptop.id}" class="btn btn-sm btn-primary btn-minus">
                                                        <i class="fa fa-minus"></i>
                                                    </a>
                                                </div>
                                                <input type="text" readonly class="form-control form-control-sm bg-secondary text-center" value="${item.quantity}">
                                                <div class="input-group-append">
                                                    <a href="process?quantityLaptop=1&id=${item.laptop.id}" class="btn btn-sm btn-primary btn-plus">
                                                        <i class="fa fa-plus"></i>
                                                    </a>
                                                </div>
                                            </div>

                                    </td>                                  
                                    <fmt:formatNumber value="${item.laptop.discount*item.quantity}" pattern="#,##0" var="price" />
                                    <td class="align-middle">${price}</td>
                                    <c:set value="${totalPrice+item.laptop.discount*item.quantity}" var="totalPrice"/>
                            <form action="process" method="post">
                                <input type="hidden" value="${item.laptop.id}" name="id"/>
                                <td class="align-middle"><button class="btn btn-sm btn-primary"> <i class="fa fa-times"></i></button></td>
                            </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">              
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Tổng đơn</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <fmt:formatNumber value="${totalPrice}" pattern="#,##0" var="totalCheckout" />
                                <h6 class="font-weight-medium">Tổng tiền</h6>
                                <h6 class="font-weight-medium">${totalCheckout}đ</h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Phí ship</h6>
                                <h6 class="font-weight-medium">0đ</h6>
                            </div>
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Tổng</h5>
                                <h5 class="font-weight-bold">${totalCheckout}đ</h5>
                            </div>
                            <button class="btn btn-block btn-primary my-3 py-3" onclick="checkout()">Thanh toán</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->


        <!-- Footer Start -->
        <jsp:include page="footer.jsp"/>
        <!-- Footer End -->

        <script type="text/javascript">
                function checkout(){
                    window.location.href = "checkout.jsp";
                }
            </script>
        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
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
</body>
</html>
