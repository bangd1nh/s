<%-- 
    Document   : viewdeposit
    Created on : Mar 1, 2024, 2:04:18 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
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
    </head>

    <body>
        <header> <%@include file="header.jsp"%></header>
        <section>
            <div class="container mt-3">
                <div class="row">
                    <c:if test="${not empty requestScope.conList}">
                        <c:forEach var="l" items="${requestScope.conList}">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">ID phong: ${l.getPropertyId()}</h5>
                                        <p class="card-text">Ngay bat dau Thue: ${l.getStartDate()}</p>
                                        <p class="card-text">Han thue: ${l.getEndDate()}</p>
                                        <p class="card-text">Tinh tran dat coc: ${l.getStatus()}</p>
                                        <p class="card-text"><a href="ViewConstractDetail?conID=${l.getConstractId()}">xem chi tiet hop dong</a></p>
                                        <c:choose>
                                            <c:when test="${sessionScope.loggedInUser.getUserType() eq 'Landlord'}">

                                                <p class="card-text">ID nguoi thue: ${l.getTenantId()}</p>
                                                <c:if test="${l.getStatus() eq 'Pendding'}">
                                                    <form action="UpdateDepositStatus" method="post">
                                                        <input type="hidden" name="constractID" value="${l.getConstractId()}">
                                                        <button type="submit" class="btn btn-success" name="status" value="Aproved">Accept</button>
                                                        <button type="submit" class="btn btn-danger" name="status" value="Cancelled">Cancel</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${l.getStatus() eq 'ByCash' or l.getStatus()eq 'VnPay'}">
                                                    <form action="UpdateDepositStatus" method="post">
                                                        <input type="hidden" name="constractID" value="${l.getConstractId()}">
                                                        <button type="submit" class="btn btn-success" name="status" value="Active">da nhan tien</button>
                                                        <button type="submit" class="btn btn-danger" name="status" value="Cancelled">chua nhan tien</button>
                                                    </form>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="card-text">ID nguoi cho thue:<a class="card-text" href="ViewUserProfile?userID=${l.getLandLordId()}">${l.getLandLordId()}</a></p>
                                                    <c:if test="${l.getStatus() eq 'Aproved'}">
                                                    <form action="/WebApplication1/vnpayajax" method="post" id="frmCreateOrder">
                                                        <input type="hidden" name="constractID" value="${l.getConstractId()}">
                                                        <input type="hidden" name="price" value="${l.getPrice()}">
                                                        <input type="hidden" name="propertyID" value="${l.getPropertyId()}">
                                                        <!--<button type="submit" class="btn btn-success" name="status" value="ByCash">Tien mat</button>-->
                                                        <button type="submit" class="btn btn-success" name="status" >VnPay</button>
                                                    </form>
                                                    <form action="UpdateDepositStatus" method="post">
                                                        <input type="hidden" name="constractID" value="${l.getConstractId()}">
                                                        <input type="hidden" name="price" value="${l.getPrice()}">
                                                        <input type="hidden" name="propertyID" value="${l.getPropertyId()}">
                                                        <button type="submit" class="btn btn-success" name="status" value="ByCash">Tien mat</button>
                                                        <!--<button type="submit" class="btn btn-success" name="status" >VnPay</button>-->
                                                    </form>
                                                    <script type="text/javascript">
                                                        $("#frmCreateOrder").submit(function () {
                                                            //var price = "${constractList.getPrice()}";
                                                            var amount = parseInt("${l.getPrice()}");
                                                            var listingId = "${l.getPropertyId()}";
                                                            var postData = "amount=" + amount + "&propertyId=" + listingId;
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
                                                </c:if>

                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty conList}">
                        <div class="col-12">
                            <p>Chua co don dat coc nao</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>

</html>
