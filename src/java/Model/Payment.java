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
public class Payment {
    private int transactionID;
    private int userID;
    private int constractID;
    private Timestamp TransactionDate;
    private int apartmentID;
    private String status;
    private double ammount;

    public Payment() {
    }

    public Payment(int transactionID, int userID, int constractID, Timestamp TransactionDate, int apartmentID, String status) {
        this.transactionID = transactionID;
        this.userID = userID;
        this.constractID = constractID;
        this.TransactionDate = TransactionDate;
        this.apartmentID = apartmentID;
        this.status = status;
    }

    public double getAmmount() {
        return ammount;
    }

    public void setAmmount(double ammount) {
        this.ammount = ammount;
    }
    
    public int getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getConstractID() {
        return constractID;
    }

    public void setConstractID(int constractID) {
        this.constractID = constractID;
    }

    public Timestamp getTransactionDate() {
        return TransactionDate;
    }

    public void setTransactionDate(Timestamp TransactionDate) {
        this.TransactionDate = TransactionDate;
    }

    public int getApartmentID() {
        return apartmentID;
    }

    public void setApartmentID(int apartmentID) {
        this.apartmentID = apartmentID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Payment{" + "transactionID=" + transactionID + ", userID=" + userID + ", constractID=" + constractID + ", TransactionDate=" + TransactionDate + ", apartmentID=" + apartmentID + ", status=" + status + '}';
    }
    
}
