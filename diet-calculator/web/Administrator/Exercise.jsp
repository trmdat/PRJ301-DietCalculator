<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Exercise
    Created on : Mar 4, 2023, 3:28:12 PM
    Author     : admin
--%>

<%@page import="com.dietcalculator.dto.Exercise"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Exercise List</title>
        <jsp:include page="../index/AdminHeader.jsp" />
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/templatemo-style.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body id="reportsPage">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="">
                    <h1 class="tm-site-title mb-0 text-success">Exercise Admin</h1>
                </a>
                <!--                <button
                                    class="navbar-toggler ml-auto mr-0"
                                    type="button"
                                    data-toggle="collapse"
                                    data-target="#navbarSupportedContent"
                                    aria-controls="navbarSupportedContent"
                                    aria-expanded="false"
                                    aria-label="Toggle navigation"
                                    >
                                    <i class="fas fa-bars tm-nav-icon"></i>
                                </button>
                
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mx-auto h-100">
                                        <li class="nav-item">
                                            <a class="nav-link" href="">
                                                <i class="fas fa-tachometer-alt"></i> Dashboard
                                                <span class="sr-only">(current)</span>
                                            </a>
                                        </li>
                                        <li class="nav-item dropdown">
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active" href="">
                                                <i class="fas fa-shopping-cart"></i> Products
                                            </a>
                                        </li>
                
                                        <li class="nav-item">
                                            <a class="nav-link" href="">
                                                <i class="far fa-user"></i> Accounts
                                            </a>
                                        </li>
                                    </ul>
                                </div>-->
            </div>
        </nav>


        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <a href="Administrator/AddExercise.jsp" class="btn btn-primary btn-block text-uppercase mb-3 bg-success">Add new Exercise</a>
                        <div class="tm-product-table-container">
                            <form action="ExerciseController" method="get">
                                <input type="hidden" name="action" value="delete">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">ID</th>
                                            <th scope="col">EXERCISE NAME</th>
                                            <th scope="col">LOWERWEIGHT</th>
                                            <th scope="col">UPPERWEIGHT</th>
                                            <th scope="col">CALOREXP</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="e" items="${list}">
                                            <tr>
                                                <th scope=row><input type="checkbox" name="checkId" value=${e.exerciseID}></th>
                                                <td> ${e.exerciseID} </td>
                                                <td> ${e.exname} </td>
                                                <td> ${e.lowerweight} </td>
                                                <td> ${e.upperweight} </td>
                                                <td> ${e.calorexp} </td>
                                                <td><a href="./ExerciseController?action=edit&exerciseID=${e.exerciseID}&jump=true" 
                                                       class="btn btn-primary btn-block bg-success">Edit</a></td>
                                            </tr>
                                        </c:forEach>    
                                    </tbody>
                                </table>
                                <section class="panel">
                                    <div class="panel-body">
                                        <div class="pull-right">
                                            <ul class="pagination pagination-sm pro-page-list text-light">
                                                <li class="page-item ${page == 1 ? 'disabled' : ''}">
                                                    <a class="page-link" href="ExerciseController?page=${page>1?page - 1:1}" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                </li>

                                                <c:forEach var="i" begin="1" end="${totalPages}">
                                                    <li class="page-item ${i == page ? 'active' : ''}">
                                                        <a class="page-link" href="ExerciseController?page=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item ${page == totalPages ? 'disabled' : ''}">
                                                    <a class="page-link" href="ExerciseController?page=${page<totalPages?page + 1:totalPages}" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </section>
                                <input type="submit" value="Delete selected Exercises" class="btn btn-primary btn-block text-uppercase bg-success">
                            </form>
                        </div>
                        <!-- table container -->

                    </div>
                </div>
            </div>
        </div>
        <br>
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <jsp:include page="../index/AdminFooter.jsp" />
    </body>

</html>
