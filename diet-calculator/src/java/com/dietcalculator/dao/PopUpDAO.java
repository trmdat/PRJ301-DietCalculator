/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.dao;

import com.dietcalculator.dto.PopUp;

import com.dietcalculator.util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author MSI
 */
public class PopUpDAO {
    
    public ArrayList<PopUp> readPopUp(){
        ArrayList<PopUp> list = new ArrayList<>();
        String sql = "SELECT popupID,description,status,theme FROM PopUp ";
         try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(new PopUp(rs.getString("popupID"),rs.getString("description"),rs.getInt("status"), rs.getString("theme")));
            }
            rs.close();
            ps.close();
        }catch (Exception e){
            System.out.println(e);
        }
        return list;
    }
    
     public boolean createPopUp(String popupID, String description, int status, String theme){
        int row = 0;
        String sql = "insert into PopUp values (?,?,?,?) ";
         try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, popupID);
            ps.setString(2, description);
            ps.setInt(3, status);
            ps.setString(4, theme);
            
            ps.close();
            conn.close();
        }catch (Exception e){
            System.out.println(e);
        }
        return row  > 0;
    }
     
    public boolean updatePopUp( String description, int status, String theme){
        int row = 0;
        String sql = "update PopUp SET description = ?, status =? theme = ? ";
         try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
     
            ps.setString(1, description);
            ps.setInt(2, status);
            ps.setString(3, theme);
            row = ps.executeUpdate();
            ps.close();
            conn.close();
            
        }catch (Exception e){
            System.out.println(e);
        }
        return row > 0;
    }
    
     public boolean deletePopUp(String popupID){
        int row =0;
        String sql ="DELETE from PopUp where popupID =?";
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
   
    

