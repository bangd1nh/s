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
        <!-- Thư viện Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <!-- Thư viện Bootstrap CSS (đặt trong thẻ head) -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="styles.css" rel="stylesheet" />
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
            .star{
                font-size: 20px;
                cursor: pointer;
            }
            .rated{
                color:gold;
            }
        </style>
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
                        <div class="mt-3">
                            <h5>Rating:</h5>
                            <div class="rating-container">
                                <span class="star" id="star1" onclick="rate(1)">&#9733;</span>
                                <span class="star" id="star2" onclick="rate(2)">&#9733;</span>
                                <span class="star" id="star3" onclick="rate(3)">&#9733;</span>
                                <span class="star" id="star4" onclick="rate(4)">&#9733;</span>
                                <span class="star" id="star5" onclick="rate(5)">&#9733;</span>
                            </div>
                            <p>Your Rating: <span id="userRating">0</span></p>
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
                        <div class="d-flex flex-column comment-section border rounded border-dark">
                            <c:if test="empty commentList">
                                NO COMMENT!
                            </c:if>
                            <c:if test="${not empty commentList}">
                                <c:forEach var="i" begin="0" end="${commentList.size()-1}">
                                    <div class="bg-white p-2">
                                        <div class="d-flex flex-row user-info"><img class="rounded-circle" src="${commentList.get(i).getUserImgsrc()}" width="40">
                                            <div class="d-flex flex-column justify-content-start ml-2"><span class="d-block font-weight-bold name">${commentList.get(i).getUserName()}</span><span class="date text-black-50">${commentList.get(i).getCommentedAt()}</span></div>
                                        </div>
                                        <div class="mt-2">
                                            <p class="comment-text">${commentList.get(i).getComment()}</p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <form action="CreateCommentServlet" method="post">
                                <div class="bg-light p-2">
                                    <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="${sessionScope.loggedInUser.getImgsrc()}" width="40"><textarea class="form-control ml-1 shadow-none textarea" name="comment"></textarea></div>
                                    <input type="hidden" name="userID" value="${sessionScope.loggedInUser.getUserID()}">
                                    <input type="hidden" name="listingID" value="${requestScope.listingDetail.getListingID()}">
                                    <div class="mt-2 text-right"><button class="btn btn-primary btn-sm shadow-none" type="submit">Post comment</button></div>
                                </div>
                            </form>
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
        function rate(star) {
            // Cập nhật giao diện người dùng
            updateStars(star);
            document.getElementById("userRating").innerText = star;

            // Gửi giá trị rating lên server thông qua Ajax
            sendRatingToServer(star);
        }

        function updateStars(rating) {
            for (let i = 1; i <= 5; i++) {
                const starElement = document.getElementById("star" + i);
                if (i <= rating) {
                    starElement.classList.add("rated");
                } else {
                    starElement.classList.remove("rated");
                }
            }
        }

        function sendRatingToServer(rating) {
            // Sử dụng XMLHttpRequest hoặc Fetch API để gửi dữ liệu lên server
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "CreateRatingServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Xử lý phản hồi từ server (nếu cần)
                    console.log(xhr.responseText);
                }
            };
            xhr.send("rating=" + rating);
        }
        function thuephongclick() {
            window.location.href = "ConstractServlet?listingId=" + ${requestScope.listingDetail.getListingID()};
//            window.location.href = "constractdetail.jsp?listingId="+${requestScope.listingDetail.getListingID()};
        }
        F
    </script>
</html>

