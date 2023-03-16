package com.dietcalculator.controller;

import com.dietcalculator.dao.ExerciseDAO;
import com.dietcalculator.dto.Exercise;
import com.dietcalculator.dto.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

//        // Check security
//        HttpSession session = request.getSession(false);
//        User currentUser = null;
//
//        if (session != null) {
//            currentUser = (User) session.getAttribute("user");
//        }
//
//        log("Debug: " + currentUser);
//        if (currentUser == null) {
//            log("Debug: Redirect to login page" + currentUser);
//            response.sendRedirect(request.getContextPath() + "/LoginController");
//            return;
//        }

        ExerciseDAO exerciseDAO = new ExerciseDAO();

        String id = "";
        String exName = "";
        double lowerweight = 0;
        double upperweight = 0;
        int calorexp = 0;
        String icon = "";
        String description = "";

        if (action == null || action.equals("list")) {
            List<Exercise> fullList = exerciseDAO.readExercise();

            int pageSize = 12;
            int totalPages = (int) Math.ceil(fullList.size() / pageSize);
            Integer page = null;
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
            }
            if (page == null) {
                page = 1;
            } else if (page > totalPages) {
                page = totalPages;
            }
            List<Exercise> list = paginExercise(page, pageSize, fullList);

            request.setAttribute("page", (int) page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("./Administrator/Exercise.jsp");
            rd.forward(request, response);
        } else if (action.equals("create")) {
            try {
                id = request.getParameter("exerciseID");
                exName = request.getParameter("exname");
                lowerweight = Double.parseDouble(request.getParameter("lowerweight"));
                upperweight = Double.parseDouble(request.getParameter("upperweight"));
                calorexp = Integer.parseInt(request.getParameter("calorexp"));
                icon = request.getParameter("icon");
                description = request.getParameter("description");
            } catch (Exception e) {
            }
            if (id != null) {
                exerciseDAO.createExercise(id, exName, lowerweight, upperweight, calorexp, icon, description);
            }

            response.sendRedirect("ExerciseController");
        } else if (action.equals("delete")) {
            String[] ids = request.getParameterValues("checkId");
            if (ids != null) {
                for (String checkedid : ids) {
                    exerciseDAO.deleteExercise(checkedid);
                }
            }

            response.sendRedirect("ExerciseController");
        } else if (action.equals("edit")) {
            if (request.getParameter("jump") != null) {
                try {
                    id = request.getParameter("exerciseID");
                } catch (NumberFormatException ex) {
                }
                Exercise ex = readexerciseByID(id);

                request.setAttribute("exercise", ex);
                RequestDispatcher rd = request.getRequestDispatcher("./Administrator/EditExercise.jsp");
                rd.forward(request, response);
            } else {
                try {
                    id = request.getParameter("exerciseID");
                    exName = request.getParameter("exname");
                    lowerweight = Double.parseDouble(request.getParameter("lowerweight"));
                    upperweight = Double.parseDouble(request.getParameter("upperweight"));
                    calorexp = Integer.parseInt(request.getParameter("calorexp"));
                    icon = request.getParameter("icon");
                    description = request.getParameter("description");
                } catch (NumberFormatException ex) {
                }

                if (id != null) {
                    exerciseDAO.updateExercise(id, exName, lowerweight, upperweight, calorexp, icon, description);
                }

                response.sendRedirect("ExerciseController");
            }

        }
    }

    protected Exercise readexerciseByID(String exID) {
        ExerciseDAO dao = new ExerciseDAO();
        List<Exercise> list = dao.readExercise();
        for (Exercise ex : list) {
            if (ex.getExerciseID().equals(exID)) {
                return ex;
            }
        }
        return null;
    }

    public List<Exercise> paginExercise(int pageNum, int pageSize, List<Exercise> exercises) {
        int startIndex = (pageNum - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, exercises.size());
        List<Exercise> list = exercises.subList(startIndex, endIndex);
        return list;
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
