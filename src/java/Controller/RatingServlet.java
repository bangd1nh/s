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
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class RatingServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RatingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RatingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String ratingStr = request.getParameter("rating");
        if (ratingStr == null) {
            ratingStr = "0";
        }
        int rating = Integer.parseInt(ratingStr);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("loggedInUser");
        int listingID = Integer.parseInt(request.getParameter("listingID"));
        int userID = u.getUserID();
        if (!DAO.RatingDAL.checkUser(userID, listingID)) {
            if (rating > 0) {
                if (DAO.RatingDAL.insertRating(userID, listingID, rating)) {
                    request.setAttribute("message", "danh gia thanh cong");
                } else {
                    request.setAttribute("message", "danh gai that bai");
                }
            }else{
                request.setAttribute("message", "ban khong the danh gai 0 sao cho bai viet nay");
            }
        } else {
            if (rating > 0) {
                if (DAO.RatingDAL.updateRating(listingID, userID, rating)) {
                    request.setAttribute("message", "danh gia thanh cong");
                } else {
                    request.setAttribute("message", "danh gia that bai");
                }
            } else {
                if (DAO.RatingDAL.deleteComment(listingID, userID)) {
                    request.setAttribute("message", "huy danh gia thanh cong");
                } else {
                    request.setAttribute("message", "huy danh gia that bai");
                }
            }
        }
        request.getRequestDispatcher("Listingdetail").forward(request, response);
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
