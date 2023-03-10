<%-- 
    Document   : Menu.jsp
    Created on : Mar 2, 2023, 6:45:19 PM
    Author     : asout
--%>
<%@page import="com.dietcalculator.dto.Image"%>
<%@page import="java.util.List"%>
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
    <%!
        public final String[] MEAL_COLOR_INDEX = {"bg-sky","bg-green","bg-yellow","bg-lightred","bg-purple"};
        //FORMAT FOR PARAMETERS
            //meal = side+main; day = 7
            //ArrayList<FoodDetail>[meal][day]
            //ArrayList<Image>[meal][day]
            //ArrayList<Meal>[meal]; ArrayList: 7 days
            //ArrayList<Day>: 7 days

        public final String menuCode(ArrayList<FoodDetail>[][] foodDetailsByWeek, ArrayList<Image>[][] imagesByWeek, ArrayList<Meal>[] meals, ArrayList<Day> days){
            String html = "";
            int numOfMeals = meals.length;  //= number of rows
            for(int index = 0; index < numOfMeals; index++){
                int mealIndex = meals[index].get(0).getMealindex();
                html += printMealByRow(mealIndex,meals[index],foodDetailsByWeek[index],imagesByWeek[index]);
            }
            return html;
        }

        public final String printMealByRow(int mealIndex, ArrayList<Meal> meals, ArrayList<FoodDetail>[] foodDetailsByRow, ArrayList<Image>[] imagesByRow){
        //GEETING GENERAL INFORMATION
            String color = MEAL_COLOR_INDEX[mealIndex - 1];
            int numOfFoodDetail = foodDetailsByRow[0].size();
            String mealIndexStr = Constants.MEAL.get(mealIndex);
            String time = Constants.MEAL_TIME.get(mealIndex);
        
        //HTML CODE
            String html=    "<tr>\n"
                            +"<td class=\"align-middle\">" + time + "</td>\n";
            for(int day = 0; day < 7; day++){
                    html += "<td class=\"tooltips\" style=\"border: none;width: 8em;height: 10em;padding-left: 0px\">\n"
                            +" <span "
                            +"   class=\"" + color + " padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13\">" + mealIndexStr + "</span>\n"
                            +"<div class=\"font-size13 text-light-gray\" style = \"margin-top: 5px\">" + meals.get(day).getTotalCal() + " KCal</div>";
                    //IMPORT IMAGES INTO TOOLTIP
                    html +=  displayImage(mealIndex, imagesByRow[day]);

                    //IMPORT DETAILS OF FOODDETAIL INTO TOOLTIPTEXT
                    html +=  displayDetailsFoodDetail(foodDetailsByRow[day]);
                    html += "</td>";
            }
            //END THE ROW
            html += "</tr>";

            return html;
        }

        public final String displayImage(int mealIndex, ArrayList<Image> imagesByWeek){
            //GETTING BASIC INFORMATION
            final int size = 25;
            int numOfFoodDetail = 0;
            String html = "";  //INITIALIZING FIRST ROW
            if(mealIndex <= 1){
                numOfFoodDetail = Constants.BREAKFAST_CATEGORIES.length;
                for(int i = 1; i <= numOfFoodDetail; i++){
                    if(i%2 == 1)
                        html += "<div class = \"row\">";
                    
                    html += "<div class=\"col-md-6 col-sm-6\" style='padding-bottom:20px;'><img src=\"" + imagesByWeek.get(i-1).getUrl() + "\" width=" + size + " height=" + size + " ></div>\n";
                    
                    if(i%2 == 0)
                        html += "</div>\n";
                }
            }else if(mealIndex <= 3){
                numOfFoodDetail = Constants.LUNCH_DINNER_CATEGORIES.length;
                for(int i = 1; i <= numOfFoodDetail; i++){
                    if(i%2 == 1)
                        html += "<div class = \"row\">";
                    
                    html += "<div class=\"col-md-6 col-sm-6\"><img src=\"" + imagesByWeek.get(i-1).getUrl() + "\" width=" + size + " height=" + size + " ></div>\n";
                    
                    if(i%2 == 0)
                        html += "</div>\n";
                }
                html += "</div>\n";
            }else{
                numOfFoodDetail = Constants.SIDE_MEAL_CATEGORIES.length;
                html += "<div class = \"row\">";
                    html += "<div class=\"col-md-12 col-sm-12\" style='padding: 30px'><img src=\"" + imagesByWeek.get(0).getUrl() + "\" width=" + size + " height=" + size + " ></div>\n";
                html += "</div>\n";
            }
            return html;
        }

        public String displayDetailsFoodDetail(ArrayList<FoodDetail> fd){
            String html = "<span class = \"tooltiptext\" style = \"\">";
            for(FoodDetail x: fd){
                html += "<div class = \"row\">"
                       +"<div class=\"column-tooltip column-50\">" + x.getFoodID() + "</div>"
                       +"<div class=\"column-tooltip column-25\">"+ x.getAmount() +" g</div>'"
                       +"<div class=\"column-tooltip column-25\">" + x.getTotalCal() + " KCal</div>"
                       +"</div>";
            }
                html += "</span>";
            return html;
        }
    %>
    
    <%
        ArrayList<FoodDetail>[][] foodDetailsByWeek = (ArrayList<FoodDetail>[][]) request.getAttribute("foodDetailsByWeek");
        ArrayList<Image>[][] imagesByWeek = (ArrayList<Image>[][]) request.getAttribute("imagesByWeek");
        ArrayList<Meal>[] meals = (ArrayList<Meal>[]) request.getAttribute("meals");
        ArrayList<Day>  days = (ArrayList<Day>) request.getAttribute("days");
        out.print(menuCode(foodDetailsByWeek,imagesByWeek,meals,days));
    %>
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
    
    </div>

</body>

</html>

