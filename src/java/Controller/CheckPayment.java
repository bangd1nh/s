/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Constract;
import Model.ConstractInfor;
import Model.User;
import com.vnpay.common.Config;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CheckPayment extends HttpServlet {

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
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            boolean checkOrderId = true; // Giá trị của vnp_TxnRef tồn tại trong CSDL của merchant
            boolean checkAmount = true; //Kiểm tra số tiền thanh toán do VNPAY phản hồi(vnp_Amount/100) với số tiền của đơn hàng merchant tạo thanh toán: giả sử số tiền kiểm tra là đúng.
            boolean checkOrderStatus = true; // Giả sử PaymnentStatus = 0 (pending) là trạng thái thanh toán của giao dịch khởi tạo chưa có IPN.
            if (checkOrderId) {
                if (checkAmount) {
                    if (checkOrderStatus) {
                        if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                            HttpSession session = request.getSession();
                            User u = (User) session.getAttribute("loggedInUser");
                            int propertyID = Integer.parseInt(request.getParameter("vnp_OrderInfo"));
                            int conID = DAO.PaymentDAL.getConstractID(propertyID);
                            long createdAt = System.currentTimeMillis();
                            Timestamp transactionDate = new Timestamp(createdAt);
                            if (DAO.PaymentDAL.InsertPayment(u.getUserID(), conID, transactionDate, propertyID, "success", DAO.PaymentDAL.getAmmount(propertyID),"VnPayAdmin")) {
                                if (DAO.ConstractDAL.updateStatusContractByPID("Active", propertyID)) {
                                    DAO.ApartmentInfoDAL.updatestatus(propertyID);
                                    DAO.UserDAL.updateBalance(DAO.ApartmentInfoDAL.getUserIDByPropertyID(propertyID), DAO.PaymentDAL.getAmmount(propertyID));
                                    request.setAttribute("message", "thanh toan thanh cong");
                                } else {
                                    request.setAttribute("message", "insert hop dong taht bai");
                                }
                            } else {
                                request.setAttribute("message", "insert than htoan taht bai");
                            }
                            request.getRequestDispatcher("ListingsServlet").forward(request, response);
                        } else {
                            //Xử lý/Cập nhật tình trạng giao dịch thanh toán "Không thành công"
                            //  out.print("GD Khong thanh cong");
                            request.setAttribute("message", "thanh toan that bai");
                            request.getRequestDispatcher("ListingsServlet").forward(request, response);
                        }
                    } else {
                        //Trạng thái giao dịch đã được cập nhật trước đó
                        out.print("{\"RspCode\":\"02\",\"Message\":\"Order already confirmed\"}");
                    }
                } else {
                    //Số tiền không trùng khớp
                    out.print("{\"RspCode\":\"04\",\"Message\":\"Invalid Amount\"}");
                }
            } else {
                //Mã giao dịch không tồn tại
                out.print("{\"RspCode\":\"01\",\"Message\":\"Order not Found\"}");
            }

        } else {
            // Sai checksum
            out.print("{\"RspCode\":\"97\",\"Message\":\"Invalid Checksum\"}");
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
