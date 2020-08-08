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
        <title>Show all boats</title>
    </head>
    <body>
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
</body>
</html>