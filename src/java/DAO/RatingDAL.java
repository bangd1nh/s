/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.Listings;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class RatingDAL {
    private static final String INSERTRATING="INSERT INTO Ratings (UserID,ListingID,Rating) Values(?,?,?)";
    private static final String GETRATINGBYLISTINGID="SELECT Rating from Ratings where ListingID=?";
    public static boolean insertRating(int userID,int listingID,int rating) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(INSERTRATING);
                ptm.setInt(1, userID);
                ptm.setInt(2, listingID);
                ptm.setInt(3, rating);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static ArrayList<Integer> getAllRating(int listingID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Integer> ratingList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETRATINGBYLISTINGID);
                ptm.setInt(1, listingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ratingList.add(rs.getInt("Rating"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ratingList;
    }
}
