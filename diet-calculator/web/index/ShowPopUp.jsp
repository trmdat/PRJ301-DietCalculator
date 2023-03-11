<%@page import="com.dietcalculator.dto.PopUp"%>
<%@page import="com.dietcalculator.dao.PopUpDAO"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ShowPopUp
    Created on : Mar 10, 2023, 10:28:10 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <title></title>
    </head>
    <body>
        <!-- Button trigger modal -->
        <!--        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Launch demo modal
                </button>-->

        <!-- Modal -->
        <div class="modal fade hide" id="myModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content bg-transparent border-0">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    <%
                        PopUpDAO popupDao = new PopUpDAO();
                        ArrayList<PopUp> list = popupDao.readAvailablePopUp(1);
                        if (list != null) {
                            for (PopUp p : list) {
                                out.print("<img src=" + p.getTheme() + " class=\"img-responsive\" />"
                                        + "<h2 class=\"text-center text-light\">" + p.getDescription() + "</h2>");
                            }
                        }
                    %>

                    <%--<c:forEach var="pop" items="${list}">--%>
                        <!--<img src="${pop.theme}" class="img-responsive" alt="deal"/>-->
                        <!--<h2 class="text-center">${pop.description}</h2>-->
                    <%--</c:forEach>--%>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            $(window).on('load', function () {
                $('#myModal').modal('show');
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
