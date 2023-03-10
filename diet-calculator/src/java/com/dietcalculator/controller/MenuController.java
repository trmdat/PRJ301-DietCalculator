/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.controller;

import com.dietcalculator.dao.FoodDAO;
import com.dietcalculator.dao.ImageDAO;
import com.dietcalculator.dto.Day;
import com.dietcalculator.dto.Food;
import com.dietcalculator.dto.FoodDetail;
import com.dietcalculator.dto.Image;
import com.dietcalculator.dto.Meal;
import com.dietcalculator.util.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author asout
 */
public class MenuController extends HttpServlet {

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
        //GETTING SESSION
        HttpSession currentSession = request.getSession(true);//allowing user to try this functionality before login or sign up
        
        //GETTING ACTION
        String action = request.getParameter("action");
        
        if(action.equals("generate")){
            //GETTING FORM PARAMETERS
            int age = Integer.parseInt(request.getParameter("age"));
            int gender = Integer.parseInt(request.getParameter("gender"));
            double height = Double.parseDouble(request.getParameter("height"));
            double weight = Double.parseDouble(request.getParameter("weight"));
            int activity = Integer.parseInt(request.getParameter("activity"));
            int preference = Integer.parseInt(request.getParameter("preference"));
            int goal = Integer.parseInt(request.getParameter("goal"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            int duration = Integer.parseInt(request.getParameter("duration"));
            int main = Integer.parseInt(request.getParameter("main"));
            int side = Integer.parseInt(request.getParameter("side"));
            int session = Integer.parseInt(request.getParameter("session"));

            //GETTING USERID
            String userID = request.getParameter("userID"); //should check session for userID

            //CALCULATING CALORIC NEED
            double totalCaloricNeed = Constants.totalCaloricNeed(gender, weight, height, age, activity, goal, amount, age);

            //GENERATING FOOD DATASET
            ArrayList<Food> foodDataset = new ArrayList();

            //GENERTAING DAYS, format: ArrayList: all days in a program
            DayController dc = new DayController();
            ArrayList<Day> days = dc.generateDay(duration, userID, totalCaloricNeed, Constants.PLATE_PORTION.get(preference));

            //GENERATING MEALS, format: ArrayList<Meal>[meals], ArrayList: all days in a program
            MealController mc = new MealController();
            HashMap<Integer, Double> mealProportion = Constants.mealProprtion(main, side);
            ArrayList<Meal>[] meals = mc.generateMeal(days, mealProportion);

            //GENERATING FOOD DETAILS, format: ArrayList<FoodDetail>[meals][foodDetails], ArrayList: all days in a program
            FoodDetailController fdc = new FoodDetailController();
            ArrayList<FoodDetail>[][] foodDetails = fdc.generateFoodDetail(foodDataset, meals, days);
            
            //GENERATING IMAGES, format: ArrayList<Image>[meals], ArrayList: all days in a program
            ImageController ic = new ImageController();
            ArrayList<Image>[][] images = ic.generateImage(foodDetails, meals);
            
            //SETTING THESE ATTRIBUTES TO THE CURRENT SESSION
            currentSession.setAttribute("days", days);
            currentSession.setAttribute("meals", meals);
            currentSession.setAttribute("foodDetails", foodDetails);
            currentSession.setAttribute("images", images);
        }else if(action.equals("show")){
            //GETTING PAGE NUMBER
            final int PAGE_SIZE = 7;       //7 days in a week
            Integer page = null;
            try{
                page = Integer.parseInt(request.getParameter("page"));
            }catch(Exception e){
                System.out.println(e.getMessage());
            }

            if(page == null)
                page = 0;
            
            ArrayList<FoodDetail>[][] foodDetailsByWeek = null;
            ArrayList<Image>[][] imagesByWeek = null;

            
            }
        }
//
    public static void main(String[] args) {
        //SAMPLE DATA
        String userID = "U00000";
        int week = 8;
        int mainMeal = 3;
        int sideMeal = 2;
        
        //Generating Food dataset
        FoodDAO foodDAO = new FoodDAO();
        ArrayList<Food> foodDataset = foodDAO.readFood();
        int preference = 1;
        double caloricNeed = 2200;
        
        //Generating days
        DayController dc =new DayController();
        ArrayList<Day> days = dc.generateDay(week, userID, caloricNeed, Constants.PLATE_PORTION.get(preference));
        
        //Testing
//        for(Day day: days)
//            System.out.println(day);
//        
        //Generating meals
        MealController mc = new MealController();
        HashMap<Integer, Double> mealProportion = Constants.mealProprtion(mainMeal, sideMeal);
        ArrayList<Meal>[] meals = mc.generateMeal(days, mealProportion);
        
        //Testing
//        for(int i = 0; i < meals.length; i++){
//            System.out.println(Constants.MEAL.get(meals[i].get(0).getMealindex()));
//            for(int j = 0; j < days.size(); j++){
//                System.out.println(meals[i].get(j));
//            }
//        }

        //Generating Food Details
        FoodDetailController fdc = new FoodDetailController();
        ArrayList<FoodDetail>[][] foodDetails = fdc.generateFoodDetail(foodDataset, meals, days);
        
        //Generating Images
        ImageController ic = new ImageController();
        ArrayList<Image>[][] images = ic.generateImage(foodDetails, meals);
        
        //Tetsing
        for(int i = 0; i < days.size(); i++){
            System.out.println("DAY: " + (i+1));
            for(int j = 0; j < mealProportion.size(); j++){
                System.out.println("\tMEAL: " + Constants.MEAL.get(meals[j].get(0).getMealindex()));
                for(int k = 0; k < Constants.FOOD_DETAIL_BY_MEAL.get(meals[j].get(0).getMealindex()).length; k++){
                    System.out.println(foodDetails[j][k].get(i));
                    System.out.println(images[j][k].get(i));
                }
            }
        }
        
         

        //CHECK UPDATES ON MEALS AND DAYS
        for(int i = 0; i < meals.length; i++){
            System.out.println(Constants.MEAL.get(meals[i].get(0).getMealindex()));
            for(int j = 0; j < days.size(); j++)
                System.out.println(meals[i].get(j));
        }
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
