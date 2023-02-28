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
        //GETTING SAMPLE FOODDATASET, WHICH IS THE WHOLE FOOD TABLE
        FoodDAO foodDAO = new FoodDAO();
        ArrayList<Food> foodDataset = foodDAO.readFood();
//        for(Food f: foodDataset)
//            System.out.println(f);
        
        //GENERTING A SAMPLE 20 OF 20 DAYS WITH USERID = U00001, CALORIC NEED = 2200, PREFERENCE = ASIAN AND PACIFIC
        DayController dc =new DayController();

        ArrayList<Day> days = dc.generateDay(10,"U00001",2200,Constants.PLATE_PORTION.get(1));
//        for(Day d: days)
//            System.out.println(d);
//        
        //GENERATING A SAMPLE OF MEALS WITH 3 MAIN MEALS AND 2 SIDE MEALS PER DAY
        MealController mc = new MealController();
        ArrayList<Meal> meals = new ArrayList();
        ArrayList<Meal> subMeals = new ArrayList();
        for(Day day: days){    
            subMeals = mc.generateMeal(day, Constants.mealProprtion(3, 2));
            for(Meal t: subMeals)
                meals.add(t);
        }
//        for(Meal m: meals)
//            System.out.println(m);

//        FoodController fd = new FoodController();
//        for(Food x: fd.listFoodByCategory(foodDataset, "vegetables/fruit"))
//            System.out.println(x);
        //GENERATING SAMPLE FOOD DETAILS
        FoodDetailController fdc = new FoodDetailController();
        
        //GENERATING FOOD DETAILS FOR 10 DAYS
//        ArrayList<FoodDetail>[] breakfasts = fdc.generateFoodDetail(foodDataset, meals.get(0), 56);
//        for(ArrayList<FoodDetail> x: breakfasts)
//            for(FoodDetail y: x)
//                System.out.println(y);
        
//        ArrayList<FoodDetail>[] lunch = fdc.generateFoodDetail(foodDataset, meals.get(1), 56);
//        for(ArrayList<FoodDetail> x: lunch)
//            for(FoodDetail y: x)
//                System.out.println(y);
        
//        ArrayList<FoodDetail>[] dinner = fdc.generateFoodDetail(foodDataset, meals.get(2), 56);
//        for(ArrayList<FoodDetail> x: dinner)
//            for(FoodDetail y: x)
//                System.out.println(y);
//        
        ArrayList<FoodDetail>[] brunch = fdc.generateFoodDetail(foodDataset, meals.get(3), 56);
        for(ArrayList<FoodDetail> x: brunch)
            for(FoodDetail y: x)
                System.out.println(y);
        
//        ArrayList<FoodDetail>[] supper = fdc.generateFoodDetail(foodDataset, meals.get(4), 56);
//        for(ArrayList<FoodDetail> x: supper)
//            for(FoodDetail y: x)
//                System.out.println(y);
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
