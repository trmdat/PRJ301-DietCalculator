/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.dao;

import com.dietcalculator.dto.ProductDetail;
import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author MSI
 */
public class ProductDetailDAO {
    
    public String lastIDIndex(){
        String sql = "select top 1 detailID from ProductDetail order by detailID desc";
        String index = "PD00000000";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                index = rs.getString("detailID");
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return index;
    }
    
    public ArrayList<ProductDetail> readProductDetail(){
        ArrayList<ProductDetail>list = new ArrayList<>();
        String sql ="SELECT detatilID, productID, userID, billID, quantity from ProductDetail";
    
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new ProductDetail(rs.getString("detailID"),rs.getString("saleoffID"), rs.getString("productID"),rs.getInt("percentoff"), rs.getFloat("priceoff"), rs.getString("gift")));
                        
            }
            rs.close();
            ps.close();

            
        }catch (Exception e){
        System.out.println(e);
        }
        return list;
    }
    
    public boolean createProductDetail(String detailID, String saleoffID, String productID, int percentoff, float priceoff, String gift){
        int row = 0;
        String sql ="insert into ProductDetail values(?,?,?,?,?,?)";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, detailID);
            ps.setString(2, productID);
            ps.setString(3, saleoffID);
            ps.setInt(4, percentoff);
            ps.setFloat(5, priceoff);
            ps.setString(6, gift);
            ps.close();
            conn.close();
         }catch (Exception e){
        System.out.println(e);
        }
        return row > 0;
    }
    
     public boolean updateProductDetail(String detailID,String saleoffID, String productID, int percentoff, float priceoff, String gift){
        int row = 0;
        String sql ="update ProductDetail SET saleoffID = ?, productID =?, percentoff =?, priceoff =?, gift =? where detailID";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
          
            ps.setString(1, productID);
            ps.setString(2, saleoffID);
            ps.setInt(3, percentoff);
            ps.setFloat(4, priceoff);
            ps.setString(5, gift);
            ps.setString(6, detailID);
            ps.close();
            conn.close();
         }catch (Exception e){
        System.out.println(e);
        }
        return row > 0;
    }
     
     
      public boolean deleteProductDetail(String detailID){
        int row = 0;
        String sql ="DELETE from ProductDetail where detailID = ?";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
          
            ps.setString(1, detailID);
        
         }catch (Exception e){
        System.out.println(e);
        }
        return row > 0;
    }
      
      
    public static void main(String[]args){
         ProductDetailDAO dao = new ProductDetailDAO();
         
        System.out.println("Create");
        dao.createProductDetail("PD00000000", "?", "PRO0000", 0, 0, "Combo 1");
         ArrayList<ProductDetail> list = dao.readProductDetail();
         for(ProductDetail product : list){
             System.out.println(product.toString());
         }
         
         System.out.println("");
         System.out.println("Update");
         dao.updateProductDetail("PRO0000","Khoi", "Xau troai", 0, 0, "Quan 10", "USA", 0, "Hoc do", 0, 0);
         list = dao.readProductDetail();
           for(ProductDetail product : list){
             System.out.println(product.toString());
         }
           
           System.out.println("");
           System.out.println("Delete");
           dao.deleteProductDetail("PRO0000");
           list = dao.readProductDetail();
                for(ProductDetail product : list){
             System.out.println(product.toString());
         }
    
}
