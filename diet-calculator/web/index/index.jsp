<%-- 
    Document   : index
    Created on : Mar 10, 2023, 12:03:52 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>Diet Calculator</title>
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
        <!--header section start -->
        <div class="header_section">
            <div class="header-nav">
                <nav class="navbar navbar-expand-lg navbar-light main_navbar">
                    <div class="logo"><a href="index.jsp"><img class="logo" src="https://images2.imgbox.com/08/79/vGFMh0Gr_o.jpg" alt="logo"><h1 class="title">Diet Calculator</h1></a></div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="">Menu Cart</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="">Shopping Cart</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="">Contact Us</a>
                            </li>               
                        </ul>
                        <div class="user-logo"><a href="../LoginController"><img src="https://images2.imgbox.com/71/a7/2NJ2EeTY_o.jpg" alt="user_logo"></a></div>
                    </div>
                </nav>
            </div>
            <!--banner section start -->
            <div class="banner_section layout_padding">
                <div class="container-fluid">
                    <section class="slide-wrapper">
                        <div class="container-fluid">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="container">
                                            <h1 class="banner_taital">Diet Calculator</h1>
                                            <p class="banner_text">Hello! We are team PGNB</p>
                                            <div class="btn_main">
                                                <div class="contact_bt"><a href="./calculator/DietForm.jsp">Calculate diet</a></div>
                                                <div class="readmore_bt active"><a href="#">Read More</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!--banner section end -->
        </div>
    </div>
    <!--header section end -->
    <!--about section start -->
    <div class="about_section layout_padding">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 padding_0">
                    <div class="abiut_images_main rounded">
                        <div><img src="https://images2.imgbox.com/95/fe/To0YzXmn_o.jpg" class="image_1"></div>
                        <div><img src="https://images2.imgbox.com/3d/f7/upQHLqmN_o.jpg" class="image_2"></div>
                        <div class="main"><img src="https://images2.imgbox.com/e5/89/mvpeeKuc_o.jpg" class="image_3"></div>
                    </div>
                </div>
                <div class="col-lg-6 padding_0">
                    <div class="about_taital_main">
                        <h1 class="about_taital">Diet Calculator</h1>
                        <p class="about_text">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is tha</p>
                        <div class="read_bt"><a href="MenuController">Get your diet now</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--about section end -->
    <!-- vitamin section start -->
    <div class="vitamin_section layout_padding">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 padding_left_30">
                    <div class="vitamin_img"><img src="https://images2.imgbox.com/87/33/E8AHOfRo_o.png"></div>
                </div>
                <div class="col-lg-6">
                    <div class="vitamin_taital_main">
                        <h3 class="vitamin_taital">Vitamin supliment product</h3>
                        <p class="vitamin_text">It is a long established fact that a reader will be distracted by the readable content of a page </p>
                        <div class="vitamin_section_2">
                            <div class="vitamin_taital_left">
                                <div class="car_box">
                                    <img src="https://thumbs2.imgbox.com/4e/a9/s08fsXhS_t.jpg" alt="image host" class="car_image"/>

                                </div>
                            </div>
                            <div class="vitamin_taital_right">
                                <h6 class="parking_text">Benefit 1</h6>
                                <p class="long_text">It is a long established fact that a reader will be distracted by the readable content of a page </p>
                            </div>
                        </div>
                        <div class="vitamin_section_2">
                            <div class="vitamin_taital_left">
                                <div class="car_box">
                                    <img src="https://thumbs2.imgbox.com/f1/68/LYzuXjKo_t.jpg" alt="image host"/>
                                </div>
                            </div>
                            <div class="vitamin_taital_right">
                                <h6 class="parking_text">Benefit 2</h6>
                                <p class="long_text">It is a long established fact that a reader will be distracted by the readable content of a page </p>
                            </div>
                        </div>
                        <div class="vitamin_section_2">
                            <div class="vitamin_taital_left">
                                <div class="car_box">
                                    <img src="https://thumbs2.imgbox.com/9a/24/bHVe3vjJ_t.jpg" alt="image host" class="car_image"/>
                                </div>
                            </div>
                            <div class="vitamin_taital_right">
                                <h6 class="parking_text">Benefit 3</h6>
                                <p class="long_text">It is a long established fact that a reader will be distracted by the readable content of a page </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- vitamin section end -->
    <!-- contact section start -->
    <div class="contact_srction layout_padding">
        <div class="container">
            <h1 class="contact_taital">Request A call Back</h1>
            <div class="contact_srction_2">
                <div class="mail_main">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" class="mail_text" placeholder="Full Name" name="Full Name">
                            <input type="text" class="mail_text" placeholder="Phone Number" name="Phone Number">
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="mail_text" placeholder="Email" name="Email">
                            <textarea class="massage-bt" placeholder="Massage" rows="5" id="comment" name="Massage"></textarea>
                        </div>
                    </div>
                    <div class="send_bt"><a href="#">SEND</a></div>
                </div>
            </div>
        </div>
    </div>
    <!-- contact section end -->
    <!-- Javascript files-->
    <script src="./index/js/jquery.min.js"></script>
    <script src="./index/js/popper.min.js"></script>
    <script src="./index/js/bootstrap.bundle.min.js"></script>
    <script src="./index/js/jquery-3.0.0.min.js"></script>
    <script src="./index/js/plugin.js"></script>
    <!-- sidebar -->
    <script src="./index/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="./index/js/custom.js"></script>
    <!-- javascript --> 
    <script src="./index/js/owl.carousel.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    <jsp:include page="UserFooter.jsp" />
</body>
</html>
