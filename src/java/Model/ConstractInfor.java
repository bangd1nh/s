/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class ConstractInfor {
    private int Listingid;
    private int LandlordId;
    private int AparmentId;
    private String Location;
    private String Price;
    private String FirstName;
    private String LastName;
    private String ContactPhone;
    private int area;
    private int bedrooms;
    private int bathrooms;
    private String descrpition;
    private Date startDate;
    private Date endDate;

    public ConstractInfor() {
    }

    public ConstractInfor(int Listingid, int LandlordId, int AparmentId, String Location, String Price, String FirstName, String LastName, String ContactPhone, int area, int bedrooms, int bathrooms, String descrpition) {
        this.Listingid = Listingid;
        this.LandlordId = LandlordId;
        this.AparmentId = AparmentId;
        this.Location = Location;
        this.Price = Price;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.ContactPhone = ContactPhone;
        this.area = area;
        this.bedrooms = bedrooms;
        this.bathrooms = bathrooms;
        this.descrpition = descrpition;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    

    public String getDescrpition() {
        return descrpition;
    }

    public void setDescrpition(String descrpition) {
        this.descrpition = descrpition;
    }

    public int getListingid() {
        return Listingid;
    }

    public void setListingid(int Listingid) {
        this.Listingid = Listingid;
    }

    public int getLandlordId() {
        return LandlordId;
    }

    public void setLandlordId(int LandlordId) {
        this.LandlordId = LandlordId;
    }

    public int getAparmentId() {
        return AparmentId;
    }

    public void setAparmentId(int AparmentId) {
        this.AparmentId = AparmentId;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getContactPhone() {
        return ContactPhone;
    }

    public void setContactPhone(String ContactPhone) {
        this.ContactPhone = ContactPhone;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getBedrooms() {
        return bedrooms;
    }

    public void setBedrooms(int bedrooms) {
        this.bedrooms = bedrooms;
    }

    public int getBathrooms() {
        return bathrooms;
    }

    public void setBathrooms(int bathrooms) {
        this.bathrooms = bathrooms;
    }

    @Override
    public String toString() {
        return "ConstractInfor{" + "Listingid=" + Listingid + ", LandlordId=" + LandlordId + ", AparmentId=" + AparmentId + ", Location=" + Location + ", Price=" + Price + ", FirstName=" + FirstName + ", LastName=" + LastName + ", ContactPhone=" + ContactPhone + ", area=" + area + ", bedrooms=" + bedrooms + ", bathrooms=" + bathrooms + '}';
    }

    
    
}
