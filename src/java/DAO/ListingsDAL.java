/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.Listings;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;

/**
 *
 * @author admin
 */
public class ListingsDAL {
    private static final String GETLISTINGS="SELECT * From.[Listings]";
    public static ArrayList<Listings> getAllListings() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Listings> list = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETLISTINGS);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Listings l = new Listings();
                    l.setListingID(rs.getInt("ListingID"));
                    l.setLandlordID(rs.getInt("LandlordID"));
                    l.setContactEmail(rs.getString("ContactEmail"));
                    l.setContactPhone(rs.getString("ContactPhone"));
                    l.setCreateAt(rs.getTimestamp("CreatedAt"));
                    l.setTitle(rs.getString("Title"));
                    l.setImgsrc(rs.getString("imgsrc"));
                    l.setLocation(rs.getString("Location"));
                    list.add(l);
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args) {
        ArrayList<Listings> listtest = getAllListings();
        for(Listings o : listtest){
            System.out.println(o.toString());
        }
    }
}
