package com.dietcalculator.dto;

/**
 *
 * @author ADMIN
 */
public class FoodDetail {
    private String foodID;
    private String mealID;
    private double amount;
    
    public FoodDetail() {
    }

    public FoodDetail(String foodID, String mealID, double amount) {
        this.foodID = foodID;
        this.mealID = mealID;
        this.amount = amount;

    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getFoodID() {
        return foodID;
    }

    public void setFoodID(String foodID) {
        this.foodID = foodID;
    }

    public String getMealID() {
        return mealID;
    }

    public void setMealID(String mealID) {
        this.mealID = mealID;
    }

}
