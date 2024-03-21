package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.GooglePojo;
import DAO.GoogleUtils;
import Model.User;
import javax.servlet.http.HttpSession;

@WebServlet("/login-google")
public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("loginform.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            String email = googlePojo.getEmail();
            User u = DAO.UserDAL.userLoginWithEmail(email);
            if(u == null){
                if(DAO.UserDAL.InsertUserEmail(email, getUserName(email))){
                    request.setAttribute("message", "dang nhap thanh cong");
                }
            }else{
                request.setAttribute("message", "dang nhap thanh cong");
                session.setAttribute("loggedInUser", u);
            }
            RequestDispatcher dis = request.getRequestDispatcher("ListingsServlet");
            dis.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    private String getUserName(String email){
        try {
            int atIndex = email.indexOf('@');
            String username = email.substring(0,atIndex);
            return username;
        } catch (Exception e) {
            return null;
        }
    }
}
