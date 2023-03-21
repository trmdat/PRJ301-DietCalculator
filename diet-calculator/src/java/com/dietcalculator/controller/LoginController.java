package com.dietcalculator.controller;

import com.dietcalculator.dao.UserDAO;
import com.dietcalculator.dto.User;
import com.dietcalculator.util.Utils;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class LoginController extends HttpServlet {

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
        //        try (PrintWriter out = response.getWriter()) {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        User currentUser = null;
        UserDAO dao = new UserDAO();
//        HttpSession checkSession = request.getSession(false);
//        if (checkSession != null && checkSession.getAttribute("usersession") != null) {
//            response.sendRedirect("index/index.html");
//        }
        if (action != null && action.equals("logout")) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("/diet-calculator/LoginController");
        } else if (action == null || request.getParameter("username") == null || request.getParameter("password") == null) {
            response.sendRedirect("Register_Login/login.jsp");
        } else if (action.equals("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = null;
            user = dao.login(username, password);
            if (user != null && user.getUserID() != null) {
                HttpSession session = request.getSession(true);

                //user session is USER
                session.setAttribute("user", user);
                String url = "HomeController";
                if (user.getRank() > 0) {
                    url = "UserController";
                }
                response.sendRedirect(url);

            } else {
                request.setAttribute("error", "Wrong username or password");
                RequestDispatcher rd = request.getRequestDispatcher("Register_Login/login.jsp");
                rd.forward(request, response);
            }
        } else if (action.equals("register")) {
            String err = "";
            String url = "Register_Login/login.jsp";
            try {
                String username = request.getParameter("username");
                Date dob = Date.valueOf(request.getParameter("dob"));
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                LocalDate createDate = java.time.LocalDate.now();
                ArrayList<User> l = dao.readUser();
                if (l != null) {
                    for (User user : l) {
                        if (user.getUsername().equalsIgnoreCase(username)) {
                            err = "Username is duplicated";
                            url="Register_Login/register.jsp";
                        }
                    }
                }
                if (err.isEmpty()) {
                    dao.createUser(getUserID(), username, dob, phone, address, email, password, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            Utils.convertJavaDateToSqlDate(createDate.getYear(), createDate.getMonthValue(), createDate.getDayOfMonth()));
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            request.setAttribute("error", err);
            request.getRequestDispatcher(url).forward(request, response);
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

    private static String getUserID() {
        UserDAO dao = new UserDAO();
        Integer ID = 0;
        try {
            ID = Integer.parseInt(dao.lastIDIndex().substring(1));
        } catch (NumberFormatException e) {
        }
        String s = "";
        if (ID < 10000) {
            s += "0";
        }
        if (ID < 1000) {
            s += "0";
        }
        if (ID < 100) {
            s += "0";
        }
        if (ID < 10) {
            s += "0";
        }
        ID++;
        return "U" + s + String.valueOf(ID);
    }

//    public static void main(String[] args) {
//        System.out.println(getUserID());
//    }
}
