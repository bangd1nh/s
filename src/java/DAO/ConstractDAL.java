/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.ConstractInfor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class ConstractDAL {

    private static final String GETINFORLANDLORD = "select Listings.Location, Users.Firstname,Users.ContactPhone, Users.Lastname,ApartmentInfo.Price,ApartmentInfo.area,ApartmentInfo.bedrooms  \n"
            + "from Listings INNER JOIN Users ON Users.UserID = Listings.LandlordID\n"
            + "INNER JOIN Apartmentinfo on Apartmentinfo.Listingid = Listings.Listingid\n"
            + "WHERE Listings.ListingID =?;";

    public static ArrayList<ConstractInfor> getInforLandLord(int listingid) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ArrayList<ConstractInfor> constractList = new ArrayList<>();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETINFORLANDLORD);
                ptm.setInt(1, listingid);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ConstractInfor app = new ConstractInfor();
                    app.setLocation(rs.getString("Location"));
                    app.setFirstName(rs.getString("Firstname"));
                    app.setLastName(rs.getString("Lastname"));
                    app.setPrice(rs.getString("Price"));
                    app.setContactPhone(rs.getString("ContactPhone"));
                    app.setArea(rs.getInt("area"));
                    app.setBedrooms(rs.getInt("bedrooms"));

                    constractList.add(app);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return constractList;
    }

    public static void main(String[] args) {
        ArrayList<ConstractInfor> resultList = getInforLandLord(5);
        if (resultList.isEmpty()) {
            System.out.println("success");
        } else {
            System.out.println("failed" + resultList.toString());
        }

    }
}
