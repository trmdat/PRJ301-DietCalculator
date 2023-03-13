<%-- 
    Document   : Menu.jsp
    Created on : Mar 2, 2023, 6:45:19 PM
    Author     : asout
--%>
<%@page import="com.dietcalculator.dto.Food"%>
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
   <style>
       body{
   margin-top:20px;
}
.bg-light-gray {
   background-color: #f7f7f7;
}
.table-bordered thead td, .table-bordered thead th {
   border-bottom-width: 2px;
}
.table thead th {
   vertical-align: bottom;
   border-bottom: 2px solid #dee2e6;
}
.table-bordered td, .table-bordered th {
   border: 1px solid #dee2e6;
}

.bg-sky.box-shadow {
   box-shadow: 0px 5px 0px 0px #00a2a7
}

.bg-orange.box-shadow {
   box-shadow: 0px 5px 0px 0px #af4305
}

.bg-green.box-shadow {
   box-shadow: 0px 5px 0px 0px #4ca520
}

.bg-yellow.box-shadow {
   box-shadow: 0px 5px 0px 0px #dcbf02
}

.bg-pink.box-shadow {
   box-shadow: 0px 5px 0px 0px #e82d8b
}

.bg-purple.box-shadow {
   box-shadow: 0px 5px 0px 0px #8343e8
}

.bg-lightred.box-shadow {
   box-shadow: 0px 5px 0px 0px #d84213
}


.bg-sky {
   background-color: #02c2c7
}

.bg-orange {
   background-color: #e95601
}

.bg-green {
   background-color: #5bbd2a
}

.bg-yellow {
   background-color: #f0d001
}

.bg-pink {
   background-color: #ff48a4
}

.bg-purple {
   background-color: #9d60ff
}

.bg-lightred {
   background-color: #ff5722
}

.padding-15px-lr {
   padding-left: 15px;
   padding-right: 15px;
}
.padding-5px-tb {
   padding-top: 5px;
   padding-bottom: 5px;
}
.margin-10px-bottom {
   margin-bottom: 10px;
}
.border-radius-5 {
   border-radius: 5px;
}

.margin-10px-top {
   margin-top: 10px;
}
.font-size14 {
   font-size: 14px;
}

.text-light-gray {
   color: #d6d5d5;
}
.font-size13 {
   font-size: 13px;
}

.font-size12 {
   font-size: 1px;
}

.table-bordered td, .table-bordered th {
   border: 1px solid #dee2e6;
}
.table td, .table th {
   padding: .75rem;
   vertical-align: top;
   border-top: 1px solid #dee2e6;
}
a:hover {
   text-decoration: none;
}

.round {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
  border-radius: 50%;
}

.round:hover{
  background-color: #ddd;
  color: black;
}

.previous {
  background-color: #f1f1f1;
  color: black;
}

.next {
  background-color: #04AA6D;
  color: white;
}

.row {
  display: flex;
}

.column {
  flex: 70%;
  font-family:Cambria;
  font-size: 14px;
  margin-top: 3px; 
  padding-left: 1.3em;
  text-align: left;
}

.column-tooltip{
  font-family:Cambria;
  font-size: 11px;
  margin-top: 2px; 
  padding-left: 0.5em;
  text-align: left;
}

.column-50 {
  width: 40%;
  padding-left: 1.5em;
}
.column-25{
 width: 25%;
}

.tooltips{
  position: relative;
  display: inline-block;
}

.tooltiptext{
  visibility: hidden;
  width: 9.2em;
  height: 11.3em;
  background-color: white;
  color: #000;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  bottom: -6%;
  left: 50%;
  margin-left: -4.7em;
  opacity: 0;
  transition: opacity 1s;
}

.tooltips:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}

.blank-gray{
    width: 10.5em;
    height: 10em;
    background-color: #f7f7f7;
    background-image: url("./logo.jpg");
}

   </style>
</head>

<body>
   <div class="container">
      <div class="timetable-img text-center">
         <img src="img/content/timetable.png" alt="" />
      </div>
      <div class="text-center">
          <h1>Week 1</h1>
      </div>     
      <div class="table-responsive" style="width: 1250px;padding-right: 150px;overflow-x: hidden;">
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
            //ArrayList<ArrayList<ArrayList<FoodDetail>>>   MEALS-DAYS-FOODDETAILS
            //ArrayList<ArrayList<ArrayList<Image>>>   MEALS-DAYS-FOODDETAILS
            //ArrayList<ArrayList<Meal>>                MEALS-DAYS
            //ArrayList<Day>

        public final String menuCode(ArrayList<ArrayList<ArrayList<FoodDetail>>> foodDetailsByWeek, ArrayList<ArrayList<ArrayList<Image>>> imagesByWeek, ArrayList<ArrayList<Meal>> meals, ArrayList<Day> days, ArrayList<Food> foodDataset){
            String html = "";
            int numOfMeals = meals.size();  //= number of rows
            for(int index = 0; index < numOfMeals; index++){
                int mealIndex = meals.get(index).get(0).getMealindex();
                html += printMealByRow(mealIndex,meals.get(index),foodDetailsByWeek.get(index),imagesByWeek.get(index), foodDataset);
            }
            return html;
        }

        public final String printMealByRow(int mealIndex, ArrayList<Meal> meals, ArrayList<ArrayList<FoodDetail>> foodDetailsByRow, ArrayList<ArrayList<Image>> imagesByRow, ArrayList<Food> foodDataset){
        //GEETING GENERAL INFORMATION
            String color = MEAL_COLOR_INDEX[mealIndex - 1];
            int numOfFoodDetail = foodDetailsByRow.get(0).size();
            String mealIndexStr = Constants.MEAL.get(mealIndex);
            String time = Constants.MEAL_TIME.get(mealIndex);
        
        //HTML CODE
            String html=    "<tr>\n"
                            +"<td class=\"align-middle\">" + time + "</td>\n";
            for(int day = 0; day < 7; day++){
                    html += "<td>\n"
                            +"<div class=\"tooltips\" style=\"border: none;width: 8em;height: 10em;padding-left: 0px\">"
                            +" <span "
                            +"   class=\"" + color + " padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13\">" + mealIndexStr + "</span>\n"
                            +"<div class=\"font-size13 text-light-gray\" style = \"margin-top: 5px\">" + meals.get(day).getTotalCal() + " KCal</div>";
                    //IMPORT IMAGES INTO TOOLTIP
                    html +=  displayImage(mealIndex, imagesByRow.get(day));

                    //IMPORT DETAILS OF FOODDETAIL INTO TOOLTIPTEXT
                    html +=  displayDetailsFoodDetail(foodDetailsByRow.get(day), foodDataset);
                    html += "</div>";
                    html += "</td>\n";
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

        public String displayDetailsFoodDetail(ArrayList<FoodDetail> fd, ArrayList<Food> foodDataset){
            String html = "<span class = \"tooltiptext\" style = \"\">";
            for(FoodDetail x: fd){
                html += "<div class = \"row\">"
                       +"<div class=\"column-tooltip column-50\">" + searchFoodNameByFoodID(x.getFoodID(),foodDataset) + "</div>"
                       +"<div class=\"column-tooltip column-25\">"+ x.getAmount() +" g</div>"
                       //+"<div class=\"column-tooltip column-25\">" + x.getTotalCal() + " KCal</div>"
                       +"</div>";
            }
                html += "<form action=\"MenuController\" method=\"get\">\n"
                       + "<input type=text name=action value=details hidden/>"
                       + "<input type=text name=mealID value=" + fd.get(0).getMealID() +  " hidden/>"
                       + "<input type=submit value=details>"
                       + "</form>";
                html += "</span>";
            return html;
        }

        public String searchFoodNameByFoodID(String foodID, ArrayList<Food> foodDataset){
            for(Food x: foodDataset)
                if(x.getFoodID().equals(foodID))
                    return x.getFoodname();
            return "Unknown";
        }
    %>
    
    <%
        ArrayList<ArrayList<ArrayList<FoodDetail>>> foodDetailsByWeek = (ArrayList<ArrayList<ArrayList<FoodDetail>>>) request.getAttribute("foodDetails");
        ArrayList<ArrayList<ArrayList<Image>>> imagesByWeek = (ArrayList<ArrayList<ArrayList<Image>>>) request.getAttribute("images");
        ArrayList<ArrayList<Meal>>  meals = (ArrayList<ArrayList<Meal>> ) request.getAttribute("meals");
        ArrayList<Day>  days = (ArrayList<Day>) request.getAttribute("days");
        ArrayList<Food> foodDataset = (ArrayList<Food>) request.getAttribute("foodDataset");
        out.print(menuCode(foodDetailsByWeek,imagesByWeek,meals,days,foodDataset));
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

