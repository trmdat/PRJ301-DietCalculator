package com.dietcalculator.dao;

import com.dietcalculator.dto.FoodAvoidance;
import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class FoodAvoidanceDAO {
    public ArrayList<String> getFoodAvoidanceByUserID(String userID){
        ArrayList<String> list = new ArrayList();
        String sql = "SELECT foodID FROM FoodAvoidance WHERE userID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("foodID"));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
             System.out.println(ex);
        }
        return list;
    }
    
    public boolean addFoodAvoidance(String userID, String foodID){
        String sql = "INSERT INTO FoodAvoidance(userID, foodID) VALUES (?,?)";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, foodID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
             System.out.println(ex);
        }
        return row > 0;
    }
    
    public boolean deleteFoodAvoidance(String userID, String foodID){
        String sql = "DELETE FROM FoodAvoidance WHERE userID = ? AND foodID = ?";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, foodID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
             System.out.println(ex);
        }
        return row > 0;
    }
}
