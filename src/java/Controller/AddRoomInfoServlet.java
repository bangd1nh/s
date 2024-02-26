/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author admin
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // 5MB
public class AddRoomInfoServlet extends HttpServlet {

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
            out.println("<title>Servlet AddRoomInfoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddRoomInfoServlet at " + request.getContextPath() + "</h1>");
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
        String uploadPath = "D:\\swpp\\s\\web\\uploads";

        // Tạo thư mục lưu trữ nếu nó không tồn tại
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        try {
            // Lưu trữ tệp ảnh được tải lên vào máy chủ
            Part part = request.getPart("image");
            String fileName = getFileName(part);
            String filePath = uploadPath + File.separator + fileName;
            try ( InputStream input = part.getInputStream()) {
                Files.copy(input, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
            String relativePath = ".\\uploads\\" + fileName;
            // Lấy thông tin từ form
            String title = request.getParameter("title");
            String location = request.getParameter("location");
            double price = Double.parseDouble(request.getParameter("price")) ;
            int bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
            int bathrooms = Integer.parseInt(request.getParameter("bathrooms"));
            String username = request.getParameter("username");
            int landlordID = DAO.UserDAL.getUserIDByname(username);
            int listingID = Integer.parseInt(request.getParameter("listingID"));
            String description = request.getParameter("description");
            float area = Float.parseFloat(request.getParameter("area"));
            // Lưu thông tin vào cơ sở dữ liệu
            if (DAO.ApartmentInfoDAL.saveToDatabase(relativePath, title, location, bedrooms, bathrooms, landlordID, description, price, area, listingID)) {
                request.setAttribute("message", "tao bai viet thanh cong");
            }else{
                request.setAttribute("message", "tao bai viet that bai");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Exception message: "+e.getMessage());
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

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                String fileName = token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
                // Lấy tên file từ đường dẫn đầy đủ nếu cần
                return new File(fileName).getName();
            }
        }
        return "";
    }
}
