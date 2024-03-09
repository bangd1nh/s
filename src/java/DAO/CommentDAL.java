/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.ApartmentInfo;
import Model.Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class CommentDAL {
    private static final String GETCOMMENTBYLISTINGID="SELECT Comments.*,Users.Username,Users.imgsrc from Comments join Users on Users.UserID = Comments.UserID Where ListingID=? ORDER By CommentedAt DESC offset ? rows fetch next 3 rows only;";
    private static final String INSERTCOMMENT="INSERT INTO Comments (UserID,ListingID,Comment,CommentedAt) Values(?,?,?,?)";
    private static final String TOTALCOMMENT = "SELECT COUNT(*) AS total_comments FROM Comments Where ListingID=?";
    private static final String EDITCOMMENT = "UPDATE Comments set Comment = ? where CommentID =?";
    private static final String DELETECOMMENT = "DELETE Comments where CommentID = ?";
    
    public static ArrayList<Comment> getCommentbyID(int listingsID,int index) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Comment> commentList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETCOMMENTBYLISTINGID);
                ptm.setInt(1, listingsID);
                ptm.setInt(2, (index-1)*3);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Comment c = new Comment();
                    c.setCommentID(rs.getInt("CommentID"));
                    c.setListingID(rs.getInt("ListingID"));
                    c.setUserID(rs.getInt("UserID"));
                    c.setComment(rs.getString("Comment"));
                    c.setCommentedAt(rs.getTimestamp("CommentedAt"));
                    c.setUserName(rs.getString("Username"));
                    c.setUserImgsrc(rs.getString("imgsrc"));
                    commentList.add(c);
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        }
        return commentList;
    }
    public static boolean createComment(int listingID,int userID,String comment,Timestamp createAt){
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()){
            if (con != null) {
                ptm = con.prepareStatement(INSERTCOMMENT);
                ptm.setInt(1, userID);
                ptm.setInt(2, listingID);
                ptm.setString(3, comment);
                ptm.setTimestamp(4, createAt);
                int rowAffected = ptm.executeUpdate();
                return rowAffected > 0;
            }
        } catch (Exception e) {
        }
        return false;
    }
    public static int getTotalComment(int listingID){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int totalListings = 0;
        try ( Connection con = DBconnection.getConnection()) {
         if (con != null) {
                ptm = con.prepareStatement(TOTALCOMMENT);
                ptm.setInt(1, listingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    totalListings = rs.getInt("total_comments");
                }
            }
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        return totalListings;
    }
    public static boolean updateComment(int commentID, String comment) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(EDITCOMMENT);
                ptm.setInt(2, commentID);
                ptm.setString(1, comment);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean deleteComment(int commentID) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(DELETECOMMENT);
                ptm.setInt(1, commentID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
        if(updateComment(30, "bang12333")){
            System.out.println("true");
        }else System.out.println("false");
    }
}
