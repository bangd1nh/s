/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class ConstractInfor {
    private String Location;
    private String Price;
    private String FirstName;
    private String LastName;
    private String ContactPhone;
    private int area;
    private int bedrooms;

    public ConstractInfor() {
    }

    public ConstractInfor(String Location, String Price, String FirstName, String LastName, int area, int bedrooms,String ContactPhone) {
        this.Location = Location;
        this.Price = Price;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.area = area;
        this.bedrooms = bedrooms;
        this.ContactPhone = ContactPhone;
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

    public String getContactPhone() {
        return ContactPhone;
    }

    public void setContactPhone(String ContactPhone) {
        this.ContactPhone = ContactPhone;
    }

    @Override
    public String toString() {
        return "ConstractInfor{" + "Location=" + Location + ", Price=" + Price + ", FirstName=" + FirstName + ", LastName=" + LastName + ", area=" + area + ", bedrooms=" + bedrooms + '}';
    }
}
