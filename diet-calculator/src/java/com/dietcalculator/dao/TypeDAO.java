/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.dao;

import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author asout
 */
public class TypeDAO {
    public ArrayList<String> getFoodIDByType(int type){
        ArrayList<String> foodIDByType = new ArrayList();
        String sql = "SELECT foodID FROM Type WHERE type = ? ORDER BY foodID ASC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, type);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                foodIDByType.add(rs.getString("foodID"));
            }
            rs.close();
            ps.close();
            conn.close();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return foodIDByType;
    }
    
    public boolean addFoodType(String foodID, int type){
        String sql = "INSERT INTO Type(foodID, type) VALUES (?,?)";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, foodID);
            ps.setInt(2, type);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return row > 0;
    }
}
