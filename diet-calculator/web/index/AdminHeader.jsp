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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Food</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

        <link href="${pageContext.request.contextPath}/index/css/style1.css" type="text/css" rel="stylesheet">
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
