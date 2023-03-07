<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Add New Product</title>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
   <link rel="stylesheet" href="css/fontawesome.min.css" />
   <link rel="stylesheet" href="css/bootstrap.min.css" />
   <link rel="stylesheet" href="css/templatemo-style.css">
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
   <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
   <nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="">
          <h1 class="tm-site-title mb-0 text-success">Product Admin</h1>
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
            <!-- <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="far fa-file-alt"></i>
                <span> Reports <i class="fas fa-angle-down"></i> </span>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Daily Report</a>
                <a class="dropdown-item" href="#">Weekly Report</a>
                <a class="dropdown-item" href="#">Yearly Report</a>
              </div>
            </li> -->
            <li class="nav-item">
              <a class="nav-link active" href="products.html">
                <i class="fas fa-shopping-cart"></i> Products
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="">
                <i class="far fa-user"></i> Accounts
              </a>
            </li>
            <!-- <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="fas fa-cog"></i>
                <span> Settings <i class="fas fa-angle-down"></i> </span>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Profile</a>
                <a class="dropdown-item" href="#">Billing</a>
                <a class="dropdown-item" href="#">Customize</a>
              </div>
            </li> -->
          </ul>
          <!-- <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link d-block" href="login.html">
                Admin, <b>Logout</b>
              </a>
            </li>
          </ul> -->
        </div>
      </div>
    </nav>
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Add Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-12 col-lg-12 col-md-12">
                <form action="" method="post" class="tm-edit-product-form">
                  <div class="form-group mb-3">
                    <label
                      for="id"
                      >Product ID
                    </label> 
                    <input
                      id="id"
                      name="id"
                      type="text"
                      placeholder="Enter Product ID"
                      class="form-control validate"
                      required
                    />
                  </div>
                    
                    <div class="form-group mb-3">
                    <label
                      for="name"
                      >Product Name
                    </label>
                    <input
                      id="name"
                      name="name"
                      type="text"
                      placeholder="Enter Product Name"
                      class="form-control validate"
                      required
                    />
                    </div>
                    
                    <p>Product Type</p>
                    <div class="row">
                        <div class="col-md-4">
                        
                    <label for="type">
                        <input
                      id="type"
                      name="type"
                      type="radio"
                      value ="Vitamin"
                      required
                    /> Vitamin
                        </label> 
                    </div>
                        
                         <div class="col-md-4">
                    <label for="type">
                        <input
                      id="type"
                      name="type"
                      type="radio"
                      value ="Protein"
                      required
                    /> Protein
                    </label> 
                  </div>
                    
                    <div class="col-md-4">
                    <label for="type">
                        <input
                      id="type"
                      name="type"
                      type="radio"
                      value ="Carbohydrate"
                      required
                    /> Carbohydrate
                    </label> 
                  </div>
                        
                    </div>
                    
                    
                   
                    <div class="row">
                         <div class="col-md-4">
                    <label for="type">
                        <input
                      id="type"
                      name="type"
                      type="radio"
                      value="Fiber"
                      required
                    /> Fiber
                    </label> 
                  </div>
                    
                    <div class="col-md-4"> 
                    <label for="type">
                        <input
                      id="type"
                      name="type"
                      value ="EAA"
                      type="radio"
                      required
                    /> EAA
                    </label> 
                  </div>
                    
                    <div class="col-md-4">
                    <label for="type">
                        <input
                      id="type"
                      name="type"
                      type="radio"
                      value="BCAA"
                      required
                    /> BCAA
                    </label> 
                  </div>
                    </div>
                   
                  <div class="row">
                      <div class="form-group mt-3 mb-3 col-xs-12 col-sm-6">
                          <label
                            for="quantity"
                            >Quantity
                          </label>
                          <input
                            id="quantity"
                            name="quantity"
                            type="number"
                            class="form-control validate"
                            data-large-mode="true"
                          />
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6 mt-3">
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
                          />
                        </div>
                  </div>   
                    
                    <div class="row">
                      <div class="form-group mt-3 mb-3 col-xs-12 col-sm-6">
                          <label
                            for="origin"
                            >Origin
                          </label>
                          <input
                            id="origin"
                            name="origin"
                            type="text"
                            class="form-control validate"
                            data-large-mode="true"
                          />
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6 mt-3">
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
                          />
                        </div>
                  </div>   
           
                    
                  <div class="form-group mb-3 mt-3">
                    <label
                      for="effect"
                      >Effect</label
                    >
                    <textarea
                      class="form-control validate"
                      id="effect"
                      rows="4"
                      required
                    ></textarea>
                  </div>
                    
<!--                  <div class="form-group mb-3">
                    <label
                      for="category"
                      >Category</label
                    >
                    <select
                      class="custom-select tm-select-accounts"
                      id="category"
                    >
                      <option selected>Select category</option>
                      <option value="1">New Arrival</option>
                      <option value="2">Most Popular</option>
                      <option value="3">Trending</option>
                    </select>
                  </div>-->

                  <div class="row">
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
                            data-large-mode="true"
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
                <div class="custom-file mt-3 mb-3">
                  <input id="fileInput" type="file" style="display:none;" />
                  <input
                    type="button"
                    class="btn btn-primary btn-block mx-auto bg-success"
                    value="UPLOAD PRODUCT IMAGE"
                    onclick="document.getElementById('fileInput').click();"
                  />
                </div>
              </div>
              <div class="col-12 mb-5">
                  <input type="submit" class="btn btn-primary btn-block text-uppercase bg-success" value="Add product">
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
          <p class="text-center text-white mb-0 px-4 small">
            Copyright &copy; <b>2018</b> All rights reserved. 
            
            Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
        </p>
        </div>
    </footer>  -->

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
</html>
