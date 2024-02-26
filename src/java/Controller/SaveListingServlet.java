/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
public class SaveListingServlet extends HttpServlet {

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
        String listingID = request.getParameter("listingID");
        String userID = request.getParameter("userID");

        // Kiểm tra xem có cookie nào đã được lưu trữ chưa
        Cookie[] cookies = request.getCookies();
        boolean isListingSaved = false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                // Kiểm tra cookie có tên là "savedListings"
                if (cookie.getName().equals("savedListings")) {
                    // Kiểm tra xem cặp listingID và userID đã được lưu trữ trong cookie hay chưa
                    String[] savedListings = cookie.getValue().split(",");
                    for (String savedListing : savedListings) {
                        String[] values = savedListing.split(":");
                        if (values.length == 2 && values[0].equals(listingID) && values[1].equals(userID)) {
                            isListingSaved = true;
                            break;
                        }
                    }
                    break;
                }
            }
        }

        // Nếu cặp listingID và userID chưa được lưu, thêm nó vào cookie
        if (!isListingSaved) {
            Cookie savedListingsCookie = new Cookie("savedListings", "");
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("savedListings")) {
                        savedListingsCookie = cookie;
                        break;
                    }
                }
            }

            // Lấy giá trị cũ của cookie và thêm cặp listingID và userID mới vào
            String savedListingsValue = savedListingsCookie.getValue();
            savedListingsValue = savedListingsValue.isEmpty() ? listingID + ":" + userID
                    : savedListingsValue + "," + listingID + ":" + userID;

            // Cập nhật giá trị mới cho cookie
            savedListingsCookie.setValue(savedListingsValue);
            response.addCookie(savedListingsCookie);
        }

        // Ở đây bạn có thể thực hiện các hành động khác, ví dụ: chuyển hướng, trả về thông báo, v.v.
        response.sendRedirect("Listingdetail?listingID=" + listingID);
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
