<%-- 
    Document   : home
    Created on : Jan 22, 2024, 9:30:39 PM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript">
            function buy(id){
                document.f.action = "buy?id="+id;
                document.f.submit();
            }
        </script>
    <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-2 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark" href="">FAQs</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Help</a>
                        <span class="text-muted px-2">|</span>
                        <a class="text-dark" href="">Support</a>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a class="text-dark pl-2" href="">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">L</span>Shopper</h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form id="searchForm" action="laptop" method="get">
                        <div class="input-group">
                            <input type="text" class="form-control" name="key" placeholder="Search by name">
                            <div class="input-group-append">
                                <button onclick="this.form.submit()" class="btn bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-3 col-6 text-right">
                    <a href="cart.jsp" class="btn border">
                        <i class="fas fa-shopping-cart text-primary"></i>
                        <span class="badge">${sessionScope.size}</span>
                    </a>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Hãng Sản Xuất</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                            <a href="laptop?manuId=${0}" class="nav-item nav-link">All</a> 
                            <jsp:useBean id="manufacturer" class="com.model.manufacturer.ManufacturerDAO"/>
                            <c:forEach items="${manufacturer.all}" var="m">
                                <a href="laptop?manuId=${m.id}" class="nav-item nav-link">${m.name}</a>
                            </c:forEach>

                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">L</span>Shopper</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="home" class="nav-item nav-link">Home</a>
                                <a href="laptop" class="nav-item nav-link">Shop</a>
                                <a href="cart.jsp" class="nav-item nav-link">Shopping Cart</a>
                                <a href="checkout.jsp" class="nav-item nav-link">Checkout</a>
                                <a href="contact.html" class="nav-item nav-link">Contact</a>
                            </div>
                            <c:set var="account" value="${sessionScope.account}"/>
                            <c:if test="${account ==null}">
                                <div class="navbar-nav ml-auto py-0">
                                    <a href="login.jsp" class="nav-item nav-link">Login</a>
                                    <a href="signup.jsp" class="nav-item nav-link">Register</a>
                                </div>
                            </c:if>
                            <c:if test="${account !=null}">
                                <div class="navbar-nav ml-auto py-0">                                   
                                    <img src="images/${account.image!=null?account.image:"profileimage.png"}"  alt="Profile Image" class="nav-profile-image rounded-circle" style="width: 30px; height: 30px; object-fit: cover;margin-top: 14px;">
                                    <a href="profile.jsp" class="nav-item nav-link">${account.fullname}</a>
                                    <c:if test="${account.role==1}">
                                        <a href="profile.jsp" class="nav-item nav-link">User Profile</a>
                                    </c:if>
                                    <c:if test="${account.role==0}">
                                        <a href="profile.jsp" class="nav-item nav-link">User Profile</a>
                                        <a href="profile.jsp" class="nav-item nav-link">Admin</a>
                                    </c:if>
                                    <a href="login?action=logout" class="nav-item nav-link">Log out</a>
                                </div>
                            </c:if>
                        </div>
                    </nav>
                    <div id="header-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" style="height: 410px;">
                                <img class="img-fluid" src="images/homelap1.png" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">Bảo hành 3 năm</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">An toàn mua hàng</h3>
                                        <a href="laptop" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" src="images/homelap2.png" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">Cấu hình cực khủng</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Giá cả hợp lý</h3>
                                        <a href="laptop" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-prev-icon mb-n2"></span>
                            </div>
                        </a>
                        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-next-icon mb-n2"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">100% hàng chất lượng</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Miễn phí giao hàng</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Bảo hành 3 năm</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Hỗ trợ 24/7</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <a href="laptop?manuId=1" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="images/ac7.png" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Acer</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <a href="laptop?manuId=2" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="images/as6.png" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Asus</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <a href="laptop?manuId=3" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="images/m1.png" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Msi</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <a href="laptop?manuId=4" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="images/d5.png" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Dell</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <a href="laptop?manuId=5" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="images/leno5.png" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Lenovo</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <a href="laptop?manuId=6" class="cat-img position-relative overflow-hidden mb-3">
                            <img class="img-fluid" src="images/hp5.png" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">HP</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Categories End -->


        <!-- Offer Start -->
        <!--        <div class="container-fluid offer pt-5">
                    <div class="row px-xl-5">
                        <div class="col-md-6 pb-4">
                            <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                                <img src="img/offer-1.png" alt="">
                                <div class="position-relative" style="z-index: 1;">
                                    <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                                    <h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
                                    <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 pb-4">
                            <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                                <img src="img/offer-2.png" alt="">
                                <div class="position-relative" style="z-index: 1;">
                                    <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                                    <h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
                                    <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
        <!-- Offer End -->


        <!-- Products Start -->
        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Laptop Thịnh Hành</span></h2>
            </div>
            <form name="f" action="" method="post">
            <input type="hidden" name="quantityLaptop" value="1"/>
            <div class="row px-xl-5 pb-3">
                <c:forEach items="${requestScope.bestseller}" var="p">        
                    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="images/${p.image.get(0)}" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="mb-3  d-inline-block ">${p.name}</h6>
                                <fmt:formatNumber value="${p.outPrice}" pattern="#,##0" var="outPrice" />
                                <fmt:formatNumber value="${p.discount}" pattern="#,##0" var="discount" />
                                <div class="d-flex  justify-content-center">
                                    <h6  class="flex-shrink-0 bg-danger text-white rounded-sm p-1">${discount}đ</h6><h6 class="text-muted ml-2 "><del>${outPrice}đ</del></h6>
                                </div>
                            </div>

                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="detail?laptopId=${p.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a href="#" onclick="buy('${p.id}')"  class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            </form>
        </div>
        <!-- Products End -->


      


        <!-- Vendor Start -->
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel vendor-carousel">
                        <div class="vendor-item border p-4">
                            <img src="images/acer.png" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="images/asus.png" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="images/lenovo.png" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="images/dell.png" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="images/hp.png" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="images/msi.png" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="images/fpt.png" alt="">
                        </div>
                        <div class="vendor-item border p-4">
                            <img src="images/laptop.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Vendor End -->


        <!-- Footer Start -->
        <jsp:include page="footer.jsp"/>
        <!-- Footer End -->


        <!-- Back to Top -->


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
