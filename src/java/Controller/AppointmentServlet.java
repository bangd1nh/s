/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ApartmentInfo;
import Model.Listings;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class AppointmentServlet extends HttpServlet {

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
        request.setAttribute("listingDetail", l);
        ArrayList<ApartmentInfo> appList = DAO.ApartmentInfoDAL.getApartmentInfobyID(listingID);
        request.setAttribute("appList", appList);
        request.getRequestDispatcher("apointments.jsp").forward(request, response);
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
        int listingID =Integer.parseInt(request.getParameter("listingID"));
        String appointmentDate = request.getParameter("appointmentdate");
        String appointmentTime = request.getParameter("appointmenttime");
        String dateTimeString = appointmentDate + " " + appointmentTime;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime localDateTime = LocalDateTime.parse(dateTimeString, formatter);
        Timestamp timestamp = Timestamp.valueOf(localDateTime);
        String contactPhone = request.getParameter("contactphone");
        String userName = request.getParameter("username");
        String roomSelect = request.getParameter("roomSelect");
        int landLordID = Integer.parseInt(request.getParameter("landlordID"));
        int userID = DAO.UserDAL.getUserIDByname(userName);
        if(DAO.AppointmentDAL.insertAppointment(listingID, userID, timestamp, contactPhone,roomSelect,landLordID)){
            request.setAttribute("message", "dat lich hen thanh cong");
        }else{
            request.setAttribute("messagae", "dat lich hen that bai");
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
