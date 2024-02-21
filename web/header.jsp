<%-- 
    Document   : header
    Created on : Oct 27, 2023, 7:12:49 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand">FPT House</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="ListingsServlet">Home</a></li>
                            <c:choose>
                                <c:when test="${empty sessionScope.loggedInUser}">
                                <li class="nav-item"><a class="nav-link" href="loginform.jsp">login</a></li>
                                <li class="nav-item"><a class="nav-link" href="registerform.jsp">register</a></li>
                                </c:when>
                                <c:otherwise>
                                <li class="nav-item"><a class="nav-link">Welcome ${sessionScope.loggedInUser.getUserName()}</a></li>
                                <li class="nav-item"><a class="nav-link">$${sessionScope.loggedInUser.getBalance()}</a></li>
                                <li class="nav-item"><a class="nav-link" href="logoutServlet">logout</a></li>
                                    <c:if test="${sessionScope.LoggedInUser.getUserType() == 'Landlord'}">
                                    <li class="nav-item"><a class="nav-link" href="managerPageServlet">manager page</a></li>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                    </ul>
                    <button class="btn btn-outline-dark bi-plus" type="submit" onclick="redirectToCreateListings()">
                        <i class=" me-1"></i>
                        Dang bai viet
                        <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                    </button>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">FPT House</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Ho tro thue tro va can ho tai Da Nang</p>
                </div>
            </div>
        </header>
        <script>
            function redirectToCreateListings() {
                window.location.href = "createlistings.jsp";
            }
        </script>
    </body>
</html>
