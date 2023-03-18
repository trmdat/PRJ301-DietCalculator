<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food List For A Week</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <h1 style="text-align: center;">Food List For Week ${week}</h1>
    <br />
    <table class="table" id="simple_table">
        <tr>
            <th>Index</th>
            <th>Food Name</th>
            <th>Amount</th>
        </tr>
        <c:set var="i" value="1" scope="page"></c:set>
        <c:forEach items="${list.keySet()}" var="x">
            <tr>
                <td>${i}</td>
                <td>${x.getFoodname()}</td>
                <td>${list.get(x)}</td>
            </tr>
            <c:set var="i" value="${i + 1}"></c:set>
        </c:forEach>
        
    </table>
        ${list.size()}
    <br/>
    <input type="button" onclick="generate()" value="Export To PDF" />
    <script src="script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.6/jspdf.plugin.autotable.min.js"></script>
</body>

</html>