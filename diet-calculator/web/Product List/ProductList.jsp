<%-- 
    Document   : ProductList.jsp
    Created on : Feb 28, 2023, 11:33:23 AM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.dietcalculator.dto.Image"%>
<%@page import="com.dietcalculator.dto.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Grocery List</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="ProductList.css">
    </head>
    <body>
        <div class="container bootdey">
            <div class="col-md-3">
                <section class="panel">
                    <div class="panel-body">
                        <input type="text" placeholder="Keyword Search" class="form-control" />
                    </div>
                </section>
                <section class="panel">
                    <header class="panel-heading">
                        Category
                    </header>
                    <div class="panel-body">
                        <ul class="nav prod-cat">
                            <li>
                                <a href="#" class="active"><i class="fa fa-angle-right"></i> Dress</a>
                                <ul class="nav">
                                    <li class="active"><a href="#">- Shirt</a></li>
                                    <li><a href="#">- Pant</a></li>
                                    <li><a href="#">- Shoes</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Bags &amp; Purses</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Beauty</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Coat &amp; Jacket</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Jeans</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Jewellery</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Electronics</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Sports</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Technology</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Watches</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-right"></i> Accessories</a>
                            </li>
                        </ul>
                    </div>
                </section>
                <section class="panel">
                    <header class="panel-heading">
                        Price Range
                    </header>
                    <div class="panel-body sliders">
                        <div id="slider-range" class="slider"></div>
                        <div class="slider-info">
                            <span id="slider-range-amount"></span>
                        </div>
                    </div>
                </section>
                <section class="panel">
                    <header class="panel-heading">
                        Filter
                    </header>
                    <div class="panel-body">
                        <form role="form product-form">
                            <div class="form-group">
                                <label>Brand</label>
                                <select class="form-control hasCustomSelect" style="-webkit-appearance: menulist-button; width: 231px; position: absolute; opacity: 0; height: 34px; font-size: 12px;">
                                    <option>Wallmart</option>
                                    <option>Catseye</option>
                                    <option>Moonsoon</option>
                                    <option>Textmart</option>
                                </select>
                                <span class="customSelect form-control" style="display: inline-block;"><span class="customSelectInner" style="width: 209px; display: inline-block;">Wallmart</span></span>
                            </div>
                            <div class="form-group">
                                <label>Color</label>
                                <select class="form-control hasCustomSelect" style="-webkit-appearance: menulist-button; width: 231px; position: absolute; opacity: 0; height: 34px; font-size: 12px;">
                                    <option>White</option>
                                    <option>Black</option>
                                    <option>Red</option>
                                    <option>Green</option>
                                </select>
                                <span class="customSelect form-control" style="display: inline-block;"><span class="customSelectInner" style="width: 209px; display: inline-block;">White</span></span>
                            </div>
                            <div class="form-group">
                                <label>Type</label>
                                <select class="form-control hasCustomSelect" style="-webkit-appearance: menulist-button; width: 231px; position: absolute; opacity: 0; height: 34px; font-size: 12px;">
                                    <option>Small</option>
                                    <option>Medium</option>
                                    <option>Large</option>
                                    <option>Extra Large</option>
                                </select>
                                <span class="customSelect form-control" style="display: inline-block;"><span class="customSelectInner" style="width: 209px; display: inline-block;">Small</span></span>
                            </div>
                            <button class="btn btn-primary" type="submit">Filter</button>
                        </form>
                    </div>
                </section>
                <section class="panel">
                    <header class="panel-heading">
                        Best Seller
                    </header>
                    <div class="panel-body">
                        <div class="best-seller">
                            <article class="media">
                                <a class="pull-left thumb p-thumb">
                                    <img src="https://www.bootdey.com/image/250x220/FFB6C1/000000" />
                                </a>
                                <div class="media-body">
                                    <a href="#" class="p-head">Item One Tittle</a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                </div>
                            </article>
                            <article class="media">
                                <a class="pull-left thumb p-thumb">
                                    <img src="https://www.bootdey.com/image/250x220/A2BE2/000000" />
                                </a>
                                <div class="media-body">
                                    <a href="#" class="p-head">Item Two Tittle</a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                </div>
                            </article>
                            <article class="media">
                                <a class="pull-left thumb p-thumb">
                                    <img src="https://www.bootdey.com/image/250x220/6495ED/000000" />
                                </a>
                                <div class="media-body">
                                    <a href="#" class="p-head">Item Three Tittle</a>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                </div>
                            </article>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-md-9">
                <section class="panel">
                    <div class="panel-body">
                        <div class="pull-right">
                            <ul class="pagination pagination-sm pro-page-list">
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                </section>
                <div class="row product-list">
<!--                    <div class="col-md-4">
                        <section class="panel">
                            <div class="pro-img-box">
                                <img src="https://www.bootdey.com/image/250x220/FFB6C1/000000" alt="" />
                                <a href="#" class="adtocart">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
                            </div>

                            <div class="panel-body text-center">
                                <h4>
                                    <a href="#" class="pro-title">
                                        Leopard Shirt Dress
                                    </a>
                                </h4>
                                <p class="price">$300.00</p>
                            </div>
                        </section>
                    </div>-->

                    <%!
                        public String product(Product p, Image i) {

                            String html = "<div class=\"col-md-4\"> "
                                    + "<section class=\"panel\"> <div class=\"pro-img-box\"> "
                                    + "<a href=\"productinfo?productID=" + p.getProductID() + "&imageID=" + i.getImageID()+ "\" class=\"pro-title\">" 
                                    + "<img src=\"" + i.getUrl() + "\" alt=\"Image not found\" />" + "</a>"
                                    + "                     <a href=\"\" class=\"adtocart\">"
                                    + "                     <i class=\"fa fa-shopping-cart\"></i>"
                                    + " </a>"
                                    + "    </div>"
                                    + "       <div class=\"panel-body text-center\">"
                                    + "           <h4>"
                                    + "                      <a href=\"productinfo?productID=" + p.getProductID() + "&imageID=" + i.getImageID()
                                    + "\" class=\"pro-title\">" + p.getProductName() + "</a>"
                                    + "                </h4>"
                                    + "       <p class=\"price\">" + p.getPrice() + " VND</p>"
                                    + "          </div>"
                                    + "         </section>"
                                    + "   </div>";
                            return html;
                        }
                    %>
                    <%
                        ArrayList<Product> productlist = (ArrayList<Product>) request.getAttribute("productlist");
                        ArrayList<Image> imagelist = (ArrayList<Image>) request.getAttribute("imagelist");
//                        out.print(imagelist.get(0).getUrl());
                        for (int i = 0; i < 12; i++) {
                            out.print(product(productlist.get(i), imagelist.get(0)));
                        }
                    %>

                </div>
            </div>
        </div>
    </body>
</html>