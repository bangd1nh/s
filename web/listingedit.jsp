<%-- 
    Document   : listingedit
    Created on : Feb 22, 2024, 3:43:38 PM
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
        <section class="py-5">
            <form action="EditServlet" method="post">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${requestScope.listingDetail.getImgsrc()}" alt="..." /></div>
                        <div class="col-md-6">
                            <div class="small mb-1">Listing ID: <input class="hiding" type="number" name="listingID" value="${requestScope.listingDetail.getListingID()}" readonly></div>
                            <h1 class="display-5 fw-bolder">Title: <input type="text" value="${requestScope.listingDetail.getTitle()}" name="title"></h1>
                            <div class="fs-5 mb-5">
                                <span>location:<input type="text" value=" ${requestScope.listingDetail.getLocation()}" name="location"></span><br>
                                <span>contact phone:<input type="tel" value=" ${requestScope.listingDetail.getContactPhone()}" name="contactphone"></span><br>
                                <span>contact email:<input type="text" value="${requestScope.listingDetail.getContactEmail()}" name="contactemail"> </span><br>
                                <span>Landlord Name: ${requestScope.listingDetail.getUsername()} </span><br>
                            </div>
                            <textarea class="form-control" name="description" rows="4" placeholder="${requestScope.listingDetail.getDescription()}"></textarea>
                            <input type="submit" value="Update Litsing" class="btn btn-outline-dark btn-lg btn-group-sm ">
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Title</h5>
                                    <h6 class="fw-bolder">Room number</h6>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#addroominfoModal" data-imgsrc="https://dummyimage.com/450x300/dee2e6/6c757d.jpg">
                                        add room information
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--add roominfo modal-->
            <div class="modal fade" id="addroominfoModal" tabindex="-1" role="dialog" aria-labelledby="addroominfoModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <form action="AddRoomInfoServlet" method="post" enctype="multipart/form-data">
                            <!--bien an-->
                            <input type="hidden" name="listingID" value="${requestScope.listingDetail.getListingID()}">
                            <input type="hidden" name="username" value="${requestScope.listingDetail.getUsername()}">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">
                                    <div class="form-group">
                                        <label for="Title">Title</label>
                                        <input type="text" name="title" value="${requestScope.listingDetail.getTitle()}" class="form-control">
                                    </div>
                                </h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <div class="row">
                                        <!-- Image Upload on the left -->
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="image">Select Image:</label>
                                                <input type="file" class="form-control" name="image" accept="image/*" required="required" onchange="previewImage(event)">
                                                <!-- Image preview -->
                                                <img id="imagePreview" class="mt-2" style="max-width: 100%; max-height: 300px;">
                                            </div>
                                        </div>
                                        <!-- Additional Information on the right -->
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label for="description">Room no:</label>
                                                <input type="text" name="description" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="location">Location:</label>
                                                <input type="text" name="location" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="Price">Price:</label>
                                                <input type="text" name="price" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="bedrooms">Bed rooms:</label>
                                                <input type="number" name="bedrooms" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="bathrooms">Bath rooms:</label>
                                                <input type="number" name="bathrooms" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="bathrooms">Area:</label>
                                                <input type="number" name="area" class="form-control">
                                            </div>
                                            <!-- Add additional input fields as needed -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                <input type="submit" value="submit" class="btn btn-secondary">
                            </div>

                        </form>
                    </div>

                </div>
            </div>     
        </section>

        <footer><%@include file="footer.jsp" %></footer>
    </body>
    <script>
        $(document).ready(function () {
            $("#addroominfoModal").on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Nút mà bạn bấm để hiển thị modal
                var imgSrc = button.data('imgsrc'); // Lấy đường dẫn ảnh từ thuộc tính data-imgsrc
                var modal = $(this);

                // Đặt đường dẫn ảnh vào thẻ img trong modal
                modal.find('.modal-body .col-md-4 img').attr('src', imgSrc);

                // Các thông tin khác có thể lấy từ các thuộc tính data khác tương tự nếu cần
            });
        });
        function previewImage(event) {
            var input = event.target;
            var reader = new FileReader();

            reader.onload = function () {
                var img = document.getElementById('imagePreview');
                img.src = reader.result;
                img.style.objectFit = 'cover'; // Maintain cover aspect ratio
                img.style.width = '300px'; // Set width to 100%
                img.style.height = '100%'; // Set fixed height
            };

            reader.readAsDataURL(input.files[0]);
        }
    </script>
</html>
