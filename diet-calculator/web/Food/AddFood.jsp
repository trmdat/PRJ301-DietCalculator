<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Add New Food</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
   <link rel="stylesheet" href="css/fontawesome.min.css" />
   <link rel="stylesheet" href="css/bootstrap.min.css" />
   <link rel="stylesheet" href="css/templatemo-style.css">
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
   <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

    </nav>
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Add Food</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-12 col-lg-12 col-md-12">
                <form action="/diet-calculator/FoodController" class="tm-edit-product-form">
                    <input type="hidden" name="action" value="create"/>
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
                      <option selected value="fruit">fruit</option>
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
                            type="number"
                            class="form-control validate"
                            required
                          />
                        </div>
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="caloricintake"
                            >caloricintake
                          </label>
                          <input
                            name="caloricintake"
                            type="number"
                            class="form-control validate"
                            required
                          />
                        </div>
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="carbohydrate"
                            >carbohydrate
                          </label>
                          <input
                            name="carbohydrate"
                            type="number"
                            class="form-control validate"
                            required
                          />
                        </div>
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="fiber"
                            >fiber
                          </label>
                          <input
                            name="fiber"
                            type="number"
                            class="form-control validate"
                            required
                          />
                        </div>
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="protein"
                            >protein
                          </label>
                          <input
                            name="protein"
                            type="number"
                            class="form-control validate"
                            required
                          />
                        </div>
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="fat"
                            >fat
                          </label>
                          <input
                            name="fat"
                            type="number"
                            class="form-control validate"
                            required
                          />
                        </div>
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="water"
                            >water
                          </label>
                          <input
                            name="water"
                            type="number"
                            class="form-control validate"
                            required
                          />
                        </div>                      
                  </div>
                  
              </div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                  <i
                    class="fas fa-cloud-upload-alt tm-upload-icon"
                    onclick="document.getElementById('fileInput').click();"
                  ></i>
                </div>
<!--                <div class="custom-file mt-3 mb-3">
                  <input id="fileInput" type="file" style="display:none;" />
                  <input
                    type="button"
                    class="btn btn-primary btn-block mx-auto bg-success"
                    value="UPLOAD PRODUCT IMAGE"
                    onclick="document.getElementById('fileInput').click();"
                  />
                </div>-->
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase bg-success">Add Food</button>
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>

   <script src="js/jquery-3.3.1.min.js"></script>
   <!-- https://jquery.com/download/ -->
   <script src="js/bootstrap.min.js"></script>
   <!-- https://getbootstrap.com/ -->
   <script>
      $(function() {
        $("#expire_date").datepicker();
      });
    </script>
</body>
</html>