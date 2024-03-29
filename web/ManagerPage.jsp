<%-- 
    Document   : ManagerPage
    Created on : Feb 22, 2024, 3:22:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop Homepage - Start Bootstrap Template</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- Thư viện Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Thư viện Bootstrap CSS (đặt trong thẻ head) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="styles.css" rel="stylesheet" />
        <style>
            .custom-size {
                width: 100%;    /* Chiều rộng mong muốn */
                height: 200px;   /* Chiều cao mong muốn */
                object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
            }
        </style>
        <script type="text/javascript">
            // Hàm kiểm tra và hiển thị popup
            function showPopup() {
                var message = '<%= request.getAttribute("message")%>';
                if (message && message !== 'null') {
                    alert(message);
                }
            }

            // Gọi hàm showPopup khi trang JSP được tải
            window.onload = function () {
                showPopup();
            };
        </script>
    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
        <section>
            <div class="container px-4 px-lg-5 mt-5">
                <h1 class="text-center m-3">Quản lý bài đăng</h1>
                <div class="row gx-5">
                    <c:if test="${empty list}">
                        <p>empty</p>
                    </c:if>
                    <c:if test="${not empty list}">
                        <c:forEach var="i" begin="0" end="${list.size()-1}" varStatus="loop">
                            <div class="col-lg-4 mb-5">
                                <div class="card h-100 shadow border-0">
                                    <img class=" custom-size img-fluid" src="${list.get(i).getImgsrc()}" alt="..." />
                                    <div class="card-body p-4">
                                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">ID bài viết:${list.get(i).getListingID()}</div>
                                        <a class="text-decoration-none link-dark stretched-link" href="EditServlet?listingID=${list.get(i).getListingID()}&username=${list.get(i).getUsername()}"><h5 class="card-title mb-3">${list.get(i).getTitle()}</h5></a>
                                        <p class="card-text mb-0">${list.get(i).getLocation()}</p>
                                    </div>
                                    <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                        <div class="d-flex align-items-end justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                                <div class="small">
                                                    <div class="fw-bold">
                                                        ${list.get(i).getUsername()}
                                                    </div>
                                                    <fmt:formatDate value="${list.get(i).getCreateAt()}" pattern="dd-MM-yyyy HH:mm" var="formattedDate" />
                                                    <div class="text-muted">${formattedDate}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
