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
    private static final String GETUSERNAMEBYID = "SELECT Username FROM.[Users] Where UserID=?";
    private static final String INSERTUSER = "INSERT INTO Users (Username, Email, FirstName, LastName, Password, UserType) VALUES (?,?,?,?,?,?);";
    private static final String GETUSERIDBYNAME = "SELECT UserID From.[Users] where Username=?";
    private static final String UPDATEUSERINFO = "UPDATE Users Set Email=?,FirstName=?,LastName=?,ContactPhone=?,imgsrc=? where UserID=?";
    private static final String GETUSER = "SELECT * FROM.[Users] where UserID =?";
    private static final String GETINFORBYID = "SELECT FirstName,LastName,Email,ContactPhone FROM.[Users] Where UserID=?";

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
                    user.setContactPhone(rs.getString("ContactPhone"));
                    user.setImgsrc(rs.getString("imgsrc"));
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

    public static boolean InsertUser(User user) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(INSERTUSER);
                ptm.setString(1, user.getUserName());
                ptm.setString(2, user.getEmail());
                ptm.setString(3, user.getFristName());
                ptm.setString(4, user.getLastName());
                ptm.setString(5, user.getPassword());
                ptm.setString(6, user.getUserType());
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int getUserIDByname(String userName) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int userID = 0;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETUSERIDBYNAME);
                ptm.setString(1, userName);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    userID = rs.getInt("UserID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userID;
    }

    public static boolean UpdateUser(int userID, String email, String firstName, String lastName, String imgsrc, String contactPhone) {
        PreparedStatement ptm = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(UPDATEUSERINFO);
                ptm.setString(1, email);
                ptm.setString(2, firstName);
                ptm.setString(3, lastName);
                ptm.setString(4, contactPhone);
                ptm.setString(5, imgsrc);
                ptm.setInt(6, userID);
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static User getUser(int userID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        User u = new User();
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETUSER);
                ptm.setInt(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    u.setBalance(rs.getDouble("Balance"));
                    u.setContactPhone(rs.getString("ContactPhone"));
                    u.setEmail(rs.getString("Email"));
                    u.setFristName(rs.getString("FirstName"));
                    u.setImgsrc(rs.getString("imgsrc"));
                    u.setLastName(rs.getString("LastName"));
                    u.setUserID(rs.getInt("UserID"));
                    u.setUserName(rs.getString("UserName"));
                    u.setUserType(rs.getString("UserType"));
                    u.setContactPhone(rs.getString("ContactPhone"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public static User getInforByID(int userID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        User inforUser = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(GETINFORBYID);
                ptm.setInt(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    inforUser.setFristName(rs.getString("FirstName"));
                    inforUser.setLastName(rs.getString("LastName"));
                    inforUser.setEmail(rs.getString("Email"));
                    inforUser.setContactPhone(rs.getString("ContactPhone"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return inforUser;
    }

    public static void main(String[] args) {
        User resultList = getUser(31);
        System.out.println("failed" + resultList.toString());

    }
}
