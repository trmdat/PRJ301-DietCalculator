package com.dietcalculator.dao;

import com.dietcalculator.dto.FoodDetail;
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
public class FoodDetailDAO {

    public ArrayList<FoodDetail> readFoodDetail(String foodID, String mealID) {
        ArrayList<FoodDetail> list = new ArrayList<>();
        String sql = "SELECT foodID, mealID, amount FROM FoodDetail WHERE foodID = ? AND mealID = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, foodID);
            ps.setString(2, mealID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FoodDetail(rs.getString("foodID"), rs.getString("mealID"), rs.getDouble("amount")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public ArrayList<FoodDetail> readFoodDetailByFoodID(String foodID) {
        ArrayList<FoodDetail> list = new ArrayList<>();
        String sql = "SELECT foodID, mealID, amount FROM FoodDetail WHERE foodID = ? ORDER BY foodID ASC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, foodID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FoodDetail(rs.getString("foodID"), rs.getString("mealID"), rs.getDouble("amount")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public ArrayList<FoodDetail> readFoodDetailByMealID(String mealID) {
        ArrayList<FoodDetail> list = new ArrayList<>();
        String sql = "SELECT mealID, foodID, amount FROM FoodDetail WHERE mealID = ? ORDER BY mealID ASC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, mealID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FoodDetail(rs.getString("foodID"), rs.getString("mealID"), rs.getDouble("amount")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean createFoodDetail(String foodID, String mealID, double amount) {
        int row = 0;
        String sql = "INSERT INTO FoodDetail(foodID, mealID, amount) VALUES (?,?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, foodID);
            ps.setString(2, mealID);
            ps.setDouble(3, amount);

            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean UpdateFoodDetail(String foodID, String mealID, double amount) {
        int row = 0;
        String sql = "UPDATE FoodDetail SET amount = ? WHERE foodID = ? AND mealID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, amount);
            ps.setString(2, foodID);
            ps.setString(3, mealID);

            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean DeleteFoodDetail(String foodID, String mealID) {
        int row = 0;
        String sql = "DELETE FROM FoodDetail WHERE foodID = ? AND mealID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, foodID);
            ps.setString(2, mealID);

            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

}
