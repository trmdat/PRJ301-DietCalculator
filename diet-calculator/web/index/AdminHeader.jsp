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
        <meta charset="UTF-8">
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index/css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index/css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="${pageContext.request.contextPath}/index/images/logo.jpg" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <!-- fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Raleway:400,700&display=swap" rel="stylesheet">
        <!-- owl stylesheets --> 
        <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg">
            <a class="navbar-logo" href="#">
                <img src="https://thumbs2.imgbox.com/08/79/vGFMh0Gr_t.jpg" alt="imgbox"/>   
            </a>
            <a class="navbar-brand" href="#"> Diet Calculator</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"> <i class="fas fa-bars" ></i></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="../index/index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./UserController">User</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./ProductController">Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./FoodController">Food</a>
                    </li>
                    <li class="nav-item"> 
                        <a class="nav-link" href="./PopUpController">Pop Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./SaleOffController">Sale Off</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./ImageController">Image</a>
                    </li>
                    <li class="user-item">
                        <a class="nav-link" href=""><i class="fas fa-user fa-2x"></i></a>
                    </li>


                </ul>

            </div>
        </nav>
    </body>
</html>
