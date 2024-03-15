<%-- 
    Document   : profile
    Created on : Feb 26, 2024, 12:08:38 AM
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
                                    <img src="${sessionScope.loggedInUser.getImgsrc()}"
                                         alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
                                    <h5>${sessionScope.loggedInUser.getUserName()}</h5>
                                    <p>${sessionScope.loggedInUser.getUserType()}</p>
                                    <i class="far fa-edit mb-5"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Information</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Email</h6>
                                                <p class="text-muted">${sessionScope.loggedInUser.getEmail()}</p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Số điện thoại</h6>
                                                <p class="text-muted">${sessionScope.loggedInUser.getContactPhone()}</p>
                                            </div>
                                        </div>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Số dư ví</h6>
                                                <p class="text-muted">${sessionScope.loggedInUser.getBalance()}</p>
                                            </div>
                                            <div class="col-6 mb-3 row">
                                                <h6>Họ và tên</h6>
                                                <p class="text-muted col">${sessionScope.loggedInUser.getFristName()}</p>
                                                <p class="text-muted col">${sessionScope.loggedInUser.getLastName()}</p>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-start">
                                            <button type="button" class="btn btn-primary" id="showModalBtn">
                                                Chỉnh sửa thông tin
                                            </button>
                                            <button class="btn btn-primary ml-1" data-toggle="modal" data-target="#momoModal">
                                                <i class="bi bi-credit-card-2-front"></i> Rút tiền qua Momo
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Bắt đầu: Modal -->
        <div class="modal fade" id="momoModal" tabindex="-1" role="dialog" aria-labelledby="momoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="momoModalLabel">Xác nhận số điện thoại Momo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="withdrawServlet" method="post">
                        <div class="modal-body">
                            <p>Vui lòng xác nhận lại số điện thoại gửi tiền qua Momo:</p>
                            <input type="text" name="phonenumber" class="form-control" placeholder="Nhập số điện thoại" value="${sessionScope.loggedInUser.getContactPhone()}">
                            <p class="mt-3">Nhập số tiền cần rút</p>
                            <input type="number" name="ammount" class="form-control" >
                            <input type="hidden" name="action" value="useraction">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Kết thúc: Modal -->
        <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editUserModalLabel">Edit User Information</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Form for editing user information -->
                        <form action="EditProfileServlet" method="post" class="row" enctype="multipart/form-data">
                            <input type="hidden" name="userID" value="${sessionScope.loggedInUser.getUserID()}">
                            <div class="col-md-6">
                                <label for="image">Select Image:</label>
                                <input type="file" class="form-control" name="image" accept="image/*" required="required" onchange="previewImage(event)">
                                <!-- Thêm thẻ img để hiển thị trước ảnh -->
                                <img id="imagePreview" class="mt-2" style="max-width: 100%; max-height: 300px;">
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${sessionScope.loggedInUser.getEmail()}">
                                </div>
                                <div class="mb-3">
                                    <label for="contactPhone" class="form-label">Contact Phone:</label>
                                    <input type="text" class="form-control" id="contactPhone" name="contactPhone" value="${sessionScope.loggedInUser.getContactPhone()}">
                                </div>
                                <div class="mb-3">
                                    <label for="firstName" class="form-label">First Name:</label>
                                    <input type="text" class="form-control" id="firstName" name="firstName" value="${sessionScope.loggedInUser.getFristName()}">
                                </div>
                                <div class="mb-3">
                                    <label for="lastName" class="form-label">Last Name:</label>
                                    <input type="text" class="form-control" id="lastName" name="lastName" value="${sessionScope.loggedInUser.getLastName()}">
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
    <script>
        $(document).ready(function () {
            // Bắt sự kiện click vào nút
            $('#showModalBtn').click(function () {
                // Kích hoạt hiển thị modal
                $('#editUserModal').modal('show');
            });
            $('#editUserModal .btn-close').click(function () {
                // Đóng modal khi nút đóng được nhấp
                $('#editUserModal').modal('hide');
            });
        });
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
</html>
