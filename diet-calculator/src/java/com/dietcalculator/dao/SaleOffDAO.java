/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.dao;

import com.dietcalculator.dto.Product;
import com.dietcalculator.dto.SaleOff;
import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author MSI
 */
public class SaleOffDAO {
    public ArrayList<SaleOff> readSaleOff(){
        ArrayList<SaleOff> list = new ArrayList<>();
        String sql = "SELECT saleoffID,description,startdate,enddate,target FROM SaleOff";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(new SaleOff(rs.getString("saleoffID"),rs.getString("description"),rs.getDate("startdate"), rs.getDate("enddate"), rs.getInt("target")));
            }
            rs.close();
            ps.close();
        }catch (Exception e){
            System.out.println(e);
        }
        return list;
        
        
    }
    
     public boolean createSaleOff(String saleoffID, String description, Date startdate, Date enddate, int target ){
        int row = 0;
        String sql = "insert into SaleOff values (?,?,?,?,?)";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, saleoffID);
            ps.setString(2, description);
            ps.setDate(3,startdate);
            ps.setDate(4, enddate);
            ps.setInt(5, target);
           
            row = ps.executeUpdate();
            ps.close();
            conn.close();
            
            
        }catch (Exception e){
            System.out.println(e);
        }
        
        return row > 0;
    }
     
     public boolean updateSaleOff(String saleoffID, String description, Date startdate, Date enddate, int target){
        int row =0;
        String sql ="UPDATE SaleOff SET saleoffID = ?, description = ?, startdate =?, enddate =?, target = ?"; 
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, saleoffID);
            ps.setString(2, description);
            ps.setDate(3, startdate);
            ps.setDate(4, enddate);
            ps.setInt(5, target);
           
            row = ps.executeUpdate();
            ps.close();
            conn.close();
            
            
        }catch (Exception e){
            System.out.println(e);
        }
        
        return row > 0;
    }
     
      public boolean deleteSaleOff(String saleoffID){
        int row = 0;
        String sql ="DELETE from SaleOff where saleoffID = ?";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
          
            ps.setString(1, saleoffID);
        
         }catch (Exception e){
        System.out.println(e);
        }
        return row > 0;
    }
    
}
