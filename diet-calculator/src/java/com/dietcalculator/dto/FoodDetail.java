package com.dietcalculator.dto;

/**
 *
 * @author ADMIN
 */
public class FoodDetail {
    private String foodID;
    private String mealID;
    private double amount;
    private double totalCal;
    private double carbohydrate;
    private double fiber;
    private double protein;
    private double fat;
    private double water;
    
    public FoodDetail() {
    }

    public FoodDetail(String foodID, String mealID, double amount, double totalCal, double carbohydrate, double fiber, double protein, double fat, double water) {
        this.foodID = foodID;
        this.mealID = mealID;
        this.amount = amount;
        this.totalCal = totalCal;
        this.carbohydrate = carbohydrate;
        this.fiber = fiber;
        this.protein = protein;
        this.fat = fat;
        this.water = water;
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

    public double getTotalCal() {
        return totalCal;
    }

    public void setTotalCal(double totalCal) {
        this.totalCal = totalCal;
    }

    public double getCarbohydrate() {
        return carbohydrate;
    }

    public void setCarbohydrate(double carbohydrate) {
        this.carbohydrate = carbohydrate;
    }

    public double getFiber() {
        return fiber;
    }

    public void setFiber(double fiber) {
        this.fiber = fiber;
    }

    public double getProtein() {
        return protein;
    }

    public void setProtein(double protein) {
        this.protein = protein;
    }

    public double getFat() {
        return fat;
    }

    public void setFat(double fat) {
        this.fat = fat;
    }

    public double getWater() {
        return water;
    }

    public void setWater(double water) {
        this.water = water;
    }
}
