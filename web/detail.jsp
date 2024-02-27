<%-- 
    Document   : detail.jsp
    Created on : Feb 9, 2024, 2:04:32 AM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laptop</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <!-- Basic styles of the plugin -->
        <link rel="stylesheet" href="v2.3.2/jquery.rateyo.css"/>
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="v2.3.2/jquery.rateyo.css" >
        <script src="v2.3.2/jquery.min.js"></script>
        <script src="v2.3.2/jquery.rateyo.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
    </head>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <!-- Page Header Start -->
            <div class="container-fluid bg-secondary mb-5">
                <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                    <h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
                    <div class="d-inline-flex">
                        <p class="m-0"><a href="">Home</a></p>
                        <p class="m-0 px-2">-</p>
                        <p class="m-0">Shop Detail</p>
                    </div>
                </div>
            </div>
            <!-- Page Header End -->
            <!-- Shop Detail Start -->
        <c:set value="${requestScope.laptop}" var="laptop"/>
        <c:set value="${requestScope.laptopImage}" var="laptopImage"/>
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 pb-5">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner border">
                            <div class="carousel-item active">
                                <img class="w-100 h-100" src="images/${laptopImage.get(0)}" alt="Image">
                            </div>
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="images/${laptopImage.get(1)}" alt="Image">
                            </div>
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="images/${laptopImage.get(2)}" alt="Image">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>
                <jsp:useBean id="reviewdao" class="com.model.review.ReviewDAO"/>
                <c:set value="${requestScope.listReview}" var="reviewList"/>
                <div class="col-lg-7 pb-5">
                    <h3 class="font-weight-semi-bold">${laptop.name}</h3>
                    <div class="d-flex mb-3">
                        <div class="text-primary mr-2">
                              <fmt:formatNumber value="${reviewdao.getReviewAverageByLaptop(laptop.id)}" pattern="#,##0.0" var="star" />
                            ${reviewList.size()>0?star:0}/5,0<small class="fas fa-star"></small>
                        </div>
                        <small class="pt-1">(${reviewList.size()} đánh giá)</small>
                    </div>
                    <fmt:formatNumber value="${laptop.outPrice}" pattern="#,##0" var="outPrice" />
                    <fmt:formatNumber value="${laptop.discount}" pattern="#,##0" var="discount" />
                    <h3 class="font-weight-semi-bold mb-4">${discount}đ</h3>
                    <p class="mb-4">${laptop.description}</p>


                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-minus"  onclick="decreaseQuantity()" >
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control bg-secondary text-center" value="1" name="">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-plus" onclick="increaseQuantity()">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <form action="" name="f" method="post">
                            <input type="hidden" name="quantityLaptop" value="1" id="quantity">  
                            <button class="btn btn-primary px-3"  onclick="buy1('${laptop.id}')"  ><i class="fa fa-shopping-cart mr-1"></i> Add To Cart</button>
                        </form>
                    </div>
                    <div class="d-flex pt-2">
                        <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                        <div class="d-inline-flex">
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
                                <i class="fab fa-pinterest"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (${reviewList.size()})</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Product Description</h4>
                            <p>${laptop.description}</p>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-2">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">Thông số kỹ thuật</th>
                                        <th scope="col">Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Màn hình</td>
                                        <td>${laptop.screen.detail}</td>
                                    </tr>
                                    <tr>
                                        <td>CPU</td>
                                        <td>${laptop.cpu.name}</td>
                                    </tr>
                                    <tr>
                                        <td>RAM</td>
                                        <td>${laptop.ram.detail}</td>
                                    </tr>
                                    <tr>
                                        <td>Ổ cứng</td>
                                        <td>${laptop.ssd.detail}</td>
                                    </tr>
                                    <tr>    
                                        <td>Đồ họa</td>
                                        <td>${laptop.card}</td>
                                    </tr>
                                    <tr>
                                        <td>Hệ điều hành</td>
                                        <td>${laptop.system}</td>
                                    </tr>
                                    <tr>
                                        <td>Trọng lượng</td>
                                        <td>${laptop.weight} kg</td>
                                    </tr>
                                    <tr>
                                        <td>Xuất xứ</td>
                                        <td>${laptop.origin}</td>
                                    </tr>
                                    <tr>
                                        <td>Năm ra mắt</td>
                                        <td>${laptop.releaseYear}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-3">
                            <div class="row">

                                <div class="col-md-12 center">

                                    <h4 class="mb-4">${reviewList.size()} đánh giá cho sản phẩm</h4>          
                                    <c:set value="${sessionScope.account}" var="account"/>
                                    <jsp:useBean id="accountdao" class="com.model.account.AccountDAO"/>
                                    <c:forEach items="${reviewList}" var="rev" >
                                        <div class="media mb-4">
                                            <img src="images/${account.image!=null?account.image:"profileimage.png"}"alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                            <div class="media-body">
                                                <h6>${accountdao.getAccountById(rev.customerId).fullname}<small> - <i>${rev.reviewDate}</i></small></h6>
                                                <div class="text-primary mb-2">
                                                    ${rev.review}/5,0<i class="fas fa-star"></i>
                                                </div>
                                                <p>${rev.details}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>


                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Detail End -->


        <!-- Products Start -->
        <div class="container-fluid py-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
            </div>
            <form name="m" action="" method="post">
                <input type="hidden" name="quantityLaptop" value="1"/>
                <div class="row px-xl-5">
                    <div class="col">
                        <div class="owl-carousel related-carousel">
                            <c:forEach items="${requestScope.laptopByManu}" var="laptop">                                     
                                <div class="card product-item border-0">
                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                        <img class="img-fluid w-100" src="images/${laptop.image.get(0)}" alt="">
                                    </div>
                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                        <h6 class="text-truncate mb-3">${laptop.name}</h6>
                                        <fmt:formatNumber value="${laptop.outPrice}" pattern="#,##0" var="outPrice" />
                                        <fmt:formatNumber value="${laptop.discount}" pattern="#,##0" var="discount" />
                                        <div class="d-flex justify-content-center">
                                            <h6 class="flex-shrink-0 bg-danger text-white rounded-sm p-1">${discount}đ</h6><h6 class="text-muted ml-2"><del>${outPrice}đ</del></h6>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between bg-light border">
                                        <a href="detail?laptopId=${laptop.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                        <a href="#"  onclick="buy('${laptop.id}')"  class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- Products End -->


        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>
        <script type="text/javascript">
            function buy(id) {
                document.m.action = "buy?id=" + id;
                document.m.submit();
            }
            function buy1(id) {
                document.f.action = "buy?id=" + id;
                document.f.submit();
            }
            function decreaseQuantity() {
                var quantityInput = document.getElementById('quantity');
                var currentValue = parseInt(quantityInput.value);
                if (currentValue > 1) {
                    quantityInput.value = currentValue - 1;
                }
            }
            function increaseQuantity() {
                var quantityInput = document.getElementById('quantity');
                var currentValue = parseInt(quantityInput.value);
                quantityInput.value = currentValue + 1;
            }
            ///// function to jquery of rating star
            

        </script>   
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="v2.3.2/jquery.rateyo.js"></script>
        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
