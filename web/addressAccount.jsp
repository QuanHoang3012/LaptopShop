<%-- 
    Document   : addressAccount.jsp
    Created on : Feb 22, 2024, 2:13:59 AM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <script type="text/javascript">
            function doDelete(id){
                if(confirm("Bạn có chắc chắn muốn xóa địa chỉ này không?")){
                    window.location = "account?action=deleteAddress&id="+id; /// trỏ vào href
                }
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
                        <a href="" class="list-group-item list-group-item-action">Địa Chỉ</a>
                        <a href="account?action=order-product"  class="list-group-item list-group-item-action">Đơn Hàng</a>
                        <a href="account?action=history-order"class="list-group-item list-group-item-action">Lịch Sử Mua Hàng</a>
                        <a href="login?action=logout" class="list-group-item list-group-item-action">Log Out</a>
                    </div>
                </div>
    <div class="col-md-9">
      <h2>Địa chỉ giao hàng</h2>
      <form action="account">
          <div class="form-group">
          <label for="name">Họ và tên người nhận</label>
          <input type="text" class="form-control" name="fullName" placeholder="Nhập họ và tên" required="">
        </div>
        <div class="form-group">
          <label for="phone">Số điện thoại</label>
          <input type="text" class="form-control" name="phone" placeholder="Nhập số điện thoại" required="">
        </div>
        <div class="form-group">
          <label for="address">Địa chỉ</label>
          <input type="text" class="form-control" name="address" placeholder="Nhập địa chỉ" required="">
        </div>
          <input type="hidden" name="action" value="addAddress"> 
        <button type="submit" class="btn btn-primary">Thêm</button>
        <h5 style="color: red; margin-top: 20px;">${requestScope.resultAdd}</h5>
      </form>
      <br><br>
      <div class="container-fluid">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th rowspan="2" class="align-middle">Tên/Địa chỉ</th>
        <th rowspan="2" class="align-middle">Số điện thoại</th>
        <th colspan="1" class="text-center">Thao tác</th>
      </tr>
      <tr>
        <th class="text-center">Xóa</th>
      </tr>
    </thead>
    <tbody>
        <c:set var="account" value="${sessionScope.account}"/>
        <jsp:useBean id="addressList" class="com.model.address.AddressDAO" />
        <c:set value="${addressList.getAllAddressByAccount(account.id)}" var="addressbyId"/>
        <c:forEach items="${addressbyId}"   var="m"   >
               <tr>
        <td>${m.name}<br>${m.address}</td>
        <td>${m.phone}</td>
        <td class="text-center">
            <button type="button" class="btn btn-danger btn-sm" onclick="doDelete('${m.id}')">Xóa</button>
        </td>
      </tr>
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
