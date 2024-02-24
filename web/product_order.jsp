<%-- 
    Document   : product_order.jsp
    Created on : Feb 23, 2024, 2:29:52 PM
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
                        <a href="product_order.jsp" class="list-group-item list-group-item-action">Địa Chỉ</a>
                        <a href="#" class="list-group-item list-group-item-action">Đơn Hàng</a>
                        <a href="#" class="list-group-item list-group-item-action">Lịch Sử Mua Hàng</a>
                        <a href="login?action=logout" class="list-group-item list-group-item-action">Log Out</a>
                    </div>
                </div>
    <div class="col-md-9">
         <h3>Đơn hàng</h3>
      <div class="container-fluid">
 

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
