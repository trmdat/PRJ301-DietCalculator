/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.dietcalculator.dto.Food;
import com.dietcalculator.dto.FoodDetail;
import com.dietcalculator.dto.Meal;
import com.dietcalculator.util.Constants;
import static com.dietcalculator.util.Constants.CARBOHYDRATE_TO_KCAL;
import static com.dietcalculator.util.Constants.FAT_FROM_DAIRIES_AND_DESSERT;
import static com.dietcalculator.util.Constants.FAT_TO_KCAL;
import static com.dietcalculator.util.Constants.FIRST_PROTEIN_SOURCE;
import static com.dietcalculator.util.Constants.FOOD_DETAIL_BY_MEAL;
import static com.dietcalculator.util.Constants.FRUIT_FIBER_SOURCE;
import static com.dietcalculator.util.Constants.PROTEIN_TO_KCAL;
import static com.dietcalculator.util.Constants.RELATIVE_ESTIMATE;
import static com.dietcalculator.util.Constants.SECOND_PROTEIN_SOURCE;
import static com.dietcalculator.util.Constants.VEGETABLES_FIBER_SOURCE;
import com.dietcalculator.util.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asout
 */
public class FoodDetailController extends HttpServlet {
 
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FoodDetailController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FoodDetailController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    //Side meal Calculator with standard SIDE_MEAL_SIZE from sources of fruit, nuts, legumes, dairies&dessert
    public final FoodDetail generateFoodDetail(Meal meal, ArrayList<Food> foodDataset, String category){
        FoodDetail detail = new FoodDetail();
        int idx = Utils.randomInt(0, foodDataset.size() - 1);
        //Calculating ratio based category
        double ratio = 0;
        double calories = 0;
        if(category.equalsIgnoreCase("fruit/nuts/legumes/dairies&dessert")){
            //the amount of break fast is based on Calories 
            calories = meal.getCarbohydratestd();   //NO NEED FOR RELATIVE_ESTIMATE
            ratio = calories/foodDataset.get(idx).getCaloricintake();
        }else if(category.equalsIgnoreCase("vegetables")){
            //the amount of vegetables is based on Fiber 
            calories = RELATIVE_ESTIMATE*meal.getFiberstd()*VEGETABLES_FIBER_SOURCE;
            ratio = calories/(foodDataset.get(idx).getFiber()*CARBOHYDRATE_TO_KCAL);
        }else if(category.equalsIgnoreCase("fruit")){
            //the amount of fruit is based on Fiber 
            calories = RELATIVE_ESTIMATE*meal.getFiberstd()*FRUIT_FIBER_SOURCE;
            ratio = calories/(foodDataset.get(idx).getFiber()*CARBOHYDRATE_TO_KCAL);
        }else if(category.equalsIgnoreCase("meat/poultry")){
            //the amount of meat is based on Protein 
            calories = RELATIVE_ESTIMATE*meal.getProteinstd()*FIRST_PROTEIN_SOURCE;
            ratio = calories/(foodDataset.get(idx).getProtein()*PROTEIN_TO_KCAL);
        }else if(category.equalsIgnoreCase("fish/seafood/egg")){
            //the amount of fish/seafood/egg is based on Protein 
            calories = RELATIVE_ESTIMATE*meal.getProteinstd()*SECOND_PROTEIN_SOURCE;
            ratio = calories/(foodDataset.get(idx).getProtein()*PROTEIN_TO_KCAL);
        }else if(category.equalsIgnoreCase("starch")){
            //the amount of starch is based on Carbohydrate 
            calories = RELATIVE_ESTIMATE*meal.getCarbohydratestd();
            ratio = calories/(foodDataset.get(idx).getCarbohydrate()*CARBOHYDRATE_TO_KCAL);}
        else if(category.equalsIgnoreCase("dairies&dessert")){
            //the amount of dairies and dessert is based on Fat 
            calories = FAT_FROM_DAIRIES_AND_DESSERT*meal.getFatstd();   //FAT ALSO COMES FROM MEAT AND OTHER FOOD
            ratio = calories/(foodDataset.get(idx).getCarbohydrate()*FAT_TO_KCAL);}
        else if(category.equalsIgnoreCase("drink")){
            //the amount of drink is based on Water 
            calories = meal.getWaterstd();  //NO NEED FOR RELATIVE_ESTIMATE
            ratio = calories/(foodDataset.get(idx).getWater());
        }
        
        //Setting parameters
        detail.setFoodID(foodDataset.get(idx).getFoodID());
        detail.setMealID("");
        detail.setAmount(ratio*foodDataset.get(idx).getSize());
        detail.setTotalCal(ratio*foodDataset.get(idx).getCaloricintake());
        detail.setCarbohydrate(ratio*foodDataset.get(idx).getCarbohydrate());
        detail.setFiber(ratio*foodDataset.get(idx).getFiber());
        detail.setProtein(ratio*foodDataset.get(idx).getProtein());
        detail.setFat(ratio*foodDataset.get(idx).getFat());
        detail.setWater(ratio*foodDataset.get(idx).getWater());
        
        return detail;
    }
    
    public final ArrayList<FoodDetail>[] generateFoodDetail(ArrayList<Food> allApplicableFood, Meal meal, int numDay){
        String[] listOfFoodDetail = Constants.FOOD_DETAIL_BY_MEAL.get(meal.getMealindex());
        ArrayList<FoodDetail>[] details = new ArrayList[listOfFoodDetail.length];
        //Initializing the array
        for(int i = 0; i < listOfFoodDetail.length; i++)
            details[i] = new ArrayList();
        
        FoodController fc = new FoodController();
        ArrayList<Food> foodOfCategory= null;
            for(int i = 0; i < listOfFoodDetail.length; i++){
                foodOfCategory = fc.listFoodByCategory(allApplicableFood, listOfFoodDetail[i]);
                for(int j = 0; j < numDay; j++){
                    details[i].add(generateFoodDetail(meal,foodOfCategory,listOfFoodDetail[i]));
                }
            }
        return details;
    }
//    
//    public static final FoodDetail sideMealCalculator(double calories, ArrayList<Food> sideMealSources){
//        FoodDetail detail = new FoodDetail();
//        int idx = Utils.randomInt(0, sideMealSources.size() - 1);
//        //Calculating ratio based on calories size
//        double ratio = calories/sideMealSources.get(idx).getCaloricintake();
//        
//        //Setting parameters
//        detail.setFoodID(sideMealSources.get(idx).getFoodID());
//        detail.setMealID("");
//        detail.setAmount(ratio*sideMealSources.get(idx).getSize());
//        detail.setTotalCal(ratio*sideMealSources.get(idx).getCaloricintake());
//        detail.setCarbohydrate(ratio*sideMealSources.get(idx).getCarbohydrate());
//        detail.setFiber(ratio*sideMealSources.get(idx).getFiber());
//        detail.setProtein(ratio*sideMealSources.get(idx).getProtein());
//        detail.setFat(ratio*sideMealSources.get(idx).getFat());
//        detail.setWater(ratio*sideMealSources.get(idx).getWater());
//        
//        return detail;
//    }
//    
//    //Carbohydrate Calculator recieving starch sources
//    public static final FoodDetail carbohydrateCalculator(double calories, ArrayList<Food> starchSources){
//        FoodDetail detail = new FoodDetail();
//        int idx = Utils.randomInt(0, starchSources.size() - 1);
//        
//        //Calculating ratio based on calories size
//        double ratio = calories/(starchSources.get(idx).getCarbohydrate()*CARBOHYDRATE_TO_KCAL);
//        
//        //Setting parameters
//        detail.setFoodID(starchSources.get(idx).getFoodID());
//        detail.setMealID("");
//        detail.setAmount(ratio*starchSources.get(idx).getSize());
//        detail.setTotalCal(ratio*starchSources.get(idx).getCaloricintake());
//        detail.setCarbohydrate(ratio*starchSources.get(idx).getCarbohydrate());
//        detail.setFiber(ratio*starchSources.get(idx).getFiber());
//        detail.setProtein(ratio*starchSources.get(idx).getProtein());
//        detail.setFat(ratio*starchSources.get(idx).getFat());
//        detail.setWater(ratio*starchSources.get(idx).getWater());
//        
//        return detail;
//    }
//    
//    //Fiber Calculator from 2 sources: fruit and vegetables
//    public static final HashMap<Food,Double> fiberCalculator(double calories, ArrayList<Food> fruitSources, ArrayList<Food> vegetablesSources){
//        HashMap<Food,Double> fiber = new HashMap();
//        int idxFruit = Utils.randomInt(0, fruitSources.size() - 1);
//        double amountFruit = FRUIT_FIBER_SOURCE*calories*fruitSources.get(idxFruit).getSize()/(fruitSources.get(idxFruit).getFiber()*CARBOHYDRATE_TO_KCAL);
//        fiber.put(fruitSources.get(idxFruit), amountFruit);
//        
//        int idxVegetables = Utils.randomInt(0, vegetablesSources.size() - 1);
//        double amountVegetables = VEGETABLES_FIBER_SOURCE*calories*vegetablesSources.get(idxVegetables).getSize()/(vegetablesSources.get(idxVegetables).getFiber()*CARBOHYDRATE_TO_KCAL);
//        fiber.put(vegetablesSources.get(idxVegetables), amountVegetables);
//        
//        return fiber;
//    }
//    
//    //Protein Calculator for breakfasts, which require 1 source of protein from meat/poultry
//    public static final HashMap<Food,Double> proteinCalculator(double calories, ArrayList<Food> proteinSources){
//        HashMap<Food,Double> protein = new HashMap();
//        int idx = Utils.randomInt(0, proteinSources.size() - 1);
//        double amount = calories*proteinSources.get(idx).getSize()/(proteinSources.get(idx).getProtein()*PROTEIN_TO_KCAL);
//        protein.put(proteinSources.get(idx), amount);   
//        return protein;
//    }
//    
//    //Protein Calculator for dinners and lunches, which require 2 sources of protein from meat/poultry and fish/seafood/egg
//    public static final HashMap<Food,Double> proteinCalculator(double calories, ArrayList<Food> mainProteinSources, ArrayList<Food> secondaryProteinSource){
//        HashMap<Food,Double> protein = new HashMap();
//        int idxMain = Utils.randomInt(0, mainProteinSources.size() - 1);
//        double amountMain = FIRST_PROTEIN_SOURCE*calories*mainProteinSources.get(idxMain).getSize()/(mainProteinSources.get(idxMain).getProtein()*PROTEIN_TO_KCAL);
//        
//        int idxSecondary = Utils.randomInt(0, secondaryProteinSource.size() - 1);
//        double amountSecondary = SECOND_PROTEIN_SOURCE*calories*secondaryProteinSource.get(idxMain).getSize()/(secondaryProteinSource.get(idxMain).getProtein()*PROTEIN_TO_KCAL);
//        
//        protein.put(mainProteinSources.get(idxMain), amountMain);
//        protein.put(secondaryProteinSource.get(idxSecondary), amountSecondary);
//        return protein;
//    }
//    
//    //Fat Calculator receiving sources from dairies&dessert
//    public static final HashMap<Food,Double> fatCalculator(double calories, ArrayList<Food> fatSources){
//        HashMap<Food,Double> fat = new HashMap();
//        int idx = Utils.randomInt(0, fatSources.size() - 1);
//        double amount = calories*fatSources.get(idx).getSize()/(fatSources.get(idx).getCarbohydrate()*FAT_TO_KCAL);
//        fat.put(fatSources.get(idx), amount);
//        return fat;
//    }
//    
//    public static final HashMap<Food,Double> waterCalculator(double demand, ArrayList<Food> waterSources){
//        HashMap<Food,Double> water = new HashMap();
//        int idx = Utils.randomInt(0, waterSources.size() - 1);
//        double amount = demand*waterSources.get(idx).getSize()/(waterSources.get(idx).getWater());
//        water.put(waterSources.get(idx), amount);
//        return water;
//    }
//    
    
    private ArrayList<Food> foodSelection(ArrayList<Food> foodDataset, String foodCategory){
        String[] subFoodCategory = foodCategory.split("/");
        ArrayList<Food> foodSelection= new ArrayList();
        
        return foodSelection;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
