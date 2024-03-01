/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.Constract;
import Model.ConstractInfor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ConstractDAL {

    private static final String GETINFORLANDLORD = "select Listings.LandlordID,Listings.Listingid,Listings.Location, Users.Firstname,Users.ContactPhone, Users.Lastname,ApartmentInfo.Price,ApartmentInfo.area,ApartmentInfo.bedrooms,ApartmentInfo.bathrooms,ApartmentInfo.ApartmentID  \n"
            + "from Listings INNER JOIN Users ON Users.UserID = Listings.LandlordID\n"
            + "INNER JOIN Apartmentinfo on Apartmentinfo.Listingid = Listings.Listingid\n"
            + "WHERE Listings.ListingID =? AND ApartmentInfo.ApartmentID=?;";
    private static final String GETINFOR = "select Listings.LandlordID,ApartmentInfo.ApartmentID From Listings INNER JOIN Apartmentinfo on Apartmentinfo.Listingid = Listings.Listingid\n"
            + "WHERE Listings.ListingID =?;";
    private static final String GETCONTRACTINFO = "Select * from Contracts";
    private static final String INSERTDEPOSIT="insert into Contracts";

    public static ConstractInfor getInforLandLord(int listingid, int apartmentid) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ConstractInfor app = new ConstractInfor();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETINFORLANDLORD);
                ptm.setInt(1, listingid);
                ptm.setInt(2, apartmentid);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    app.setListingid(rs.getInt("Listingid"));
                    app.setLocation(rs.getString("Location"));
                    app.setFirstName(rs.getString("Firstname"));
                    app.setLastName(rs.getString("Lastname"));
                    app.setPrice(rs.getString("Price"));
                    app.setContactPhone(rs.getString("ContactPhone"));
                    app.setArea(rs.getInt("area"));
                    app.setBedrooms(rs.getInt("bedrooms"));
                    app.setBathrooms(rs.getInt("bathrooms"));
                    app.setAparmentId(rs.getInt("ApartmentID"));
                    app.setLandlordId(rs.getInt("LandlordID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return app;
    }

    public static Constract getInfor(int listingID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Constract constractList1 = new Constract();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETINFOR);
                ptm.setInt(1, listingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    constractList1.setLandLordId(rs.getInt("LandlordId"));
                    constractList1.setPropertyId(rs.getInt("ApartmentId"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return constractList1;
    }
    public static ArrayList<Constract> getContract() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Constract> conList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETCONTRACTINFO);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Constract app = new Constract();
                    app.setConstractId(rs.getInt("ContractID"));
                    app.setPropertyId(rs.getInt("PropertyID"));
                    app.setTenantId(rs.getInt("TennatID"));
                    app.setStartDate(rs.getTimestamp("StartDate"));
                    app.setEndDate(rs.getTimestamp("EndDate"));
                    app.setStatus(rs.getString("Status"));
                    app.setLandLordId(rs.getInt("LandlordID"));
                    conList.add(app);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conList;
    }
//    chua hoan thanh
    public static boolean insertContract(int propetyID,int tennantID,Timestamp startDate, Timestamp endDate,int landlordID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Constract> conList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETINFORLANDLORD);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Constract app = new Constract();
                    app.setConstractId(rs.getInt("ContractID"));
                    app.setPropertyId(rs.getInt("PropertyID"));
                    app.setTenantId(rs.getInt("TennatID"));
                    app.setStartDate(rs.getTimestamp("StartDate"));
                    app.setEndDate(rs.getTimestamp("EndDate"));
                    app.setStatus(rs.getString("Status"));
                    app.setLandLordId(rs.getInt("LandlordID"));
                    conList.add(app);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
