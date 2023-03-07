package com.dietcalculator.controller;

import com.dietcalculator.dao.PopUpDetailDAO;
import com.dietcalculator.dto.PopUpDetail;
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
 * @author admin
 */
public class PopUpDetailController extends HttpServlet {

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

        PopUpDetailDAO popupdetailDao = new PopUpDetailDAO();

        String popupId = "";
        String productId = "";
        String description = "";

        if (action == null || action.equals("list")) {
            ArrayList<PopUpDetail> list = popupdetailDao.readPopUpDetail();

            request.setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("Adminstrator/PopUpDetail.jsp");
            rd.forward(request, response);
        } else if (action.equals("create")) {
            try {
                popupId = request.getParameter("popupID");
                productId = request.getParameter("productID");
                description = request.getParameter("description");
            } catch (Exception e) {
            }
            if (popupId != null) {
                popupdetailDao.createPopUpDetail(popupId, productId, description);
            }

            response.sendRedirect("popupdetailcontroller");
        } else if (action.equals("delete")) {
            String[] ids = request.getParameterValues("checkId");
            try {
                productId = request.getParameter("checkProductId");
            } catch (Exception e) {
            }
            if (ids != null) {
                for (String checkedid : ids) {
                    popupdetailDao.deletePopUpDetail(checkedid, productId);
                }
            }

            response.sendRedirect("popupdetailcontroller");
        } else if (action.equals("edit")) {
            if (request.getParameter("jump") != null) {
                try {
                    popupId = request.getParameter("popupID");
                    productId = request.getParameter("productID");
                } catch (NumberFormatException ex) {
                }
                PopUpDetail p = readPopUpDetailByID(popupId, productId);

                request.setAttribute("popup", p);
                RequestDispatcher rd = request.getRequestDispatcher("Adminstrator/EditPopUpDetail.jsp");
                rd.forward(request, response);
            } else {
                try {
                    popupId = request.getParameter("popupID");
                    productId = request.getParameter("productID");
                    description = request.getParameter("description");
                } catch (NumberFormatException ex) {
                }

                if (popupId != null) {
                    popupdetailDao.updatePopUpDetail(popupId, productId, description);
                }

                response.sendRedirect("popupdetailcontroller");
            }

        }
    }

    protected PopUpDetail readPopUpDetailByID(String popupID, String productID) {
        PopUpDetailDAO dao = new PopUpDetailDAO();
        ArrayList<PopUpDetail> list = dao.readPopUpDetail();
        for (PopUpDetail ex : list) {
            if (ex.getPopupID().equals(popupID) && ex.getProductID().equals(productID)) {
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
