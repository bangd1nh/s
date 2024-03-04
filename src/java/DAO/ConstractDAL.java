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
    private static final String INSERTDEPOSIT="INSERT INTO Contracts (PropertyID,TenantID,StartDate,EndDate,Status,LandlordID) VALUES (?,?,?,?,?,?) ";
    private static final String GETCONTRACTINFOBYLANDLORDID="Select ApartmentInfo.Price,Contracts.* from Contracts join ApartmentInfo on Contracts.PropertyID = ApartmentInfo.ApartmentID where Contracts.LandlordID=?";
    private static final String GETCONTRACTINFOBYTENANTID="Select ApartmentInfo.Price,Contracts.* from Contracts join ApartmentInfo on Contracts.PropertyID = ApartmentInfo.ApartmentID where Contracts.TenantID=?";
    private static final String UPDATECONTRACTSTATUS="Update Contracts SET Status=? where ContractID=?";
    private static final String UPDATECONTRACTSTATUSBYPROPERTYID="Update Contracts SET Status=? where PropertyID=?";

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
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(INSERTDEPOSIT);
                ptm.setInt(1, propetyID);
                ptm.setInt(2, tennantID);
                ptm.setTimestamp(3, startDate);
                ptm.setTimestamp(4, endDate);
                ptm.setString(5, "Pendding");
                ptm.setInt(6, landlordID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static ArrayList<Constract> getContractByLandLordID(int landlordID){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Constract> conList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETCONTRACTINFOBYLANDLORDID);
                ptm.setInt(1, landlordID);
                rs= ptm.executeQuery();
                while (rs.next()){
                    Constract c = new Constract();
                    c.setConstractId(rs.getInt("ContractID"));
                    c.setPropertyId(rs.getInt("PropertyID"));
                    c.setTenantId(rs.getInt("TenantID"));
                    c.setStartDate(rs.getTimestamp("StartDate"));
                    c.setEndDate(rs.getTimestamp("EndDate"));
                    c.setStatus(rs.getString("Status"));
                    c.setLandLordId(rs.getInt("LandlordID"));
                    c.setPrice(rs.getDouble("Price"));
                    conList.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conList;
    }
    public static ArrayList<Constract> getContractByTenantID(int tenantID){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Constract> conList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETCONTRACTINFOBYTENANTID);
                ptm.setInt(1, tenantID);
                rs= ptm.executeQuery();
                while (rs.next()){
                    Constract c = new Constract();
                    c.setConstractId(rs.getInt("ContractID"));
                    c.setPropertyId(rs.getInt("PropertyID"));
                    c.setTenantId(rs.getInt("TenantID"));
                    c.setStartDate(rs.getTimestamp("StartDate"));
                    c.setEndDate(rs.getTimestamp("EndDate"));
                    c.setStatus(rs.getString("Status"));
                    c.setLandLordId(rs.getInt("LandlordID"));
                    c.setPrice(rs.getDouble("Price"));
                    conList.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conList;
    }
    public static boolean updateStatusContract(String status,int constractID){
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATECONTRACTSTATUS);
                ptm.setString(1, status);
                ptm.setInt(2, constractID);
                int rowAffected = ptm.executeUpdate();
                return rowAffected >0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean updateStatusContractByPID(String status,int propertyID){
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATECONTRACTSTATUSBYPROPERTYID);
                ptm.setString(1, status);
                ptm.setInt(2, propertyID);
                int rowAffected = ptm.executeUpdate();
                return rowAffected >0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
