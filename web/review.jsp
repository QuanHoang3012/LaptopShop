<%-- 
    Document   : review.jsp
    Created on : Feb 26, 2024, 11:03:03 PM
    Author     : Anh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
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
                <c:set value="${requestScope.orderId}" var="orderId"/>
                <h4 class="mb-4">Để lại nhận xét</h4>

                <form method="get" action="review" id="myForm">
                    <div class="d-flex my-3">
                        <p class="mb-0 mr-2" style="padding-top: 5px">Đánh giá * :</p>
                        <div>
                            <div id="rating"></div>
                            <input type="hidden" name="hdrating'" id="hdrating" >
                        </div>

                    </div>
                    <input type="hidden" name="orderId" value="${orderId}">
                    <div class="form-group">
                        <label for="message">Nhận xét*</label>
                        <textarea id="message" cols="30" rows="5" class="form-control" name="detail" ></textarea>
                    </div>
                    <div class="form-group mb-0">
                        <input type="submit" value="Bình luận"   class="btn btn-primary px-3">
                    </div>
                </form>


            </div>
        </div>
    </div>



    <jsp:include page="footer.jsp"/>
    <script type="text/javascript">
        $(function () {

            $("#rating").rateYo({
                rating: 0,
                numStars: 5,
                maxValue: 5,
                halfStar: false,
                onChange: function (rating, rateYoInstance) {
                    $('#hdrating').val(rating);
                }
            });
        });
        ////////////////        function to change url to proper form
        document.getElementById("myForm").addEventListener("submit", function (event) {
            var form = event.target;
            var input = form.querySelector("input[name='hdrating\\'']"); // Escaping the apostrophe in querySelector

            // If the input field exists
            if (input) {
                input.setAttribute("name", "hdrating"); // Change the name attribute
            }
        });
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
