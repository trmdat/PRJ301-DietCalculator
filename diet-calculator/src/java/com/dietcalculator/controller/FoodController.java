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
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null || action.equals("read")) {
            FoodDAO dao = new FoodDAO();
            ArrayList<Food> foodList = dao.readFood();
            RequestDispatcher rd = request.getRequestDispatcher("Food/View&DeleteFood.jsp");
            request.setAttribute("foodList", foodList);
            rd.forward(request, response);
        } else if (action.equals("create")) {
            
            
            RequestDispatcher rd = request.getRequestDispatcher("");
            rd.forward(request, response);
        } else if (action.equals("update")) {
            
            
            RequestDispatcher rd = request.getRequestDispatcher("");
            rd.forward(request, response);
        } else if (action.equals("delete")) {
            
            
            RequestDispatcher rd = request.getRequestDispatcher("");
            rd.forward(request, response);
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

}
