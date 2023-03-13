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
   <!-- Latest compiled and minified JavaScript -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
      integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
      crossorigin="anonymous"></script>

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
                      <%--<c:set var="i"value="1"></c:set>--%>
                      <c:forEach items="${foodDetail}" var="x">
                     <tr>
                        <th scope="row">1</th>
                        <td></td>
                        <td>${x.getAmount()}</td>
                        <td>${x.getTotalCal()}</td>
                        <td>${x.getCarbohydrate()}</td>
                        <td>${x.getFiber()}</td>
                        <td>${x.getProtein()}</td>
                        <td>${x.getFat()}</td>
                        <td>${x.getWater()}</td>
                        <td></td>
                        <%--<c:set var="i" value="${i+1}"></c:set>--%>
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

</html>
