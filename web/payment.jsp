<%-- 
    Document   : payment
    Created on : Mar 14, 2024, 6:21:45 PM
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

    </head>
    <body>
        <header> <%@include file="header.jsp"%></header>
        <section>
            <div class="container">
                <div class="text-center p-2 m-2">
                    <h1 class="justify-content-center">Lịch sử giao dịch</h1>
                </div>
                <c:if test="${empty payList}">
                    <div class="alert alert-warning" role="alert">
                        Không có giao dịch nào cả
                    </div>
                </c:if>
                <c:if test="${not empty payList}">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">ID Hợp đồng</th>
                                    <th scope="col">Ngày Giao dịch</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Số Tiền</th>
                                    <th scope="col">Mô tả</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="payment" items="${requestScope.payList}">
                                    <tr>
                                        <td><c:if test="${payment.getConstractID() != '0'}"><a href="ViewConstractDetail?conID=${payment.getConstractID()}">${payment.getConstractID()}</a></c:if></td>
                                        <fmt:formatDate value="${payment.getTransactionDate()}" pattern="dd-MM-yyyy HH:mm" var="formattedDate" />
                                        <td>${formattedDate}</td>
                                        <td>${payment.getStatus()}</td>
                                        <td>${payment.getAmmount()}</td>
                                        <td>${payment.getDescription()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
