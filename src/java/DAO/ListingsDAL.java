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

    private static final String GETALLLISTINGS = "SELECT ListingID,Title,CreatedAt,imgsrc,Location From.[Listings]";
    private static final String GETLISTINGSBYID = "SELECT * From.[Listings] Where ListingID=?";

    public static ArrayList<Listings> getAllListings() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Listings> list = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETALLLISTINGS);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Listings l = new Listings();
                    l.setListingID(rs.getInt("ListingID"));
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

    public static Listings getListingsByID(int listingID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Listings l = new Listings();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETLISTINGSBYID);
                ptm.setInt(1, listingID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    l.setListingID(rs.getInt("ListingID"));
                    l.setLandlordID(rs.getInt("LandlordID"));
                    l.setContactEmail(rs.getString("ContactEmail"));
                    l.setContactPhone(rs.getString("ContactPhone"));
                    l.setCreateAt(rs.getTimestamp("CreatedAt"));
                    l.setTitle(rs.getString("Title"));
                    l.setImgsrc(rs.getString("imgsrc"));
                    l.setLocation(rs.getString("Location"));
                    l.setDescription(rs.getString("Descriptions"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static void main(String[] args) {
        Listings listtest = getListingsByID(1);
        System.out.println(listtest.toString());
    }
}
