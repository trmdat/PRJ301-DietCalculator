/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.util;

import java.util.List;

/**
 *
 * @author asout
 */
public class Utils {

    private Utils() {

    }

    public static int extractIntFromString(String input) {
        int i = 0;

        while(Character.isLetter(input.charAt(i))){

            i++;
        }
        return Integer.valueOf(input.substring(i));
    }

    public static int randomInt(int lower, int upper) {
        return (int) (lower + (upper - lower + 1) * Math.random());
    }


    public static java.sql.Date convertJavaDateToSqlDate(int year, int month, int day) {
        java.util.Date utilDate = new java.util.Date(year - 1900, month - 1, day);
//         java.util.Date utilDate = new java.util.Date();
        return new java.sql.Date(utilDate.getTime());

    }
  
    public static boolean isInStringArray(String[] array, String element){
        for (String string : array) 
            if (element.trim().equalsIgnoreCase(string)) 
                return true;
        
        return false;
    }
    
    public static java.sql.Date convertStringToSqlDate(String str){
        //FORMAT: yyyy-mm-dd
        String[] components = str.split("-");
        int year = 0, month = 0, day = 0;
        try{
            year = Integer.parseInt(components[0]);
            month = Integer.parseInt(components[1]);
            day = Integer.parseInt(components[2]);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return convertJavaDateToSqlDate(year,month,day);
    }
    
    public List pagingItems(int pageNum, int pageSize, List list) {
        int startIndex = (pageNum - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, list.size());
        List subList = list.subList(startIndex, endIndex);
        return subList;
    }

    public static final int roundDouble(double num){
        return (int)Math.round(num);
    }
}
