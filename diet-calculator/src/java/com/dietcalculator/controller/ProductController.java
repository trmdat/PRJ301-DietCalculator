/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dietcalculator.controller;

import com.dietcalculator.dao.ProductDAO;
import com.dietcalculator.dto.Product;
import com.dietcalculator.util.Constants;
import com.dietcalculator.util.Utils;
import com.oracle.jrockit.jfr.RequestDelegate;
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
public class ProductController extends HttpServlet {

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
        ProductDAO dao = new ProductDAO();
        
        if(action == null || action.equals("read")){
            ArrayList<Product> productList = dao.readProduct();
            request.setAttribute("productList", productList);
            RequestDispatcher rd = request.getRequestDispatcher("Adminstrator/ViewDeleteProduct.jsp");
            
            rd.forward(request, response);
        }else if(action.equals("create")){
            if(!request.getParameter("productID").isEmpty()){
                try {
                    String productID = request.getParameter("productID");
                    String productname = request.getParameter("productname");
                    String type = request.getParameter("type");
                    double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    String brand = request.getParameter("brand");
                    String origin = request.getParameter("origin");
                    double volume = Double.parseDouble(request.getParameter("volume"));
                    String effect = request.getParameter("effect");
                    double rate = Double.parseDouble(request.getParameter("rate"));
                    int purchase = Integer.parseInt(request.getParameter("purchase"));
                    
                }catch (Exception e){
                    System.out.println(e);
                }
                response.sendRedirect("ProductController");
            }else{
               response.sendRedirect("ProductController");
            }
        }else if (action.equals("update")){
            if(request.getParameter("productname") == null){
                Product product = productByID(request.getParameter("productID"));
                request.setAttribute("product", product);
                RequestDispatcher rd = request.getRequestDispatcher("Adminstrator/EditProduct.jsp");
                rd.forward(request, response);
            }else if(!request.getParameter("productnam").isEmpty()){
                try{
                    String productID = request.getParameter("productID");
                    String productname = request.getParameter("productname");
                    String type = request.getParameter("type");
                    double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    String brand = request.getParameter("brand");
                    String origin = request.getParameter("origin");
                    double volume = Double.parseDouble(request.getParameter("volume"));
                    String effect = request.getParameter("effect");
                    double rate = Double.parseDouble(request.getParameter("rate"));
                    int purchase = Integer.parseInt(request.getParameter("purchase"));
                    
                }catch (Exception e){
                    System.out.println(e);
                }
                response.sendRedirect("ProductController");
            }
        }else if(action.equals("delete")){
            String [] ids = request.getParameterValues("productID");
            if(ids != null){
                for (String id : ids){
                    dao.deleteProduct(id);
                }
            }
            
            
            response.sendRedirect("ProductController");
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

    public ArrayList<Product> listProductByType(ArrayList<Product> ProductDataset, String type){
        ArrayList<Product> productList = new ArrayList();
        String[] types = type.trim().split(Constants.DELIMITER);
        for(Product x : ProductDataset){
            if(Utils.isInStringArray(types, x.getType())){
                productList.add(x);
            }
        }
        return productList;
    }
    
    
    
    
    private Product productByID(String productID){
        ProductDAO dao = new ProductDAO();
        ArrayList<Product> list = dao.readProduct();
        for (Product product : list){
            if(product.getProductID().equals(productID)){
                return product;
            }
        }
        return null;
    }
}


