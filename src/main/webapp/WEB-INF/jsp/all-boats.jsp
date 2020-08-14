<%-- 
    Document   : all-boats
    Created on : Aug 8, 2020, 1:51:51 PM
    Author     : pkontekas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Show all boats</title>
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <h1>Show all boats</h1>
        <%-- "JSTL for each" to show specific boat information we want in the page, for each Boat, 
        also added a button for "view boat" that takes user to boat-info carrying the boat id --%>
        <c:forEach items="${allboats}" var="b">
        <tr>
            <td>Manufacturer: ${b.manufacturer}</td><br>
        <td>Model: ${b.model}</td><br>
        <td>Year: ${b.constructionYear}</td><br>
        <td>Type: ${b.boatType}</td><br>
        <td>Length: ${b.boatLength} feet</td><br>
        <td>Fuel Type: ${b.fuel}</td><br>
        <td>Cruise Speed: ${b.cruiseSpeed} knots</td><br>
        <td>Price: ${b.currentPrice}</td><br>
        <td>Port: ${b.portsId.portName}</td><br>
        <td>City: ${b.portsId.city}</td><br>   
        <td>
            <form action="showboatinfo" method="GET">
                <input type="hidden" name="boatId" value="${b.id}">
                <button type="Submit">View Boat</button>
            </form>
        </td>
    </tr>
</c:forEach>

<jsp:include page="footer.jsp"/>

 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
        
</body>
</html>