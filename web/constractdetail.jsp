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
    </head>
    <header><%@include file="header.jsp" %></header>
    <body >
        <div class="container2">
            <div class="content">
                <h1 class="heading" style="text-align: center;">HỢP ĐỒNG ĐẶT CỌC THUÊ NHÀ</h1>
                <br><!-- comment -->
                <form action="/WebApplication1/vnpayajax" id="frmCreateOrder" method="post">
                    <div class="section" >
                        <div class="section-title">BÊN CHO THUÊ (Gọi tắt là bên A)</div>
                        <div class="section-content">
                            <c:forEach var="i" begin="0" end="${constractList.size()-1}">


                                <p>Ông/Bà:<strong>${constractList.get(i).getFirstName()} ${constractList.get(i).getLastName()}</strong></p>
                                <p>HKTT: <strong>${constractList.get(i).getLocation()}</strong></p>
                                <p>Là chủ sở hữu và sử dụng hợp pháp của căn nhà cho thuê nêu tại Điều 1 hợp đồng này.</p>
                                <p>Điện thoại: <strong>${constractList.get(i).getContactPhone()}</strong></p>
                            </c:forEach>
                        </div>
                    </div>


                    <div class="section">
                        <div class="section-title">BÊN THUÊ (Gọi tắt là bên B)</div>
                        <div class="section-content">
                            <p>Ông/Bà:<strong>${requestScope.user.getFristName()} ${requestScope.user.getLastName()}</strong></p>
                            <p>Điện thoại:<strong>${requestScope.user.getContactPhone()}</strong></p>
                            <p>Email: <strong>${requestScope.user.getEmail()}</strong></p>
                        </div>
                    </div>

                    <div class="section">
                        <div class="section-title">ĐIỀU 1: NHÀ CHO THUÊ</div>
                        <div class="section-content">
                            <c:forEach var="i" begin="0" end="${constractList.size()-1}">
                                <p>Bên A đồng ý cho Bên B thuê nhà <strong>${constractList.get(i).getLocation()}</strong>, thành phố Đà Nẵng; theo Giấy chứng nhận quyền sở hữu nhà ở và quyền sử dụng đất số 1258 do Ủy ban nhân dân thành phố Đà Nẵng cấp ngày 20/10/2008</p>
                                <p>Vị trí và diện tích thuê: <strong>${constractList.get(i).getArea()}</strong>m2 bao gồm <strong>${constractList.get(i).getBedrooms()}</strong> phòng ngủ và <strong>${constractList.get(i).getBathrooms()}</strong> phòng tắm</p>

                            </div>
                        </div>

                        <div class="section">
                            <div class="section-title">ĐIỀU 2: THỜI HẠN CHO THUÊ VÀ TIỀN ĐẶT CỌC</div>
                            <div class="section-content">
                                <p>2.1 Thời hạn cho thuê nhà nêu tại điều 1 của hợp đồng này là: 6 tháng, kể từ  <strong>ngày <%
                                    Date currentDate = new Date();
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd 'tháng' MM 'năm' yyyy");
                                    String formattedDate = dateFormat.format(currentDate);
                                    out.print(formattedDate);
                                        %> </strong>  
                                    đến <strong>ngày 
                                        <% Calendar calendar = Calendar.getInstance();
                                            calendar.setTime(new Date());
                                            calendar.add(Calendar.MONTH, 6);
                                            Date newDate = calendar.getTime();
                                            SimpleDateFormat dateFormat1 = new SimpleDateFormat("dd 'tháng' MM 'năm' yyyy");
                                            String formattedDate1 = dateFormat1.format(newDate);
                                            out.print(formattedDate1);
                                        %></strong></p>
                                <p>2.2 Bên B đặt cọc cho bên A một khoản tiền là: <strong>
                                        ${constractList.get(i).getPrice()} VNĐ
                                    </strong> khoản tiền đặt cọc này được bên A trả lại cho bên B khi hết thời hạn hợp đồng này.</p>    </div>
                        </div>
                    </c:forEach>
                    <div class="section">
                        <div class="section-title">ĐIỀU 3: GIÁ CỌC VÀ PHƯƠNG THỨC THANH TOÁN</div>
                        <div class="section-content">
                            <p>Giá cọc nhà tại điều 1 của hợp đồng này như sau:</p>
                            <p>Giá cọc nhà là ${constractList.get(i).getPrice()} VNĐ</p>
                            <p>Bên B thanh toán cho Bên A tiền cọc. Thời gian đến xem phòng là từ <strong>ngày 
                                    <%
                                        Date currentDate2 = new Date();
                                        SimpleDateFormat dateFormat2 = new SimpleDateFormat("dd 'tháng' MM 'năm' yyyy");
                                        String formattedDate2 = dateFormat2.format(currentDate2);
                                        out.print(formattedDate2);
                                    %>
                                </strong> đến <strong>ngày 
                                    <%
                                        Calendar calendar1 = Calendar.getInstance();
                                        calendar1.setTime(currentDate2);
                                        calendar1.add(Calendar.DAY_OF_MONTH, 7);
                                        Date futureDate1 = calendar1.getTime();
                                        String formattedFutureDate1 = dateFormat2.format(futureDate1);
                                        out.print(formattedFutureDate1);
                                    %>
                                </strong>.</p>
                            <p>Nếu đến hạn <strong>ngày 
                                    <%
                                        Calendar calendar2 = Calendar.getInstance();
                                        calendar2.setTime(currentDate2);
                                        calendar2.add(Calendar.DAY_OF_MONTH, 7);
                                        Date futureDate2 = calendar2.getTime();
                                        String formattedFutureDate2 = dateFormat2.format(futureDate1);
                                        out.print(formattedFutureDate2);
                                    %>
                                </strong> mà bên B chưa đến xem phòng và kí hợp đồng thì bên A sẽ được hưởng toàn bộ số tiền cọc.</p>
                            <p>Bên B sau khi thanh toán sẽ chịu mọi trách nhiệm nếu có việc gì xảy ra.</p>
                        </div>
                    </div>
                    <div style="text-align: center;">
                        <button class="btn btn-success" type="submit" style="margin-right: 40px; font-size: 20px;" href>Đặt Cọc Phòng</button>
                        <button type="button" class="btn btn-secondary"onclick="dongclick()"  style="font-size: 20px;">Đóng</button>
                    </div>
                </form>
            </div> 

        </div>

        <footer><%@include file="footer.jsp" %></footer>
    </body>
    <script type="text/javascript">
        $("#frmCreateOrder").submit(function () {
            //                var price = "${constractList.get(i).getPrice()}";
            var amount = parseInt("${constractList.get(i).getPrice()}");
            var listingId = "${constractList.get(i).getListingid()}";
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
