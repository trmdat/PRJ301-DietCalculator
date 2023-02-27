package com.dietcalculator.dao;

import com.dietcalculator.dto.Image;
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
public class ImageDAO {

    public String lastIDIndex() {
        String sql = "SELECT TOP 1 ImageID FROM Image ORDER BY ImageID DESC";
        String index = "IMG00000";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                index = rs.getString("ImageID");
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return index;
    }

    public boolean createImage(String imageID, String productID, String mealID, String commentID, String url) {
        String sql = "insert into Image values (?,?,?,?,?)";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, imageID);
            ps.setString(2, productID);
            ps.setString(3, mealID);
            ps.setString(4, commentID);
            ps.setString(5,  url);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }
    
    public boolean updateImage(String imageID, String productID, String mealID, String commentID, String url) {
        String sql = "update Image set productID=?, mealID=?, commentID=?,  url=? where imageID=?";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, productID);
            ps.setString(2, mealID);
            ps.setString(3, commentID);
            ps.setString(4,  url);
            ps.setString(5, imageID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }
    
        public boolean deleteImage(String imageID) {
        String sql = "DELETE FROM Image WHERE imageID = ?";
        int row = 0;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, imageID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return row > 0;
    }

    public String readImageUrlByProductID(String productID) {
        String url = "";
        String sql = "SELECT url FROM Image WHERE productID = ? ";
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

        System.out.println("Create");
        dao.createImage("IMG000000", "PRO0001",null,null,"abc");
        String a = dao.readImageUrlByProductID("PRO0001");
        System.out.println(a);
        
        System.out.println("Update");
        System.out.println(dao.updateImage("IMG000000", "PRO0002", null, null, "bed"));
        a = dao.readImageUrlByProductID("PRO0002");
        System.out.println(a);
        
        System.out.println("Delete");
        System.out.println(dao.deleteImage("IMG000000"));
    }
}
