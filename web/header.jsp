<%-- 
    Document   : header
    Created on : Oct 27, 2023, 7:12:49 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                                <li class="nav-item"><a class="nav-link" href="profile.jsp">Welcome ${sessionScope.loggedInUser.getUserName()}</a></li>
                                <li class="nav-item"><a class="nav-link" href="">$${sessionScope.loggedInUser.getBalance()}</a></li>
                                <li class="nav-item"><a class="nav-link" href="logoutServlet">logout</a></li>
                                    <c:if test="${sessionScope.loggedInUser.getUserType() == 'Landlord'}">
                                    <li class="nav-item"><a class="nav-link" href="ManagerPageServlet">manager page</a></li>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        <li class="nav-item"><a class="nav-link" href="ViewDepositServlet">Deposit</a></li>
                    </ul>
                    <!-- thong bao -->
                    <button class="btn btn-outline-dark bi-bell" type="button" data-bs-toggle="modal" data-bs-target="#notificationModal" id="openModalBtn">
                        <i class=" me-1"></i>
                        Thông báo
                        <span class="badge bg-dark text-white ms-1 rounded-pill">
                            <c:if test="${empty sessionScope.aList}">0</c:if>
                            <c:if test="${not empty sessionScope.aList}">${sessionScope.aList.size()}</c:if>
                            </span>
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-xl"> <!-- Added 'modal-lg' class for a larger modal -->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="notificationModalLabel">Thông báo</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- Nội dung thông báo sẽ được hiển thị ở đây -->
                                    <c:if test="${empty sessionScope.aList}">
                                        <p>Không có thông báo mới: ...</p>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.aList}">
                                        <c:forEach var="appointment" items="${sessionScope.aList}">
                                            <c:set var="formattedDate">
                                                <fmt:formatDate value="${appointment.appointmentDate}" pattern="dd-MM-yyyy HH:mm"/>
                                            </c:set>
                                            <form action="NotificationServlet" method="post">
                                                <input type="hidden" name="appointmentID" value="${appointment.getAppointmentID()}">
                                                <div class="row border-bottom mb-2"> <!-- Added 'border-bottom' and 'mb-3' classes for borders and margin -->
                                                    <div class="col">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.loggedInUser.getUserType() eq 'Landlord'}">
                                                                <p>Tenant ID: <a href="ViewUserProfile?userID=${appointment.getTenantID()}">${appointment.getTenantID()}</a></p>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <p>Landlord ID:<a href="ViewUserProfile?userID=${appointment.getLandlordID()}"> ${appointment.getLandlordID()} </a></p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div class="col-3">
                                                        <p>Appointment At: ${formattedDate}</p>
                                                    </div>
                                                    <div class="col">
                                                        <p>Listing ID: <a href="Listingdetail?listingID=${appointment.getListingID()}">${appointment.getListingID()}</a></p>
                                                    </div>
                                                    <div class="col">
                                                        <p>Room no: ${appointment.getRoomSelected()}</p>
                                                    </div>
                                                    <div class="col">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.loggedInUser.getUserType() eq 'Landlord'}">
                                                                <c:choose>
                                                                    <c:when test="${appointment.getStatus() eq 'Pending'}">
                                                                        <button name="status" class="btn btn-outline-dark" type="submit" value="Cancelled">Cancel</button>
                                                                        <button name="status" class="btn btn-outline-dark btn-primary" type="submit" value="Approved">Approve</button>
                                                                    </c:when>
                                                                    <c:otherwise><p>Status: ${appointment.getStatus()}</p></c:otherwise>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p>Status: ${appointment.getStatus()}</p>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </div>
                                                </div>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ket thuc modal -->
                    <c:if test="${sessionScope.loggedInUser.getUserType() == 'Landlord'}"><button class="btn btn-outline-dark bi-plus" type="submit" onclick="redirectToCreateListings()">
                            <i class=" me-1"></i>
                            Dang bai viet
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                    </c:if>
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
    </body>
    <script>
        $(document).ready(function () {
            $('#openModalBtn').click(function () {
                // Kích hoạt modal
                $('#notificationModal').modal('show');
            });
            // Thêm sự kiện click cho nút đóng trong modal
            $('#notificationModal .btn-close').click(function () {
                // Đóng modal khi nút đóng được nhấp
                $('#notificationModal').modal('hide');
            });
        });
        function redirectToCreateListings() {
            window.location.href = "createlistings.jsp";
        }
    </script>
</html>
