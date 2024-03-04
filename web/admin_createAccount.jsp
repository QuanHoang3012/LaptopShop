

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : admin_addLaptop
    Created on : Feb 29, 2024, 3:04:32 PM
    Author     : Anh Quan
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit-Product</title>

        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <meta name="description" content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
        <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
        <link rel="shortcut icon" href="favicon.ico"> 

        <!-- FontAwesome JS-->
        <script defer src="assets1/plugins/fontawesome/js/all.min.js"></script>

        <!-- App CSS -->  
        <link id="theme-style" rel="stylesheet" href="assets1/css/portal.css">

    </head>
    <body class="app">
        <jsp:include page="admin-header.jsp"/>
        <div class="app-wrapper">
            <h2 style="color: red;margin-left: 20px;margin-top: 20px">${requestScope.alert}</h2>
            <div class="container" style="margin-top: 20px">
                <form  action="admin-account?action=create" method="get">
                    <input type="hidden" value="create" name="action"/>
                    <div class="row">
                        <div class="col-md-6">                      
                            <div class="form-group">
                                <label >UserName</label>
                                <input type="text" class="form-control" name="username" value="" required>
                            </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label >Password</label>
                                        <input type="password" class="form-control" name="password" value="" required="">
                                    </div>             
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label >Email</label>
                                        <input type="email" class="form-control" name="email" value="" required>
                                    </div>             
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label >Phone</label>
                                        <input type="text" class="form-control"  name="phone" value="" required>
                                    </div>             
                                </div>

                            <div class="form-group">
                                <label >FullName</label>
                                <input type="text" class="form-control"name="fullname" value="" required>
                            </div>               
                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Role</label>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" value="0" name="role" required="">
                                                <label class="form-check-label" >Admin</label>
                                            </div>     
                                        <div class="form-check">
                                                <input class="form-check-input" type="radio" value="1" name="role" required="">
                                                <label class="form-check-label" >Customer</label>
                                            </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary w-auto mx-auto" style="margin-top: 50px" type="submit" value="Add">Add</button>   
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Javascript -->          
    <script src="assets1/plugins/popper.min.js"></script>
    <script src="assets1/plugins/bootstrap/js/bootstrap.min.js"></script>  


    <!-- Page Specific JS -->
    <script src="assets1/js/app.js"></script> 

</body>

</html>

