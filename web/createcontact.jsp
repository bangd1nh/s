<%-- 
    Document   : createcontact
    Created on : Feb 25, 2024, 4:00:27 PM
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Thư viện Bootstrap CSS (đặt trong thẻ head) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="styles.css" rel="stylesheet" />

    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
        <div class="border p-5 rounded container border-1 mb-5 mt-5">
            <form action="CreateContactServlet" method="post">
                <h1 class="text-center">Rent contract</h1>
                <h2 class="text-uppercase mt-5">contractual responsibility</h2>
                <div class="mt-3 mb-3">
                    <label>
                        -Both parties must create conditions for each other to perform the contract.
                    </label><label>
                        - During the validity period of the contract, if either party violates the agreed terms, the other party can request to terminate the contract; If that breach of contract causes loss to the party that breached the contract, the party that breached the contract must compensate for the damage. 
                    </label><label>
                        - If either party wants to terminate the contract ahead of time, they must notify the other party at least 30 days and both parties must reach an agreement.
                    </label><label>
                        - Party A must return the deposit to Party B. - Any party that violates the terms must be responsible before the law.
                    </label><label>
                        - The contract is made into 03 copies with equal legal value, each party keeps one copy, one copy is saved in the system. If Party B does not pay after 2 hours from signing the contract, the system will automatically cancel the original contract between the two parties.
                    </label>
                </div>
                <div class="row">
                    <h3 class="col">represented by A</h3>
                    <h3 class="col text-right">represented by B</h3>
                </div>
                <div class="d-flex justify-content-center mt-5 ">
                    <button class="btn btn-outline-dark">Send contract</button>
                    <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#contractModal"> contract detail</button>
                </div>
                <div>

                </div>
                <!-- modal-->
                <div class="modal fade" id="contractModal" tabindex="-1" aria-labelledby="contractModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="contractModalLabel">Contract detail</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body container mt-1">
                                <div class="modal-body container mt-1">
                                    <h2 class="mb-4 text-center">Contract</h2>
                                    <div class="mb-3 row">
                                        <div class="col">
                                            <label for="firstName" class="form-label">First name</label>
                                            <input type="text" class="form-control" name="firstname" id="firstname" value="${sessionScope.loggedInUser.getFristName()}" required>
                                        </div>
                                        <div class="col">
                                            <label for="flastname" class="form-label">Last Name</label>
                                            <input type="text" class="form-control" name="lastname" id="lastname" value="${sessionScope.loggedInUser.getLastName()}" required>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="contactphone" class="form-label">Contact phone</label>
                                        <input type="tel" class="form-control" name="contactphone" id="contactphone" value="${requestScope.listing.getContactPhone()}" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="location" class="form-label">Location</label>
                                        <input type="text" class="form-control" id="location" name="location" value="${requestScope.listing.getLocation()}" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="startdate" class="form-label">Start Date</label>
                                        <input type="date" class="form-control" id="startdate" name="startdate" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="enddate" class="form-label">End Date</label>
                                        <input type="date" class="form-control" id="enddate" name="enddate" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="room" class="form-label">Rooms no</label>
                                        <select class="form-control" id="roomSelect">
                                            <c:forEach var="appList" items="${requestScope.appList}">
                                                <option value="${appList.getDescription()}">${appList.getDescription()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="price" class="form-label">Price</label>
                                        <input type="number" class="form-control" id="price" name="price" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="listing" class="form-label">listing ID</label>
                                        <input type="number" class="form-control" id="price" name="listing" value="${requestScope.listing.getListingID()}" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="tenantID" class="form-label">Tenant name</label>
                                        <select class="form-control" id="tenantID">
                                            <c:forEach var="appointment" items="${sessionScope.aList}">
                                                <option>${appointment.getTenantID()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
    <script>
    </script>
</html>
