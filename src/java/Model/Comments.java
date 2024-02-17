/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class Comments {
    private int commentID;
    private int userID;
    private int listingID;
    private String comment;
    private Timestamp commentAt;

    public Comments() {
    }

    public Comments(int commentID, int userID, int listingID, String comment, Timestamp commentAt) {
        this.commentID = commentID;
        this.userID = userID;
        this.listingID = listingID;
        this.comment = comment;
        this.commentAt = commentAt;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getListingID() {
        return listingID;
    }

    public void setListingID(int listingID) {
        this.listingID = listingID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCommentAt() {
        return commentAt;
    }

    public void setCommentAt(Timestamp commentAt) {
        this.commentAt = commentAt;
    }
    
}
