<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : PopUpDetail
    Created on : Mar 6, 2023, 6:05:30 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PopUpDetail List</title>
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
                    <h1 class="tm-site-title mb-0 text-success">Details for PopUp ${popup}</h1>
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
                        <a href="PopUpDetailController?action=create&popupID=${popup}" class="btn btn-primary btn-block text-uppercase mb-3 bg-success">Add new details for PopUp</a>
                        <div class="tm-product-table-container">
                            <form action="PopUpDetailController" method="post">
                                <input type="hidden" name="action" value="delete">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">POPUPID</th>
                                            <th scope="col">PRODUCTID</th>
                                            <th scope="col">DESCRIPTION</th>
                                            <th scope="col">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="p" items="${list}">
                                            <tr><th scope=row><input type="checkbox" name="checkId" value=${p.popupID}></th>
                                            <input type="hidden" name="checkProductId" value=${p.productID}>
                                            <td> ${p.popupID} </td>
                                            <td> ${p.productID} </td>
                                            <td> ${p.description} </td>
                                            <td><a href="./PopUpDetailController?action=edit&popupID=${p.popupID}&productID=${p.productID}" 
                                                   class="btn btn-primary btn-block bg-success">Edit</a></td>
                                            </tr>
                                        </c:forEach>    
                                    </tbody>
                                </table>
                                <input type="submit" value="Delete selected PopUp Details" class="btn btn-primary btn-block text-uppercase bg-success">

                            </form>
                        </div>
                        <!-- table container -->

                    </div>
                </div>
                <!-- <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
                  <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                    <h2 class="tm-block-title">Product Categories</h2>
                    <div class="tm-product-table-container">
                      <table class="table tm-table-small tm-product-table">
                        <tbody>
                          <tr>
                            <td class="tm-product-name">Product Category 1</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 2</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 3</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 4</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 5</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 6</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 7</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 8</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 9</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 10</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                          <tr>
                            <td class="tm-product-name">Product Category 11</td>
                            <td class="text-center">
                              <a href="#" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                              </a>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <button class="btn btn-primary btn-block text-uppercase mb-3">
                      Add new category
                    </button>
                  </div>
                </div> -->
            </div>
        </div>
        <!-- <footer class="tm-footer row tm-mt-small">
          <div class="col-12 font-weight-light">
            <p class="text-center text-white mb-0 px-4 small">
              Copyright &copy; <b>2018</b> All rights reserved. 
              
              Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
            </p>
          </div>
        </footer> -->

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
