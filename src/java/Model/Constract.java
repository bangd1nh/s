/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Constract {
    private int constractId;
    private int propertyId;
    private int tenantId;
    private Date startDate;
    private Date EndDate;
    private String status;
    private int landLordId;
    private double price;
    
  public Constract() {
    }

    public Constract(int constractId, int propertyId, int tenantId, Date startDate, Date EndDate, String status, int landLordId, double price) {
        this.constractId = constractId;
        this.propertyId = propertyId;
        this.tenantId = tenantId;
        this.startDate = startDate;
        this.EndDate = EndDate;
        this.status = status;
        this.landLordId = landLordId;
        this.price = price;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return EndDate;
    }

    public void setEndDate(Date EndDate) {
        this.EndDate = EndDate;
    }


    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getConstractId() {
        return constractId;
    }

    public void setConstractId(int constractId) {
        this.constractId = constractId;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    public int getTenantId() {
        return tenantId;
    }

    public void setTenantId(int tenantId) {
        this.tenantId = tenantId;
    }



    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getLandLordId() {
        return landLordId;
    }

    public void setLandLordId(int landLordId) {
        this.landLordId = landLordId;
    }

    @Override
    public String toString() {
        return "Constract{" + "constractId=" + constractId + ", propertyId=" + propertyId + ", tenantId=" + tenantId + ", startDate=" + startDate + ", EndDate=" + EndDate + ", status=" + status + ", landLordId=" + landLordId + '}';
    }
    
    
    
}
