/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.dao;

import com.dietcalculator.dto.Day;
import com.dietcalculator.util.DBUtils;
import com.dietcalculator.util.Utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author asout
 */
public class DayDAO {
//    public void generateDayByUserID(String userID, int day){
//        //SQL for getting the last dayID
//        String sql1 = "SELECT TOP 1 dayID FROM Day ORDER BY dayID DESC";
//        int lastIdx;
//        String sql2 = "INSERT INTO Day VALUES(?,?,?,?,?,?,?,?,?)";
//        String sqlFinal = "";
//        try {
//            Connection conn = DBUtils.getConnection();
//            //Get the last dayID
//            PreparedStatement ps;
//            ResultSet rs;
//            ps = conn.prepareStatement(sql1);
//            rs = ps.executeQuery();
//            if(rs.next()) lastIdx = Utils.extractIntFromString(rs.getString("dayID"));
//            else lastIdx = 0;
//            //Insertion with loops
//            for(int i = 0; i < day; i++){
//                
//            }
//            
//            ps.setString(1, userID);
//            
//            
//            rs.close();
//            ps.close();
//            conn.close();
//        } catch (SQLException ex) {
//             System.out.println(ex);
//        }
//    }
    
    public ArrayList<Day> readDayByUserID(String userID){
        ArrayList<Day> list = new ArrayList();
        String sql = "SELECT * FROM Day WHERE userID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Day(rs.getString("dayID"),rs.getString("userID"),rs.getInt("index"),rs.getDouble("totalCal"), rs.getDouble("carbohydrate"), rs.getDouble("fiber"), rs.getDouble("protein"), rs.getDouble("fat"), rs.getDouble("water")));
            }
            rs.close();
            ps.close();
            conn.close();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return list;
    }
    
    public boolean createDay(String dayID, String userID, int index, double totalCal, double carbohydrate, double fiber, double protein, double fat, double water){
        String sql = "INSERT INTO Day VALUES(?,?,?,?,?,?,?,?,?)";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, dayID);
            ps.setString(2, userID);
            ps.setInt(3, index);
            ps.setDouble(4, totalCal);
            ps.setDouble(5, carbohydrate);
            ps.setDouble(6, fiber);
            ps.setDouble(7, protein);
            ps.setDouble(8, fat);
            ps.setDouble(9, water);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return row > 0;
    }
    
    public boolean updateDay(String dayID, String userID, int index, double totalCal, double carbohydrate, double fiber, double protein, double fat, double water){
        String sql = "UPDATE Day SET userID = ?, index = ?, totalCal = ?, carbohydrate = ?, fiber = ?, protein = ?, fat = ?, water = ? WHERE dayID = ?";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(9, dayID);
            ps.setString(1, userID);
            ps.setInt(2, index);
            ps.setDouble(3, totalCal);
            ps.setDouble(4, carbohydrate);
            ps.setDouble(5, fiber);
            ps.setDouble(6, protein);
            ps.setDouble(7, fat);
            ps.setDouble(8, water);
            row = ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return row > 0;
    }
    
    public boolean deleteDay(String dayID){
        int row = 0;
        String sql = "DELETE FROM Day WHERE dayID = ?";
           try {
               Connection conn = DBUtils.getConnection();
               PreparedStatement ps = conn.prepareStatement(sql);
               ps.setString(1, dayID);
               row = ps.executeUpdate();
               ps.close();
               conn.close();
           }catch(SQLException ex){
               System.out.println(ex);
           }
           return row > 0;   
    }
}
