/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.Payment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class PaymentDAL {

    private static final String INSERTCONTRACT = "INSERT INTO Transactions (UserID, ContractID, TransactionDate, ApartmentID, Status,Ammount,Description) VALUES (?,?,?,?,?,?);";
    private static final String GETCONTRACTID = "Select Contracts.ContractID from Contracts join Users on Users.UserID = Contracts.TenantID where PropertyID = ?";
    private static final String GETALLPAYMENT = "select * from Transactions";
    private static final String GETTOTALPAYMENT = "select COUNT(*) from Transactions";
    private static final String GETAMMOUNT = "Select Price from ApartmentInfo where ApartmentID = ?";
    private static final String GETPAYMENTBYUSERID = "SELECT * from Transactions where UserID = ? ORDER BY TransactionDate DESC";
    private static final String INSERTWITHDRAW = "INSERT INTO Transactions (UserID, TransactionDate,Status,Ammount,Description) VALUES (?,?,?,?,?);";
    private static final String UPDATESTATUS = "Update Transactions set Status = ? where TransactionID = ?";
    private static final String GETUSERID = "SELECT UserID from Transactions where TransactionID = ?";
    private static final String GETAMMOUNT1 = "Select Ammount from Transactions where TransactionID = ?";

    public static boolean InsertPayment(int userID, int consctractID, Timestamp transactionDate, int apartmentID, String status, double ammount, String description) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(INSERTCONTRACT);
                ptm.setInt(1, userID);
                ptm.setInt(2, consctractID);
                ptm.setTimestamp(3, transactionDate);
                ptm.setInt(4, apartmentID);
                ptm.setString(5, status);
                ptm.setDouble(6, ammount);
                ptm.setString(7, description);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int getConstractID(int propertyID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int constractID = 0;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETCONTRACTID);
                ptm.setInt(1, propertyID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    constractID = rs.getInt("ContractID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return constractID;
    }

    public static ArrayList<Payment> getAllPayment() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Payment> payList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETALLPAYMENT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Payment p = new Payment();
                    p.setTransactionID(rs.getInt("TransactionID"));
                    p.setUserID(rs.getInt("UserID"));
                    p.setConstractID(rs.getInt("ContractID"));
                    p.setTransactionDate(rs.getTimestamp("TransactionDate"));
                    p.setApartmentID(rs.getInt("ApartmentID"));
                    p.setStatus(rs.getString("Status"));
                    p.setAmmount(rs.getDouble("Ammount"));
                    p.setDescription(rs.getString("Description"));
                    payList.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return payList;
    }

    public static int getTotalPayment() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETTOTALPAYMENT);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static double getAmmount(int appID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETAMMOUNT);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static ArrayList<Payment> getAllPaymentByUserID(int userID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Payment> payList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETPAYMENTBYUSERID);
                ptm.setInt(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Payment p = new Payment();
                    p.setTransactionID(rs.getInt("TransactionID"));
                    p.setUserID(rs.getInt("UserID"));
                    p.setConstractID(rs.getInt("ContractID"));
                    p.setTransactionDate(rs.getTimestamp("TransactionDate"));
                    p.setApartmentID(rs.getInt("ApartmentID"));
                    p.setStatus(rs.getString("Status"));
                    p.setAmmount(rs.getDouble("Ammount"));
                    p.setDescription(rs.getString("Description"));
                    payList.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return payList;
    }

    public static boolean InsertPayment(int userID, Timestamp transactionDate, String status, double ammount, String description) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(INSERTWITHDRAW);
                ptm.setInt(1, userID);
                ptm.setTimestamp(2, transactionDate);
                ptm.setString(3, status);
                ptm.setDouble(4, ammount);
                ptm.setString(5, description);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updateStatus(String status, int transactionID) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATESTATUS);
                ptm.setString(1, status);
                ptm.setInt(2, transactionID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int getUserID(int transactionID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int constractID = 0;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETUSERID);
                ptm.setInt(1, transactionID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    constractID = rs.getInt("UserID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return constractID;
    }

    public static double getAmmountByID(int transactionID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        double constractID = 0;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETAMMOUNT1);
                ptm.setInt(1, transactionID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    constractID = rs.getDouble("Ammount");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return constractID;
    }

    public static void main(String[] args) {
        ArrayList<Payment> p = new ArrayList<>();
        p = getAllPayment();
        for (Payment p1 : p) {
            System.out.println(p1.toString());
        }
    }
}
