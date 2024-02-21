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
public class Listings {

    private int listingID;
    private int landlordID;
    private String contactEmail;
    private String contactPhone;
    private Timestamp createAt;
    private String title;
    private String imgsrc;
    private String location;
    private String description;
    private String username;

    public Listings() {
    }

    public Listings(int listingID, int landlordID, String contactEmail, String contactPhone, Timestamp createAt, String title, String imgsrc, String location, String description, String username) {
        this.listingID = listingID;
        this.landlordID = landlordID;
        this.contactEmail = contactEmail;
        this.contactPhone = contactPhone;
        this.createAt = createAt;
        this.title = title;
        this.imgsrc = imgsrc;
        this.location = location;
        this.description = description;
        this.username = username;
    }

    @Override
    public String toString() {
        return "Listings{" + "listingID=" + listingID + ", landlordID=" + landlordID + ", contactEmail=" + contactEmail + ", contactPhone=" + contactPhone + ", createAt=" + createAt + ", title=" + title + ", imgsrc=" + imgsrc + ", location=" + location + ", description=" + description + '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgsrc() {
        return imgsrc;
    }

    public void setImgsrc(String imgsrc) {
        this.imgsrc = imgsrc;
    }

    public int getListingID() {
        return listingID;
    }

    public void setListingID(int listingID) {
        this.listingID = listingID;
    }

    public int getLandlordID() {
        return landlordID;
    }

    public void setLandlordID(int landlordID) {
        this.landlordID = landlordID;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

}
