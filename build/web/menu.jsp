<%-- 
    Document   : menu
    Created on : Feb 1, 2024, 2:57:02 AM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <a href="home" class="text-decoration-none">
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
            <c:set var="size" value="${sessionScope.size}"/>
            <a href="cart.jsp" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge">${size}</span>
            </a>
        </div>
    </div>
</div>
<!-- Topbar End -->

<!-- Navbar Start -->
<div class="container-fluid">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0">Hãng sản xuất</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                <div class="navbar-nav w-100 overflow-hidden" style="height: 247px">
                    <c:set var="sort" value="${requestScope.sort}" />
                    <a href="laptop?manuId=${0}&sort=${sort}" class="nav-item nav-link">All</a>
                    <jsp:useBean id="manufacturer" class="com.model.manufacturer.ManufacturerDAO"/>
                    <c:forEach items="${manufacturer.all}" var="m">
                        <a href="laptop?manuId=${m.id}&sort=${sort}" class="nav-item nav-link">${m.name}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
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
                            <img src="images/profileimage.png" alt="Profile Image" class="nav-profile-image rounded-circle" style="width: 30px; height: 30px; object-fit: cover;margin-top: 14px;">
                            <a href="#" class="nav-item nav-link">${account.fullname}</a>
                            <c:if test="${account.role==1}">
                                <a href="profile.jsp" class="nav-item nav-link">User Profile</a>
                            </c:if>
                            <c:if test="${account.role==0}">
                                <a href="profile.jsp" class="nav-item nav-link">User Profile</a>
                                <a href="profile.jsp" class="nav-item nav-link">Admin</a>
                            </c:if>
                            <a href="login?action=logout" class="nav-item nav-link">Log out</a>
                        </div>                       
                    </div>
                </c:if>
        </div>
        </nav>
    </div>
</div>
</div>
<!-- Navbar End -->


