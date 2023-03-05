package com.dietcalculator.controller;

import com.dietcalculator.dao.ExerciseDAO;
import com.dietcalculator.dto.Exercise;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
//@WebServlet(name = "ExerciseController", urlPatterns = {"/exercisecontroller"})
public class ExerciseController extends HttpServlet {

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

        ExerciseDAO exerciseDAO = new ExerciseDAO();

        String id = "";
        String exName = "";
        double lowerweight = 0;
        double upperweight = 0;
        int calorexp = 0;

        if (action == null || action.equals("list")) {
            List<Exercise> list = exerciseDAO.readExercise();

            request.setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("Adminstrator/Exercise.jsp");
            rd.forward(request, response);
        } else if (action.equals("create")) {
            try {
                id = request.getParameter("exerciseID");
                exName = request.getParameter("exname");
                lowerweight = Double.parseDouble(request.getParameter("lowerweight"));
                upperweight = Double.parseDouble(request.getParameter("upperweight"));
                calorexp = Integer.parseInt(request.getParameter("calorexp"));
            } catch (Exception e) {
            }
            if (id != null) {
                exerciseDAO.createExercise(id, exName, lowerweight, upperweight, calorexp);
            }
            
            response.sendRedirect("exercisecontroller");
        } else if (action.equals("delete")) {
            StringBuilder ids = new StringBuilder();
            
            for (String checkedid : request.getParameterValues("checkId")) {
                ids.append("'").append(checkedid).append("',");
            }
            ids.deleteCharAt(ids.length() - 1);

            exerciseDAO.deleteMultipleExercise(ids);
            
            response.sendRedirect("exercisecontroller");
        } else if (action.equals("edit")) {
            if (request.getParameter("jump") != null) {
                try {
                    id = request.getParameter("exerciseID");
                } catch (NumberFormatException ex) {
                }
                Exercise ex = readexerciseByID(id);

                request.setAttribute("exercise", ex);
                RequestDispatcher rd = request.getRequestDispatcher("Adminstrator/EditExercise.jsp");
                rd.forward(request, response);
            } else {
                try {
                    id = request.getParameter("exerciseID");
                    exName = request.getParameter("exname");
                    lowerweight = Double.parseDouble(request.getParameter("lowerweight"));
                    upperweight = Double.parseDouble(request.getParameter("upperweight"));
                    calorexp = Integer.parseInt(request.getParameter("calorexp"));
                } catch (NumberFormatException ex) {
                }

                if (id != null) {
                    exerciseDAO.updateExercise(id, exName, lowerweight, upperweight, calorexp);
                }

                
                response.sendRedirect("exercisecontroller");
            }

        }
    }
    
    protected Exercise readexerciseByID(String exID) {
        ExerciseDAO dao = new ExerciseDAO();
        List<Exercise> list = dao.readExercise();
        for (Exercise ex : list) {
            if(ex.getExerciseID().equals(exID)){
                return ex;
            }
        }
        return null;
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
