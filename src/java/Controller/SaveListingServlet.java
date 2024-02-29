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
        // Lấy thông tin từ request
        String listingID = request.getParameter("listingID");
        String userID = request.getParameter("userID");

// Kiểm tra xem có cookie nào đã được lưu trữ chưa
        Cookie[] cookies = request.getCookies();
        boolean isListingSaved = false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("c_" + userID)) {
                    // Đọc giá trị của cookie
                    String savedListingsValue = cookie.getValue();

                    // Kiểm tra xem listingID đã được lưu trong cookie chưa
                    if (!savedListingsValue.contains(listingID + ":")) {
                        // Nếu chưa, thêm listingID vào giá trị cookie
                        savedListingsValue += listingID + ":";
                        cookie.setValue(savedListingsValue);

                        // Cập nhật thời gian sống của cookie (nếu cần)
                        cookie.setMaxAge(30 * 24 * 60 * 60); // Thời gian sống của cookie: 1 năm

                        // Đặt cờ để báo hiệu rằng listing đã được lưu
                        isListingSaved = true;
                        response.addCookie(cookie);
                        request.setAttribute("message", "them vao bai viet yeu thich thanh cong");
                    }
                    break;
                }
            }
        }

// Nếu cặp listingID và userID chưa được lưu, thêm nó vào cookie
        if (!isListingSaved) {
            String savedListingsValue = listingID + ":";

            Cookie savedListingsCookie = new Cookie("c_" + userID, savedListingsValue);
            savedListingsCookie.setMaxAge(30 * 24 * 60 * 60); // Thời gian sống của cookie: 1 năm
            request.setAttribute("message", "them vao bai viet yeu thich thanh cong");
            response.addCookie(savedListingsCookie);
        }

// Chuyển hướng đến trang Listingdetail
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
