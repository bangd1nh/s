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
public class Constract {
     private int constractId;
    private int propertyId;
    private int tenantId;
    private Timestamp startDate;
    private Timestamp sendDate;
    private String status;
    private int landLordId;
    
    
    public Constract(int constractId, int propertyId, int tenantId, Timestamp startDate, Timestamp sendDate, String status, int landLordId) {
        this.constractId = constractId;
        this.propertyId = propertyId;
        this.tenantId = tenantId;
        this.startDate = startDate;
        this.sendDate = sendDate;
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

    public Timestamp getSendDate() {
        return sendDate;
    }

    public void setSendDate(Timestamp sendDate) {
        this.sendDate = sendDate;
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
}
