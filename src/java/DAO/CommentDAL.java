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
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class CommentDAL {
    private static final String GETCOMMENTBYLISTINGID="SELECT * From[Comments] Where ListingID=?;";
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
                    commentList.add(c);
                }
            }
        } catch (Exception e) {
             e.printStackTrace();
        }
        return commentList;
    }
    public static void main(String[] args) {
        ArrayList<Comment> commentList = getCommentbyID(6);
        for(Comment c : commentList){
            System.out.println(c.toString());
        }
    }
}
