/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.dao;

import com.dietcalculator.dto.PopUpDetail;

import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author MSI
 */
public class PopUpDetailDAO {
     public ArrayList<PopUpDetail> readPopUpDetail(){
        ArrayList<PopUpDetail> list = new ArrayList<>();
        String sql = "SELECT popupID, productID,description FROM PopUpDetail";
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(new PopUpDetail(rs.getString("popupID"),rs.getString("productID"),rs.getString("description")));
            }
            rs.close();
            ps.close();
        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }
     
     public boolean createPopUpDetail(String popupID, String productID, String description ){
        int row = 0;
        String sql = "insert into PopUpDetail values (?,?,?)";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, popupID);
            ps.setString(2, productID);
            ps.setString(3, description);
          
            row = ps.executeUpdate();
            ps.close();
            conn.close();
            
            
        }catch (Exception e){
            System.out.println(e);
        }
        
        return row > 0;
    }
     
     public boolean updatePopUpDetail(String productID,String description ){
        int row =0;
        String sql ="UPDATE PopUpDetail SET productID = ?, description = ?"; 
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, productID);
            ps.setString(2, description);
        
            row = ps.executeUpdate();
            ps.close();
            conn.close();
            
            
        }catch (Exception e){
            System.out.println(e);
        }
        
        return row > 0;
    }
     
     public boolean deletePopUpDetail(String popupID){
        int row =0;
        String sql ="DELETE from PopUpDetail where popupID =?";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,popupID);
            
        }catch (Exception e){
            System.out.println(e);
        }
        return row > 0;
    }
}
