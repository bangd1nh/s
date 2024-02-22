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
                        <div class="small mb-1">Listing ID: ${requestScope.listingDetail.getListingID()}</div>
                        <h1 class="display-5 fw-bolder">${requestScope.listingDetail.getTitle()}</h1>
                        <div class="fs-5 mb-5">
                            <span>location: ${requestScope.listingDetail.getLocation()}</span><br>
                            <span>contact phone: ${requestScope.listingDetail.getContactPhone()}</span><br>
                            <span>contact email: ${requestScope.listingDetail.getContactEmail()}</span><br>
                            <span>Landlord Name: ${requestScope.listingDetail.getUsername()}</span><br>
                        </div>
                        <p class="lead">${requestScope.listingDetail.getDescription()}</p>
                        <div class="d-flex">
                        </div>
                    </div>
                </div>
            </div>
            <div class="container px-4 px-lg-5 my-5">
                <div class="card">
                    <div class="container px-4 px-lg-5 my-5">
                        <h5 class="calendar-container p-3 ">Appointments</h5>
                        <form action="AppointmentServlet" method="post">
                        <input type="date" name="appointmentdate" class="">
                        <input type="time" name="appointmenttime">
                        <input type="tel" name="contactphone" placeholder="Contact phone">
                        <input type="text" name="username" placeholder="User name">
                        <label>Chon phong</label>
                        <select>
                            <c:if test="${empty appList}">
                                <option>No free room left</option>
                            </c:if>
                            <c:forEach var="i" begin="0" end="${appList.size()-1}">
                                <option>${appList.get(i).getDescription()}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" value="submit">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer><%@include file="footer.jsp" %></footer>
</body>
</html>
