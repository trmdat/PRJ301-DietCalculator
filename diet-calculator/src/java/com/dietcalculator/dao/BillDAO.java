package com.dietcalculator.dao;

import com.dietcalculator.dto.Bill;
import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class BillDAO {
        public List<Bill> readBillByUserID(String userID) {
        List<Bill> list = new ArrayList<>();
        String sql = "SELECT * FROM Bill WHERE userID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getString("billID"), rs.getString("userID"), rs.getDate("date"), rs.getString("delivery"), rs.getString("payment")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    
    public boolean createBill(String billID, String userID, Date date, String delivery, String payment) {
        String sql = "INSERT INTO Bill VALUES(?,?,?,?,?)";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, billID);
            ps.setString(2, userID);
            ps.setDate(3, date);
            ps.setString(4, delivery);
            ps.setString(5, payment);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }
    
    public boolean updateBill(String billID, String userID, Date date, String delivery, String payment) {
        String sql = "UPDATE Bill SET billID = ?, userID = ?, date = ?, delivery = ?, payment = ?";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, billID);
            ps.setString(2, userID);
            ps.setDate(3, date);
            ps.setString(4, delivery);
            ps.setString(5, payment);
            row = ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }
    
    public boolean deleteBill(String billID) {
        int row = 0;
        String sql = "DELETE FROM Bill WHERE billID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, billID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;        
    }
}