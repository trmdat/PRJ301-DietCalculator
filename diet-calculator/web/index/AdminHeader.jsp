<%-- 
    Document   : AdminHeader
    Created on : Mar 10, 2023, 1:44:04 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>Header</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" type="text/css" href="./index/css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" type="text/css" href="./index/css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="./index/css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="./index/images/logo.jpg" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="./index/css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <!-- fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Raleway:400,700&display=swap" rel="stylesheet">
        <!-- owl stylesheets --> 
        <link rel="stylesheet" href="./index/css/owl.carousel.min.css">
        <link rel="stylesheet" href="./index/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light main_navbar bg-success">
            <div class="logo">
                <a href=""><img class="logo img-responsive" src="https://images2.imgbox.com/08/79/vGFMh0Gr_o.jpg" alt="logo"><h1 class="title">Diet Calculator</h1></a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="./UserController">User</a>
                    </li>              
                    <li class="nav-item">
                        <a class="nav-link text-white" href="./ProductController">Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="./FoodController">Food</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="./ExerciseController">Exercise</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="./PopUpController">PopUp</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="./SaleOffController">SaleOff</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="./ImageController">Image</a>
                    </li>
                </ul>
                <div class="user-logo"><a href="./LoginController"><img src="https://images2.imgbox.com/71/a7/2NJ2EeTY_o.jpg" alt="user_logo"></a></div>
            </div>
        </nav>
    </body>
</html>
