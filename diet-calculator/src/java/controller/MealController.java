/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.dietcalculator.dao.MealDAO;
import com.dietcalculator.dto.Day;
import com.dietcalculator.dto.Meal;
import com.dietcalculator.util.Constants;
import com.dietcalculator.util.MealValues;
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
public class MealController extends HttpServlet {
    private final String MEAL_ID_FORMAT_STRING = "MEAL%06d";
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
            out.println("<title>Servlet MealController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MealController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    public ArrayList<Meal> generateMeal(Day day, HashMap<Integer, Double> mealProportion){
        ArrayList<Meal> meals = new ArrayList();
        
        //Getting the last ID index
        MealDAO mealDAO = new MealDAO();
        String lastIDIndex = mealDAO.lastIDIndex();
        int lastIndex = Utils.extractIntFromString(lastIDIndex);
                  
        //Getting day standard values
        String userID = day.getUserID();
        String dayID = day.getDayID();
        double totalCalstd_day = day.getTotalCalstd();
        double carbohydratestd_day = day.getCarbohydratestd();
        double fiberstd_day = day.getFiberstd();
        double proteinstd_day = day.getProteinstd();
        double fatstd_day = day.getFatstd();
        double waterstd_day = day.getWaterstd();
        for(int i: mealProportion.keySet()){
            String mealID = String.format(MEAL_ID_FORMAT_STRING, ++lastIndex);
     
            //Getting proportion
            double proportion = mealProportion.get(i);
   
            //Generating meal standard values
            double totalCalstd = totalCalstd_day*proportion;
            double carbohydratestd = carbohydratestd_day*proportion;
            double fiberstd = fiberstd_day*proportion;
            double proteinstd = proteinstd_day*proportion;
            double fatstd = fatstd_day*proportion;
            double waterstd = waterstd_day*proportion;
            
            //Create a new meal instance
            meals.add(new Meal(mealID,userID,dayID,i,totalCalstd,carbohydratestd,fiberstd,proteinstd,fatstd,waterstd));
        }
        return meals;
    }
    
    //Check
    public static void main(String[] args) {
        MealController mc = new MealController();
//        ArrayList<MealController> list = mc.generateMeal(day, Constants.mealProprtion(3, 2));
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
