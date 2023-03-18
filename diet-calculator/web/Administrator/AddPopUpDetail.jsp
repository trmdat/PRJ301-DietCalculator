<%-- 
    Document   : AddPopUpDetail
    Created on : Mar 9, 2023, 9:30:58 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New PopUp</title>
       

        <title>Add New PopUpDetail</title>
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

        
        <jsp:include page="../index/AdminHeader.jsp" />
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <div class="navbar-brand" href="">
                    <h1 class="tm-site-title mb-0">PopUp Detail Admin</h1>
                </div>
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
                        <!-- <li class="nav-item dropdown">
                          <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdown"
                            role="button"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                          >
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
                          <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            id="navbarDropdown"
                            role="button"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                          >
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
        <div class="container tm-mt-big tm-mb-big mt-5 mb-5">

        <div class="container tm-mt-big tm-mb-big">

            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-10">
                                <h2 class="tm-block-title d-inline-block">Add new Details for PopUp ${pID}</h2>
                            </div>
                            <div class="col-2">
                                <form action="/diet-calculator/PopUpDetailController">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase bg-success"> << Return</button>                            
                                </form>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form action="./PopUpDetailController" method="post" class="tm-edit-product-form">
                                    <input type=hidden name="action" value="insert">
                                    <input type=hidden name="popupID" value="${pID}">
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-12">
                                            <label for="lowerweight">Product ID</label>
                                            <input type="text" name="productID" class="form-control validate" required/>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Description</label>
                                        <input type="text" name="description" class="form-control validate" required/>
                                    </div>
                                    <div class="col-12">
                                        <input type="submit" value="Add Detail" class="btn btn-primary btn-block text-uppercase bg-success">
                                    </div>
                                </form>
                            </div>


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
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <!--    <script>
            $(function () {
                $("#expire_date").datepicker();
            });
        </script>-->
    <jsp:include page="../index/UserFooter.jsp" />
</body>
</html>
