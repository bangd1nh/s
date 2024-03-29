/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Appointments;
import Model.Listings;
import Model.User;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class ListingsServlet extends HttpServlet {

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
        int count = DAO.ListingsDAL.getTotalListings();
        int endPage = count / 9;
        if(count % 9 != 0){
            endPage ++;
        }
        request.setAttribute("endP", endPage);
        String index = request.getParameter("index");
        if(index == null){
            index = "1";
        }
        int indexPage = Integer.parseInt(index);
        if (request.getAttribute("list") == null) {
            ArrayList<Listings> list = DAO.ListingsDAL.getAllListings(indexPage);
            request.setAttribute("list", list);
        } else {
            ArrayList<Listings> list = (ArrayList) request.getAttribute("list");
            request.setAttribute("list", list);
        }
        HttpSession session = request.getSession();
        try {
            User u = (User) session.getAttribute("loggedInUser");
            if (u != null) {
                ArrayList<Appointments> aList = new ArrayList<>();
                if (u.getUserType().equals("Landlord")) {
                    aList = DAO.AppointmentDAL.getAllApointmentByLandlordID(u.getUserID());
                }
                if (u.getUserType().equals("Tenant")) {
                    aList = DAO.AppointmentDAL.getAllApointmentByTenantID(u.getUserID());
                }
                session.setAttribute("aList", aList);
            }
        } catch (Exception e) {
        }
        request.getRequestDispatcher("trangchu.jsp").forward(request, response);
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
