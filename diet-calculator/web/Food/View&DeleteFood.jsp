<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.dietcalculator.dto.Food"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product List</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/templatemo-style.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body id="reportsPage">

        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">View & Delete Food</h2>
                            </div>
                        </div>
                        <form action="/diet-calculator/FoodController" method="get" class="tm-edit-product-form">
                            <div class="tm-product-table-container">

                                <table class="table table-hover tm-table-small tm-product-table">
                                    <input type="hidden" name="action" value="delete"/>
                                    <thead>
                                        <tr>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">Food ID</th>
                                            <th scope="col">Food name</th>
                                            <th scope="col">category</th>
                                            <th scope="col">size</th>
                                            <th scope="col">caloricintake</th>
                                            <th scope="col">carbohydrate</th>
                                            <th scope="col">fiber</th>
                                            <th scope="col">protein</th>
                                            <th scope="col">fat</th>
                                            <th scope="col">water</th>
                                        </tr>
                                    </thead>
                                    <tbody>
   <!--                                     <tr>
                                            <th scope="row"><input type="checkbox" name="id" value="1"/></th>
                                            <td class="tm-product-name">Lorem Ipsum Product 1</td>
                                            <td>1,450</td>
                                            <td>550</td>
                                            <td>28 March 2019</td>
                                            <td>
                                                <a href="#" class="tm-product-delete-link">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                        </tr> -->

                                    <c:forEach items="${foodList}" var="x">
                                        <tr>
                                            <th scope="row"><input type="checkbox" name="foodID" value="${x.getFoodID()}"/></th>
                                            <td>${x.getFoodID()}</td>
                                            <td>${x.getFoodname()}</td>
                                            <td>${x.getCategory()}</td>
                                            <td>${x.getSize()}</td>
                                            <td>${x.getCaloricintake()}</td>
                                            <td>${x.getCarbohydrate()}</td>
                                            <td>${x.getFiber()}</td>
                                            <td>${x.getProtein()}</td>
                                            <td>${x.getFat()}</td>
                                            <td>${x.getWater()}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- table container -->
                            <a
                                href="AddProduct.html"
                                class="btn btn-primary btn-block text-uppercase mb-3 bg-success">Add new product</a>
                            <button type="submit" class="btn btn-primary btn-block text-uppercase bg-success">
                                Delete selected products
                            </button>
                        </form>

                    </div>
                </div>

                <script src="js/jquery-3.3.1.min.js"></script>
                <!-- https://jquery.com/download/ -->
                <script src="js/bootstrap.min.js"></script>
                <!-- https://getbootstrap.com/ -->
                <script>
                    $(function () {
                        $(".tm-product-name").on("click", function () {
                            window.location.href = "EditProduct.html";
                        });
                    });
                </script>
                </body>

                </html>