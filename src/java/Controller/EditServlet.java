/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ApartmentInfo;
import Model.Listings;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class EditServlet extends HttpServlet {

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
        int listingID = Integer.parseInt(request.getParameter("listingID"));
        Listings l = DAO.ListingsDAL.getListingsByID(listingID);
        ArrayList<ApartmentInfo> appList = DAO.ApartmentInfoDAL.getApartmentInfobyID(listingID);
        request.setAttribute("appList", appList);
        request.setAttribute("listingDetail", l);
        request.getRequestDispatcher("listingedit.jsp").forward(request, response);
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
        String listingIDString = request.getParameter("listingID");
        try {
            int listingID = Integer.parseInt(listingIDString);
            String title = request.getParameter("title");
            String location = request.getParameter("location");
            String contactphone = request.getParameter("contactphone");
            String contactemail = request.getParameter("contactemail");
            String description = request.getParameter("description");
            if (DAO.ListingsDAL.UpdateListing(title, location, contactphone, contactemail, description, listingID)) {
                request.setAttribute("message", "update thanh cong");
            } else {
                request.setAttribute("message", "Update thất bại: DAO method returned false");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Update thất bại: Exception - " + e.getMessage());
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
