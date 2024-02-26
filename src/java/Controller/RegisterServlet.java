/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String userType = request.getParameter("usertype");
        String email = request.getParameter("email");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        User u = new User();
        u.setFristName(firstName);
        u.setLastName(lastName);
        u.setUserType(userType);
        u.setEmail(email);
        u.setUserName(userName);
        u.setPassword(password);
        u.setImgsrc("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqFtKyMtqhbt99_lrslqSydPDSxT3otYmGdG-rYRefbg&s");
        request.setAttribute("tk", u);
        if(DAO.UserDAL.InsertUser(u)){
            request.setAttribute("message", "dang ky thanh cong");
        }else{
            request.setAttribute("message", "dang ky that bai");
        }
        request.getRequestDispatcher("ListingsServlet").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String userType = request.getParameter("usertype");
        String email = request.getParameter("email");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        User u = new User();
        u.setFristName(firstName);
        u.setLastName(lastName);
        u.setUserType(userType);
        u.setEmail(email);
        u.setUserName(userName);
        u.setPassword(password);
        request.setAttribute("tk", u);
        if(DAO.UserDAL.InsertUser(u)){
            request.setAttribute("message", "dang ky thanh cong");
        }else{
            request.setAttribute("message", "dang ky that bai");
        }
        request.getRequestDispatcher("ListingsServlet").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
