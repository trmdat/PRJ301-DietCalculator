/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.controller;

import com.dietcalculator.dao.FoodDAO;
import com.dietcalculator.dto.Food;
import com.dietcalculator.util.Constants;
import com.dietcalculator.util.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asout
 */
public class FoodController extends HttpServlet {

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

        String action = request.getParameter("action");
        FoodDAO dao = new FoodDAO();

        if (action == null || action.equals("read")) {

            ArrayList<Food> foodList = dao.readFood();
            request.setAttribute("foodList", foodList);
            RequestDispatcher rd = request.getRequestDispatcher("Food/View&DeleteFood.jsp");

            rd.forward(request, response);
        } else if (action.equals("create")) {
            if (!request.getParameter("foodID").isEmpty()) {
                try {
                    String foodID = request.getParameter("foodID");
                    String foodname = request.getParameter("foodname");
                    String category = request.getParameter("category");
                    int size = Integer.parseInt(request.getParameter("size"));
                    int caloricintake = Integer.parseInt(request.getParameter("caloricintake"));
                    Double carbohydrate = Double.parseDouble(request.getParameter("carbohydrate"));
                    Double fiber = Double.parseDouble(request.getParameter("fiber"));
                    Double protein = Double.parseDouble(request.getParameter("protein"));
                    Double fat = Double.parseDouble(request.getParameter("fat"));
                    Double water = Double.parseDouble(request.getParameter("water"));
                    dao.createFood(foodID, foodname, category, size, caloricintake, carbohydrate, fiber, protein, fat, water);
                } catch (Exception e) {
                }

                response.sendRedirect("FoodController");
            } else {
                response.sendRedirect("FoodController");
            }
        } else if (action.equals("update")) {
            if (request.getParameter("foodname") == null) {
                Food food = foodByID(request.getParameter("foodID"));
                request.setAttribute("food", food);
                RequestDispatcher rd = request.getRequestDispatcher("Food/EditFood.jsp");
                rd.forward(request, response);
            } else if (!request.getParameter("foodname").isEmpty()) {
                try {
                    String foodID = request.getParameter("foodID");
                    String foodname = request.getParameter("foodname");
                    String category = request.getParameter("category");
                    int size = Integer.parseInt(request.getParameter("size"));
                    int caloricintake = Integer.parseInt(request.getParameter("caloricintake"));
                    Double carbohydrate = Double.parseDouble(request.getParameter("carbohydrate"));
                    Double fiber = Double.parseDouble(request.getParameter("fiber"));
                    Double protein = Double.parseDouble(request.getParameter("protein"));
                    Double fat = Double.parseDouble(request.getParameter("fat"));
                    Double water = Double.parseDouble(request.getParameter("water"));
                    dao.updateFood(foodID, foodname, category, size, caloricintake, carbohydrate, fiber, protein, fat, water);
                } catch (Exception e) {
                }
                response.sendRedirect("FoodController");
            }
        } else if (action.equals("delete")) {
            String[] ids = request.getParameterValues("foodID");
            if (ids != null) {
                for (String id : ids) {
                    dao.deleteFood(id);
                }
            }

//              RequestDispatcher rd = request.getRequestDispatcher("FoodController");   
//              request.removeAttribute("action");
//              rd.forward(request, response);
            response.sendRedirect("FoodController");
        }
    }

    public ArrayList<Food> listFoodByCategory(ArrayList<Food> FoodDataset, String category) {
        ArrayList<Food> foodList = new ArrayList();
        String[] categories = category.trim().split(Constants.DELIMITER);
        for (Food x : FoodDataset) {
            if (Utils.isInStringArray(categories, x.getCategory())) {
                foodList.add(x);
            }
        }
        return foodList;
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

    private Food foodByID(String foodID) {
        FoodDAO dao = new FoodDAO();
        ArrayList<Food> list = dao.readFood();
        for (Food food : list) {
            if (food.getFoodID().equals(foodID)) {
                return food;
            }
        }
        return null;
    }

}
