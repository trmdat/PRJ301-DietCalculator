package com.dietcalculator.controller;

import com.dietcalculator.dao.PopUpDAO;
import com.dietcalculator.dao.PopUpDetailDAO;
import com.dietcalculator.dao.ProductDAO;
import com.dietcalculator.dto.PopUp;
import com.dietcalculator.dto.PopUpDetail;
import com.dietcalculator.dto.Product;
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
public class ShowPopUpController extends HttpServlet {

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
        PopUpDAO popupDao = new PopUpDAO();
        PopUpDetailDAO popupdetDao = new PopUpDetailDAO();
        Product p = new Product();

        ArrayList<PopUp> popupList = popupDao.readAvailablePopUp(1);
        ArrayList<PopUpDetail> detailList = new ArrayList<>();
        ArrayList<Product> productList = new ArrayList<>();
        for (PopUp popUp : popupList) {
            detailList = popupdetDao.readPopUpDetail(popUp.getPopupID());
            for (PopUpDetail popUpDetail : detailList) {
                p = readProductById(popUpDetail.getProductID());
                productList.add(p);
            }
        }

//        PrintWriter out = response.getWriter();
//        for(Product p1: productList)
//            out.println(p1);
        request.setAttribute("list", popupList);
        request.setAttribute("productList", productList);
        RequestDispatcher rd = request.getRequestDispatcher("index/ShowPopUp.jsp");
        try {
            Thread.sleep(2000); // delay 
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        rd.include(request, response);
    }

    private Product readProductById(String id) {
        ProductDAO productDao = new ProductDAO();
        ArrayList<Product> productList = productDao.readProduct();
        for (Product product : productList) {
            if (product.getProductID().equals(id)) {
                return product;
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
