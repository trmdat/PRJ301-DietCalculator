package com.dietcalculator.dto;

/**
 *
 * @author ADMIN
 */
public class Meal {
    private String mealID;
    private String userID;
    private String dayID;
    private int time;
    private double calosize;

    public Meal() {
    }

    public Meal(String mealID, String userID, String dayID, int time, double calosize) {
        this.mealID = mealID;
        this.userID = userID;
        this.dayID = dayID;
        this.time = time;
        this.calosize = calosize;
    }

    public double getCalosize() {
        return calosize;
    }

    public void setCalosize(double calosize) {
        this.calosize = calosize;
    }

    public String getMealID() {
        return mealID;
    }

    public void setMealID(String mealID) {
        this.mealID = mealID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getDayID() {
        return dayID;
    }

    public void setDayID(String dayID) {
        this.dayID = dayID;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
    
}
