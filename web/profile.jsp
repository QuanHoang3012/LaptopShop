<%-- 
    Document   : profile.jsp
    Created on : Feb 21, 2024, 9:21:13 PM
    Author     : Anh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h1 class="font-weight-semi-bold text-uppercase mb-3">User Profile</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="home">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">User Profile</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="list-group">
                        <a href="profile.jsp" class="list-group-item list-group-item-action ">Cập nhật Hồ Sơ</a>
                        <a href="updatepassword.jsp" class="list-group-item list-group-item-action">Đổi Mật Khẩu</a>
                        <a href="addressAccount.jsp" class="list-group-item list-group-item-action">Địa Chỉ</a>
                        <a href="account?action=order-product"  class="list-group-item list-group-item-action">Đơn Hàng</a>
                        <a href="account?action=history-order"class="list-group-item list-group-item-action">Lịch Sử Mua Hàng</a>
                        <a href="login?action=logout" class="list-group-item list-group-item-action">Log Out</a>
                    </div>
                </div>
                <c:set var="account" value="${sessionScope.account}"/>
                <div class="col-md-9">
                    <!-- User Profile -->
                    <div class="card mt-3">
                        <div class="card-body">
                            <!-- Form -->
                            <form action="account" method="get">
                                <div class="row">
                                    <!-- Avatar -->
                                    <div class="form-group col-md-12">
                                        <label for="avatar">Chọn ảnh</label>
                                        <input type="file" class="form-control-file" id="avatar" name="avatar" value="${account.image}">
                                    </div>

                                    <!-- Username -->
                                    <div class="form-group col-md-6">
                                        <label for="username">Tên đăng nhập</label>
                                        <input type="text" class="form-control" readonly=""id="username" placeholder="Nhập tên đăng nhập" value="${account.username}">
                                    </div>

                                    <!-- Tên -->
                                    <div class="form-group col-md-6">
                                        <label for="name">Họ và tên</label>
                                        <input type="text" class="form-control" name="name" placeholder="Nhập tên" value="${account.fullname}">
                                    </div>

                                    <!-- Email -->
                                    <div class="form-group col-md-6">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" name="email" placeholder="Nhập email" value="${account.email}">
                                    </div>

                                    <!-- Số điện thoại -->
                                    <div class="form-group col-md-6">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="tel" class="form-control" name="phone" placeholder="Nhập số điện thoại" value="${account.phoneNumber}">
                                    </div>

                                    <!-- Ngày sinh -->
                                    <div class="form-group col-md-6">
                                        <label for="birthdate">Ngày sinh</label>
                                        <input type="date" class="form-control" name="birthdate" value="${account.birthday}">
                                    </div>

                                    <!-- Giới tính -->
                                    <div class="form-group col-md-6">
                                        <label for="gender">Giới tính</label>
                                        <select class="form-control" name="gender">
                                            <option value="" >Chọn giới tính</option>
                                            <option  ${account.gender==1?"selected":""}  value="male">Nam</option>
                                            <option ${account.gender==0?"selected":""}  value="female">Nữ</option>
                                            <option ${account.gender==2?"selected":""} value="other">Khác</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Button -->
                                <input type="hidden" name="action" value="updateInfo"> 
                                <button type="submit"  class="btn btn-primary">Lưu thông tin</button>
                                <h5 style="color:red;margin-top:20px;">${requestScope.updateResult}</h2>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
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
