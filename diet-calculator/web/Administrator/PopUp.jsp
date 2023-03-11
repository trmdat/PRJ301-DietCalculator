<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : PopUp
    Created on : Mar 6, 2023, 3:49:22 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PopUp List</title>
        <jsp:include page="../index/AdminHeader.jsp" />
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
                    <h1 class="tm-site-title mb-0 text-success">PopUp Admin</h1>
                </a>
                <button
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
                </div>
            </div>
        </nav>


        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <a href="Administrator/AddPopUp.jsp" class="btn btn-primary btn-block text-uppercase mb-3 bg-success">Add new PopUp</a>
                        <div class="tm-product-table-container">
                            <form action="PopUpController" method="get">
                                <input type="hidden" name="action" value="delete">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">POPUPID</th>
                                            <th scope="col">DESCRIPTION</th>
                                            <th scope="col">STATUS</th>
                                            <th scope="col">THEME</th>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="p" items="${list}">
                                            <tr>
                                                <th scope=row><input type="checkbox" name="checkId" value=${p.popupID}></th>
                                                <td> ${p.popupID} </td>
                                                <td> ${p.description} </td>
                                                <td> ${p.status} </td>
                                                <td> ${p.theme} </td>
                                                <td><a href="./PopUpController?action=edit&popupID=${p.popupID}&jump=true" 
                                                       class="btn btn-primary btn-block bg-success">Edit</a></td>
                                                <td><a href="./PopUpDetailController?popupID=${p.popupID}" 
                                                       class="btn btn-primary btn-block bg-success">Details</a></td>
                                            </tr>
                                        </c:forEach>    
                                    </tbody>
                                </table>
                                <input type="submit" value="Delete selected PopUps" class="btn btn-primary btn-block text-uppercase bg-success">
                            </form>
                        </div>
                        <!-- table container -->

                    </div>
                </div>
            </div>
        </div>
        <br>
        <jsp:include page="../index/AdminFooter.jsp" />

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <!--        <script>
                    $(function () {
                        $(".tm-product-name").on("click", function () {
                            window.location.href = "EditProduct.html";
                        });
                    });
                </script>-->
    </body>

</html>
