package com.dietcalculator.controller;

import com.dietcalculator.dao.PopUpDAO;
import com.dietcalculator.dto.PopUp;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class PopUpController extends HttpServlet {

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

        PopUpDAO popupDao = new PopUpDAO();

        String id = "";
        String description = "";
        int status = 0;
        String theme = "";

        if (action == null || action.equals("list")) {
            List<PopUp> list = popupDao.readPopUp();

            request.setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("Adminstrator/PopUp.jsp");
            rd.forward(request, response);
        } else if (action.equals("create")) {
            try {
                id = request.getParameter("popupID");
                description = request.getParameter("description");
                status = Integer.parseInt(request.getParameter("status"));
                id = request.getParameter("theme");
            } catch (Exception e) {
            }
            if (id != null) {
                popupDao.createPopUp(id, description, status, theme);
            }

            response.sendRedirect("popupcontroller");
        } else if (action.equals("delete")) {
            String[] ids = request.getParameterValues("checkId");
            if (ids != null) {
                for (String checkedid : ids) {
                    popupDao.deletePopUp(checkedid);
                }
            }

            response.sendRedirect("popupcontroller");
        } else if (action.equals("edit")) {
            if (request.getParameter("jump") != null) {
                try {
                    id = request.getParameter("popupID");
                } catch (NumberFormatException ex) {
                }
                PopUp p = readPopUpByID(id);

                request.setAttribute("popup", p);
                RequestDispatcher rd = request.getRequestDispatcher("Adminstrator/EditPopUp.jsp");
                rd.forward(request, response);
            } else {
                try {
                    id = request.getParameter("popupID");
                    description = request.getParameter("description");
                    status = Integer.parseInt(request.getParameter("status"));
                    id = request.getParameter("theme");
                } catch (NumberFormatException ex) {
                }

                if (id != null) {
                    popupDao.updatePopUp(id, description, status, theme);
                }

                response.sendRedirect("popupcontroller");
            }

        }
    }

    protected PopUp readPopUpByID(String popupID) {
        PopUpDAO dao = new PopUpDAO();
        List<PopUp> list = dao.readPopUp();
        for (PopUp ex : list) {
            if (ex.getPopupID().equals(popupID)) {
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
