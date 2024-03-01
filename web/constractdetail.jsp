<%-- 
    Document   : constractdetail
    Created on : Feb 26, 2024, 9:42:13 PM
    Author     : Admin
--%>
<%@page import="Model.Constract"%>
<%@page import="Model.ConstractInfor"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <title>Hợp đồng thuê nhà</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.5;
            }

            .container2 {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                overflow: auto;
                padding-top: 100px; /* Thêm khoảng cách 100px từ phía trên */
            }

            .content {
                max-width: 1200px;
                padding: 20px;
                background-color: #f2f2f2;
                border: 1px solid #ccc;
            }

            .heading {
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .section {
                margin-bottom: 20px;
            }

            .section-title {
                font-weight: bold;
                margin-bottom: 10px;
            }

            .section-content {
                margin-left: 20px;
            }


        </style>
        <%
            // Tạo đối tượng Date để lấy ngày hiện tại
            Date currentDate = new Date();

            // Định dạng ngày thành chuỗi dạng yyyy-MM-dd (định dạng của input type date)
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = dateFormat.format(currentDate);
        %>
        <%
            // Tạo đối tượng Calendar để thực hiện phép cộng ngày
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(currentDate);

            // Thêm 7 ngày
            calendar.add(Calendar.DAY_OF_MONTH, 7);

            // Lấy ngày sau khi thêm 7 ngày
            Date date7DaysLater = calendar.getTime();

            // Định dạng ngày thành chuỗi dạng yyyy-MM-dd (định dạng của input type date)
            String formattedDate7DaysLater = dateFormat.format(date7DaysLater);
        %>
    </head>
    <header><%@include file="header.jsp" %></header>
    <body >
        <div class="container2">
            <div class="content">
                <h1 class="heading" style="text-align: center;">HỢP ĐỒNG ĐẶT CỌC THUÊ NHÀ</h1>
                <br><!-- comment -->
                <form action="AddDepositServlet" method="post">
                    <!-- <form action="/WebApplication1/vnpayajax" id="frmCreateOrder" method="post">-->
                    <div class="section" >
                        <div class="section-title">BÊN CHO THUÊ (Gọi tắt là bên A)</div>
                        <div class="section-content">
                            <p>Ông/Bà:<strong>${constractList.getFirstName()} ${constractList.getLastName()}</strong></p>
                            <p>HKTT: <strong>${constractList.getLocation()}</strong></p>
                            <p>Là chủ sở hữu và sử dụng hợp pháp của căn nhà cho thuê nêu tại Điều 1 hợp đồng này.</p>
                            <p>Điện thoại: <strong>${constractList.getContactPhone()}</strong></p>
                        </div>
                    </div>
                    <input type="hidden" value="${constractList.getAparmentId()}" name="apartmentID">
                    <input type="hidenn" value="${constractList.getListingid()}" name="listingID">
                    <input type="hidden" value="${sessionScope.loggedInUser.getUserID()}" name="tennantID">
                    <input type="hidden" value="${constractList.getLandlordId()}" name="landlordID">

                    <div class="section">
                        <div class="section-title">BÊN THUÊ (Gọi tắt là bên B)</div>
                        <div class="section-content">
                            <p>Ông/Bà:<strong>${sessionScope.loggedInUser.getFristName()} ${sessionScope.loggedInUser.getLastName()}</strong></p>
                            <p>Điện thoại:<strong>${sessionScope.loggedInUser.getContactPhone()}</strong></p>
                            <p>Email: <strong>${sessionScope.loggedInUser.getEmail()}</strong></p>
                        </div>
                    </div>

                    <div class="section">
                        <div class="section-title">ĐIỀU 1: NHÀ CHO THUÊ</div>
                        <div class="section-content">
                            <p>Bên A đồng ý cho Bên B thuê nhà <strong>${constractList.getLocation()}</strong>, thành phố Đà Nẵng; theo Giấy chứng nhận quyền sở hữu nhà ở và quyền sử dụng đất số 1258 do Ủy ban nhân dân thành phố Đà Nẵng cấp ngày 20/10/2008</p>
                            <p>Vị trí và diện tích thuê: <strong>${constractList.getArea()}</strong>m2 bao gồm <strong>${constractList.getBedrooms()}</strong> phòng ngủ và <strong>${constractList.getBathrooms()}</strong> phòng tắm</p>

                        </div>
                    </div>

                    <div class="section">
                        <div class="section-title">ĐIỀU 2: THỜI HẠN CHO THUÊ VÀ TIỀN ĐẶT CỌC</div>
                        <div class="section-content">
                            <p>Sau khi đàm phán, thương lượng, bên A và bên B đồng ý ký giấy biên nhận đặt cọc thuê nhà với nội dung như sau: <br> Bên B có nhận của bên A một số tiền đặt cọc là: <strong> ${constractList.getPrice()} VNĐ </strong>  
                                Bên B cam kết sẽ giữ nhà cho thuê nêu trên đến ngày <strong>ngày 
                                    <%= formattedDate7DaysLater%></strong> Trong thời gian đó, bên B và bên A sẽ tiến hành việc ký kết hợp đồng thuê nhà với căn nhà nêu trên</p>
                            <p>Nếu bên A không tiến hành các thủ tục để hai bên ký hợp đồng thuê nhà cho đến ngày <strong>
                                    <%= formattedDate7DaysLater%>
                                </strong> thì coi như bên A phải chịu mất cọc</p>    </div>
                    </div>
                    <div class="section">
                        <div class="section-content">
                            <p>Nếu bên B cho thuê căn nhà nêu trên cho một đối tác khác hoặc đổi ý không thực hiện việc ký kết hợp đồng thuê nhà với bên A cho đến ngày <strong>
                                    <%= formattedDate7DaysLater%>
                                </strong>  thì bên B phải chịu đền bù gấp đôi  số tiền đặt cọc </p> 
                            <p>Giá cọc nhà là ${constractList.getPrice()} VNĐ</p>
                            <p>Bên B thanh toán cho Bên A tiền cọc. Thời gian đến xem phòng là từ <strong>ngày 
                                    <input type="date" name="startdate" value="<%= formattedDate%>" readonly>
                                </strong> đến <strong>ngày 
                                    <input type="date" name="enddate" for="endate" value="<%= formattedDate7DaysLater%>" readonly>
                                </strong>.</p>
                            <p>Nếu đến hạn <strong>ngày 
                                    <%= formattedDate7DaysLater%>
                                </strong> mà bên B chưa đến xem phòng và kí hợp đồng thì bên A sẽ được hưởng toàn bộ số tiền cọc.</p>
                            <p>Bên B sau khi thanh toán sẽ chịu mọi trách nhiệm nếu có việc gì xảy ra.</p>
                        </div>
                    </div>
                    <div style="text-align: center;">
                        <button class="btn btn-success" type="submit" style="margin-right: 40px; font-size: 20px;">Đặt Cọc Phòng</button>
                        <button type="button" class="btn btn-secondary"onclick="dongclick()"  style="font-size: 20px;">Đóng</button>
                    </div>
                </form>
            </div> 

        </div>

        <footer><%@include file="footer.jsp" %></footer>
    </body>
    <script type="text/javascript">
        $("#frmCreateOrder").submit(function () {
            //                var price = "${constractList.getPrice()}";
            var amount = parseInt("${constractList.getPrice()}");
            var listingId = "${constractList.getListingid()}";
            var postData = "amount=" + amount + "&listingId=" + listingId;
            var submitUrl = $("#frmCreateOrder").attr("action");
            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (x) {
                    if (x.code === '00') {
                        if (window.vnpay) {
                            vnpay.open({width: 768, height: 600, url: x.data});
                        } else {
                            location.href = x.data;
                        }
                        return false;
                    } else {
                        alert(x.Message);
                    }
                }
            });
            return false;
        });
    </script> 
    <script>

        function dongclick() {
            window.location.href = "ListingsServlet";
        }
    </script>
</html>
