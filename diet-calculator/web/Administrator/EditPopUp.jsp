<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : EditPopUp
    Created on : Mar 6, 2023, 5:17:30 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit PopUp</title>
        <jsp:include page="../index/AdminHeader.jsp" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/templatemo-style.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>

    <body>
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="">
                    <h1 class="tm-site-title mb-0 text-success">PopUp Admin</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
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
                        <!-- <li class="nav-item dropdown">
                           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                              aria-haspopup="true" aria-expanded="false">
                              <i class="far fa-file-alt"></i>
                              <span> Reports <i class="fas fa-angle-down"></i> </span>
                           </a>
                           <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                              <a class="dropdown-item" href="#">Daily Report</a>
                              <a class="dropdown-item" href="#">Weekly Report</a>
                              <a class="dropdown-item" href="#">Yearly Report</a>
                           </div>
                        </li> -->
                        <li class="nav-item">
                            <a class="nav-link active" href="products.html">
                                <i class="fas fa-shopping-cart"></i> Products
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="">
                                <i class="far fa-user"></i> Accounts
                            </a>
                        </li>
                        <!-- <li class="nav-item dropdown">
                           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                              aria-haspopup="true" aria-expanded="false">
                              <i class="fas fa-cog"></i>
                              <span> Settings <i class="fas fa-angle-down"></i> </span>
                           </a>
                           <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                              <a class="dropdown-item" href="#">Profile</a>
                              <a class="dropdown-item" href="#">Billing</a>
                              <a class="dropdown-item" href="#">Customize</a>
                           </div>
                        </li> -->
                    </ul>
                    <!-- <ul class="navbar-nav">
                       <li class="nav-item">
                          <a class="nav-link d-block" href="login.html">
                             Admin, <b>Logout</b>
                          </a>
                       </li>
                    </ul> -->
                </div>
            </div>
        </nav>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Edit PopUp <strong>${popup.popupID}</strong></h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form action="PopUpController" method="post" class="tm-edit-product-form">
                                    <input type=hidden name="action" value="update">
                                    <input type=hidden name="popupID" value="${popup.popupID}">
                                    <div class="form-group mb-3">
                                        <label for="des">Description</label>
                                        <input type="text" name="description" value="${popup.description}" class="form-control validate" required/>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-2">
                                            <label for="status">Status</label>
                                            <select name="status" class="form-control validate" required>
                                                <option value="1" <c:if test="${popup.status == 1 ? 'selected' : ' '}">
                                                        </c:if>>On</option>
                                                <option value="0" <c:if test="${popup.status == 0 ? 'selected' : ' '}">
                                                        </c:if>>Off</option>
                                            </select>
                                            <!--<input type="text" name="status" value="${popup.status}" class="form-control validate" required/>-->
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-10">
                                            <label for="theme">Theme</label>
                                            <input type="text" name="theme" value="${popup.theme}" class="form-control validate"/>
                                        </div>
                                        <div class="col-12">
                                            <input type="submit" value="Update Now" class="btn btn-primary btn-block text-uppercase bg-success">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <jsp:include page="../index/AdminFooter.jsp" />
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>

</html>
