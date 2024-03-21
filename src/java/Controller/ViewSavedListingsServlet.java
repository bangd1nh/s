/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Listings;
import Model.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class ViewSavedListingsServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session.getAttribute("loggedInUser") != null) {
            User u = (User) session.getAttribute("loggedInUser");
            Cookie[] cookies = request.getCookies();
            int userID = u.getUserID();
            String[] savedListings = new String[99];
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("c_" + userID)) {
                        // Parse the value of the "savedListings" cookie
                        savedListings = cookie.getValue().split(":");
                    }
                }
                if (!Arrays.asList(savedListings).contains(null)) {
                    ArrayList<Listings> l = new ArrayList<>();
                    for (String s : savedListings) {
                        l.add(DAO.ListingsDAL.getSavedListingsByID(Integer.parseInt(s)));
                    }
                    request.setAttribute("list", l);
                }else{
                    request.setAttribute("message", "bạn chưa lưu bài viết nào");
                }
            }
        } else {
            request.setAttribute("message", "vui long dang nhap");
        }
        // Send a response if needed
        request.getRequestDispatcher("ListingsServlet").forward(request, response);
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
        processRequest(request, response);
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
