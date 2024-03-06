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
    private static final String GETCOMMENTBYLISTINGID="SELECT Comments.*,Users.Username,Users.imgsrc from Comments join Users on Users.UserID = Comments.UserID where ListingID = ? order by CommentedAt desc offset ? rows fetch next 3 rows only;";
    private static final String INSERTCOMMENT="INSERT INTO Comments (UserID,ListingID,Comment,CommentedAt) Values(?,?,?,?)";
     private static final String GETTOTALCOMMENTS="SELECT count(*) from Comments where ListingID=?";
    public static ArrayList<Comment> getCommentbyID(int listingsID,int index) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Comment> commentList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETCOMMENTBYLISTINGID);
                ptm.setInt(1, listingsID);
                ptm.setInt(2, index);
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
    public static int getTotalListings(int listingID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETTOTALCOMMENTS);
                ptm.setInt(1, listingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public static void main(String[] args) {
        long createdAt = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(createdAt);
        if(createComment(1,8,"aa",timestamp)){
            System.out.println("succes");
        }else{
            System.out.println("false");
        }
    }
}
