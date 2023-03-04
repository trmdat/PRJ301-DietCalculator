/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.dietcalculator.dao.FoodDAO;
import com.dietcalculator.dto.Day;
import com.dietcalculator.dto.Food;
import com.dietcalculator.dto.FoodDetail;
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

/**
 *
 * @author asout
 */
public class MainController extends HttpServlet {

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
            out.println("<title>Servlet MainController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MainController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        for(Day day: days)
            System.out.println(day);
        
        //Generating meals
        MealController mc = new MealController();
        HashMap<Integer, Double> mealProportion = Constants.mealProprtion(mainMeal, sideMeal);
        ArrayList<Meal>[] meals = mc.generateMeal(days, mealProportion);
        
        //Testing
        for(int i = 0; i < meals.length; i++){
            System.out.println(Constants.MEAL.get(meals[i].get(0).getMealindex()));
            for(int j = 0; j < days.size(); j++){
                System.out.println(meals[i].get(j));
            }
        }

        //Generating Food Details
        FoodDetailController fdc = new FoodDetailController();
        ArrayList<FoodDetail>[][] foodDetails = fdc.generateFoodDetail(foodDataset, meals, days);
        //Tetsing
        for(int i = 0; i < days.size(); i++){
            System.out.println("DAY: " + (i+1));
            for(int j = 0; j < mealProportion.size(); j++){
                System.out.println("\tMEAL: " + Constants.MEAL.get(meals[j].get(0).getMealindex()));
                for(int k = 0; k < Constants.FOOD_DETAIL_BY_MEAL.get(meals[j].get(0).getMealindex()).length; k++){
                    System.out.println(foodDetails[j][k].get(i));
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
