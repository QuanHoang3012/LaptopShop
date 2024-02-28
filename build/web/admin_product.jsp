<%-- 
    Document   : admin_product
    Created on : Feb 27, 2024, 11:33:48 PM
    Author     : Anh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>Admin-Product</title>

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
       
        <script type="text/javascript">
            function doDeleteLaptop(id){
                if (confirm("Are you sure to delete this product?")) {
                window.location = "admin-product?action=delete&laptopId="+id;
            }
        }
        </script>
    </head> 

    <body class="app">   	
        <jsp:include page="admin-header.jsp"/>
        <div class="app-wrapper">

            <div class="app-content pt-3 p-md-3 p-lg-4">
                <div class="container-xl">
                    <div class="row g-3 mb-4 align-items-center justify-content-between">
                        <div class="col-auto">
                            <h1 class="app-page-title mb-0">My Product</h1>
                            <h2 style="color:red">${requestScope.alert}</h2>
                        </div>
                        <div class="col-auto">
                            <div class="page-utilities">
                                <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
                                    <div class="col-auto">
                                        <form class="docs-search-form row gx-1 align-items-center" action="admin-product">
                                            <div class="col-auto">
                                                <input type="text" id="search-docs" class="form-control search-docs" placeholder="Search"  name="search">
                                            </div>
                                            <div class="col-auto">
                                                <button type="submit" class="btn app-btn-secondary" >Search</button>
                                            </div>
                                        </form>

                                    </div><!--//col-->

                                    <div class="col-auto">
                                        <a class="btn app-btn-primary" href="#"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-upload me-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                            <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
                                            </svg>Upload File</a>
                                    </div>
                                </div><!--//row-->
                            </div><!--//table-utilities-->
                        </div><!--//col-auto-->
                    </div><!--//row-->

                    <div class="row g-4">
                        <c:set value="${requestScope.product}" var="listproduct"/>
                        <jsp:useBean id="reviewdao" class="com.model.review.ReviewDAO"/>
                        <c:forEach items="${listproduct}" var="laptop">
                            <c:set value="${reviewdao.getReviewBylaptopId(laptop.id)}" var="reviewList"/>
                            <div class="col-6 col-md-4 col-xl-3 col-xxl-2">
                                <div class="app-card app-card-doc shadow-sm  h-100">
                                    <div class="app-card-thumb-holder p-3">
                                        <div class="app-card-thumb">
                                            <img class="img-fluid w-100" src="images/${laptop.image.get(0)}" alt="">
                                        </div>
                                        <a class="app-card-link-mask" href="detail?laptopId=${laptop.id}"></a>
                                    </div>
                                    <div class="app-card-body p-3 has-card-actions">

                                        <h4 class="app-doc-title truncate mb-0"><a href="#file-link">${laptop.name}</a></h4>
                                        <div class="app-doc-meta">
                                            <fmt:formatNumber value="${laptop.discount}" pattern="#,##0" var="discount" />
                                             <fmt:formatNumber value="${reviewdao.getReviewAverageByLaptop(laptop.id)}" pattern="#,##0.0" var="star" />
                                            <ul class="list-unstyled mb-0">
                                                <li><span class="text-muted">Price</span> ${discount}đ</li>
                                                <li><span class="text-muted">Rating:</span> ${reviewList.size()>00?star:0}/5,0<small class="fas fa-star"></small></li>
                                                <li><span class="text-muted">Stock: </span>${laptop.stock}</li>
                                            </ul>
                                        </div><!--//app-doc-meta-->

                                        <div class="app-card-actions">
                                            <div class="dropdown">
                                                <div class="dropdown-toggle no-toggle-arrow" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-three-dots-vertical" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" d="M9.5 13a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm0-5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                                    </svg>
                                                </div><!--//dropdown-toggle-->
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item" href="detail?laptopId=${laptop.id}"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye me-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
                                                            <path fill-rule="evenodd" d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                                            </svg>View</a></li>
                                                            <li><a class="dropdown-item" href="edit?laptopId=${laptop.id}"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil me-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                                            </svg>Edit</a></li>                                        
                                                    <li><hr class="dropdown-divider"></li>
                                                    <li><a class="dropdown-item" href="#" onclick="doDeleteLaptop('${laptop.id}')"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash me-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg" >
                                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                            </svg>Delete</a></li>
                                                </ul>
                                            </div><!--//dropdown-->
                                        </div><!--//app-card-actions-->

                                    </div><!--//app-card-body-->

                                </div><!--//app-card-->
                            </div><!--//col-->
                        </c:forEach>

                    </div><!--//row-->
                    <c:set value="${requestScope.href}" var="href"/>
                    <c:set var="page"   value="${requestScope.page}"/>
                    <c:set var="numPage" value="${requestScope.num}"/>
                    <nav class="app-pagination mt-5">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${page==1?"disabled":""}">
                                <a class="page-link" href="admin-product?page=${page-1}&${href}" aria-label="Previous">Previous</a>
                            </li>
                            <c:forEach  begin="${1}"  end="${numPage}" var="i">

                                <li class="${i==page?'page-item active':' '}"><a class="page-link" href="admin-product?page=${i}&${href}" >${i}</a></li>

                            </c:forEach>

                            <li class="page-item  ${page==numPage?"disabled":""} ">
                                <a class="page-link" href="admin-product?page=${page+1}&${href}" aria-label="Next">Next</a>
                            </li>
                        </ul>
                    </nav><!--//app-pagination-->
                </div><!--//container-fluid-->
            </div><!--//app-content-->

            <footer class="app-footer">
                <div class="container text-center py-3">
                    <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
                    <small class="copyright">Designed with <span class="sr-only">love</span><i class="fas fa-heart" style="color: #fb866a;"></i> by <a class="app-link" href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>

                </div>
            </footer><!--//app-footer-->

        </div><!--//app-wrapper-->    					


        <!-- Javascript -->          
        <script src="assets1/plugins/popper.min.js"></script>
        <script src="assets1/plugins/bootstrap/js/bootstrap.min.js"></script>  


        <!-- Page Specific JS -->
        <script src="assets1/js/app.js"></script> 

    </body>
</html> 


