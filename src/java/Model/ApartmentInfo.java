/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class ApartmentInfo {

    private int apartmentID;
    private String title;
    private String description;
    private String location;
    private double price;
    private float area;
    private int bedRooms;
    private int bathRooms;
    private int landLordID;
    private int listtingID;
    private String imgsrc;
    private String status;

    public ApartmentInfo(int apartmentID, String title, String description, String location, double price, float area, int bedRooms, int bathRooms, int landLordID, int listtingID, String imgsrc, String status) {
        this.apartmentID = apartmentID;
        this.title = title;
        this.description = description;
        this.location = location;
        this.price = price;
        this.area = area;
        this.bedRooms = bedRooms;
        this.bathRooms = bathRooms;
        this.landLordID = landLordID;
        this.listtingID = listtingID;
        this.imgsrc = imgsrc;
        this.status = status;
    }

    public String getImgsrc() {
        return imgsrc;
    }

    public void setImgsrc(String imgsrc) {
        this.imgsrc = imgsrc;
    }

    public ApartmentInfo() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getApartmentID() {
        return apartmentID;
    }

    public void setApartmentID(int apartmentID) {
        this.apartmentID = apartmentID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public int getBedRooms() {
        return bedRooms;
    }

    public void setBedRooms(int bedRooms) {
        this.bedRooms = bedRooms;
    }

    public int getBathRooms() {
        return bathRooms;
    }

    public void setBathRooms(int bathRooms) {
        this.bathRooms = bathRooms;
    }

    public int getLandLordID() {
        return landLordID;
    }

    public void setLandLordID(int landLordID) {
        this.landLordID = landLordID;
    }

    public int getListtingID() {
        return listtingID;
    }

    public void setListtingID(int listtingID) {
        this.listtingID = listtingID;
    }

    @Override
    public String toString() {
        return "ApartmentInfo{" + "apartmentID=" + apartmentID + ", title=" + title + ", description=" + description + ", location=" + location + ", price=" + price + ", area=" + area + ", bedRooms=" + bedRooms + ", bathRooms=" + bathRooms + ", landLordID=" + landLordID + ", listtingID=" + listtingID + ", imgsrc=" + imgsrc + '}';
    }

}
