<%-- 
    Document   : detail
    Created on : Feb 17, 2024, 8:14:04 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!--Thư viện Bootstrap JS--> 
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <!--Thư viện Bootstrap CSS (đặt trong thẻ head)--> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="jquery.rating.css">
        <script src="jquery.js"></script>
        <script src="jquery.rating.js"></script>
        <style>
            .custom-size {
                width: 100%;    /* Chiều rộng mong muốn */
                height: 200px;   /* Chiều cao mong muốn */
                object-fit: cover; /* Đảm bảo ảnh không bị biến dạng */
            }
            /*            .thumnail-size{
                            width:100%;
                            height:500px;
                            object-fit: cover;
                        }*/
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
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0 thumnail-size" src="${requestScope.listingDetail.getImgsrc()}" alt="..." /></div>
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
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="redirectToAppointment()">
                                <i class="me-1"></i>
                                Dat lich ngay
                            </button>
                            <button class="btn btn-outline-dark flex-shrink-0" onclick="saveListingID()">save post</button>
                        </div>
                        <div class="d-flex mt-1 row">
                            <div class="col">
                                <p>Rating: ${requestScope.average}</p>
                            </div>
                            <div class="col">
                                <p>Your Rating: ${requestScope.userRating}</p>
                            </div>
                            <p>Rate this post:</p>
                            <form action="RatingServlet" method="post" id="ratingForm">
                                <input type="radio" name="rating" value="1" class="star">
                                <input type="radio" name="rating" value="2" class="star">
                                <input type="radio" name="rating" value="3" class="star">
                                <input type="radio" name="rating" value="4" class="star">
                                <input type="radio" name="rating" value="5" class="star">
                                <input type="hidden" name="listingID" value="${requestScope.listingDetail.getListingID()}">
                                <c:if test="${sessionScope.loggedInUser.getUserID() != null}"><input type="submit" value="Rate" class="btn btn-outline-dark"></c:if>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="py-5 bg-light">
                <div class="container px-4 px-lg-5 mt-5">
                    <h2 class="fw-bolder mb-4">Danh sach phong</h2>

                <c:if test="${empty appList}">
                    <p>empty</p>
                </c:if>
                <c:if test="${not empty appList}">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <c:forEach var="i" begin="0" end="${appList.size()-1}">
                            <div class="col mb-5">
                                <div class="card h-100 position-relative">
                                    <div class="badge position-absolute top-0 start-0 bg-${appList.get(i).getStatus() == 'Rentable' ? 'success' : 'danger'} rounded-pill">${appList.get(i).getStatus()}!!!</div>
                                    <!-- Product image-->
                                    <img class="card-img-top custom-size" src="${appList.get(i).getImgsrc()}" alt="..." />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">${appList.get(i).getTitle()}</h5>
                                            <h6 class="fw-bolder">${appList.get(i).getDescription()}</h6>
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#myModal${i}" data-imgsrc="duong-dan-anh.jpg">
                                                Xem Thông Tin
                                            </button></div>
                                    </div>
                                </div>
                            </div>
                            <!--modal -->
                            <div class="modal fade" id="myModal${i}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="myModalLabel">${appList.get(i).getTitle()}</h4>
                                            <span class="badge mx-1 p-1 bg-${appList.get(i).getStatus() == 'Rentable' ? 'success' : 'danger'}">${appList.get(i).getStatus()}!</span>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <!-- Phần ảnh bên trái -->
                                                    <div class="col-md-4">
                                                        <img src="${appList.get(i).getImgsrc()}" class="img-fluid" alt="...">
                                                    </div>
                                                    <!-- Phần thông tin bên phải -->
                                                    <div class="col-md-8">
                                                        <p>${appList.get(i).getDescription()}</p>
                                                        <p>Location: ${appList.get(i).getLocation()}</p>
                                                        <p>Price: ${appList.get(i).getPrice()}</p>
                                                        <p>Bed rooms: ${appList.get(i).getBedRooms()}</p>
                                                        <p>Bath rooms: ${appList.get(i).getBathRooms()}</p>
                                                        <p>Area : ${appList.get(i).getArea()}</p>
                                                        <!-- Thêm các dòng thông tin khác tại đây -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="thuephong" class="btn btn-success" onclick="thuephongclick()" data-dismiss="modal" >Thuê Phòng</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </section>
        <section>
            <div class="container mt-5">
                <div class="d-flex justify-content-center row">
                    <div class="col-md-8">
                        <div class="d-flex flex-column comment-section">
                            <c:if test="${empty commentList}">
                                NO COMMENT!
                            </c:if>
                            <div class="d-flex justify-content-center">
                                <h2 class="text-uppercase">Comment</h2>
                            </div>
                            <c:if test="${not empty commentList}">
                                <c:forEach var="i" begin="0" end="${commentList.size()-1}">
                                    <div class="bg-white p-1 rounded">
                                        <div class="d-flex flex-row user-info">
                                            <img class="rounded-circle" src="${commentList.get(i).getUserImgsrc()}" width="40" height="40" style="object-fit: cover;">
                                            <div class="d-flex flex-column justify-content-start ml-2">
                                                <span class="d-block font-weight-bold name">${commentList.get(i).getUserName()}</span>
                                                <span class="date text-muted">${commentList.get(i).getCommentedAt()}</span>
                                            </div>
                                        </div>
                                        <div class="mt-2 row">
                                            <p class="comment-text col-8">${commentList.get(i).getComment()}</p>
                                            <c:if test="${commentList.get(i).getUserID() eq sessionScope.loggedInUser.getUserID()}">
                                                <button class="btn btn-outline-dark col" type="button" onclick="showEditForm(${i})">sua binh luan</button>
                                                <button class="btn btn-danger col" type="button" onclick="saveChanges(${i}, 'delete')">xoa binh luan</button>
                                            </c:if>
                                        </div>
                                        <div id="editForm${i}" style="display: none;" class="mt-3">
                                            <!-- Biểu mẫu chỉnh sửa -->
                                            <form action="EditCommentServlet" method="post" class="border p-3 rounded">
                                                <input type="hidden" name="commentId" value="${commentList.get(i).getCommentID()}">
                                                <input type="hidden" name="action" value="edit">
                                                <div class="form-group">
                                                    <label for="editedComment">chinh sua comment tai day</label>
                                                    <textarea name="editedComment" id="editedComment" class="form-control" rows="4">${commentList.get(i).getComment()}</textarea>
                                                </div>
                                                <button type="button" onclick="saveChanges(${i}, 'edit')" class="btn btn-primary">luu</button>
                                            </form>
                                        </div>                                   
                                    </div>
                                </c:forEach>
                                <div class="d-flex justify-content-center">
                                    <ul class="pagination">
                                        <c:forEach begin="1" end="${endP}" var="index">
                                            <li class="page-item"><a class="page-link" href="Listingdetail?index=${index}&listingID=${requestScope.listingDetail.getListingID()}">${index}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${not empty sessionScope.loggedInUser}">
                                <form action="CreateCommentServlet" method="post">
                                    <div class="bg-light p-2">
                                        <div class="d-flex flex-row align-items-start">
                                            <img class="rounded-circle" src="${sessionScope.loggedInUser.getImgsrc()}" width="40" height="40" style="object-fit: cover;">
                                            <textarea class="form-control ml-1 shadow-none textarea" name="comment"></textarea>
                                        </div>
                                        <input type="hidden" name="userID" value="${sessionScope.loggedInUser.getUserID()}">
                                        <input type="hidden" name="listingID" value="${requestScope.listingDetail.getListingID()}">
                                        <div class="mt-2 text-right">
                                            <button class="btn btn-primary btn-sm shadow-none" type="submit">Post comment</button>
                                        </div>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
    <script>
        $(document).ready(function () {
            $("#myModal").on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Nút mà bạn bấm để hiển thị modal
                var imgSrc = button.data('imgsrc'); // Lấy đường dẫn ảnh từ thuộc tính data-imgsrc
                var modal = $(this);

                // Đặt đường dẫn ảnh vào thẻ img trong modal
                modal.find('.modal-body .col-md-4 img').attr('src', imgSrc);

                // Các thông tin khác có thể lấy từ các thuộc tính data khác tương tự nếu cần
            });
        });
        function redirectToAppointment() {
            window.location.href = "AppointmentServlet?listingID=${requestScope.listingDetail.getListingID()}&landlordID=${requestScope.listingDetail.getLandlordID()}";
        }
        function saveListingID() {
            var listingID = "${requestScope.listingDetail.getListingID()}";

            // Gọi servlet để lưu cookie
            window.location.href = "SaveListingServlet?listingID=" + listingID + "&userID=" + ${sessionScope.loggedInUser.getUserID()};
        }
        function thuephongclick() {
        <c:if test="${not empty listingDetail && not empty appList}">
            window.location.href = "ConstractServlet?listingId=" + ${requestScope.listingDetail.getListingID()} + "&aprtementID=" +${appList.get(i).getApartmentID()};
//            window.location.href = "constractdetail.jsp?listingId="+${requestScope.listingDetail.getListingID()};
        </c:if>
        }
        function showEditForm(index) {
            // Ẩn tất cả các biểu mẫu chỉnh sửa
            hideAllEditForms();

            // Hiển thị biểu mẫu chỉnh sửa của bình luận được chọn
            document.getElementById("editForm" + index).style.display = "block";
        }

        function hideAllEditForms() {
            // Ẩn tất cả các biểu mẫu chỉnh sửa
        <c:if test="${not empty commentList}">
            <c:forEach var="i" begin="0" end="${commentList.size()-1}">
            document.getElementById("editForm${i}").style.display = "none";
            </c:forEach>
        </c:if>
        }
        function saveChanges(index, action) {
            var commentId = document.getElementsByName("commentId")[0].value;
            var editedComment = document.getElementsByName("editedComment")[0].value;

            // Sử dụng Ajax để gửi dữ liệu chỉnh sửa đến máy chủ
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "EditCommentServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Sau khi cập nhật thành công, cập nhật trực tiếp trên trang
                    document.getElementsByClassName("comment-text")[index].innerHTML = editedComment;

                    // Ẩn biểu mẫu chỉnh sửa và hiển thị lại nội dung bình luận
                    hideAllEditForms();
                    document.getElementsByClassName("comment-text")[index].style.display = "block";
                    if (action === "delete") {
                        // Nếu action là "delete", thì reload trang
                        location.reload();
                    } else {
                        // Nếu action là "edit", cập nhật trực tiếp trên trang và ẩn biểu mẫu chỉnh sửa
                        document.getElementsByClassName("comment-text")[index].innerHTML = editedComment;
                        hideAllEditForms();
                        document.getElementsByClassName("comment-text")[index].style.display = "block";
                    }
                }
            };
            xhr.send("commentId=" + commentId + "&editedComment=" + editedComment + "&action=" + action);
        }
    </script>
</html>

