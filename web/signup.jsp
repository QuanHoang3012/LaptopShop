<%-- 
    Document   : signup.jsp
    Created on : Feb 7, 2024, 3:29:44 PM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>SignUp</title>

        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    </head>
    <script type="text/javascript"> 

    </script>
    <body>
        <div class="container-fluid ">
            <div class="container ">
                <div class="row ">

                    <div class="col-sm-10 login-box">
                        <div class="row">
                            <div class="col-lg-4 col-md-5 box-de">
                                <div class="small-logo">
                                    <i class="fab fa-asymmetrik"></i> SignUp
                                </div>
                                <div class="ditk-inf sup-oi">
                                    <h2 class="w-100">Already Have an Account </h2>
                                    <p>Simply login to your account by clicking the login Button</p>
                                    <a href="login.jsp">
                                        <button type="button" class="btn btn-outline-light">SIGN IN</button>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-7 log-det">

                                <h2>Create Account</h2>
                                <div style="margin-top: 70px;"></div> <!-- Khoảng trắng -->


                                
                                <form action="signup" method="post">
                                    <h5 style="color:red; text-align: center; margin-top: 10px;">${requestScope.alert}</h5>
                                    <div class="text-box-cont">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">
                                                    <i class="far fa-user"></i>
                                                </span>
                                            </div>
                                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" name="username" required>
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon2">
                                                    <i class="far fa-envelope"></i>
                                                </span>
                                            </div>
                                            <input type="email" class="form-control" placeholder="Email Address" aria-label="Email Address" aria-describedby="basic-addon2" name="email" value="${param.email}" required>
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon3">
                                                    <i class="fas fa-lock"></i>
                                                </span>
                                            </div>
                                            <input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon3" name="password" required>
                                        </div>

                                        <div class="input-group center sup mb-3">
                                            <button type="submit" class="btn btn-success btn-round" >SIGN UP</button>
                                        </div>    
                                    </div>
                                </form>



                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/script.js"></script>
</body>
</html>
