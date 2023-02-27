/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.util;

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
        java.util.Date utilDate = new java.util.Date(year - 1900, month, day);
        return new java.sql.Date(utilDate.getTime());

    }
  
}
