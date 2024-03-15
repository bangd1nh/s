<%-- 
    Document   : apointments
    Created on : Feb 22, 2024, 1:26:18 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- Thư viện Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Thư viện Bootstrap CSS (đặt trong thẻ head) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
        <section>
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${requestScope.listingDetail.getImgsrc()}" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">ID bài viết: ${requestScope.listingDetail.getListingID()}</div>
                        <h1 class="display-5 fw-bolder">${requestScope.listingDetail.getTitle()}</h1>
                        <div class="fs-5 mb-5">
                            <span>Địa chỉ: ${requestScope.listingDetail.getLocation()}</span><br>
                            <span>số điện thoại liên lạc: ${requestScope.listingDetail.getContactPhone()}</span><br>
                            <span>địa chỉ email liên lạc: ${requestScope.listingDetail.getContactEmail()}</span><br>
                            <span>Tên người cho thuê: ${requestScope.listingDetail.getUsername()}</span><br>
                        </div>
                        <p class="lead">${requestScope.listingDetail.getDescription()}</p>
                        <div class="d-flex">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container px-4 px-lg-5 my-5">
                <form action="AppointmentServlet" method="post">
                    <div class="card">
                        <div class="row">
                            <!-- Cột bên trái -->
                            <input type="hidden" value="${param.listingID}" name="listingID">
                            <input type="hidden" value="${param.landlordID}" name="landlordID">
                            <div class="col-lg-6">
                                <div class="container px-4 px-lg-5 my-5">
                                    <h5 class="calendar-container p-3 ">Lịch hẹn</h5>

                                    <div class="mb-3">
                                        <label for="appointmentdate" class="form-label">Ngày hẹn</label>
                                        <input type="date" id="appointmentdate" name="appointmentdate" class="form-control" >
                                    </div>
                                    <div class="mb-3">
                                        <label for="appointmenttime" class="form-label">Giờ hẹn</label>
                                        <input type="time" id="appointmenttime" name="appointmenttime" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <!-- Cột bên phải -->
                            <div class="col-lg-6">
                                <div class="container px-4 px-lg-5 my-5">
                                    <div class="mb-3">
                                        <label for="contactphone" class="form-label">số điện thoại liên lạc</label>
                                        <input type="tel" id="contactphone" name="contactphone" placeholder="số điện thoại" class="form-control">
                                    </div>
                                    <div class="mb-3">
                                        <label for="username" class="form-label">Tên người thuê</label>
                                        <input type="text" id="username" name="username" placeholder="User name" value="${sessionScope.loggedInUser.getUserName()}" readonly class="form-control">
                                    </div>
                                    <div class="mb-3">
                                        <label for="roomSelect" class="form-label">Chọn phòng</label>
                                        <select id="roomSelect" name="roomSelect" class="form-select">
                                            <c:if test="${empty appList}">
                                                <option>Hết phòng trống!</option>
                                            </c:if>
                                            <c:if test="${not empty appList}">
                                                <c:forEach var="i" begin="0" end="${appList.size()-1}">
                                                    <c:if test="${appList.get(i).getStatus() =='Rentable'}">
                                                        <option>${appList.get(i).getDescription()}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <input type="submit" value="Đặt lịch!" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
