package com.dietcalculator.dao;

import com.dietcalculator.dto.Exercise;
import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ExerciseDAO {

    public List<Exercise> readExercise() {
        List<Exercise> list = new ArrayList();
        String sql = "SELECT * FROM Exercise";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Exercise(rs.getString("exerciseID"), rs.getString("exname"), rs.getDouble("lowerweight"), rs.getDouble("upperweight"), rs.getInt("calorexp")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean createExercise(String exerciseID, String exname, double lowerweight, double upperweight, int calorexp) {
        String sql = "INSERT INTO Exercise VALUES(?,?,?,?,?)";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, exerciseID);
            ps.setString(2, exname);
            ps.setDouble(3, upperweight);
            ps.setDouble(4, lowerweight);
            ps.setInt(5, calorexp);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean updateExercise(String exerciseID, String exname, double lowerweight, double upperweight, int calorexp) {
        String sql = "UPDATE Exercise SET exercesrID = ?, exname = ?, lowerweight = ?, upperweight = ?, calorexp = ?";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, exerciseID);
            ps.setString(2, exname);
            ps.setDouble(3, upperweight);
            ps.setDouble(4, lowerweight);
            ps.setInt(5, calorexp);
            row = ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean deleteExercise(String exerciseID) {
        int row = 0;
        String sql = "DELETE FROM Exercise WHERE exerciseID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, exerciseID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }
}