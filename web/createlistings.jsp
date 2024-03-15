<%-- 
    Document   : createlistings
    Created on : Feb 21, 2024, 3:49:42 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <header> <%@include file="header.jsp"%></header>
        <section class="py-5">
            <form action="CreateListingServlet" method="post" enctype="multipart/form-data">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6">
                            <label for="image">Chọn ảnh:</label>
                            <input type="file" class="form-control" name="image" accept="image/*" required="required" onchange="previewImage(event)">
                            <!-- Thêm thẻ img để hiển thị trước ảnh -->
                            <img id="imagePreview" class="mt-2" style="max-width: 100%; max-height: 300px;">
                        </div>
                        <div class="col-md-6">
                            <h1 class="display-5 fw-bolder">Tiêu đề: <input type="text" class="form-control" name="title"></h1>
                            <div class="fs-5 mb-5">
                                <span>Địa chỉ: <input type="text" class="form-control" name="location"></span><br>
                                <span>Số điện thoại liên lạc: <input type="text" class="form-control" name="contactPhone" value="${sessionScope.loggedInUser.getContactPhone()}"></span><br>
                                <span>Email liên lạc: <input type="text" class="form-control" name="contactEmail" value="${sessionScope.loggedInUser.getEmail()}"></span><br>
                                <span>Tên người cho thuê: <input type="text" class="form-control" name="landlordName" value="${sessionScope.loggedInUser.getUserName()}"></span><br>
                            </div>
                            <div class="fs-5 mb-5">
                                <label for="description" class="form-label">Mô tả:</label>
                                <textarea class="form-control" name="description" rows="4"></textarea>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Đăng bài viết">
                        </div>
                    </div>
                </div>
            </form>
            <script>
                function previewImage(event) {
                    var input = event.target;
                    var preview = document.getElementById('imagePreview');

                    var file = input.files[0];
                    if (file) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            preview.src = e.target.result;
                        };
                        reader.readAsDataURL(file);
                    } else {
                        preview.src = "";
                    }
                }
            </script>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
