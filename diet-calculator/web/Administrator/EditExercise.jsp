<%-- 
    Document   : EditExercise
    Created on : Mar 4, 2023, 4:20:28 PM
    Author     : admin
--%>

<%@page import="com.dietcalculator.dto.Exercise"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Edit Exercise</title>
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

    <body>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-10">
                                <h2 class="tm-block-title d-inline-block">Edit Exercise</h2>
                            </div>
                            <div class="col-2">
                                <form action="/diet-calculator/ExerciseController">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase bg-success"> << Return</button>                            
                                </form>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form action="ExerciseController" method="post" class="tm-edit-product-form">
                                    <input type=hidden name="action" value="edit">
                                    <input type=hidden name="exerciseID" value="${exercise.exerciseID}">
                                    <div class="form-group mb-3">
                                        <label for="name">Exercise Name</label>
                                        <input type="text" name="exname" value="${exercise.exname}" class="form-control validate" required/>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-4">
                                            <label for="lowerweight">Lower Weight</label>
                                            <input type="text" name="lowerweight" value="${exercise.lowerweight}" class="form-control validate" required/>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-4">
                                            <label for="upperweight">Upper Weight</label>
                                            <input type="text" name="upperweight" value="${exercise.upperweight}" class="form-control validate" required/>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-4">
                                            <label for="calorexp">Calorexp</label>
                                            <input type="text" name="calorexp" value="${exercise.calorexp}" class="form-control validate" required/>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-4">
                                            <label for="calorexp">Icon</label>
                                            <input type="text" name="icon" value="${exercise.icon}" class="form-control validate" required/>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-4">
                                            <label for="calorexp">Description</label>
                                            <input type="text" name="description" value="${exercise.description}" class="form-control validate" required/>
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
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <jsp:include page="../index/AdminFooter.jsp" />
    </body>

</html>
