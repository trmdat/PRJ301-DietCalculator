package com.dietcalculator.dao;

import com.dietcalculator.dto.Comment;
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
public class CommentDAO {

    public List<Comment> readComment() {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT * FROM Comment";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getString("commentID"), rs.getString("userID"), rs.getString("productID"), rs.getDouble("rate"), rs.getString("content")));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean createComment(String commentID, String userID, String productID, double rate, String content) {
        String sql = "INSERT INTO Comment VALUES(?,?,?,?,?)";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, commentID);
            ps.setString(2, userID);
            ps.setString(3, productID);
            ps.setDouble(4, rate);
            ps.setString(5, content);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean updateComment(String commentID, String userID, String productID, double rate, String content) {
        String sql = "UPDATE Comment SET commentID = ?, userID = ?, productID = ?, rate = ?, content = ?";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, commentID);
            ps.setString(2, userID);
            ps.setString(3, productID);
            ps.setDouble(4, rate);
            ps.setString(5, content);
            row = ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public boolean deleteComment(String commentID) {
        int row = 0;
        String sql = "DELETE FROM Comment WHERE commentID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, commentID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }
}