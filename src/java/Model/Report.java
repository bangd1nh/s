/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Report {
    private int UserID;
    private int ListingID;
    private Date CreateAt;
    private String Description;
    private String Status;
    public Report(){

    }
    public Report(int UserID, int ListingID, Date CreateAt, String Description, String Status) {
        this.UserID = UserID;
        this.ListingID = ListingID;
        this.CreateAt = CreateAt;
        this.Description = Description;
        this.Status = Status;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getListingID() {
        return ListingID;
    }

    public void setListingID(int ListingID) {
        this.ListingID = ListingID;
    }

    public Date getCreateAt() {
        return CreateAt;
    }

    public void setCreateAt(Date CreateAt) {
        this.CreateAt = CreateAt;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Report{" + "UserID=" + UserID + ", ListingID=" + ListingID + ", CreateAt=" + CreateAt + ", Description=" + Description + ", Status=" + Status + '}';
    }
    
}
