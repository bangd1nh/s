/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.Appointments;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class AppointmentDAL {
    private static final String INSERTAPPOINTMENT="INSERT INTO Appointments (ListingID,TenantID,AppointmentDate,Status,ContactPhone,RoomSelected,LandlordID) VALUES (?,?,?,?,?,?,?)";
    private static final String GETALLAPOINTMENTBYUSERID="SELECT * FROM [Appointments] where LandlordID=?";
    public static ArrayList<Appointments> getAllApointmentByUserID(int userID){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Appointments> aList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETALLAPOINTMENTBYUSERID);
                ptm.setInt(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Appointments a = new Appointments();
                    a.setAppointmentID(rs.getInt("AppointmentID"));
                    a.setListingID(rs.getInt("ListingID"));
                    a.setTenantID(rs.getInt("TenantID"));
                    a.setAppointmentDate(rs.getTimestamp("AppointmentDate"));
                    a.setStatus(rs.getString("Status"));
                    a.setRoomSelected(rs.getString("RoomSelected"));
                    a.setContactPhone(rs.getString("ContactPhone"));
                    a.setLandlordID(rs.getInt("LandlordID"));
                    aList.add(a);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return aList;
    }
    public static boolean insertAppointment(int listingID,int TenantID,Timestamp appointmentdate,String contactPhone,String roomSelected,int landlordID){
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(INSERTAPPOINTMENT);
                ptm.setInt(1, listingID);
                ptm.setInt(2, TenantID);
                ptm.setTimestamp(3, appointmentdate);
                ptm.setString(4,"Pending");
                ptm.setString(5, contactPhone);
                ptm.setString(6, roomSelected);
                ptm.setInt(7, landlordID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0 ;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
        ArrayList<Appointments> aList = getAllApointmentByUserID(28);
        for(Appointments a : aList){
            System.out.println(a.toString());
        }
    }
}
