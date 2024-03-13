/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.Listings;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class ListingsDAL {

    private static final String GETSAVELISTINGSBYID = "SELECT Listings.*, Users.UserName FROM Listings JOIN Users ON Listings.LandlordID = Users.UserID where Listings.ListingID=?";
    private static final String GETALLLISTINGS = "SELECT * FROM Listings JOIN Users ON Listings.LandlordID = Users.UserID where Status = 'Approved' ORDER By CreatedAt DESC offset ? rows fetch next 9 rows only;";
    private static final String GETLISTINGSBYID = "SELECT Listings.*, Users.UserName FROM Listings JOIN Users ON Listings.LandlordID = Users.UserID where ListingID=?";
    private static final String UPLOADLISTING = "INSERT INTO Listings (LandlordID,ContactEmail,ContactPhone,CreatedAt,Title,imgsrc,Location,Descriptions,Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
    private static final String GETALLLISTINGSBYUSERID = "SELECT Listings.*, Users.UserName FROM Listings JOIN Users ON Listings.LandlordID = Users.UserID where UserID=?";
    private static final String UPDATELISTING = "UPDATE Listings SET Title = ?,Location = ?,ContactPhone = ?,ContactEmail = ?,Descriptions = ? WHERE ListingID = ?";
    private static final String TOTALLISTING = "SELECT COUNT(*) AS total_listings FROM listings";
    private static final String TOTALUSER = "SELECT COUNT(*) AS total_users FROM Users";
    private static final String TOTALLOARD= "SELECT COUNT(*) AS total_loard FROM Users WHERE UserType = 'Landlord'";
    private static final String TOTALTENNANT= "SELECT COUNT(*) AS total_tenant FROM Users WHERE UserType = 'Tenant'";
    private static final String UPDATESTATUS="Update Listings set Status = ? WHERE ListingID = ?";
    public static int getTotalListings(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int totalListings = 0;
        try ( Connection con = DBconnection.getConnection()) {
         if (con != null) {
                ptm = con.prepareStatement(TOTALLISTING);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    totalListings = rs.getInt("total_listings");
                }
            }
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        return totalListings;
    }
    public static int getTotalUsers(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int totalUsers = 0;
        try ( Connection con = DBconnection.getConnection()) {
         if (con != null) {
                ptm = con.prepareStatement(TOTALUSER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    totalUsers = rs.getInt("total_users");
                }
            }
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        return totalUsers;
    }
    public static int getTotalLoard(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int totalLoard = 0;
        try ( Connection con = DBconnection.getConnection()) {
         if (con != null) {
                ptm = con.prepareStatement(TOTALLOARD);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    totalLoard = rs.getInt("total_loard");
                }
            }
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        return totalLoard;
    }
    public static int getTotalTenant(){
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int totalTenant = 0;
        try ( Connection con = DBconnection.getConnection()) {
         if (con != null) {
                ptm = con.prepareStatement(TOTALTENNANT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    totalTenant = rs.getInt("total_tenant");
                }
            }
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        return totalTenant;
    }
    public static ArrayList<Listings> getAllListings(int index) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Listings> list = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETALLLISTINGS);
                ptm.setInt(1, (index-1)*9);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Listings l = new Listings();
                    l.setListingID(rs.getInt("ListingID"));
                    l.setCreateAt(rs.getTimestamp("CreatedAt"));
                    l.setTitle(rs.getString("Title"));
                    l.setImgsrc(rs.getString("imgsrc"));
                    l.setLocation(rs.getString("Location"));
                    l.setLandlordID(rs.getInt("LandlordID"));
                    l.setUsername(rs.getString("UserName"));
                    list.add(l);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static ArrayList<Listings> getAllListings() {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Listings> list = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement("SELECT *FROM Listings JOIN Users ON Listings.LandlordID = Users.UserID ORDER By CreatedAt DESC;");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Listings l = new Listings();
                    l.setListingID(rs.getInt("ListingID"));
                    l.setCreateAt(rs.getTimestamp("CreatedAt"));
                    l.setTitle(rs.getString("Title"));
                    l.setImgsrc(rs.getString("imgsrc"));
                    l.setLocation(rs.getString("Location"));
                    l.setLandlordID(rs.getInt("LandlordID"));
                    l.setUsername(rs.getString("UserName"));
                    l.setStatus(rs.getString("Status"));
                    list.add(l);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Listings getListingsByID(int listingID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Listings l = new Listings();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETLISTINGSBYID);
                ptm.setInt(1, listingID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    l.setListingID(rs.getInt("ListingID"));
                    l.setLandlordID(rs.getInt("LandlordID"));
                    l.setContactEmail(rs.getString("ContactEmail"));
                    l.setContactPhone(rs.getString("ContactPhone"));
                    l.setCreateAt(rs.getTimestamp("CreatedAt"));
                    l.setTitle(rs.getString("Title"));
                    l.setImgsrc(rs.getString("imgsrc"));
                    l.setLocation(rs.getString("Location"));
                    l.setDescription(rs.getString("Descriptions"));
                    l.setUsername(rs.getString("UserName"));
                    l.setStatus(rs.getString("Status"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }

    public static boolean saveToDatabase(String imagePath, String title, String location, String contactPhone, String contactEmail, int landlordID, String description, Timestamp createdAt) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                System.out.println("CreatedAt value: " + createdAt);
                ptm = con.prepareStatement(UPLOADLISTING);
                ptm.setInt(1, landlordID);
                ptm.setString(2, contactEmail);
                ptm.setString(3, contactPhone);
                ptm.setTimestamp(4, createdAt);
                ptm.setString(5, title);
                ptm.setString(6, imagePath);
                ptm.setString(7, location);
                ptm.setString(8, description);
                ptm.setString(9, "Pending");
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static ArrayList<Listings> getAllListingsByUserID(int userID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<Listings> list = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETALLLISTINGSBYUSERID);
                ptm.setInt(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    Listings l = new Listings();
                    l.setListingID(rs.getInt("ListingID"));
                    l.setCreateAt(rs.getTimestamp("CreatedAt"));
                    l.setTitle(rs.getString("Title"));
                    l.setImgsrc(rs.getString("imgsrc"));
                    l.setLocation(rs.getString("Location"));
                    l.setLandlordID(rs.getInt("LandlordID"));
                    l.setUsername(rs.getString("UserName"));
                    list.add(l);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean UpdateListing(String title, String location, String contactPhone, String contactEmail, String description, int listingsID) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATELISTING);
                ptm.setString(1, title);
                ptm.setString(2, location);
                ptm.setString(3, contactPhone);
                ptm.setString(4, contactEmail);
                ptm.setString(5, description);
                ptm.setInt(6, listingsID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean UpdateStatus(int listingID, String status) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATESTATUS);
                ptm.setString(1, status);
                ptm.setInt(2, listingID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        ArrayList<Listings> list = getAllListingsByUserID(8);
        for (Listings l : list) {
            System.out.println(l.toString());
        }
    }

    public static Listings getSavedListingsByID(int listingID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        Listings l = new Listings();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETSAVELISTINGSBYID);
                ptm.setInt(1, listingID);
                rs = ptm.executeQuery();
                if (rs.next()) {

                    l.setListingID(rs.getInt("ListingID"));
                    l.setCreateAt(rs.getTimestamp("CreatedAt"));
                    l.setTitle(rs.getString("Title"));
                    l.setImgsrc(rs.getString("imgsrc"));
                    l.setLocation(rs.getString("Location"));
                    l.setLandlordID(rs.getInt("LandlordID"));
                    l.setUsername(rs.getString("UserName"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return l;
    }
}
