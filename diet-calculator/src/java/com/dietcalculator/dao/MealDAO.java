package com.dietcalculator.dao;

import com.dietcalculator.dto.Meal;
import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class MealDAO {
    public String lastIDIndex(){
        String sql = "SELECT TOP 1 mealID FROM Meal ORDER BY mealID DESC";
        String index = "MEAL00000";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) 
                index = rs.getString("mealID");
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return index;
    }

    public ArrayList<Meal> readMealByDayID(String dayID) {
        ArrayList<Meal> list = new ArrayList<>();
        String sql = "SELECT mealID,userID,dayID,time,calosize FROM Meal WHERE dayID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, dayID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Meal(rs.getString("mealID"), rs.getString("userID"), rs.getString("dayID"), rs.getInt("time"), rs.getDouble("calosize")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean createMeal(String mealID, String userID, String dayID, int time, double calosize) {
        int row = 0;
        String sql = "INSERT INTO Meal(mealID,userID,dayID,time,calosize) VALUES (?,?,?,?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, mealID);
            ps.setString(2, userID);
            ps.setString(3, dayID);
            ps.setInt(4, time);
            ps.setDouble(5, calosize);

            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean updateMeal(String mealID, String userID, String dayID, int time, double calosize) {
        int row = 0;
        String sql = "UPDATE Meal SET userID = ?,dayID = ?,time = ?,calosize = ? WHERE mealID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, dayID);
            ps.setInt(3, time);
            ps.setDouble(4, calosize);
            ps.setString(5, mealID);

            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean deleteMeal(String mealID) {
        int row = 0;
        String sql = "DELETE FROM Meal WHERE mealID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, mealID);

            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }
    
    public static void main(String[] args) {
        MealDAO dao = new MealDAO();
        ArrayList<Meal> ls = dao.readMealByDayID("1");
        for (Meal l : ls) {
            System.out.println(l);
        }
    }
}
