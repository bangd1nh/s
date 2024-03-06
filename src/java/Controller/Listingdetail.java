/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ApartmentInfo;
import Model.Comment;
import Model.Listings;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Listingdetail extends HttpServlet {

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
        int listingID = Integer.parseInt(request.getParameter("listingID"));
        Listings l = DAO.ListingsDAL.getListingsByID(listingID);
        request.setAttribute("listingDetail", l);
        ArrayList<ApartmentInfo> appList = DAO.ApartmentInfoDAL.getApartmentInfobyID(listingID);
        request.setAttribute("appList", appList);
        String index = request.getParameter("index");
        int count = DAO.CommentDAL.getTotalListings(listingID);
        int endPage = count / 3;
        if (count % 3 != 0) {
            endPage++;
        }
        if(index == null){
            index = "1";
            ArrayList<Comment> commentList = DAO.CommentDAL.getCommentbyID(listingID,Integer.parseInt(index));
            request.setAttribute("commentList", commentList);
        }else{
            ArrayList<Comment> commentList = DAO.CommentDAL.getCommentbyID(listingID,Integer.parseInt(index));
            request.setAttribute("commentList", commentList);
        }
        ArrayList<Integer> ratingList = DAO.RatingDAL.getAllRating(listingID);
        double average = averageRating(ratingList);
        request.setAttribute("average", average);
        HttpSession session = request.getSession();
        if(session.getAttribute("loggedInUser")!=null){
        User u = (User) session.getAttribute("loggedInUser");
        request.setAttribute("userRating", DAO.RatingDAL.getUserRating(u.getUserID(),listingID));
        }
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
        String index = request.getParameter("index");
        int count = DAO.CommentDAL.getTotalListings(listingID);
        int endPage = count / 3;
        if (count % 3 != 0) {
            endPage++;
        }
        if(index == null){
            index = "1";
            ArrayList<Comment> commentList = DAO.CommentDAL.getCommentbyID(listingID,Integer.parseInt(index));
            request.setAttribute("commentList", commentList);
        }else{
            ArrayList<Comment> commentList = DAO.CommentDAL.getCommentbyID(listingID,Integer.parseInt(index));
            request.setAttribute("commentList", commentList);
        }
        request.setAttribute("endP", endPage);
        ArrayList<Integer> ratingList = DAO.RatingDAL.getAllRating(listingID);
        double average = averageRating(ratingList);
        request.setAttribute("average", average);
        HttpSession session = request.getSession();
        if(session.getAttribute("loggedInUser")!=null){
        User u = (User) session.getAttribute("loggedInUser");
        request.setAttribute("userRating", DAO.RatingDAL.getUserRating(u.getUserID(),listingID));
        }
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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

    private double averageRating(ArrayList<Integer> ratingList) {
        int sum = 0;
        double average = 0;
        if (!ratingList.isEmpty()) {
            for (int i : ratingList) {
                sum += i;
            }
            average = (double) sum / (ratingList.size());
        }
        return average;
    }
}
