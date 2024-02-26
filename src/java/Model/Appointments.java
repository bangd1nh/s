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
public class Appointments {
    private int appointmentID;
    private int listingID;
    private int tenantID;
    private Timestamp appointmentDate;
    private String status;
    private String contactPhone;
    private String roomSelected;
    private int landlordID;

    public int getLandlordID() {
        return landlordID;
    }

    public void setLandlordID(int landlordID) {
        this.landlordID = landlordID;
    }
    
    public Appointments() {
    }

    public Appointments(int appointmentID, int listingID, int tenantID, Timestamp appointmentDate, String status, String contactPhone, String roomSelected, int landlordID) {
        this.appointmentID = appointmentID;
        this.listingID = listingID;
        this.tenantID = tenantID;
        this.appointmentDate = appointmentDate;
        this.status = status;
        this.contactPhone = contactPhone;
        this.roomSelected = roomSelected;
        this.landlordID = landlordID;
    }

 

    
    public String getRoomSelected() {
        return roomSelected;
    }

    public void setRoomSelected(String roomSelected) {
        this.roomSelected = roomSelected;
    }


    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public int getAppointmentID() {
        return appointmentID;
    }

    public void setAppointmentID(int appointmentID) {
        this.appointmentID = appointmentID;
    }

    public int getListingID() {
        return listingID;
    }

    public void setListingID(int listingID) {
        this.listingID = listingID;
    }

    public int getTenantID() {
        return tenantID;
    }

    public void setTenantID(int tenantID) {
        this.tenantID = tenantID;
    }

    public Timestamp getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Timestamp appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Appointments{" + "appointmentID=" + appointmentID + ", listingID=" + listingID + ", tenantID=" + tenantID + ", appointmentDate=" + appointmentDate + ", status=" + status + ", contactPhone=" + contactPhone + ", roomSelected=" + roomSelected + '}';
    }
    
}
