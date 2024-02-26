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
public class Ratings {
    private int ratingID;
    private int userID;
    private int listingID;
    private int rating;
    private Timestamp ratedAt;

    public Ratings() {
    }

    public Ratings(int ratingID, int userID, int listingID, int rating, Timestamp ratedAt) {
        this.ratingID = ratingID;
        this.userID = userID;
        this.listingID = listingID;
        this.rating = rating;
        this.ratedAt = ratedAt;
    }

    public int getRatingID() {
        return ratingID;
    }

    public void setRatingID(int ratingID) {
        this.ratingID = ratingID;
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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Timestamp getRatedAt() {
        return ratedAt;
    }

    public void setRatedAt(Timestamp ratedAt) {
        this.ratedAt = ratedAt;
    }
    
}
