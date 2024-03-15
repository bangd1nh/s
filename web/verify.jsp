<%-- 
    Document   : verify
    Created on : Mar 15, 2024, 10:16:25 PM
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

        <section>
            <div class="container">
                <form action="ConfirmEmailServlet" method="post" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Email" name="email" value="${sessionScope.tk.getEmail()}" readonly required>
                    </div>
                    <div class="mb-3">
                        <label for="verificationCode" class="form-label">Mã xác nhận</label>
                        <input type="text" class="form-control" id="verificationCode" placeholder="Mã xác nhận" name="verificationCode" required>
                    </div>
                    <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Xác nhận</button>
                </form>
                    <a href="ListingsServlet">trở lại trang chủ</a>
            </div>
        </section>

    </body>
</html>
