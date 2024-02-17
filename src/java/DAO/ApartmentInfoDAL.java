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
                    appList.add(app);
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        }
        return appList;
    }
    public static void main(String[] args) {
        ArrayList<ApartmentInfo> list = getApartmentInfobyID(1);
        for(ApartmentInfo o : list){
            System.out.println(o.toString());
        }
    }
}
