/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBconnection;
import Model.Constract;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class PaymentDAL {
    private static final String INSERTCONTRACT="INSERT INTO Contracts (PropertyID, TenantID, StartDate, EndDate, Status, LandlordID) VALUES (?,?,?,?,?,?);";
public static boolean InsertContracts(Constract contracts) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try ( Connection con = DBconnection.getConnection()) {
            if (con != null) {
                ptm = con.prepareStatement(INSERTCONTRACT);
                ptm.setInt(1, contracts.getPropertyId());
                ptm.setInt(2, contracts.getTenantId());
                ptm.setTimestamp(3, contracts.getStartDate());
                ptm.setTimestamp(4, contracts.getEndDate());
                ptm.setString(5, contracts.getStatus());
                ptm.setInt(6, contracts.getLandLordId());
                int rowsAffected = ptm.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
