/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.dao;

import com.dietcalculator.dto.Product;
import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author MSI
 */
public class ProductDAO {
    public String lastIDIndex(){
        String sql = "select top 1 productID from Product order by productID desc";
        String index = "PRO0000";
        
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps =conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                index = rs.getString("productID");
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return index;
    }
   
    
    
    public ArrayList<Product> readProduct(){
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT  productID,productname,type,price,quantity,brand,origin,volume,effect,rate,purchase FROM Product";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Product(rs.getString("productID"),
                                    rs.getString("productname"),
                                    rs.getString("type"), 
                                    rs.getDouble("price"),
                                    rs.getInt("quantity"), 
                                    rs.getString("brand"), 
                                    rs.getString("origin"),
                                    rs.getDouble("volume"), 
                                    rs.getString("effect"), 
                                    rs.getDouble("rate"), 
                                    rs.getDouble("purchase")));
            }
            rs.close();
            ps.close();
        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }
    
    public boolean createProduct(String productID, String productname, String type, double price, int quantity, String brand, String origin, double volume, String effect, double rate, double purchase ){
        int row = 0;
        String sql = "insert into Product values (?,?,?,?,?,?,?,?,?,?,?)";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, productID);
            ps.setString(2, productname);
            ps.setString(3, type);
            ps.setDouble(4, price);
            ps.setInt(5, quantity);
            ps.setString(6, brand);
            ps.setString(7, origin);
            ps.setDouble(8, volume);
            ps.setString(9, effect);
            ps.setDouble(10, rate);
            ps.setDouble(11, purchase);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
            
            
        }catch (Exception e){
            System.out.println(e);
        }
        
        return row > 0;
    }
    
    public boolean updateProduct(String productID, String productname, String type, double price, int quantity, String brand, String origin, double volume, String effect, double rate, double purchase ){
        int row =0;
        String sql ="UPDATE Product SET productname = ?, type = ?, price =?, quantity =?, brand = ?, origin =?, volume =?, effect =?, rate =?, purchase=? where productID = ?"; 
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, productname);
            ps.setString(2, type);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, brand);
            ps.setString(6, origin);
            ps.setDouble(7, volume);
            ps.setString(8, effect);
            ps.setDouble(9, rate);
            ps.setDouble(10, purchase);
            ps.setString(11, productID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
            
            
        }catch (Exception e){
            System.out.println(e);
        }
        
        return row > 0;
    }
    
    
     public boolean deleteProduct(String productID){
        int row = 0;
        String sql ="DELETE from Product where  productID = ?";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
          
            ps.setString(1, productID);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
        
         }catch (Exception e){
        System.out.println(e);
        }
        return row > 0;
    }
    
     
     public static void main(String[]args){
         ProductDAO dao = new ProductDAO();
         
//         System.out.println("Create");
//         dao.createProduct("PRO0000", "Khoi", "Dep troai", 0, 0, "Quan 9", "VietNam", 0, "Hoc gioi", 0, 0);
         ArrayList<Product> list = dao.readProduct();
         for(Product product : list){
             System.out.println(product.toString());
         }
         
         System.out.println("");
         System.out.println("Update");
         dao.updateProduct("PRO0000","Khoi", "Xau troai", 0, 0, "Quan 10", "USA", 0, "Hoc do", 0, 0);
         list = dao.readProduct();
           for(Product product : list){
             System.out.println(product.toString());
         }
           
           System.out.println("");
           System.out.println("Delete");
           dao.deleteProduct("PRO0000");
           list = dao.readProduct();
                for(Product product : list){
             System.out.println(product.toString());
         }
     }
     
     
     
     
   
}
