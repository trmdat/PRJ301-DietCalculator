package com.dietcalculator.dao;

import com.dietcalculator.dto.FoodDetail;
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
    public ArrayList<Meal> readMealByDayID(String dayID){
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
    public boolean createMealID(String mealID, String userID, String dayID, int time,){
        
    }
}
