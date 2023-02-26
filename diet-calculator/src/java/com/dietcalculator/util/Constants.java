/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.util;

import com.dietcalculator.dto.Food;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/**
 *
 * @author asout
 */
public final class Constants {
    //DEFAULT CONSTANTS
    //Format Defaults
    public static final String USER_ID_FORMAT = "U\\d{5}";
    public static final String EXERCISE_ID_FORMAT = "EX\\d{3}";
    public static final String FOOD_ID_FORMAT = "FD\\d{5}";
    public static final String PRODUCT_ID_FORMAT = "PRO\\d{4}";
    public static final String DAY_ID_FORMAT = "DAY\\d{5}";
    public static final String EX_SESSION_ID_FORMAT = "SES\\d{6}";
    public static final String MEAL_ID_FORMAT = "MEAL\\d{6}";
    public static final String BILL_ID_FORMAT = "BILL\\d{6}";
    public static final String DETAIL_ID_FORMAT = "PD\\d{8}";
    public static final String SALE_OFF_ID_FORMAT = "SALE\\d{3}";
    public static final String POPUP_ID_FORMAT = "POP\\d{3}";
    public static final String COMMENT_ID_FORMAT = "CMT\\d{6}";
    public static final String IMAGE_ID_FORMAT = "IMG\\d{6}";
    
    //Form constants

    public static final int DEFAULT_PREFERENCE = 0;
    public static final int DEFAULT_WEEK = 8;
    public static final int DEFAULT_RANK = 1;

    public static final int[] PREFERENCE_RANGE = {0,1,2,3,4};
    public static final int[] WEEK_RANGE = {0,1,2,3,4,5,6,7,8,9,10,11,12};
    public static final int[] RANK_RANGE = {1,2};

    //Diet constants
    public static final int CALORIES_PER_KG = 7716;
    public static final double SIDE_MEAL_PROPORTION = 0.08;
    //Relative parameter
    public static final double RELATIVE_ESTIMATE = 0.8;
    
    //Plate Portion By Preference
    //No Preference (0)
    public static final double CARBOHYDRATE_0 = 0.5;
    public static final double FIBER_0 = (double)1/11;
    public static final double PROTEIN_0 = 0.25;
    public static final double STANDARD_PROTEIN_0 = 0.8;
    public static final double FAT_0 = 0.25;
    public static final double WATER_0 = 2.25;
    
    //Asian and Pacific (1)
    public static final double CARBOHYDRATE_1 = 0.6;
    public static final double FIBER_1 = (double)1/11.2;
    public static final double PROTEIN_1 = 0.2;
    public static final double STANDARD_PROTEIN_1 = 0.8;
    public static final double FAT_1 = 0.2;
    public static final double WATER_1 = 2.25;
    
    //European and North America (2)
    public static final double CARBOHYDRATE_2 = 0.4;
    public static final double FIBER_2 = (double)1/13;
    public static final double PROTEIN_2 = 0.3;
    public static final double STANDARD_PROTEIN_2 = 0.9;
    public static final double FAT_2 = 0.3;
    public static final double WATER_2 = 2.5;
    
    //Mediterranean & Hispanic(3)
    public static final double CARBOHYDRATE_3 = 0.47;
    public static final double FIBER_3 = (double)1/13;
    public static final double PROTEIN_3 = 0.25;
    public static final double STANDARD_PROTEIN_3 = 0.85;
    public static final double FAT_3 = 0.28;
    public static final double WATER_3 = 2.5;
    
    //Vegan(4)
    public static final double CARBOHYDRATE_4 = 0.6;
    public static final double FIBER_4 = (double)1/9;
    public static final double PROTEIN_4 = 0.22;
    public static final double STANDARD_PROTEIN_4 = 0.9;
    public static final double FAT_4 = 0.18;
    public static final double WATER_4 = 2.25;
    
    public static final HashMap<Integer,MealValues> PLATE_PORTION = new HashMap();
    static{
        PLATE_PORTION.put(0, new MealValues(CARBOHYDRATE_0,FIBER_0,PROTEIN_0,STANDARD_PROTEIN_0,FAT_0,WATER_0));
        PLATE_PORTION.put(1, new MealValues(CARBOHYDRATE_1,FIBER_1,PROTEIN_1,STANDARD_PROTEIN_1,FAT_1,WATER_1));
        PLATE_PORTION.put(2, new MealValues(CARBOHYDRATE_2,FIBER_2,PROTEIN_2,STANDARD_PROTEIN_2,FAT_2,WATER_2));
        PLATE_PORTION.put(3, new MealValues(CARBOHYDRATE_3,FIBER_3,PROTEIN_3,STANDARD_PROTEIN_3,FAT_3,WATER_3));
        PLATE_PORTION.put(4, new MealValues(CARBOHYDRATE_4,FIBER_4,PROTEIN_4,STANDARD_PROTEIN_4,FAT_4,WATER_4));
    }
    
    //Grams to Calories
    public static final int CARBOHYDRATE_TO_KCAL = 4;
    public static final int PROTEIN_TO_KCAL = 4;
    public static final int FAT_TO_KCAL = 9;
    
    //Macronutrients sources
    public static final HashMap<String,String> MACRO_SOURCE = new HashMap();
    static{
        MACRO_SOURCE.put("CARBOHYDRATE", "starch");
        MACRO_SOURCE.put("FIBER1", "vegetables");
        MACRO_SOURCE.put("FIBER2", "fruit");
        MACRO_SOURCE.put("PROTEIN1", "meat");
        MACRO_SOURCE.put("PROTEIN2", "poultry");
        MACRO_SOURCE.put("PROTEIN3", "fish");
        MACRO_SOURCE.put("PROTEIN4", "seafood");
        MACRO_SOURCE.put("PROTEIN5", "egg");
        MACRO_SOURCE.put("FAT", "dairies&dessert");
        MACRO_SOURCE.put("WATER", "drink");
    }

    //Main meals
    public static final int[] MAIN_MEAL_RANGE = {2,3};
    public static final int DEFAULT_MAIN_MEAL = 3;
    public static final String[] BREAKFAST_CATEGORIES = {"vegetables/fruit","meat/poultry","starch"};
    public static final String[] LUNCH_DINNER_CATEGORIES = {"vegetables/fruit","fish/seafood/egg","meat/poultry","starch","dairies&dessert","drink"};
    public static final double VEGETABLES_FIBER_SOURCE = 0.7;
    public static final double FRUIT_FIBER_SOURCE = 0.3;
    public static final double FIRST_PROTEIN_SOURCE = 0.5;
    public static final double SECOND_PROTEIN_SOURCE = 0.5;
    public static final double WATER_PROPORTION = 0.2;

    //Side meals
    public static final int[] SIDE_MEAL_RANGE = {0,1,2};
    public static final int DEFAULT_SIDE_MEAL = 1;
    public static final String[] SIDE_MEAL_CATEGORIES = {"fruit/nuts/legumes/dairies&dessert"};
    public static final double LUNCH_2 = 0.5;
    public static final double DINNER_2 = 0.5;
    public static final double BREAKFAST_3 = 0.35;
    public static final double LUNCH_3 = 0.35;
    public static final double DINNER_3 = 0.3;

        
    public static final HashMap<String, Integer> MEAL = new HashMap();
    static{
        MEAL.put("BREAKFAST", 1);
        MEAL.put("LUNCH", 2);
        MEAL.put("DINNER", 3);
        MEAL.put("BRUNCH", 4);
        MEAL.put("SNACK", 5);
    }
    
    public static final HashMap<Integer, String[]> MEAL_DATASET = new HashMap();
    static{
        MEAL_DATASET.put(1, BREAKFAST_CATEGORIES);
        MEAL_DATASET.put(2, LUNCH_DINNER_CATEGORIES);
        MEAL_DATASET.put(3, LUNCH_DINNER_CATEGORIES);
        MEAL_DATASET.put(4, SIDE_MEAL_CATEGORIES);
        MEAL_DATASET.put(5, SIDE_MEAL_CATEGORIES);
    }
    
    //Exercises
    public static final int[] EXERCISE_SESSION_RANGE = {1,2,3};
    public static final int DEFAULT_EXERCISE_SESSION = 2;     

    public static final HashMap<String, Integer> GENDER = new HashMap();
    static{
        GENDER.put("MALE", 1);
        GENDER.put("FEMALE", 0);
    }
    
    public static final HashMap<String ,Double> ACTIVITY_LEVEL = new HashMap(); 
    static{
        ACTIVITY_LEVEL.put("SEDENTARY", 1.2);
        ACTIVITY_LEVEL.put("LIGHTLY_ACTIVE", 1.375);
        ACTIVITY_LEVEL.put("MODERATELY_ACTIVE", 1.55);
        ACTIVITY_LEVEL.put("ACTIVE", 1.725);
        ACTIVITY_LEVEL.put("VERY_ACTIVE", 1.9);
    }
    
    public static final HashMap<String, Integer> PREFERENCE = new HashMap();
    static{
        PREFERENCE.put("NO_PREFERENCE", 0);
        PREFERENCE.put("ASIAN&PACIFIC", 1);
        PREFERENCE.put("EUROPEAN&NORTH_AMERICA", 2);
        PREFERENCE.put("MEDITERRANEAN&HISPANIC", 3);
        PREFERENCE.put("VEGAN", 4);
    }
    
    public static final HashMap<String, Integer> GOAL = new HashMap();
    static{
        GOAL.put("GAIN", 1);
        GOAL.put("LOSE", -1);
        GOAL.put("MAINTENANCE", 0);
    }
    
    //METHODS
    public static final double BMICalculator(double weight, double height){
        double bmi = weight/(height*height);
        return Math.round(bmi*100)/100;
    }
    
    public static final int totalCaloricNeed(String gender, double weight, double height, int age, String activityLevel, String goalStr, double amount, int week){
        //Calculating BMR
        double bmr = 0;
        for(String x: GENDER.keySet())
            if(x.equals("MALE"))
                bmr = 66.5 + (13.75*weight) + (5.003*height) - (6.775*age);
            else if(x.equals("FEMALE"))
                bmr = 655.1 + (9.563*weight) + (1.85*height) - (4.676*age);
        
        //Calculating AMR
        double amr = ACTIVITY_LEVEL.keySet().stream().filter((x) -> (x.equals(activityLevel))).map((x) -> ACTIVITY_LEVEL.get(x)).reduce(bmr, (accumulator, _item) -> accumulator * _item);
        
        //Getting goal value
        int goal = 0;
        for (String x : GOAL.keySet())
            if(x.equals(goalStr))
                goal = GOAL.get(x);
        
        double total = amr + goal*amount*CALORIES_PER_KG/(week*7);
        return (int) Math.round(total);
    }
    
    public static final HashMap<Integer, Double> mealProprtion(int mainMeal, int sideMeal){
        HashMap<Integer, Double> mealProprtion = new HashMap();
        //Side meals
        if(sideMeal == 2){
            //Set brunch
            mealProprtion.put(4, SIDE_MEAL_PROPORTION);
            
            //Set snack
            mealProprtion.put(5, SIDE_MEAL_PROPORTION);
        }else if(sideMeal == 1)
            if(mainMeal == 2)
                //Set brunch
                mealProprtion.put(4, SIDE_MEAL_PROPORTION);
            else 
                //Set snack
                mealProprtion.put(5, SIDE_MEAL_PROPORTION);
        
        //Main meals
        double caloRemainder = 1 - sideMeal*SIDE_MEAL_PROPORTION;
        if(mainMeal == 2){
            //Set lunch = 0.5
            mealProprtion.put(2, caloRemainder*LUNCH_2);
            
            //Set dinner = 0.5
            mealProprtion.put(3, caloRemainder*DINNER_2);
        }else{
            //Set breakfast = 0.35
            mealProprtion.put(1, caloRemainder*BREAKFAST_3);
            
            //Set lunch = 0.35
            mealProprtion.put(2, caloRemainder*LUNCH_3);
            
            //Set dinner = 0.3
            mealProprtion.put(3, caloRemainder*DINNER_3);
        }
        
        return mealProprtion;
    }
    
    //Side meal Calculator with standard SIDE_MEAL_SIZE from sources of fruit, nuts, legumes, dairies&dessert
    public static final HashMap<Food,Double> sideMealCalculator(double calories, ArrayList<Food> sideMealSources){
        HashMap<Food,Double> sideMeal = new HashMap();
        int idx = Utils.randomInt(0, sideMealSources.size() - 1);
        double amount = calories*sideMealSources.get(idx).getSize()/sideMealSources.get(idx).getCaloricintake();
        sideMeal.put(sideMealSources.get(idx), amount);
        return sideMeal;
    }
    
    //Carbohydrate Calculator recieving starch sources
    public static final HashMap<Food,Double> carbohydrateCalculator(double calories, ArrayList<Food> starchSources){
        HashMap<Food,Double> starch = new HashMap();
        int idx = Utils.randomInt(0, starchSources.size() - 1);
        double amount = calories*starchSources.get(idx).getSize()/(starchSources.get(idx).getCarbohydrate()*CARBOHYDRATE_TO_KCAL);
        starch.put(starchSources.get(idx), amount);
        return starch;
    }
    
    //Fiber Calculator from 2 sources: fruit and vegetables
    public static final HashMap<Food,Double> fiberCalculator(double calories, ArrayList<Food> fruitSources, ArrayList<Food> vegetablesSources){
        HashMap<Food,Double> fiber = new HashMap();
        int idxFruit = Utils.randomInt(0, fruitSources.size() - 1);
        double amountFruit = FRUIT_FIBER_SOURCE*calories*fruitSources.get(idxFruit).getSize()/(fruitSources.get(idxFruit).getCaloricintake());
        fiber.put(fruitSources.get(idxFruit), amountFruit);
        
        int idxVegetables = Utils.randomInt(0, vegetablesSources.size() - 1);
        double amountVegetables = VEGETABLES_FIBER_SOURCE*calories*vegetablesSources.get(idxVegetables).getSize()/(vegetablesSources.get(idxVegetables).getCaloricintake());
        fiber.put(vegetablesSources.get(idxVegetables), amountVegetables);
        
        return fiber;
    }
    
    //Protein Calculator for breakfasts, which require 1 source of protein from meat/poultry
    public static final HashMap<Food,Double> proteinCalculator(double calories, ArrayList<Food> proteinSources){
        HashMap<Food,Double> protein = new HashMap();
        int idx = Utils.randomInt(0, proteinSources.size() - 1);
        double amount = calories*proteinSources.get(idx).getSize()/(proteinSources.get(idx).getProtein()*PROTEIN_TO_KCAL);
        protein.put(proteinSources.get(idx), amount);   
        return protein;
    }
    
    //Protein Calculator for dinners and lunches, which require 2 sources of protein from meat/poultry and fish/seafood/egg
    public static final HashMap<Food,Double> proteinCalculator(double calories, ArrayList<Food> mainProteinSources, ArrayList<Food> secondaryProteinSource){
        HashMap<Food,Double> protein = new HashMap();
        int idxMain = Utils.randomInt(0, mainProteinSources.size() - 1);
        double amountMain = FIRST_PROTEIN_SOURCE*calories*mainProteinSources.get(idxMain).getSize()/(mainProteinSources.get(idxMain).getProtein()*PROTEIN_TO_KCAL);
        
        int idxSecondary = Utils.randomInt(0, secondaryProteinSource.size() - 1);
        double amountSecondary = SECOND_PROTEIN_SOURCE*calories*secondaryProteinSource.get(idxMain).getSize()/(secondaryProteinSource.get(idxMain).getProtein()*PROTEIN_TO_KCAL);
        
        protein.put(mainProteinSources.get(idxMain), amountMain);
        protein.put(secondaryProteinSource.get(idxSecondary), amountSecondary);
        return protein;
    }
    
    //Fat Calculator receiving sources from dairies&dessert
    public static final HashMap<Food,Double> fatCalculator(double calories, ArrayList<Food> fatSources){
        HashMap<Food,Double> fat = new HashMap();
        int idx = Utils.randomInt(0, fatSources.size() - 1);
        double amount = calories*fatSources.get(idx).getSize()/(fatSources.get(idx).getCarbohydrate()*FAT_TO_KCAL);
        fat.put(fatSources.get(idx), amount);
        return fat;
    }
    
    public static final HashMap<Food,Double> waterCalculator(double demand, ArrayList<Food> waterSources){
        HashMap<Food,Double> water = new HashMap();
        int idx = Utils.randomInt(0, waterSources.size() - 1);
        double amount = demand*waterSources.get(idx).getSize()/(waterSources.get(idx).getWater());
        water.put(waterSources.get(idx), amount);
        return water;
    }
}
