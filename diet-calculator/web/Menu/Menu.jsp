<%-- 
    Document   : Menu.jsp
    Created on : Mar 2, 2023, 6:45:19 PM
    Author     : asout
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dietcalculator.dto.FoodDetail"%>
<%@page import="com.dietcalculator.dto.Day"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dietcalculator.util.Constants"%>
<%@page import="com.dietcalculator.dto.Meal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <title>Diet Menu</title>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
   <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="Menu.css" />
</head>

<body>
   <div class="container">
      <div class="timetable-img text-center">
         <img src="img/content/timetable.png" alt="" />
      </div>
      <div class="text-center">
          <h1>Week 1</h1>
      </div>     
      <div class="table-responsive">
         <table class="table table-bordered text-center">
            <thead>
               <tr class="bg-light-gray">
                  <th class="text-uppercase">Time</th>
                  <th class="text-uppercase">Monday</th>
                  <th class="text-uppercase">Tuesday</th>
                  <th class="text-uppercase">Wednesday</th>
                  <th class="text-uppercase">Thursday</th>
                  <th class="text-uppercase">Friday</th>
                  <th class="text-uppercase">Saturday</th>
                  <th class="text-uppercase">Sunday</th>
               </tr>
            </thead>
            <tbody>
                <c:forEach items="${meals}" var="x">
                    <tr>
                       <td class="align-middle">09:00am</td>
                        <c:forEach items="${x}" var="y">
                            <td class="tooltips" style="border: none;width: 8em;height: 10em;padding-left: 0px">
                                <span
                                   class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Breakfast</span>
                                <div class="font-size13 text-light-gray" style = "margin-top: 5px">126KCal</div>
                                <div class = "row">
                                   <div class="column">Carrot</div>
                                   <div class="column">Rice</div>
                                   <div class="column">Chicken</div>
                                  <div class="column">Tea</div>
                               </div>
                               <div class = "row">
                                   <div class="column">Oyster</div>
                                   <div class="column">Banana</div>
                                   <div class="column">Pudding</div>
                               </div>
                                    <span class = "tooltiptext" style = "">
                                        <div class = "row">
                                            <div class="column-tooltip column-50">Carrot</div>
                                            <div class="column-tooltip column-25">100g</div>
                                            <!--<div class="column-tooltip column-25">25KCal</div>-->
                                        </div>
                                        <div class = "row">
                                            <div class="column-tooltip column-50">Chicken</div>
                                            <div class="column-tooltip column-25"> 100g</div>
                                            <!--<div class="column-tooltip column-25">64KCal</div>-->
                                        </div>
                                        <div class = "row">
                                            <div class="column-tooltip column-50">Rice</div>
                                            <div class="column-tooltip column-25">280g</div>
                                            <!--<div class="column-tooltip column-25">250KCal</div>-->
                                        </div>
                                        <div class = "row">
                                            <div class="column-tooltip column-50">Oyster</div>
                                            <div class="column-tooltip column-25">49g</div>
                                            <!--<div class="column-tooltip column-25">86KCal</div>-->
                                        </div>
                                        <div class = "row">
                                            <div class="column-tooltip column-50">Banana</div>
                                            <div class="column-tooltip column-25">100g</div>
                                            <!--<div class="column-tooltip column-25">25KCal</div>-->
                                        </div>
                                        <div class = "row">
                                            <div class="column-tooltip column-50">Pudding</div>
                                            <div class="column-tooltip column-25">100g</div>
                                            <!--<div class="column-tooltip column-25">140KCal</div>-->
                                        </div>
                                        <div class = "row">
                                            <div class="column-tooltip column-50">Tea</div>
                                            <div class="column-tooltip column-25">100g</div>
                                            <!--<div class="column-tooltip column-25">25KCal</div>-->
                                        </div>
                                     </span>
                                </td>
                            </c:foreach>
                        </td>
                    </tr>
                </c:foreach>
<!--                  <td>
                     <span
                        class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Yoga</span>
                     <div class="margin-10px-top font-size14">9:00-10:00</div>
                     <div class="font-size13 text-light-gray">Marta Healy</div>
                  </td>

                  <td>
                     <span
                        class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Music</span>
                     <div class="margin-10px-top font-size14">9:00-10:00</div>
                     <div class="font-size13 text-light-gray">Ivana Wong</div>
                  </td>
                  <td>
                     <span
                        class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Dance</span>
                     <div class="margin-10px-top font-size14">9:00-10:00</div>
                     <div class="font-size13 text-light-gray">Ivana Wong</div>
                  </td>
                  <td>
                     <span
                        class="bg-purple padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Art</span>
                     <div class="margin-10px-top font-size14">9:00-10:00</div>
                     <div class="font-size13 text-light-gray">Kate Alley</div>
                  </td>
                  <td>
                     <span
                        class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">English</span>
                     <div class="margin-10px-top font-size14">9:00-10:00</div>
                     <div class="font-size13 text-light-gray">James Smith</div>
                  </td>
               </tr>

               <tr>
                  <td class="align-middle">10:00am</td>
                  <td>
                     <span
                        class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Music</span>
                     <div class="margin-10px-top font-size14">10:00-11:00</div>
                     <div class="font-size13 text-light-gray">Ivana Wong</div>
                  </td>
                  <td class="blank-gray">
                  </td>
                  <td>
                     <span
                        class="bg-purple padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Art</span>
                     <div class="margin-10px-top font-size14">10:00-11:00</div>
                     <div class="font-size13 text-light-gray">Kate Alley</div>
                  </td>
                  <td>
                     <span
                        class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Yoga</span>
                     <div class="margin-10px-top font-size14">10:00-11:00</div>
                     <div class="font-size13 text-light-gray">Marta Healy</div>
                  </td>
                  <td>
                     <span
                        class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">English</span>
                     <div class="margin-10px-top font-size14">10:00-11:00</div>
                     <div class="font-size13 text-light-gray">James Smith</div>
                  </td>
                  <td class="bg-light-gray"></td>
               </tr>

               <tr>
                  <td class="align-middle">11:00am</td>
                  <td>
                     <span
                        class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Break</span>
                     <div class="margin-10px-top font-size14">11:00-12:00</div>
                  </td>
                  <td>
                     <span
                        class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Break</span>
                     <div class="margin-10px-top font-size14">11:00-12:00</div>
                  </td>
                  <td>
                     <span
                        class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Break</span>
                     <div class="margin-10px-top font-size14">11:00-12:00</div>
                  </td>
                  <td>
                     <span
                        class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Break</span>
                     <div class="margin-10px-top font-size14">11:00-12:00</div>
                  </td>
                  <td>
                     <span
                        class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Break</span>
                     <div class="margin-10px-top font-size14">11:00-12:00</div>
                  </td>
                  <td>
                     <span
                        class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Break</span>
                     <div class="margin-10px-top font-size14">11:00-12:00</div>
                  </td>
               </tr>

               <tr>
                  <td class="align-middle">12:00pm</td>
                  <td class="bg-light-gray"></td>
                  <td>
                     <span
                        class="bg-purple padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Art</span>
                     <div class="margin-10px-top font-size14">12:00-1:00</div>
                     <div class="font-size13 text-light-gray">Kate Alley</div>
                  </td>
                  <td>
                     <span
                        class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Dance</span>
                     <div class="margin-10px-top font-size14">12:00-1:00</div>
                     <div class="font-size13 text-light-gray">Ivana Wong</div>
                  </td>
                  <td>
                     <span
                        class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Music</span>
                     <div class="margin-10px-top font-size14">12:00-1:00</div>
                     <div class="font-size13 text-light-gray">Ivana Wong</div>
                  </td>
                  <td class="bg-light-gray"></td>
                  <td>
                     <span
                        class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Yoga</span>
                     <div class="margin-10px-top font-size14">12:00-1:00</div>
                     <div class="font-size13 text-light-gray">Marta Healy</div>
                  </td>
               </tr>

               <tr>
                  <td class="align-middle">01:00pm</td>
                  <td>
                     <span
                        class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">English</span>
                     <div class="margin-10px-top font-size14">1:00-2:00</div>
                     <div class="font-size13 text-light-gray">James Smith</div>
                  </td>
                  <td>
                     <span
                        class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Music</span>
                     <div class="margin-10px-top font-size14">1:00-2:00</div>
                     <div class="font-size13 text-light-gray">Ivana Wong</div>
                  </td>
                  <td class="bg-light-gray"></td>
                  <td>
                     <span
                        class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">English</span>
                     <div class="margin-10px-top font-size14">1:00-2:00</div>
                     <div class="font-size13 text-light-gray">James Smith</div>
                  </td>
                  <td>
                     <span
                        class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Yoga</span>
                     <div class="margin-10px-top font-size14">1:00-2:00</div>
                     <div class="font-size13 text-light-gray">Marta Healy</div>
                  </td>
                  <td>
                     <span
                        class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">Music</span>
                     <div class="margin-10px-top font-size14">1:00-2:00</div>
                     <div class="font-size13 text-light-gray">Ivana Wong</div>
                  </td>
               </tr>-->
            </tbody>
         </table>
      </div>
   </div>
   <div class="text-center">
       <a href="#" class="previous round">&#8249;</a>
       <a href="#" class="next round">&#8250;</a>
   </div>
   <div class="text-center">
      <a class="btn btn-success" target="__blank" href="MenuEditor.html">Edit</a>
   </div>
    <div>
    <%!
        public final String BREAKFAST_BG = "green";
        public final String LUNCH_BG = "blue";
        public final String DINNER_BG = "yellow";
        public final String BRUNCH_BG = "red";
        public final String SNACK_BG = "purple";

        public final String printMealByRow(ArrayList<Meal>[] meals, ArrayList<FoodDetail>[][] foodDetails){
//            String time = ;
            String html = "td class='" +"'></td>";
//            String mealType = Constants.MEAL.get(meal.getMealindex());

            return html;
        }
    %>
    </div>

</body>

</html>

