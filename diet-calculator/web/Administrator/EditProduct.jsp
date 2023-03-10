<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Product</title>
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
                                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                            </div>
                            <div class="col-2">
                                <form action="/diet-calculator/ProductController">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase bg-success"> << Return</button>                            
                                </form>
                            </div>
                        </div>






                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form action="/diet-calculator/ProductController" method="get" class="tm-edit-product-form">
                                    <input type="hidden" name="action" value="update"/>
                                    <div class="form-group mb-3">
                                        <label
                                            for="productID"
                                            >Product ID
                                        </label>
                                        <input
                                            
                                            name="productID"
                                            type="text"
                                            class="form-control validate"
                                            readonly
                                            required
                                            value = "${product.getProductID()}"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="productname"
                                            >Product Name
                                        </label>
                                        <input
                                            
                                            name="productname"
                                            type="text"
                                            class="form-control validate"
                                            required
                                            value = "${product.getProductname()}"
                                            />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label
                                            for="type"
                                            >Type</label
                                        >
                                        <select
                                            class="custom-select tm-select-accounts"
                                            name="type"
                                            >
                                            <option selected value="${product.getType()}">${product.getType()} (default)</option>
                                            <option value="vitamin">Vitamin</option>
                                            <option value="protein">Protein</option>
                                            <option value="carbohydrate">Carbohydrate</option>
                                            <option value="fiber">Fiber</option>
                                            <option value="eaa">EAA</option>
                                            <option value="bcaa">BCAA</option>
                                        </select>
                                    </div>
                                    <div class="row">

                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="price"
                                                >Price
                                            </label>
                                            <input
                                                id ="price"
                                                name="price"
                                                type="text"
                                                class="form-control validate"
                                                value = "${product.getPrice()}"
                                                required
                                                />
                                        </div>


                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="quantity"
                                                >Quantity
                                            </label>
                                            <input
                                                id="quantity"
                                                name="quantity"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${product.getQuantity()}"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="brand"
                                                >Brand
                                            </label>
                                            <input
                                                id="brand"
                                                name="brand"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${product.getBrand()}"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="origin"
                                                >Origin
                                            </label>
                                            <input
                                                id="origin"
                                                name="origin"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${product.getOrigin()}"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="volume"
                                                >Volume
                                            </label>
                                            <input
                                                id="volume"
                                                name="volume"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${product.getVolume()}"
                                                />
                                        </div>

                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="rate"
                                                >Rate
                                            </label>
                                            <input
                                                id="rate"
                                                name="rate"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${product.getRate()}"
                                                />
                                        </div>

                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="purchase"
                                                >Purchase
                                            </label>
                                            <input
                                                id="purchase"
                                                name="purchase"
                                                type="text"
                                                class="form-control validate"
                                                value = "${product.getPurchase()}"
                                                />
                                        </div>


                                    </div>


                                    <div class="form-group mb-3">
                                        <label
                                            for="effect"
                                            >Effect
                                        </label>
                                        <input
                                            id="effect"
                                            name="effect"
                                            type="textarea"
                                            class="form-control validate"
                                            required
                                            value = "${product.getEffect()}"
                                            />
                                    </div>



                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase bg-success">Update</button>
                                    </div>
                                </form>
                            </div>



                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>

</html>
