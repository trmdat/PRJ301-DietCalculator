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
                                <form action="/diet-calculator/FoodController">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase bg-success"> << Return</button>                            
                                </form>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form action="/diet-calculator/FoodController" method="get" class="tm-edit-product-form">
                                    <input type="hidden" name="action" value="update"/>
                                    <div class="form-group mb-3">
                                        <label
                                            for="foodID"
                                            >Food ID
                                        </label>
                                        <input
                                            name="foodID"
                                            type="text"
                                            class="form-control validate"
                                            readonly
                                            required
                                            value = "${food.getFoodID()}"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="foodname"
                                            >Food Name
                                        </label>
                                        <input
                                            name="foodname"
                                            type="text"
                                            class="form-control validate"
                                            required
                                            value = "${food.getFoodname()}"
                                            />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label
                                            for="category"
                                            >Category</label
                                        >
                                        <select
                                            class="custom-select tm-select-accounts"
                                            name="category"
                                            >
                                            <option selected value="${food.getCategory()}">${food.getCategory()} (default)</option>
                                            <option value="fruit">fruit</option>
                                            <option value="vegetables">vegetables</option>
                                            <option value="fish">fish</option>
                                            <option value="seafood">seafood</option>
                                            <option value="meat">meat</option>
                                            <option value="poultry">poultry</option>
                                            <option value="egg">egg</option>
                                            <option value="nuts">nuts</option>
                                            <option value="legumes">legumes</option>
                                            <option value="starch">starch</option>
                                            <option value="dairies&dessert">dairies&dessert</option>
                                            <option value="drinks">drinks</option>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="size"
                                                >size
                                            </label>
                                            <input
                                                name="size"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${food.getSize()}"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="caloricintake"
                                                >caloricintake
                                            </label>
                                            <input
                                                name="caloricintake"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${food.getCaloricintake()}"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="carbohydrate"
                                                >carbohydrate
                                            </label>
                                            <input
                                                name="carbohydrate"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${food.getCarbohydrate()}"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="fiber"
                                                >fiber
                                            </label>
                                            <input
                                                name="fiber"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${food.getCarbohydrate()}"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="protein"
                                                >protein
                                            </label>
                                            <input
                                                name="protein"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${food.getProtein()}"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="fat"
                                                >fat
                                            </label>
                                            <input
                                                name="fat"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${food.getFat()}"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="water"
                                                >water
                                            </label>
                                            <input
                                                name="water"
                                                type="text"
                                                class="form-control validate"
                                                required
                                                value = "${food.getWater()}"
                                                />
                                        </div>                      
                                    </div>

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

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>

</html>