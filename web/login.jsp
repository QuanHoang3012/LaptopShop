<%-- 
    Document   : login.jsp
    Created on : Feb 7, 2024, 3:07:11 PM
    Author     : Anh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> Login</title>

        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
        

    <body>
        <div class="container-fluid ">
            <div class="container ">
                <div class="row ">
                    <div class="col-sm-10 login-box">
                        <div class="row">
                            <div class="col-lg-8 col-md-7 log-det">
                                <div class="small-logo">
                                    <i class="fab fa-asymmetrik"></i> Login
                                </div>
                                <h2>Sign in to LamtopShop</h2>
                                  <div style="margin-top: 70px;"></div> <!-- Khoảng trắng -->


                                <form action="login" method="post">
                                    <div class="text-box-cont">
                                            <div id="errorMessage" style="color: red;">${requestScope.error}</div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                                            </div>
                                        
                                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" name="username" value="${param.username}">
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
                                            </div>
                                            <input type="password" class="form-control" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1" name="password" value="${param.password}">
                                        </div>
                                          <div style="margin-top: 50px;"></div> <!-- Khoảng trắng -->
                                        <div class="input-group center mb-3">
                                            <button type="submit" class="btn btn-success btn-round">SIGN IN</button>
                                        </div>    
                                    </div>
                                </form>




                            </div>
                            <div class="col-lg-4 col-md-5 box-de">
                                <div class="ditk-inf">
                                    <h2 class="w-100">Din't Have an Account </h2>
                                    <p>Simply Create your account by clicking the Signup Button</p>
                                    <a href="signup.jsp">
                                        <button type="button" class="btn btn-outline-light">SIGN UP</button>
                                    </a>
                                </div>
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
