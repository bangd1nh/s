<%-- 
    Document   : detail
    Created on : Feb 17, 2024, 8:14:04 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${requestScope.listingDetail.getImgsrc()}" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">Listing ID: ${requestScope.listingDetail.getListingID()}</div>
                        <h1 class="display-5 fw-bolder">${requestScope.listingDetail.getTitle()}</h1>
                        <div class="fs-5 mb-5">
                            <span>location: ${requestScope.listingDetail.getLocation()}</span><br>
                            <span>contact phone: ${requestScope.listingDetail.getContactPhone()}</span><br>
                            <span>contact email: ${requestScope.listingDetail.getContactEmail()}</span><br>
                            <span>contact phone: ${requestScope.listingDetail.getContactPhone()}</span><br>
                        </div>
                        <p class="lead">${requestScope.listingDetail.getDescription()}</p>
                        <div class="d-flex">
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="addToCart()">
                                <i class="me-1"></i>
                                Dat lich ngay
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Danh sach phong</h2>

                <c:if test="${empty appList}">
                    <p>empty</p>
                </c:if>
                <c:if test="${not empty appList}">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <c:forEach var="i" begin="0" end="${appList.size()-1}">
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="${appList.get(i).getImgsrc()}" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">${appList.get(i).getTitle()}</h5>
                                            <h6 class="fw-bolder">${appList.get(i).getDescription()}</h6>
                                            <!-- Product price-->
                                            $ ${appList.get(i).getPrice()}
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
    <script>
        function addToCart() {
            var productId = "${requestScope.productDetail.getProductId()}"; // Lấy ID của sản phẩm
            var quantity = document.getElementById("inputQuantity").value; // Lấy số lượng từ ô input
            // Gửi yêu cầu đến Servlet "AddToCart"
            window.location.href = "addtocartServlet?productId=" + productId + "&quantity=" + quantity;
        }
    </script>
</html>

