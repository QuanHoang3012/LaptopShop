<%-- 
    Document   : checkout.jsp
    Created on : Feb 21, 2024, 8:57:21 PM
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
            function redirect(msg) {
                window.alert(msg);
                window.location.href = "home"; // Corrected line
            }


        </script>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="home">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Checkout</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <c:set var="account" value="${sessionScope.account}"/>
        <!-- Checkout Start -->
        <div class="container-fluid pt-5">
            <form method="post" action="checkout">
                <div class="row px-xl-5">
                    <div class="col-lg-6">   
                        <div class="container mt-4">
                            <div class="d-flex align-items-center">
                                <h3 class="mr-3">Địa chỉ giao hàng</h3>
                                <a href="addressAccount.jsp" class="btn btn-primary">Thêm địa chỉ</a>
                            </div>
                        </div>
                        <jsp:useBean id="addressList" class="com.model.address.AddressDAO" />
                        <c:set value="${addressList.getAllAddressByAccount(account.id)}" var="addressbyId"/>
                        <c:forEach items="${addressbyId}"  var="m">
                            <div class="form-check">
                                <hr>
                                <input class="form-check-input" type="radio" name="address"  value="${m.id}">
                                <label class="form-check-label" for="addressOption">
                                    <h5> ${m.name}</h5> <p> |  ${m.phone}</p>
                                    <p>${m.address}</p>
                                </label>
                                <hr>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-lg-6">
                        <div class="card border-secondary mb-5">
                            <h4 style="color: red; margin-bottom: 20px;">${requestScope.error}</h5>
                                <div class="card-header bg-secondary border-0">
                                    <h4 class="font-weight-semi-bold m-0">Tổng thanh toán</h4>
                                </div>
                                <div class="card-body">
                                    <h5 class="font-weight-medium mb-3">Sản phẩm</h5>
                                    <c:set var="cart" value="${sessionScope.cart}"/>
                                    <c:forEach items="${cart.items}" var="c">
                                        <div class="d-flex justify-content-between">
                                            <p>${c.laptop.name}</p>
                                            <fmt:formatNumber value="${c.laptop.discount*c.quantity}" pattern="#,##0" var="price" />
                                            <p>${price}đ</p>                           
                                        </div>
                                    </c:forEach>
                                    <hr class="mt-0">
                                    <div class="d-flex justify-content-between mb-3 pt-1">
                                        <fmt:formatNumber value="${cart.getTotalMoney()}" pattern="#,##0" var="totalprice" />
                                        <h6 class="font-weight-medium">Tổng tiền</h6>
                                        <h6 class="font-weight-medium">${totalprice}đ</h6>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <h6 class="font-weight-medium">Phí ship</h6>
                                        <h6 class="font-weight-medium">0đ</h6>
                                    </div>
                                </div>
                                <div class="card-footer border-secondary bg-transparent">
                                    <div class="d-flex justify-content-between mt-2">
                                        <h5 class="font-weight-bold">Tổng</h5>
                                        <h5 class="font-weight-bold">${totalprice}đ</h5>
                                    </div>
                                </div>
                        </div>
                        <div class="card border-secondary mb-5">
                            <div class="card-header bg-secondary border-0">
                                <h4 class="font-weight-semi-bold m-0">Phương thức thanh toán</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" checked="" id="paypal">
                                        <label class="custom-control-label" for="paypal">COD</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                                        <label class="custom-control-label" for="directcheck">Mobile Banking</label>
                                    </div>
                                </div>
                            </div>

                            <c:set value="${requestScope.error}" var="error"/>
                            <div class="card-footer border-secondary bg-transparent">
                                <button type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" >Thanh toán</button>
                            </div>

                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- Checkout End -->
        <jsp:include page="footer.jsp"/>



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
</html>
