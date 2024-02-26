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
    private static final String GETCOMMENTBYLISTINGID="SELECT Comments.*,Users.Username,Users.imgsrc from Comments join Users on Users.UserID = Comments.UserID Where ListingID=?;";
    private static final String INSERTCOMMENT="INSERT INTO Comments (UserID,ListingID,Comment,CommentedAt) Values(?,?,?,?)";
    public static ArrayList<Comment> getCommentbyID(int listingsID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Comment> commentList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETCOMMENTBYLISTINGID);
                ptm.setInt(1, listingsID);
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
                return rowAffected > 1;
            }
        } catch (Exception e) {
        }
        return false;
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
