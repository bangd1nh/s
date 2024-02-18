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
public class Comment {
    private int commentID;
    private int UserID;
    private int ListingID;
    private String comment;
    private Timestamp commentedAt;

    public Comment() {
    }

    public Comment(int commentID, int UserID, int ListingID, String comment, Timestamp commentedAt) {
        this.commentID = commentID;
        this.UserID = UserID;
        this.ListingID = ListingID;
        this.comment = comment;
        this.commentedAt = commentedAt;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getListingID() {
        return ListingID;
    }

    public void setListingID(int ListingID) {
        this.ListingID = ListingID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCommentedAt() {
        return commentedAt;
    }

    public void setCommentedAt(Timestamp commentedAt) {
        this.commentedAt = commentedAt;
    }

    @Override
    public String toString() {
        return "Comment{" + "commentID=" + commentID + ", UserID=" + UserID + ", ListingID=" + ListingID + ", comment=" + comment + ", commentedAt=" + commentedAt + '}';
    }
    
}
