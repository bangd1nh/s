<%-- 
    Document   : constractdetail
    Created on : Feb 26, 2024, 9:42:13 PM
    Author     : Admin
--%>
<%@page import="Model.Constract"%>
<%@page import="Model.ConstractInfor"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    padding-top: 400px; /* Thêm khoảng cách 100px từ phía trên */
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
  <h1 class="heading" style="text-align: center;">HỢP ĐỒNG THUÊ NHÀ</h1>
  <br><!-- comment -->
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
      <p>Bà: ...........................................................Sinh năm:</p>
      <p>HKTT:</p>
      <p>CMND số: ...........................Cấp ngày: ................. tại CA Tp Hà Nội</p>
      <p>Địa chỉ:</p>
      <p>Điện thoại:</p>
    </div>
  </div>

  <div class="section">
    <div class="section-title">ĐIỀU 1: NHÀ CHO THUÊ</div>
    <div class="section-content">
      <p>Bên A đồng ý cho Bên B thuê nhà số ......., Phố .............., Phường ..............., Quận ........., thành phố Hà Nội; theo Giấy chứng nhận quyền sở hữu nhà ở và quyền sử dụng đất số ........... do Ủy ban nhân dân thành phố Hà Nội cấp ngày ........</p>
      <p>Vị trí và diện tích thuê: ............. mặt đường, .........m2 x ........T, MT ........m.</p>
    </div>
  </div>

  <div class="section">
    <div class="section-title">ĐIỀU 2: THỜI HẠN CHO THUÊ VÀ TIỀN ĐẶT CỌC</div>
    <div class="section-content">
      <p>2.1 Thời hạn cho thuê nhà nêu tại điều 1 của hợp đồng này là: ...... năm, kể từ ngày ...... tháng ...... năm .... đến ngày .... tháng .... năm ......</p>
      <p>2.2 Bên B đặt cọc cho bên A một khoản tiền là: ................................... khoản tiền đặt cọc này được bên A trả lại cho bên B khi hết thời hạn hợp đồng này.</p>
    </div>
  </div>

  <div class="section">
    <div class="sectionTiếp tục phần còn lại của mã HTML:

```html
-title">ĐIỀU 3: GIÁ THUÊ VÀ PHƯƠNG THỨC THANH TOÁN</div>
    <div class="section-content">
      <p>Giá thuê nhà tại điều 1 của hợp đồng này như sau:</p>
      <p>Giá thuê nhà hàng tháng là ............................./01 tháng (..................................................)</p>
      <p>Bên B thanh toán cho Bên A theo định kỳ ......... tháng/lần. Và sẽ được thực hiện trong suốt thời hạn cho thuê.</p>
      <p>Tiền thuế cho thuê nhà theo quy định của pháp luật, khoản thuế này do bên ............ trả.</p>
      <p>Giá thuê nhà chưa bao gồm các chi phí sử dụng như: tiền điện, nước, điện thoại, internet, vv… các chi phí này sẽ được bên B( bên thuê nhà) trả riêng, theo mức tiêu thụ thực tế.</p>
      <p>Trong ........ năm đầu tiên, từ ngày ...../…./… đến hết ngày …../…../…., tiền nhà cố định hàng tháng là ………………….. /01 tháng (………………………………………………………….………………………)</p>
      <p>Giá thuê nhà trên được giữ ổn định trong ………….. năm đầu tiên của hợp đồng, từ năm thứ ....... trở đi giá thuê nhà sẽ tăng không quá ……..%.</p>
      <p>Các kỳ thanh toán tiếp theo chậm nhất sẽ là 05 ngày đầu kỳ của kỳ thanh toán tiếp theo.</p>
    </div>
  </div>
  </div> 
        </div>
</body>
</html>