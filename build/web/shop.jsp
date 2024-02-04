<%-- 
    Document   : shop.jsp
    Created on : Jan 23, 2024, 2:00:16 AM
    Author     : Anh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>

            <!-- Shop Start -->
            <div class="container-fluid pt-5">
                <div class="row px-xl-5">
                    <!-- Shop Sidebar Start -->
                    <div class="col-lg-3 col-md-12">
                        <form id="checkbox">
                            <!-- Branch Start -->
                        <c:set var="checkManu" value="${requestScope.checkManu}"/>

                        <div class="border-bottom mb-4 pb-4">
                            <h5 class="font-weight-semi-bold mb-4">Hãng sản xuất</h5>
                            <div class="row" >
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox"  id="c0" name="manuIdBox"  ${checkManu[0]?"checked":""} value="${0}" onclick="setCheck(this)" />
                                        <label >All</label>
                                    </div>
                                </div>
                                <c:set value="${requestScope.manufacturer}" var="m" />
                                <c:forEach begin="0" end="${m.size()-1}" var="i">
                                    <div class="col-md-6">
                                        <div >
                                            <input type="checkbox"id="c01" name="manuIdBox" value="${m.get(i).getId()}"  ${m.get(i).getId()==manuId?"checked":""}  ${checkManu[i+1]?"checked":""}  onclick="setCheck(this)">
                                            <label>${m.get(i).getName()}</label>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- Branch End -->

                        <!-- Price Start -->
                        <div class="border-bottom mb-4 pb-4">
                            <h5 class="font-weight-semi-bold mb-4">Mức giá</h5>
                            <div class="row" >
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox" checked id="c2" name="price">
                                        <label >All</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox"  id="c2" name="price">
                                        <label >Từ 10-15 triệu</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox"  id="c2" name="price">
                                        <label >Từ 15-20 triệu</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox"  id="c2" name="price">
                                        <label >Từ 20-25 triệu</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox"  id="c2" name="price">
                                        <label >Trên 25 triệu</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Price -->

                        <!-- Cpu Start -->
                        <c:set var="checkCpu" value="${requestScope.checkCpu}"/>
                        <div class="border-bottom mb-4 pb-4">
                            <h5 class="font-weight-semi-bold mb-4">CPU</h5>
                            <div class="row" >
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox" value="${0}"   ${checkCpu[0]?"checked":""}  id="c2" name="cpuBox" onclick="setCheck(this)">
                                        <label >All</label>
                                    </div>
                                </div>
                                <c:set value="${requestScope.listCpu}" var="m" />
                                <c:forEach begin="0" end="${m.size()-1}" var="i">
                                    <div class="col-md-6">
                                        <div >
                                            <input type="checkbox"id="c02" name="cpuBox" ${checkCpu[i+1]?"checked":""} value="${m.get(i).getId()}" onclick="setCheck(this)">
                                            <label>${m.get(i).getName()}</label>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- Cpu End -->

                        <!-- Ram Start -->
                        <div class="border-bottom mb-4 pb-4">
                            <h5 class="font-weight-semi-bold mb-4">Ram</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox" checked id="c2" name="ram">
                                        <label >All</label>
                                    </div>
                                </div>
                                <c:set value="${requestScope.listRam}" var="m" />
                                <c:forEach begin="0" end="${m.size()-1}" var="i">
                                    <div class="col-md-6">
                                        <div >
                                            <input type="checkbox"id="c2" name="ram">
                                            <label>${m.get(i).getDetail()}</label>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- Ram End -->

                        <!-- Ssd Start -->
                        <div class="border-bottom mb-4 pb-4">
                            <h5 class="font-weight-semi-bold mb-4">SSD</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox" checked id="c0" name="ssd">
                                        <label >All</label>
                                    </div>
                                </div>
                                <c:set value="${requestScope.listSsd}" var="m" />
                                <c:forEach begin="0" end="${m.size()-1}" var="i">
                                    <div class="col-md-6">
                                        <div >
                                            <input type="checkbox"id="ssd" name="ssd">
                                            <label>${m.get(i).getDetail()}</label>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- Ssd End -->

                        <!-- Scren Start -->
                        <div class="border-bottom mb-4 pb-4">
                            <h5 class="font-weight-semi-bold mb-4">SSD</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <div>
                                        <input type="checkbox" checked id="c4" name="screen">
                                        <label >All</label>
                                    </div>
                                </div>
                                <c:set value="${requestScope.listScreen}" var="m" />
                                <c:forEach begin="0" end="${m.size()-1}" var="i">
                                    <div class="col-md-6">
                                        <div >
                                            <input type="checkbox"id="ssd" name="screen">
                                            <label>${m.get(i).getDetail()}</label>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </form>
                    <!-- Screen End -->

                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-12">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <form id="searchForm" action="laptop" method="get">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="key" placeholder="Tìm kiếm theo tên">
                                        <div class="input-group-append">
                                            <button onclick="this.form.submit()" class="btn bg-transparent text-primary">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                <c:set var="k" value="${requestScope.key}"/>            
                                <c:set var="manuIdBox" value="${requestScope.manuIdBox}"/>
                                <div class="dropdown ml-4">
                                    <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        Sắp xếp
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                        <c:if test="${k!=null}">
                                            <a class="dropdown-item" href="laptop?key=${k}&sort=priceAsc" >Giá thấp</a>
                                            <a class="dropdown-item" href="laptop?key=${k}&sort=priceDes" >Giá cao</a>
                                        </c:if>
                                        <c:if test="${k==null && manuIdBox ==null}">                                       
                                            <a class="dropdown-item" href="laptop?manuId=${manuId}&sort=priceAsc"  >Giá thấp</a>
                                            <a class="dropdown-item" href="laptop?manuId=${manuId}&sort=priceDes" >Giá cao</a>                                        
                                        </c:if>
                                            <c:if test="${manuIdBox !=null}">
                                            <a class="dropdown-item" href="laptop?manuIdBox=${manuIdBox}&sort=priceAsc"  >Giá thấp</a>
                                            <a class="dropdown-item" href="laptop?manuIdBox=${manuIdBox}&sort=priceDes" >Giá cao</a>
                                            </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:forEach items="${requestScope.data}" var="p">
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                <div class="card product-item border-0 mb-4">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">

                                        <img class="img-fluid w-100" src="images/${p.image.href}"alt="">
                                    </div>
                                    <fmt:formatNumber value="${p.outPrice}" pattern="#,##0" var="outPrice" />
                                    <fmt:formatNumber value="${p.discount}" pattern="#,##0" var="discount" />
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="mb-3  d-inline-block">${p.name}</h6>
                                        <div class="d-flex justify-content-center">
                                            <h6 class="flex-shrink-0 bg-danger text-white rounded-sm p-1">${discount}đ</h6><h6 class="text-muted ml-2"><del>${outPrice}đ</del></h6>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between bg-light border">
                                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:set var="page"   value="${requestScope.page}"/>

                        <div class="col-12 pb-1">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center mb-3">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>

                                    <c:forEach  begin="${1}"  end="${requestScope.num}" var="i">
                                        <c:if test="${k!=null}">
                                            <li class="${i==page?'page-item active':' '}"><a class="page-link" href="laptop?page=${i}&key=${k}&sort=${sort}">${i}</a></li>

                                        </c:if>
                                        <c:if test="${k==null}">
                                            <li class="${i==page?'page-item active':' '}"><a class="page-link" href="laptop?page=${i}&manuId=${manuId}&sort=${sort}">${i}</a></li>
                                            </c:if>
                                        </c:forEach>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- Shop Product End -->
            </div>
        </div>
        <!-- Shop End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                            <form action="">
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                           required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-dark">
                        &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed
                        by
                        <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a><br>
                        Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


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
        <script src="js/checkbox.js"></script>
    </body>

</html>
