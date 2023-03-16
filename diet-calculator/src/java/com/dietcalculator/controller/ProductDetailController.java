package com.dietcalculator.controller;

import com.dietcalculator.dao.ProductDAO;
import com.dietcalculator.dao.ProductDetailDAO;
import com.dietcalculator.dto.Product;
import com.dietcalculator.dto.ProductDetail;
import com.dietcalculator.dto.User;
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
 * @author ADMIN
 */
public class ProductDetailController extends HttpServlet {

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
        //Check if user is login
        User user = (User) request.getSession().getAttribute("user");
        user = new User("U00000", "", null, "", "", "", "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);
//        if (user == null) {
//            RequestDispatcher rd = request.getRequestDispatcher("login");
//            rd.forward(request, response);
//        }
        String action = request.getParameter("action");
        ProductDetailDAO pddao = new ProductDetailDAO();
        if (action == null || action.equals("read")) {
            ArrayList<ProductDetail> pdl = new ArrayList<>();
            ArrayList<ProductDetail> detailList = new ArrayList<>();
            pdl = pddao.readProductDetail();
            ProductDAO pdao = new ProductDAO();
            ArrayList<Product> pl = pdao.readProduct();
            ArrayList<Product> productList = new ArrayList<>();
            Double total = 0.0;
            for (Product product : pl) {
                for (ProductDetail detail : pdl) {
                    if (product.getProductID().equals(detail.getProductID())) {
                        productList.add(product);
                        detailList.add(detail);
                        total += product.getPrice() * detail.getQuantity();
                    }
                }
            }
            request.setAttribute("productList", productList);
            request.setAttribute("detailList", detailList);
            request.setAttribute("total", total);
            RequestDispatcher rd = request.getRequestDispatcher("Shopping Cart/ShoppingCart.jsp");
            rd.forward(request, response);
        } else if (action.equals("add")) {
            String productID = "";
            String detailID = "";
            //default amount is 1
            int amount = 1;
            try {
                productID = request.getParameter("productID");
                amount = Integer.parseInt(request.getParameter("amount"));
            } catch (Exception e) {
            }
            ArrayList<ProductDetail> pdl = new ArrayList<>();
            pdl = pddao.readProductDetail();
            boolean isInCart = false;
            //Add product in cart already
            if (pdl != null) {
                for (ProductDetail productDetail : pdl) {
                    if (productID.equals(productDetail.getProductID()) && productDetail.getBillID() == null && user.getUserID().equals(productDetail.getUserID())) {
                        int quantity = productDetail.getQuantity() + amount;
                        pddao.updateProductDetail(productDetail.getDetailID(), productID, productDetail.getUserID(), null, quantity);
                        isInCart = true;
                    }
                }
            }
            //Add an non-in cart product
            if (!productID.isEmpty() && isInCart == false) {
                String tmp = String.valueOf(Integer.parseInt(pddao.lastIDIndex().substring(2)) + 1);
                detailID = "PD";
                for (int i = 0; i < (8 - tmp.length()); i++) {
                    detailID += "0";
                }
                detailID += tmp;
                pddao.createProductDetail(detailID, productID, user.getUserID(), null, amount);
            }
            response.sendRedirect("ProductDetailController");
        } else if (action.equals("update")) {
            String productID = "";
            String detailID = "";
            int amount = 0;
            try {
                detailID = request.getParameter("detailID");
                productID = request.getParameter("productID");
                amount = Integer.parseInt(request.getParameter("amount"));
            } catch (Exception e) {
            }
            ProductDetail pd = pddao.readProductDetailByID(detailID);
            if (pd.getBillID() == null) {
                if (amount <= 0) {
                    pddao.deleteProductDetail(detailID);
                } else {
                    pddao.updateProductDetail(detailID, productID, user.getUserID(), null, amount);
                }
            }
            response.sendRedirect("ProductDetailController");
        } else if (action.equals("delete")) {
            String detailID = "";
            try {
                detailID = request.getParameter("detailID");
            } catch (Exception e) {
            }
            pddao.deleteProductDetail(detailID);
            response.sendRedirect("ProductDetailController");
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

}