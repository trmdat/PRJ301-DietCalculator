<%-- 
    Document   : ProductList.jsp
    Created on : Feb 28, 2023, 11:33:23 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.dietcalculator.dto.Image"%>
<%@page import="com.dietcalculator.dto.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Grocery List</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="ProductList.css">
    </head>
    <body>
        <div class="header_section1">
            <div class="header-nav">
                <nav class="navbar navbar-expand-lg navbar-dark main_navbar">
                    <div class="logo"><a href="HomeController"><img class="logo" src="./index/images/logo.jpg" alt="logo"><h1 class="title">Diet Calculator</h1></a></div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="HomeController">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./calculator/DietForm.jsp">Diet</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ProductListController">Product</a>
                            </li> 
                            <li class="nav-item">
                                <a class="nav-link" href="">Contact Us</a>
                            </li>      
                        </ul>
                        <div class="user-logo"><a href="../LoginController"><img src="./index/images/user-logo.jpg" alt="user_logo"></a></div>
                    </div>
                </nav>
            </div>
            <div class="container bootdey">
                <form action="ProductListController">
                    <div class="col-md-3">
                        <h3 style="back-ground:white">
                            Keyword: <input type="text" name="keyword" value="${keyword}" /><br>
                            Type: <input type="text" name="type" value="${type}" /><br>
                            Price: <input type="radio" name="price" value="ASC" check=${price.equals(ASC)?"checked":""}/>ASC
                            <input type="radio" name="price" value="DESC"check=${price.equals(DESC)?"checked":""} />DESC<br>
                            Quantity: <input type="radio" name="quantity" value="ASC" check=${quantity.equals(ASC)?"checked":""}/>ASC
                            <input type="radio" name="quantity" value="DESC" check=${quantity.equals(DESC)?"checked":""}/>DESC<br>
                            <input type="submit" value="Filter" />
                        </h3>

                    </div>
                    <div class="col-md-9">
                        <section class="panel">
                            <div class="panel-body">
                                <div class="pull-right">
                                    <ul class="pagination pagination-sm pro-page-list">

                                        <li class="page-item ${page == 1 ? 'disabled' : ''}">
                                            <a class="page-link" href="ProductListController?page=${page>1?page - 1:1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>

                                        <c:forEach var="i" begin="1" end="${totalPages}">


                                            <li class="page-item ${i == page ? 'active' : ''}">
                                                <a class="page-link" href="ProductListController?page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item ${page == totalPages ? 'disabled' : ''}">
                                            <a class="page-link" href="ProductListController?page=${page<totalPages?page + 1:totalPages}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </section>
                        <div class="row product-list">

                            <%!
                                public String product(Product p, Image i) {

                                    String html = "<div class=\"col-md-4\"> "
                                            + "<section class=\"panel\"> <div class=\"pro-img-box\"> "
                                            + "<a href=\"ProductInfoController?productID=" + p.getProductID() + "\" class=\"pro-title\">"
                                            + "<img class=\"img-responsive\" src=\"" + i.getUrl() + "\" alt=\"Image not found\" />" + "</a>"
                                            + "                     <a href=\"ProductDetailController?productID=" + p.getProductID() + "&action=add"
                                            + "\" class=\"adtocart\">"
                                            + "                     <i class=\"fa fa-shopping-cart\"></i>"
                                            + " </a>"
                                            + "    </div>"
                                            + "       <div class=\"panel-body text-center\">"
                                            + "           <h4>"
                                            + "                      <a href=\"ProductInfoController?productID=" + p.getProductID()
                                            + "\" class=\"pro-title\">" + p.getProductname() + "</a>"
                                            + "                </h4>"
                                            + "       <p class=\"price\">" + p.getPrice() + " VND</p>"
                                            + "          </div>"
                                            + "         </section>"
                                            + "   </div>";
                                    return html;
                                }
                            %>
                            <%
                                List<Product> productlist = (List<Product>) request.getAttribute("productlist");
                                ArrayList<Image> imagelist = (ArrayList<Image>) request.getAttribute("imagelist");
                                //                        out.print(imagelist.get(0).getUrl());
                                for (int i = 0; i < 12; i++) {
                                    out.print(product(productlist.get(i), imagelist.get(i)));
                                }
                            %>

                        </div>
                    </div>
                </form>
            </div>
            <br>
            <jsp:include page="../index/UserFooter.jsp" />
            </body>
            </html>