package com.dietcalculator.dao;

import com.dietcalculator.dto.ExSession;
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
public class ExSessionDAO {

    public List<ExSession> readExSession() {
        List<ExSession> list = new ArrayList<>();
        String sql = "SELECT * FROM ExSession";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ExSession(rs.getString("sessionID"), rs.getString("exerciseID"), rs.getString("userID"), rs.getString("dayID")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean createExSession(String sessionID, String exerciseID, String userID, String dayID) {
        String sql = "INSERT INTO ExSession VALUES(?,?,?,?)";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, exerciseID);
            ps.setString(2, exerciseID);
            ps.setString(3, userID);
            ps.setString(4, dayID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean updateExSession(String sessionID, String exerciseID, String userID, String dayID) {
        String sql = "UPDATE ExSession SET sessionID = ?, exerciseID = ?, userID = ?, dayID = ?";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, exerciseID);
            ps.setString(2, exerciseID);
            ps.setString(3, userID);
            ps.setString(4, dayID);
            row = ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean deleteExSession(String sessionID) {
        int row = 0;
        String sql = "DELETE FROM ExSession WHERE sessionID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sessionID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }
}
