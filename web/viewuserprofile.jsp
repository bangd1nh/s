<%-- 
    Document   : viewuserprofile
    Created on : Feb 26, 2024, 1:30:33 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- Thư viện Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Thư viện Bootstrap CSS (đặt trong thẻ head) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="styles.css" rel="stylesheet" />
        <style>
            .gradient-custom {
                /* fallback for old browsers */
                background: #f6d365;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right bottom, rgba(32, 117, 217, 1), rgba(32, 117, 217, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right bottom, rgba(32, 117, 217, 1), rgba(10, 60, 117, 1))
            }
        </style>
    </head>
    <body>
        <header> <%@include file="header.jsp"%></header>
        <section class="vh-100" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <img src="${requestScope.viewUser.getImgsrc()}"
                                         alt="Avatar" class="img-fluid my-5 rounded" style="width: 150px; height: 150px;object-fit: cover" />
                                    <h5>${requestScope.viewUser.getUserName()}</h5>
                                    <p>${requestScope.viewUser.getUserType()}</p>
                                    <i class="far fa-edit mb-5"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Information</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted">${requestScope.viewUser.getEmail()}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Số điện thoại</h6>
                                                <p class="text-muted">${requestScope.viewUser.getContactPhone()}</p>
                                            </div>
                                        </div>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Số dư ví</h6>
                                                <p class="text-muted">######</p>
                                            </div>
                                            <div class="col-6 mb-3 row">
                                                <h6>Họ và tên</h6>
                                                <p class="text-muted col">${requestScope.viewUser.getFristName()}</p>
                                                <p class="text-muted col">${requestScope.viewUser.getLastName()}</p>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-start">
                                            <button class="btn btn-primary ml-1">liên hệ</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
