/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class Constract {
    private int constractId;
    private int propertyId;
    private int tenantId;
    private Timestamp startDate;
    private Timestamp EndDate;
    private String status;
    private int landLordId;
  public Constract() {
    }
    public Constract(int constractId, int propertyId, int tenantId, Timestamp startDate, Timestamp EndDate, String status, int landLordId) {
        this.constractId = constractId;
        this.propertyId = propertyId;
        this.tenantId = tenantId;
        this.startDate = startDate;
        this.EndDate = EndDate;
        this.status = status;
        this.landLordId = landLordId;
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

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return EndDate;
    }

    public void setEndDate(Timestamp EndDate) {
        this.EndDate = EndDate;
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
