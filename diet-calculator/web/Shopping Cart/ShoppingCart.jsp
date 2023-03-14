<%@page import="com.dietcalculator.dto.ProductDetail"%>
<%@page import="com.dietcalculator.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>
    <!--<body>
       <nav class="navbar navbar-expand-md navbar-dark bg-success">
          <div class="container">
              <a class="navbar-brand" href="index.html">Diet Calculator</a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
              </button>
      
              <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                  <ul class="navbar-nav m-auto">
                      <li class="nav-item m-auto">
                          <a class="nav-link" href="index.html">Home</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="category.html">Categories</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="product.html">Product</a>
                      </li>
                      <li class="nav-item active">
                          <a class="nav-link" href="contact.html">Cart <span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="contact.html">Contact</a>
                      </li>
                  </ul>
      
                  <form class="form-inline my-2 my-lg-0">
                      <div class="input-group input-group-sm">
                          <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                          <div class="input-group-append">
                              <button type="button" class="btn btn-secondary btn-number">
                                  <i class="fa fa-search"></i>
                              </button>
                          </div>
                      </div>
                      <a class="btn btn-success btn-sm ml-3" href="cart.html">
                          <i class="fa fa-shopping-cart"></i> Cart
                          <span class="badge badge-light">3</span>
                      </a>
                  </form>
              </div>
          </div>
      </nav>-->
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">YOUR CART</h1>
        </div>
    </section>

    <div class="container mb-4">
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col"> </th>
                                <th scope="col">Product</th>
                                <th scope="col"></th>
                                <th scope="col" class="text-center">Quantity</th>
                                <th scope="col" class="text-right">Price</th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--                            <tr>
                                                            <td><img src="https://dummyimage.com/50x50/55595c/fff" /> </td>
                                                            <td>Product Name Dada</td>
                                                            <td>In stock</td>
                                                            <td><input class="form-control" type="text" value="1" /></td>
                                                            <td class="text-right">124,90 €</td>
                                                            <td class="text-right"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
                                                        </tr>--><form name="a" action="a"><input type="hidden" name="a" value="" />
                        </form>
                        <%  ArrayList<ProductDetail> detailList = (ArrayList<ProductDetail>) request.getAttribute("detailList");
                            ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
                            for (int i = 0; i < detailList.size(); i++) {
                                out.print("<form method=\"get\" action=\"ProductDetailController\"><tr> "
                                        + "<td><input type=\"hidden\" name=\"detailID\" value=" + detailList.get(i).getDetailID() + ">"
                                        + "<input type=\"hidden\" name=\"productID\" value=" + productList.get(i).getProductID() + ">"
                                        + "<input type=\"hidden\" name=\"action\" value=update></td>"
                                        + "<td><img src=\"https://dummyimage.com/50x50/55595c/fff\" /> </td>"
                                        + "<td>" + productList.get(i).getProductname() + "</td>"
                                        + "<td><input class=\"form-control\" type=\"number\" name=amount value=" + detailList.get(i).getQuantity() + " /></td>"
                                        + "<td><button class=\"btn btn-sm btn-danger\" type=submit>Submit</button></td>"
                                        + "<td class=\"text-right\">" + productList.get(i).getPrice() + "</td>"
                                        + " <td class=\"text-right\"><a href=\"ProductDetailController?action=delete&detailID=" + detailList.get(i).getDetailID() + "\">"
                                        + "<button class=\"btn btn-sm btn-danger\"><i class=\"fa fa-trash\"></i> </button></a> </td></tr></form> ");
                            }

                        %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>Total</strong></td>
                            <td class="text-right">${total}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col mb-2">
                <div class="row">
                    <div class="col-sm-12  col-md-6">
                        <button class="btn btn-block btn-light">Continue Shopping</button>
                    </div>
                    <div class="col-sm-12 col-md-6 text-right">
                        <button class="btn btn-lg btn-block btn-success text-uppercase">Checkout</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="text-light">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-lg-4 col-xl-3">
                    <!-- <h5>About</h5> -->
                    <!-- <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25"> -->
                    <!-- <p class="mb-0">
                        Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.
                    </p> -->
                </div>

                <!-- <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                    <h5>Informations</h5>
                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                    <ul class="list-unstyled">
                        <li><a href="">Link 1</a></li>
                        <li><a href="">Link 2</a></li>
                        <li><a href="">Link 3</a></li>
                        <li><a href="">Link 4</a></li>
                    </ul>
                </div>
    
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                    <h5>Others links</h5>
                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                    <ul class="list-unstyled">
                        <li><a href="">Link 1</a></li>
                        <li><a href="">Link 2</a></li>
                        <li><a href="">Link 3</a></li>
                        <li><a href="">Link 4</a></li>
                    </ul>
                </div> -->

                <!-- <div class="col-md-4 col-lg-3 col-xl-3">
                    <h5>Contact</h5>
                    <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                    <ul class="list-unstyled">
                        <li><i class="fa fa-home mr-2"></i> My company</li>
                        <li><i class="fa fa-envelope mr-2"></i> email@example.com</li>
                        <li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
                        <li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
                    </ul>
                </div> -->
                <div class="col-12 copyright mt-3">
                    <p class="float-left">
                        <a href="#">Back to top</a>
                    </p>
                    <!-- <p class="text-right text-muted">created with <i class="fa fa-heart"></i> by <a href="https://t-php.fr/43-theme-ecommerce-bootstrap-4.html"><i>t-php</i></a> | <span>v. 1.0</span></p> -->
                </div>
            </div>
        </div>
    </footer>
</body>
</html>