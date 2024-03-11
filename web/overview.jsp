<%-- 
    Document   : index.jsp
    Created on : Mar 4, 2024, 5:35:40 PM
    Author     : Anh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>Over-view</title>

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

            <div class="app-content pt-3 p-md-3 p-lg-4">
                <div class="container-xl">

                    <h1 class="app-page-title">Overview</h1>

                    <jsp:useBean id="laptopdao" class="com.model.laptop.LaptopDAO"/>
                    <jsp:useBean id="orderdao" class="com.model.order.OrderDAO"/>

                    <div class="row g-4 mb-4">
                        <div class="col-6 col-lg-3">
                            <c:set value="${0}" var="totalMoney"/>
                            <c:forEach items="${orderdao.getPriceGroupByDate()}" var="i">
                                <c:set value="${totalMoney+i.getTotalMoney()}" var="totalMoney"/>
                            </c:forEach>
                            <fmt:formatNumber value="${totalMoney}" pattern="#,##0" var="money" />
                            <div class="app-card app-card-stat shadow-sm h-100">
                                <div class="app-card-body p-3 p-lg-4">
                                    <h4 class="stats-type mb-1">Total Sales</h4>
                                    <div class="stats-figure">${money}đ</div>
                                    <div class="stats-meta text-success">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-up" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
                                        </svg> </div>
                                </div><!--//app-card-body-->
                                <a class="app-card-link-mask" href="#"></a>
                            </div><!--//app-card-->
                        </div><!--//col-->
                        <div class="col-6 col-lg-3">
                            <div class="app-card app-card-stat shadow-sm h-100">
                                <div class="app-card-body p-3 p-lg-4">
                                    <h4 class="stats-type mb-1">Products</h4>
                                    <div class="stats-figure">${laptopdao.numberOfProduct()}</div>
                                    <div class="stats-meta">
                                        Open</div>
                                </div><!--//app-card-body-->
                                <a class="app-card-link-mask" href="#"></a>
                            </div><!--//app-card-->
                        </div><!--//col-->
                        <div class="col-6 col-lg-3">
                            <div class="app-card app-card-stat shadow-sm h-100">
                                <div class="app-card-body p-3 p-lg-4">
                                    <h4 class="stats-type mb-1">Invoices</h4>
                                    <div class="stats-figure">${orderdao.numberOfOrder()}</div>
                                    <div class="stats-meta">New</div>
                                </div><!--//app-card-body-->
                                <a class="app-card-link-mask" href="#"></a>
                            </div><!--//app-card-->
                        </div><!--//col-->
                    </div><!--//row-->
                    <div class="row g-4 mb-4">
                        <div class="col-12 col-lg-12">
                            <div class="app-card app-card-chart h-100 shadow-sm">
                                <div class="app-card-header p-3">
                                    <div class="row justify-content-between align-items-center">
                                        <div class="col-auto">
                                            <h4 class="app-card-title">Line Chart</h4>
                                        </div><!--//col-->
                                    </div><!--//row-->
                                </div><!--//app-card-header-->
                                <c:set value="${orderdao.getPriceGroupByDate()}" var="listO"/>
                                <div class="app-card-body p-3 p-lg-4">
                                    <script>

                                        window.onload = function () {
                                            var dataPoints = [];
                                        <c:forEach var="item" items="${listO}">
                                            dataPoints.push({
                                                x: new Date('${item.date}'),
                                                y: ${item.getTotalMoney()}
                                            });
                                        </c:forEach>
                                            var chart = new CanvasJS.Chart("chartContainer", {
                                                animationEnabled: true,
                                                title: {
                                                    text: "Doanh thu"
                                                },
                                                axisY: {
                                                    title: "Triệu",
                                                    valueFormatString: "#0,,.",
                                                    suffix: "triệu",

                                                },
                                                data: [{
                                                        yValueFormatString: "#,### vnd",
                                                        xValueFormatString: "DD/MM/YYYY",
                                                        type: "spline",
                                                        dataPoints: dataPoints
                                                    }]
                                            });
                                            chart.render();

                                        }
                                    </script>
                                    <!--                                    <div class="chart-container">
                                                                            <canvas id="canvas-linechart" ></canvas>
                                                                        </div>-->
                                    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                                </div><!--//app-card-body-->
                            </div><!--//app-card-->
                        </div><!--//col-->
                    </div><!--//row-->
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

        <!-- Charts JS -->
        <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
        <script src="assets1/plugins/chart.js/chart.min.js"></script> 
        <script src="assets1/js/index-charts.js"></script> 

        <!-- Page Specific JS -->
        <script src="assets1/js/app.js"></script> 

    </body>
</html> 


