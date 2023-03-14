<%-- 
    Document   : Meal
    Created on : Mar 4, 2023, 11:34:40 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Meal Detail</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
      integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous" />
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
   <!-- Latest compiled and minified JavaScript -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
      integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
      crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />

   <style>
      body {
         margin-top: 20px;
      }

      /* .toggleDisplay {
         display: none;
      }

      .toggleDisplay.in {
         display: table-cell;
      } */
   </style>
</head>

<body>

   <div class="container">
      <div class="row">
         <div class="col-md-12">
             <h1>Meal Details</h1>
            <div class="table-responsive">
               <table class="table table-bordered">
                  <thead>
                     <tr>
                        <th>Index</th>
                        <th>Name</th>
                        <th>Amount</th>
                        <th>Calories</th>
                        <th>Carbohydrate</th>
                        <th>Fiber</th>
                        <th>Protein</th>
                        <th>Fat</th>
                        <th>Water</th>
                        <th>Substitute</th>
                     </tr>
                  </thead>
                  <tbody>
                      <c:set var="i" value="1" scope="page"></c:set>
                      <c:forEach items="${foodDetail}" var="x">
                     <tr>
                        <th scope="row">${i}</th>
                        <td></td>
                        <td>${x.getAmount()}</td>
                        <td>${x.getTotalCal()}</td>
                        <td>${x.getCarbohydrate()}</td>
                        <td>${x.getFiber()}</td>
                        <td>${x.getProtein()}</td>
                        <td>${x.getFat()}</td>
                        <td>${x.getWater()}</td>
                        <td>
                            <div style="width: 100px;">
                                <select id="select-state${i}" placeholder="Pick a state...">
                                    <option value="">Select a state...</option>
                                    <option value="AL">Alabama</option>
                                    <option value="AK">Alaska</option>
                                    <option value="AZ">Arizona</option>
                                    <option value="AR">Arkansas</option>
                                    <option value="CA">California</option>
                                    <option value="CO">Colorado</option>
                                    <option value="CT">Connecticut</option>
                                    <option value="DE">Delaware</option>
                                    <option value="DC">District of Columbia</option>
                                    <option value="FL">Florida</option>
                                    <option value="GA">Georgia</option>
                                    <option value="HI">Hawaii</option>
                                    <option value="ID">Idaho</option>
                                    <option value="IL">Illinois</option>
                                    <option value="IN">Indiana</option>
                                </select>
                            </div>
                        </td>
                        <c:set var="i" value="${i+1}"></c:set>
                     </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
            <div class="description">
               <h2>Description</h2>
               Beef: ...... <br>
               Egg: ......
            </div>

         </div>
      </div>
   </div>

</body>
<script>
    <c:set var="i" value="1"></c:set>
    <c:forEach items="${foodDetail}" var="y">
        $(document).ready(function () {
            $('#select-state${i}').selectize({
                sortField: 'text'
            });
          });
        <c:set var="i" value="${i+1}"></c:set>
    </c:forEach>
</script>

</html>
