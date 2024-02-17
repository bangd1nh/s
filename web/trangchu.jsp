<%-- 
    Document   : Trang chu
    Created on : Oct 27, 2023, 7:29:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Homepage - Start Bootstrap Template</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
        <header> <%@include file="header.jsp"%></header>
        <section class="py-5">
            <div>
                <div class="container px-md-5">
                    <div>
                        <form action="searchServlet" method="get">
                        <input type="text"  value="" placeholder="Search Products..." name="searchTerm">
                        <input type="submit" value="search">
                        </form>
                    </div>
                </div>
            </div>
            <div>
                ${requestScope.message}
            </div>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:if test="${empty list}">
                        <p>empty</p>
                    </c:if>
                    <c:if test="${not empty list}">
                    <c:forEach var="i" begin="0" end="${list.size()-1}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="${list.get(i).getImgsrc()}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${list.get(i).getTitle()}</h5>
                                    <!-- Product price-->
                                    location ${list.get(i).getLocation()}
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="ViewdetailServlet?listingID=${list.get(i).getListingID()}">view Detail</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                </div>
            </div>
        </section>
        <div>
            <c:if test="${pageNumber > 1}">
                <a href="product?page=${pageNumber - 1}">Previous</a>
            </c:if>
            <c:if test="${!empty productList}">
                <a href="product?page=${pageNumber + 1}">Next</a>
            </c:if>
        </div>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
