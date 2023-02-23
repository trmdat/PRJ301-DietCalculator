package com.dietcalculator.dao;

import com.dietcalculator.dto.User;
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
public class UserDAO {

    public List<User> readUser() {
        List<User> list = new ArrayList();
        String sql = "SELECT * FROM User";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getString("userID"), rs.getString("username"),
                        rs.getDate("dob"), rs.getString("phone"), rs.getString("address"),
                        rs.getString("email"), rs.getString("password"), rs.getDouble("weight"),
                        rs.getDouble("height"), rs.getInt("gender"), rs.getInt("activity"), rs.getInt("preference"),
                        rs.getInt("goal"), rs.getDouble("amount"), rs.getInt("duration"), rs.getInt("main"),
                        rs.getInt("side"), rs.getInt("session"), rs.getInt("rank"), rs.getDate("createdate")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean createUser(String userID, String username, Date dob, String phone, String address, String email, String password, double weight, double height, int gender, int activity, int preference, int goal, double amount, int duration, int main, int side, int session, int rank, Date createdate) {
        String sql = "INSERT INTO User VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, username);
            ps.setDate(3, dob);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, email);
            ps.setString(7, password);
            ps.setDouble(8, weight);
            ps.setDouble(9, height);
            ps.setInt(10, gender);
            ps.setInt(11, activity);
            ps.setInt(12, preference);
            ps.setInt(13, goal);
            ps.setDouble(14, amount);
            ps.setInt(15, duration);
            ps.setInt(16, main);
            ps.setInt(17, side);
            ps.setInt(18, session);
            ps.setInt(19, rank);
            ps.setDate(20, createdate);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean updateUser(String userID, String username, Date dob, String phone, String address, String email, String password, double weight, double height, int gender, int activity, int preference, int goal, double amount, int duration, int main, int side, int session, int rank, Date createdate) {
        String sql = "UPDATE User SET userID = ?, username = ?, dob = ?, phone = ?, address = ?, email = ?, password = ?, weight = ?, height = ?, gender = ?, activity = ?, preference = ?, goal = ?, amount = ?, duration = ?, main = ?, side ?, session = ?, rank = ?, createdate = ?";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, username);
            ps.setDate(3, dob);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, email);
            ps.setString(7, password);
            ps.setDouble(8, weight);
            ps.setDouble(9, height);
            ps.setInt(10, gender);
            ps.setInt(11, activity);
            ps.setInt(12, preference);
            ps.setInt(13, goal);
            ps.setDouble(14, amount);
            ps.setInt(15, duration);
            ps.setInt(16, main);
            ps.setInt(17, side);
            ps.setInt(18, session);
            ps.setInt(19, rank);
            ps.setDate(20, createdate);
            row = ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean deleteUser(String userID) {
        int row = 0;
        String sql = "DELETE FROM User WHERE userID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<User> list = dao.readUser();
        for (User food : list) {
            System.out.println(food.toString());
        }
    }
}