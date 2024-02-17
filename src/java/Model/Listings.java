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

    public Listings() {
    }

    @Override
    public String toString() {
        return "Listings{" + "listingID=" + listingID + ", landlordID=" + landlordID + ", contactEmail=" + contactEmail + ", contactPhone=" + contactPhone + ", createAt=" + createAt + ", title=" + title + ", imgsrc=" + imgsrc + '}';
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


    public Listings(int listingID, int landlordID, String contactEmail, String contactPhone, Timestamp createAt, String title, String imgsrc) {
        this.listingID = listingID;
        this.landlordID = landlordID;
        this.contactEmail = contactEmail;
        this.contactPhone = contactPhone;
        this.createAt = createAt;
        this.title = title;
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
