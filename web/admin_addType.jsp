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
        <script>
            function doDelete(id,type){
                if(confirm("Delete ?"))
                window.location = "addtype?type="+type+"&id="+id;
            }
        </script>
    </head>
    <body class="app">
        <jsp:include page="admin-header.jsp"/>
        <div class="container">
            <div  style="margin-top: 10%;"class="row justify-content-center">
                <div class="col-md-8">
                    <div class="app-wrapper">
                              <div class="col-auto">
                                        <a class="btn app-btn-primary" href="admin_addLaptop.jsp"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-upload me-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                            <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
                                            </svg>Add more laptops</a>
                                    </div>
                        <h2 style="color: red;margin-left: 20px;margin-top: 20px">${requestScope.alert}</h2>
                        <div class="container" style="margin-top: 20px">
                            <div class="row">
                                <div class="col-md-6">
                                    <form action="addtype" method="get">
                                        <input hidden="" value="${requestScope.type}" name="type"/>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" class="form-control" name="name" value="" required>
                                        </div>
                                        <button class="btn btn-primary w-auto mx-auto" style="margin-top: 50px ; margin-left: 100px" type="submit" value="Add">Add</button>   
                                    </form>
                                </div>

                                <!-- Add more text inputs as needed -->

                              
                                    
                             
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <table class="table table-striped table-bordered">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                  <c:forEach items="${requestScope.list}" var="list">
                                                <tr>
                                                    <c:set value="" var="type"/>
                                                    <td>${list.id}</td>
                                                    <td>${list.name}</td>
                                                    <td class="cell"><a style="margin-left: 10px"class="btn-sm app-btn-secondary" href="#" onclick="doDelete('${list.id}','${requestScope.type}')">Delete</a></td>
                                                </tr>   
                                                   </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
