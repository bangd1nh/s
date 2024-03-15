<%-- 
    Document   : loginform
    Created on : Oct 27, 2023, 8:28:47 PM
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
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card border-0 shadow rounded-3 my-5">
                        <div class="card-body p-4 p-sm-5">
                            <h5 class="card-title text-center mb-5 fw-light fs-5">ĐĂNG NHẬP</h5>
                            <form action="LoginServlet" method="post">
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email">
                                    <label for="floatingInput">Địa chỉ Email</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" id="floatingPassword" placeholder="password" name ="pass">
                                    <label for="floatingPassword">Mật khẩu</label>
                                </div>

                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
                                    <label class="form-check-label" for="rememberPasswordCheck">
                                        Nhớ mật khẩu
                                    </label>
                                    <br>
                                    <a href="forgotpassword.jsp">Quên mật khẩu ?</a>
                                </div>
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Đăng nhập</button>
                                </div>
                                <hr class="my-4">
                                <div class="d-grid mb-2">
                                    <button class="btn btn-google btn-login text-uppercase fw-bold" type="submit">
                                         <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/WebApplication1/login-google&response_type=code&client_id=578581362821-kej6i0hgbl4987ff6ip8dkbmlatur1f3.apps.googleusercontent.com&approval_prompt=force"> Đăng nhập bằng GOOGLE </a>
                                    </button>
                                </div>
                                ${requestScope.loginMessage}
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
