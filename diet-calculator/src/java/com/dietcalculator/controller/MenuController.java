/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.controller;

import com.dietcalculator.dao.DayDAO;
import com.dietcalculator.dao.FoodDAO;
import com.dietcalculator.dao.FoodDetailDAO;
import com.dietcalculator.dao.ImageDAO;
import com.dietcalculator.dao.MealDAO;
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
import java.util.List;
import javax.servlet.RequestDispatcher;
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
        
        //GETTING ACTION
        String action = request.getParameter("action");

        if(action.equals("generate")){
            //GETTING SESSION
            HttpSession currentSession = request.getSession(true);//allowing user to try this functionality before login or sign up
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
            FoodDAO foodDAO = new FoodDAO();
            ArrayList<Food> foodDataset = foodDAO.readFood();

            //GENERTAING DAYS, format: ArrayList: all days in a program
            DayController dc = new DayController();
            ArrayList<Day> days = dc.generateDay(duration, userID, totalCaloricNeed, Constants.PLATE_PORTION.get(preference));

            //GENERATING MEALS, format: ArrayList<Meal>[meals], ArrayList: all days in a program
            MealController mc = new MealController();
            HashMap<Integer, Double> mealProportion = Constants.mealProprtion(main, side);
            ArrayList<ArrayList<Meal>> meals = mc.generateMeal(days, mealProportion);

            //GENERATING FOOD DETAILS, format: ArrayList<FoodDetail>[meals][foodDetails], ArrayList: all days in a program
            FoodDetailController fdc = new FoodDetailController();
            ArrayList<ArrayList<ArrayList<FoodDetail>>> foodDetails = fdc.generateFoodDetail(foodDataset, meals, days);
            
            //GENERATING IMAGES, format: ArrayList<Image>[meals], ArrayList: all days in a program
            ImageController ic = new ImageController();
            ArrayList<ArrayList<ArrayList<String>>> imageUrls = ic.generateImage(foodDetails, meals);
            
            //SETTING THESE ATTRIBUTES TO THE CURRENT SESSION
            currentSession.setAttribute("foodDataset",foodDataset);
            currentSession.setAttribute("days", days);
            currentSession.setAttribute("meals", meals);
            currentSession.setAttribute("foodDetails", foodDetails);
            currentSession.setAttribute("imageUrls", imageUrls);
            
            RequestDispatcher rd = request.getRequestDispatcher("/MenuController?action=show");
            rd.forward(request, response);
            
        }else if(action.equals("show")){
            //GETTING SESSION
            HttpSession currentSession = request.getSession(false);//allowing user to try this functionality before login or sign up
        
            //GETTING PAGE NUMBER
            final int PAGE_SIZE = 7;       //7 days in a week
            
//            if(currentSession.getAttribute("userID") == null){   //Not a signed user
                ArrayList<Food> foodDataset = (ArrayList<Food>) currentSession.getAttribute("foodDataset");
                ArrayList<Day> days = (ArrayList<Day>) currentSession.getAttribute("days");
                ArrayList<ArrayList<Meal>> meals = (ArrayList<ArrayList<Meal>>)currentSession.getAttribute("meals");
                ArrayList<ArrayList<ArrayList<FoodDetail>>> foodDetails = (ArrayList<ArrayList<ArrayList<FoodDetail>>>)currentSession.getAttribute("foodDetails");
                ArrayList<ArrayList<ArrayList<String>>> imageUrls = (ArrayList<ArrayList<ArrayList<String>>>)currentSession.getAttribute("imageUrls");
//            }else{
                
//            }
            int totalPages = (int) Math.ceil(days.size()/PAGE_SIZE);
            Integer page = null;
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            
            if (page == null) {
                page = 1;
            } else if (page > totalPages) {
                page = totalPages;
            }
            
            //GETTING PAGED PARAMETERS
            List<Day> subDays = pagingDays(page,PAGE_SIZE,days);
            ArrayList<List<Meal>> subMeals = pagingMeals(page,PAGE_SIZE,meals);
            ArrayList<List<ArrayList<FoodDetail>>> subFoodDetails = pagingFoodDetails(page,PAGE_SIZE,foodDetails);
            ArrayList<List<ArrayList<String>>> subImageUrls = pagingImageUrls(page,PAGE_SIZE,imageUrls);
            
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("days", subDays);
            request.setAttribute("meals", subMeals);
            request.setAttribute("foodDetails", subFoodDetails);
            request.setAttribute("imageUrls", subImageUrls);
            request.setAttribute("foodDataset", foodDataset);
            
            RequestDispatcher rd = request.getRequestDispatcher("/Menu/Menu.jsp");
            rd.forward(request, response);
            
        }else if(action.equals("details")){
            //GETTING SESSION
            HttpSession currentSession = request.getSession(false);
            if(currentSession == null){
                response.sendRedirect("/HomeController");
            }else{
                ArrayList<Day> days = (ArrayList<Day>)currentSession.getAttribute("days");
                ArrayList<ArrayList<Meal>> meals = (ArrayList<ArrayList<Meal>>)currentSession.getAttribute("meals");
                ArrayList<ArrayList<ArrayList<FoodDetail>>> foodDetails = (ArrayList<ArrayList<ArrayList<FoodDetail>>>)currentSession.getAttribute("foodDetails");
                ArrayList<Food> foodDataset = (ArrayList<Food>) currentSession.getAttribute("foodDataset");

                String mealID = request.getParameter("mealID");

                Day day = null;
                Meal meal = null;
                ArrayList<FoodDetail> foodDetail = new ArrayList();

                if(mealID != null)
                    meal = findMealByMealID(meals, mealID);

                if(meal != null && days != null && foodDataset != null){
                    day = findDayByMealID(days,meal);
                    foodDetail = findFoodDetailByMealID(foodDetails,meal);
                }
                //GETTING FOODNAME
                ArrayList<Food> foodInMeal = new ArrayList();
                for(FoodDetail x: foodDetail)
                    foodInMeal.add(findFoodByFoodID(x.getFoodID(),foodDataset));
                
                ArrayList<ArrayList<FoodDetail>> substitutes = new ArrayList();
                FoodDetailController fdc = new FoodDetailController();
                for(FoodDetail x: foodDetail)
                    substitutes.add(fdc.generateFoodDetailSubstituteByCategory(meal, foodDataset, x.getCategory()));
                
                //GETTING FOODNAME FOR SUBSTITUTES
                ArrayList<ArrayList<Food>> foodSubstitute = new ArrayList();
                
                for(ArrayList<FoodDetail> x: substitutes){
                    ArrayList<Food> tmp = new ArrayList();
                    for(FoodDetail y: x)
                        tmp.add(findFoodByFoodID(y.getFoodID(),foodDataset));
                    foodSubstitute.add(tmp);
                }
                    
                request.setAttribute("day", day);
                request.setAttribute("meal", meal);
                request.setAttribute("foodDetail", foodDetail);
                request.setAttribute("substitutes", substitutes);
                request.setAttribute("foodInMeal", foodInMeal);
                request.setAttribute("foodSubstitute", foodSubstitute);
                RequestDispatcher rd = request.getRequestDispatcher("/Meal/Meal.jsp");
                rd.forward(request, response);
            }
        }
    }
    
    public Meal findMealByMealID(ArrayList<ArrayList<Meal>> meals, String mealID){
        for(ArrayList<Meal> x: meals)
            for(Meal y: x)
                if(y.getMealID().equals(mealID))
                    return y;
        return null;
    }
    
    public Day findDayByMealID(ArrayList<Day> days, Meal meal){
        for(Day x: days)
            if(meal.getDayID().equals(x.getDayID()))
                return x;
        return null;
    }
    
    public ArrayList<FoodDetail> findFoodDetailByMealID(ArrayList<ArrayList<ArrayList<FoodDetail>>> foodDetail, Meal meal){
        for(ArrayList<ArrayList<FoodDetail>> x: foodDetail)
            for(ArrayList<FoodDetail> y: x)
                if(y.get(0).getMealID().equals(meal.getMealID()))
                    return y;
        return null;
            
    }
    
    public Food findFoodByFoodID(String foodID, ArrayList<Food> allApplicableFood){
        for(Food x: allApplicableFood)
            if(x.getFoodID().equals(foodID))
                return x;
        return null;
    }
    
    public ArrayList<List<ArrayList<FoodDetail>>> pagingFoodDetails(int pageNum, int pageSize, ArrayList<ArrayList<ArrayList<FoodDetail>>> foodDetails) {
        int startIndex = (pageNum - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, foodDetails.get(0).size());
        ArrayList<List<ArrayList<FoodDetail>>> subList = new ArrayList();
        
        for(ArrayList<ArrayList<FoodDetail>> fdByMeal: foodDetails){
            List<ArrayList<FoodDetail>> fdByMealAndDay = (List<ArrayList<FoodDetail>>) fdByMeal.subList(startIndex, endIndex);
            subList.add(fdByMealAndDay);
        }
        return subList;
    }
    
    public ArrayList<List<ArrayList<String>>> pagingImageUrls(int pageNum, int pageSize, ArrayList<ArrayList<ArrayList<String>>> imageUrls) {
        int startIndex = (pageNum - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, imageUrls.get(0).size());
        ArrayList<List<ArrayList<String>>> subList = new ArrayList();
        
        for(ArrayList<ArrayList<String>> urlByMeal: imageUrls){
            List<ArrayList<String>> urlByMealAndDay = (List<ArrayList<String>>) urlByMeal.subList(startIndex, endIndex);
            subList.add(urlByMealAndDay);
        }
        return subList;
    }
    
    public ArrayList<List<Meal>> pagingMeals(int pageNum, int pageSize, ArrayList<ArrayList<Meal>> meals) {
        int startIndex = (pageNum - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, meals.get(0).size());
        ArrayList<List<Meal>> subList = new ArrayList();
        
        for(ArrayList<Meal> mealsByMeal: meals){
            List<Meal> mealsByMealAndDay = (List<Meal>) mealsByMeal.subList(startIndex, endIndex);
            subList.add(mealsByMealAndDay);
        }
        return subList;
    }
    
    public List<Day> pagingDays(int pageNum, int pageSize, ArrayList<Day> days) {
        int startIndex = (pageNum - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, days.size());
        List<Day> subList = (List<Day>) days.subList(startIndex, endIndex);
        return subList;
    }
//
//    public static void main(String[] args) {
//        //SAMPLE DATA
//        String userID = "U00000";
//        int week = 8;
//        int mainMeal = 3;
//        int sideMeal = 2;
//        
//        //Generating Food dataset
//        FoodDAO foodDAO = new FoodDAO();
//        ArrayList<Food> foodDataset = foodDAO.readFood();
//        int preference = 1;
//        double caloricNeed = 2200;
//        
//        //Generating days
//        DayController dc =new DayController();
//        ArrayList<Day> days = dc.generateDay(week, userID, caloricNeed, Constants.PLATE_PORTION.get(preference));
//        
//        //Testing
////        for(Day day: days)
////            System.out.println(day);
//        
//        //Generating meals
//        MealController mc = new MealController();
//        HashMap<Integer, Double> mealProportion = Constants.mealProprtion(mainMeal, sideMeal);
//        ArrayList<ArrayList<Meal>> meals = mc.generateMeal(days, mealProportion);
//        
//        //Testing
////        for(int i = 0; i < mainMeal+sideMeal; i++){
////            for(int j = 0; j < days.size(); j++){
////                 System.out.println(meals.get(i).get(j));
////            }
////        }
//        
//
////        //Generating Food Details
//        FoodDetailController fdc = new FoodDetailController();
//        ArrayList<ArrayList<ArrayList<FoodDetail>>> foodDetails = fdc.generateFoodDetail(foodDataset, meals, days);
//        
//        //Generating Images
//        ImageController ic = new ImageController();
//        ArrayList<ArrayList<ArrayList<Image>>> images = ic.generateImage(foodDetails, meals);
//        
//        //Tetsing
//        for(int j = 0; j < mealProportion.size(); j++){
//            System.out.println("\tMEAL: " + Constants.MEAL.get(meals.get(j).get(0).getMealindex()));
//            for(int i = 0; i < days.size(); i++){
//                System.out.println("DAY: " + (i+1));
//                for(int k = 0; k < Constants.FOOD_DETAIL_BY_MEAL.get(meals.get(j).get(0).getMealindex()).length; k++){
//                    System.out.println(foodDetails.get(j).get(i).get(k));
//                    System.out.println(images.get(j).get(i).get(k));
//                }
//            }
//        }
////        //CHECK UPDATES ON MEALS AND DAYS
//        for(int i = 0; i < mainMeal + sideMeal; i++){
//            System.out.println(Constants.MEAL.get(meals.get(i).get(0).getMealindex()));
//            for(int j = 0; j < days.size(); j++)
//                System.out.println(meals.get(i).get(j));
//        }
//    }
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
