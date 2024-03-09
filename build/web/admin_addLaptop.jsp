<%-- 
    Document   : admin_addLaptop
    Created on : Feb 29, 2024, 3:04:32 PM
    Author     : Anh Quan
--%>

<%-- 
    Document   : admin_editproduct.jsp
    Created on : Feb 28, 2024, 11:17:28 PM
    Author     : Anh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="row" style="margin-left: 30px">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-3">
                            <button><a href="addtype?type=manu" >Branch</a></button>
                        </div>
                        <div class="col-md-3">
                            <button><a href="addtype?type=ram">Ram</a></button>
                        </div>
                        <div class="col-md-3">
                            <button><a href="addtype?type=cpu">Cpu</a></button>
                        </div>
                        <div class="col-md-3">
                            <button><a href="addtype?type=ssd">Ssd</a></button>
                        </div>                                     
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-3">
                            <button><a href="addtype?type=screen">Screen</a></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="margin-top: 20px">
                <form  action="addproduct" method="get">
                    <div class="row">
                        <div class="col-md-6">                      
                            <div class="form-group">
                                <label >Name</label>
                                <input type="text" class="form-control" name="nameAdd" value="" required>
                            </div>


                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >InPrice</label>
                                        <input type="text" class="form-control" name="inPriceAdd" value="" required="">
                                    </div>             
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >OutPrice</label>
                                        <input type="text" class="form-control" name="outPriceAdd" value="" required>
                                    </div>             
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >Stock</label>
                                        <input type="number" class="form-control"  name="stockAdd" value="" required>
                                    </div>             
                                </div>
                            </div>
                            <div class="form-group">
                                <label >Card</label>
                                <input type="text" class="form-control"name="cardAdd" value="" required>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >Release Year</label>
                                        <input type="text" class="form-control"  name="releaseYearAdd" value="" required>
                                    </div>             
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >Origin</label>
                                        <input type="text" class="form-control"  name="origin" value="" required>
                                    </div>             
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Discount</label>
                                        <input type="text" class="form-control"  name="discountAdd" value="" required>
                                    </div>             
                                </div>
                            </div>
                            <div class="row">
                                <label >Image</label>
                                <input type="file" name="imageAdd" multiple="" required="">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label >System</label>
                                            <input type="text" class="form-control"  name="systemAdd" value="" required>
                                        </div>             
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label >Weight</label>
                                            <input type="text" class="form-control"  name="weightAdd" value="" required>
                                        </div>             
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label >Description</label>
                                    <input type="text" class="form-control"  name="descriptionAdd" value="" height="30px" required>
                                </div>
                            </div>
                        </div>
                        <!-- Add more text inputs as needed -->
                        <jsp:useBean id="ramdao" class="com.model.ram.RamDAO"/>
                        <jsp:useBean id="cpudao" class="com.model.cpu.CpuDAO"/>
                        <jsp:useBean id="manudao" class="com.model.manufacturer.ManufacturerDAO"/>
                        <jsp:useBean id="screendao" class="com.model.screen.ScreenDAO"/>
                        <jsp:useBean id="ssddao" class="com.model.ssd.SsdDAO"/>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <c:set value="${ramdao.all}" var="ram"/>
                                        <label>Ram</label>
                                        <c:forEach items="${ram}" var="m" >
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" value="${m.id}"   name="ramAdd" required="">
                                                <label class="form-check-label" >${m.name}</label>
                                            </div>
                                        </c:forEach>                              
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <c:set value="${cpudao.all}" var="cpu"/>
                                        <label>Ram</label>
                                        <c:forEach items="${cpu}" var="m" >
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" value="${m.id}"   name="cpuAdd" required="">
                                                <label class="form-check-label" >${m.name}</label>
                                            </div>
                                        </c:forEach>                              
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <c:set value="${manudao.all}" var="manu"/>
                                        <label>Branch</label>
                                        <c:forEach items="${manu}" var="m" >
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" value="${m.id}" name="manuAdd" required="">
                                                <label class="form-check-label" >${m.name}</label>
                                            </div>
                                        </c:forEach>                              
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <c:set value="${ssddao.all}" var="ssd"/>
                                        <label>SSD</label>
                                        <c:forEach items="${ssd}" var="m" >
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" value="${m.id}"     name="ssdAdd" required="">
                                                <label class="form-check-label" >${m.name}</label>
                                            </div>
                                        </c:forEach>                              
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <c:set value="${screendao.all}" var="screen"/>
                                        <label>Screen</label>
                                        <c:forEach items="${screen}" var="m" >
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" value="${m.id}" name="screenAdd" required="">
                                                <label class="form-check-label" >${m.name}</label>
                                            </div>
                                        </c:forEach>                              
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
