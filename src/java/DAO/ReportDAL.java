/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.Report;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ReportDAL {
    private static final String GETALLREPORT = "SELECT * FROM Report ORDER By CreateAt DESC;";
    private static final String TOTALREPORT = "SELECT COUNT(*) AS total_report FROM Report";
    private static final String DELETECOMMENT = "DELETE FROM Comments WHERE ListingID=?";
    private static final String DELETEAPARTMENT = "DELETE FROM ApartmentInfo WHERE ListingID=?";
    private static final String DELETEAPOINTMENT = "DELETE FROM Appointments WHERE ListingID=?";
    private static final String DELETELISTING = "DELETE FROM Listings WHERE ListingID=?";
    private static final String UPDATESTATUSREPORT = "UPDATE Report SET Status=? WHERE ListingID=?";
    public static ArrayList<Report> getAllReport() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Report> reports = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETALLREPORT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Report l = new Report();
                    l.setUserID(rs.getInt("UserID"));
                    l.setListingID(rs.getInt("ListingID"));
                    l.setCreateAt(rs.getDate("CreateAt"));
                    l.setDescription(rs.getString("Description"));
                    l.setStatus(rs.getString("Status"));
                    reports.add(l);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reports;
    }
    public static int getTotalReport() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int totalReport = 0;
        try (Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(TOTALREPORT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    totalReport = rs.getInt("total_report");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalReport;
    }
    public void deleteCommentByListingID(int listingID) {
    PreparedStatement ptm = null;
    try (Connection con = DBconnection.getConnection()) {
        if (con != null) {
            ptm = con.prepareStatement(DELETECOMMENT);
            ptm.setInt(1, listingID);
            ptm.executeUpdate();
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (ptm != null) {
            try {
                ptm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    }
    public void deleteApartmentByListingID(int listingID) {
    PreparedStatement ptm = null;
    try (Connection con = DBconnection.getConnection()) {
        if (con != null) {
            ptm = con.prepareStatement(DELETEAPARTMENT);
            ptm.setInt(1, listingID);
            ptm.executeUpdate();
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (ptm != null) {
            try {
                ptm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
}
    public void deleteApointmentByListingID(int listingID) {
    PreparedStatement ptm = null;
    try (Connection con = DBconnection.getConnection()) {
        if (con != null) {
            ptm = con.prepareStatement(DELETEAPOINTMENT);
            ptm.setInt(1, listingID);
            ptm.executeUpdate();
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (ptm != null) {
            try {
                ptm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
}
        public void deleteListingByListingID(int listingID) {
    PreparedStatement ptm = null;
    try (Connection con = DBconnection.getConnection()) {
        if (con != null) {
            ptm = con.prepareStatement(DELETELISTING);
            ptm.setInt(1, listingID);
            ptm.executeUpdate();
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (ptm != null) {
            try {
                ptm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
}
         public static boolean UpdateReport(String Status, int listingsID) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATESTATUSREPORT);
                ptm.setString(1, Status);
                ptm.setInt(2, listingsID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
        public int getStatusReport(int listingsID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int statusReport = 0;
        try (Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement("SELECT Status FROM Report WHERE listingsID = ?");
                ptm.setInt(1, listingsID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    statusReport = rs.getInt("Status");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return statusReport;
    }
}

