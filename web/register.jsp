<%-- 
    Document   : register
    Created on : Oct 29, 2023, 4:29:02 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                font-family: Arial, sans-serif;
            }
            .loginform{
                background: white;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .form{
                background: grey;
                color: black;
                padding: 20px;
                border: 2px solid #3366FF;
                border-radius: 5px;
                width: 300px;
            }
            .form h1{
                text-align: center;
            }
            .form p{
                margin: 10px 0;
            }
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 10px 0;
                margin: 5px 0;
                border-radius: 5px;
                border: none;
            }
            button[type="submit"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border-radius: 5px;
                border: none;
                background-color: white;
                color: #3366FF;
                cursor: pointer;
                background-color: white;
                color: #3366FF;
                transition: background-color 0.3s, color 0.3s;
            }
            button[type="submit"]:hover {
                background-color: #3366FF;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="loginform">
            <form class="form" action="registerServlet" method="post">
                <h1 style="text-align: center;
                margin: auto;">
                    Register
                </h1>
                <p>Enter username</p>
                <input type="text" name="rusername"><br>
                <p>Enter password</p>
                <input type="password" name="rpassword"><br>
                <p>Enter password Again</p>
                <input type="password" name="rpassword1"><br>
                <p>${requestScope.message}</p><br>
                <button type="submit" style="font-weight: bold">REGISTER</button>
            </form>
        </div>
    </body>
</html>
