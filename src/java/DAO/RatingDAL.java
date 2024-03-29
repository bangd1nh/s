/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
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
    private static final String CHECKUSER="SELECT UserID from Ratings where UserID=? AND ListingID=?";
    private static final String GETRATINGBYUSERID="SELECT Rating from Ratings where UserID=? AND ListingID=?";
    private static final String UPDATERATING="UPDATE Ratings set Rating = ? where ListingID = ? AND UserID = ?";
    private static final String DELETERATING="DELETE Ratings where ListingID = ? AND UserID = ?";
    
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
    public static boolean checkUser(int userID,int listingID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(CHECKUSER);
                ptm.setInt(1, userID);
                ptm.setInt(2, listingID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static int getUserRating(int userID, int listingID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int rating = 0;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETRATINGBYUSERID);
                ptm.setInt(1, userID);
                ptm.setInt(2, listingID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    rating = rs.getInt("Rating");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rating;
    }
    public static boolean updateRating(int listingID, int userID,int rating){
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATERATING);
                ptm.setInt(1,rating);
                ptm.setInt(3, userID);
                ptm.setInt(2, listingID);
                int rowAffected = ptm.executeUpdate();
                return rowAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean deleteComment(int listingID, int userID) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(DELETERATING);
                ptm.setInt(1, listingID);
                ptm.setInt(2, userID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
