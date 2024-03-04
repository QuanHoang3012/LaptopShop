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
        <c:set value="${requestScope.laptop}" var="laptop"/>
        <div class="app-wrapper">
            <h2 style="color: red;margin-left: 20px;margin-top: 20px">${requestScope.alert}</h2>
            <div class="container" style="margin-top: 50px">
                <form  action="edit">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" name="laptopId" value="${laptop.id}"/>
                            <div class="form-group">
                                <label >Name</label>
                                <input type="text" class="form-control" name="name" value="${laptop.name}" required>
                            </div>
                            <fmt:formatNumber value="${laptop.outPrice}" pattern="#,##0" var="outPrice" />
                            <fmt:formatNumber value="${laptop.discount}" pattern="#,##0" var="discount" />
                            <fmt:formatNumber value="${laptop.inPrice}" pattern="#,##0" var="inPrice" />

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >InPrice</label>
                                        <input type="text" class="form-control" name="inPrice" value="${laptop.inPrice}" required="">
                                    </div>             
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >OutPrice</label>
                                        <input type="text" class="form-control" name="outPrice" value="${laptop.outPrice}" required>
                                    </div>             
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >Stock</label>
                                        <input type="number" class="form-control"  name="stock" value="${laptop.stock}" required>
                                    </div>             
                                </div>
                            </div>
                            <div class="form-group">
                                <label >Card</label>
                                <input type="text" class="form-control"name="card" value="${laptop.card}" required>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >Release Year</label>
                                        <input type="text" class="form-control"  name="releaseYear" value="${laptop.releaseYear}" required>
                                    </div>             
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >Origin</label>
                                        <input type="text" class="form-control"  name="origin" value="${laptop.origin}" required>
                                    </div>             
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Discount</label>
                                        <input type="text" class="form-control"  name="discount" value="${laptop.discount}" required>
                                    </div>             
                                </div>
                            </div>
                            <div class="row">
                                <label >Image</label>
                                <input type="file" name="image" multiple="">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label >System</label>
                                            <input type="text" class="form-control"  name="system" value="${laptop.system}" required>
                                        </div>             
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label >Weight</label>
                                            <input type="text" class="form-control"  name="weight" value="${laptop.weight}" required>
                                        </div>             
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group">
                                     <label >Description</label>
                                     <input type="text" class="form-control"  name="description" value="${laptop.description}" height="30px" required>
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
                                                <input class="form-check-input" type="radio" value="${m.id}"  ${m.id==laptop.ram.id?"checked":""} name="ram">
                                                <label class="form-check-label" >${m.detail}</label>
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
                                                <input class="form-check-input" type="radio" value="${m.id}"  ${m.id==laptop.cpu.id?"checked":""}  name="cpu">
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
                                                <input class="form-check-input" type="radio" value="${m.id}"  ${m.id==laptop.manufacturer.id?"checked":""}  name="manu">
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
                                                <input class="form-check-input" type="radio" value="${m.id}"  ${m.id==laptop.ssd.id?"checked":""}   name="ssd">
                                                <label class="form-check-label" >${m.detail}</label>
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
                                                <input class="form-check-input" type="radio" value="${m.id}"  ${m.id==laptop.screen.id?"checked":""}  name="screen">
                                                <label class="form-check-label" >${m.detail}</label>
                                            </div>
                                        </c:forEach>                              
                                    </div>
                                </div>
                            </div>
                        </div>
                                        <button class="btn btn-primary w-auto mx-auto" style="margin-top: 50px" type="submit" value="Update">Update</button>   
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
