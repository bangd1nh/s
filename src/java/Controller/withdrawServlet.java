/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class withdrawServlet extends HttpServlet {

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
            out.println("<title>Servlet withdrawServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet withdrawServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("useraction")) {
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("loggedInUser");
            int userID = u.getUserID();
            String phonenumber = request.getParameter("phonenumber");
            double ammount = Double.parseDouble(request.getParameter("ammount"));
            long createdAt = System.currentTimeMillis();
            Timestamp transactionDate = new Timestamp(createdAt);
            if (DAO.PaymentDAL.InsertPayment(userID, transactionDate, "pending", ammount, "withdraw_" + phonenumber)) {
                if (DAO.UserDAL.updateBalance(userID, - ammount)) {
                    request.setAttribute("message", "tạo đơn rút tiền thành công");
                } else {
                    request.setAttribute("message", "trừ tiền thất bại");
                }
            } else {
                request.setAttribute("message", "tạo đơn rút tiền thất bại");
            }
            request.getRequestDispatcher("ListingsServlet").forward(request, response);
        } else if (action.equalsIgnoreCase("adminaction")) {
            String status = request.getParameter("status");
            int transactionID = Integer.parseInt(request.getParameter("transactionID"));
            if(status.equalsIgnoreCase("cancel")){
                int userID = DAO.PaymentDAL.getUserID(transactionID);
                double userBalance = DAO.UserDAL.getUserBalance(userID);
                double ammount = DAO.PaymentDAL.getAmmountByID(transactionID);
                DAO.UserDAL.updateBalance(userID, userBalance+ammount);
                DAO.PaymentDAL.updateStatus(status, transactionID);
            }else{
                DAO.PaymentDAL.updateStatus(status, transactionID);
            }
        }

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
