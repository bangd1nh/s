/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.ApartmentInfo;
import Model.Listings;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class ApartmentInfoDAL {
    private static final String GETAPARTMENTINFOBYID="SELECT * From[ApartmentInfo] Where ListingID=?;";
    private static final String UPDATESTATUS="UPDATE Apartmentinfo SET Status = ? where ListingID=? and ApartmentID=?;";
    private static final String UPLOADAPARTMENTINFO = "INSERT INTO Apartmentinfo (Title,Description,Location,Price,Area,Bedrooms,Bathrooms,LandlordID,ListingID,imgsrc,Status) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String GETALLFREEROOMS="";
    public static ArrayList<ApartmentInfo> getApartmentInfobyID(int listingsID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<ApartmentInfo> appList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETAPARTMENTINFOBYID);
                ptm.setInt(1, listingsID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ApartmentInfo app = new ApartmentInfo();
                    app.setApartmentID(rs.getInt("ApartmentID"));
                    app.setTitle(rs.getString("Title"));
                    app.setDescription(rs.getString("Description"));
                    app.setLocation(rs.getString("Location"));
                    app.setPrice(rs.getDouble("Price"));
                    app.setArea(rs.getFloat("Area"));
                    app.setBedRooms(rs.getInt("Bedrooms"));
                    app.setBathRooms(rs.getInt("Bathrooms"));
                    app.setLandLordID(rs.getInt("LandlordID"));
                    app.setListtingID(rs.getInt("ListingID"));
                    app.setImgsrc(rs.getString("imgsrc"));
                    app.setStatus(rs.getString("Status"));
                    appList.add(app);
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        }
        return appList;
    }
    public static boolean saveToDatabase(String imagePath, String title, String location, int bedrooms,int bathrooms, int landlordID, String description,double price,float area,int listingID){
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPLOADAPARTMENTINFO);
                ptm.setString(1, title);
                ptm.setString(2, description);
                ptm.setString(3, location);
                ptm.setDouble(4, price);
                ptm.setFloat(5, area);
                ptm.setInt(6, bedrooms);
                ptm.setInt(7, bathrooms);
                ptm.setInt(8, landlordID);
                ptm.setInt(9, listingID);
                ptm.setString(10, imagePath);
                ptm.setString(11, "Rentable");
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0 ;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean updatestatus(int listingID,int Apartment){
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATESTATUS);
                ptm.setString(1, "Deposited");
                ptm.setInt(2, listingID);
                ptm.setInt(3, Apartment);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0 ;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) {
        if(saveToDatabase(".\\428616039_2455009161507086_7646541435436616999_n", "nha tro fpt", "123 Nguyen Minh chau", 1, 1, 28, "Phong 201", 3200, 32, 18)){
            System.out.println("sucess");
        }else System.out.println("false");
    }
}
