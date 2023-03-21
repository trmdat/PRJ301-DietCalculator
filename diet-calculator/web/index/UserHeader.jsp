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
        <title>Admin header</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>

        <link href="${pageContext.request.contextPath}/index/css/style.css" type="text/css" rel="stylesheet">

    </head>
    <body>
        <nav class="navbar navbar-expand-lg ">
            <a class="navbar-logo" href="#">
                <img style="border-radius: 50%; margin-right: 20px;" src="https://thumbs2.imgbox.com/08/79/vGFMh0Gr_t.jpg" alt="imgbox"/>   
            </a>
            <a class="navbar-brand" href="#" style="margin-top: 10px;"> Diet Calculator</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"> <i class="fas fa-bars" ></i></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav" style="margin-top: 20px; font-size: 15px; margin-left: 100px" >
                   
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/ProductController">Diet Calculator</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/FoodController">Menu</a>
                    </li>
                    <li class="nav-item"> 
                        <a class="nav-link" href="${pageContext.request.contextPath}/PopUpController">Shop</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/SaleOffController">Cart</a>
                    </li>
                   
            
                    
                    <c:if test = "${sessionScope.user.getUserID()!=null}"><a href="/diet-calculator/LoginController?action=logout"><div class="nav-link" style="color:white; margin-top: 10px; margin-left: 500px">Log out</div></a> </c:if>
                    <c:if test = "${sessionScope.user.getUserID()==null}"> <a href="/diet-calculator/Register_Login/login.jsp"><div class="nav-link" style="color:white;margin-top: 10px">Log in</div></a></c:if>
                    <c:if test = "${sessionScope.user.getUsername()!=null}"><div style="color:white; margin-top: 20px; margin-left: 20px;">Welcome back: ${sessionScope.user.getUsername()}</div></c:if>
                    <div class="user-logo" style="margin-left: 20px"><a href="ProfileController"><img src="/diet-calculator/index/images/user-logo.jpg" alt="user_logo"></a>
                    </div>

                </ul>

            </div>
        </nav>
    </body>
</html>
