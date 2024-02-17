/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
public class UserDAL {

    private static final String LOGIN = "SELECT * FROM.[Users] where Email=? and Password=?";
    private static final String GETUSERNAMEBYID="SELECT Username FROM.[Users] Where UserID=?";

    public static User userLogin(String email, String password) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        User user = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(LOGIN);
                ptm.setString(1, email);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    user = new User();
                    user.setUserID(rs.getInt("UserID"));
                    user.setUserName(rs.getString("Username"));
                    user.setEmail(rs.getString("Email"));
                    user.setUserType(rs.getString("UserType"));
                    user.setBalance(rs.getDouble("Balance"));
                    user.setFristName(rs.getString("FirstName"));
                    user.setLastName(rs.getString("LastName"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static String getUserByID(int userID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String userName = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETUSERNAMEBYID);
                ptm.setInt(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    userName = rs.getString("Username");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userName;
    }
    public static void main(String[] args) {
        User user = userLogin("dinhbang121@gmail.com", "123");
        if (user == null) {
            System.out.println("null");
        } else {
            System.out.println("not null");
        }
    }
}
