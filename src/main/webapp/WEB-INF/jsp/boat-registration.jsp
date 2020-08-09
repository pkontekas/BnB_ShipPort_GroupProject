<%-- 
    Document   : boat-registration
    Created on : Aug 6, 2020, 12:21:19 PM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <security:authorize access="isAuthenticated()">
        authenticated as <security:authentication property="principal.username" /> 
    </security:authorize>
        <h1>Boat Registration</h1>
        <form:form action="doinsertboat" method="POST" modelAttribute="newboat">
            <label for="manufacturer">Manufacturer</label><br>
            <form:input type="text" path="manufacturer" id="manufacturer" required="true" /><br>
            <label for="model">Model</label><br>
            <form:input type="text" path="model" id="model" required="true"/><br>
            <label for="constructionYear">Construction Year</label><br>
            <form:input type="number" path="constructionYear" id="constructionYear" required="true"/><br>
            <label for="boatType">Boat Type</label><br>
            <form:input type="text" path="boatType" id="boatType" required="true"/><br>
            <label for="boatLength">Length</label><br>
            <form:input type="number" path="boatLength" id="boatLength" required="true"/><br>
            <label for="passengerCapacity">Passenger Capacity</label><br>
            <form:input type="number" path="passengerCapacity" id="passengerCapacity" required="true"/><br>
            <label for="enginePower">Engine Power</label><br>
            <form:input type="text" path="enginePower" id="enginePower" required="true"/><br>
            <label for="fuel">Fuel Type</label><br>
            <form:input type="text" path="fuel" id="fuel" required="true"/><br>
            <label for="fuelTankCapacity">Fuel Tank Capacity</label><br>
            <form:input type="number" path="fuelTankCapacity" id="fuelTankCapacity" required="true"/><br>
            <label for="cruiseSpeed">Cruise Speed</label><br>
            <form:input type="number" path="cruiseSpeed" id="cruiseSpeed" required="true"/><br>
            <label for="maxSpeed">Max Speed</label><br>
            <form:input type="number" path="maxSpeed" id="maxSpeed" required="true"/><br>
            <label for="currentPrice">Current Price</label><br>
            <form:input type="number" path="currentPrice" id="currentPrice" required="true"/><br>
            <label for="portsId">Port:</label>
            <form:select path="portsId" required="true">
                <form:options items="${allports}" itemLabel="portName" itemValue="id"/>
            </form:select><br>

            <form:button type="Submit">Register Boat</form:button>
        </form:form>
    </body>
</html>
