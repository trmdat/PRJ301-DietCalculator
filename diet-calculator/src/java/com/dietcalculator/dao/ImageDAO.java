package com.dietcalculator.dao;

import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class ImageDAO {
    public String lastIDIndex(){
        String sql = "SELECT TOP 1 ImageID FROM Image ORDER BY ImageID DESC";
        String index = "IMG00000";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) 
                index = rs.getString("ImageID");
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return index;
    }

    public String readImageUrlByProductID(String productID) {
        String url = "";
        String sql = "SELECT url FROM Image WHERE productID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                url = rs.getString("url");
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return url;
    }

    public String readImageUrlByMealID(String mealID) {
        String url = "";
        String sql = "SELECT url FROM Image WHERE mealID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, mealID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                url = rs.getString("url");
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return url;
    }

    public String readImageUrlByCommentID(String commnentID) {
        String url = "";
        String sql = "SELECT url FROM Image WHERE commentID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, commnentID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                url = rs.getString("url");
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return url;
    }
    public static void main(String[] args) {
        ImageDAO dao = new ImageDAO();
        System.out.println(dao.readImageUrlByProductID("1"));
    }

}
