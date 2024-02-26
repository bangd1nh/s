/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.Ratings;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class RatingDAL {
    private static final String GETALLRATINGBYID="SELECT * from Ratings where ListingID=?";
    private static final String INSERTRATINGBYID="INSERT INTO Ratings (UserID,ListingID,Rating,RatedAt) Value(?,?,?,?,?)";
    public static ArrayList<Ratings> getAllRating(int listingID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Ratings> list = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETALLRATINGBYID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Ratings l = new Ratings();
                    l.setRatingID(rs.getInt("RatingID"));
                    l.setUserID(rs.getInt("RatingID"));
                    l.setListingID(rs.getInt("ListingID"));
                    l.setRating(rs.getInt("Rating"));
                    l.setRatedAt(rs.getTimestamp("RatedAt"));
                    list.add(l);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static boolean insertRating(int userID, int listingID,int Rating,Timestamp ratedAt) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETALLRATINGBYID);
                ptm.setInt(1, userID);
                ptm.setInt(2, listingID);
                ptm.setInt(3, Rating);
                ptm.setTimestamp(5, ratedAt);
                int rowAffected = ptm.executeUpdate();
                return rowAffected >0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
