<%-- 
    Document   : boat-registration
    Created on : Aug 6, 2020, 12:21:19 PM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Boat Registration</h1>
        <form:form action="doinsertport" method="post" modelAttribute="newboat">
            <label for="manufacturer">Manufacturer</label><br>
            <form:input type="text" path="manufacturer" id="manufacturer" required="true" /><br>
            <label for="model">Model</label><br>
            <form:input type="text" path="model" id="model" required="true"/><br>
            <label for="constructionYear">Construction Year</label><br>
            <form:input type="number" path="constructionYear" id="constructionYear" /><br>
            <label for="boatType">Boat Type</label><br>
            <form:input type="text" path="boatType" id="boatType"/><br>
            <label for="length">Length</label><br>
            <form:input type="number" path="length" id="length"/><br>
            <label for="passengerCapacity">Passenger Capacity</label><br>
            <form:input type="number" path="passengerCapacity" id="passengerCapacity"/><br>
            <label for="enginePower">Engine Power</label><br>
            <form:input type="text" path="enginePower" id="enginePower"/><br>
            <label for="fuel">Fuel</label><br>
            <form:input type="text" path="fuel" id="fuel"/><br>
            <label for="fuelTankCapacity">Fuel Tank Capacity</label><br>
            <form:input type="number" path="fuelTankCapacity" id="fuelTankCapacity"/><br>
            <label for="cruiseSpeed">Cruise Speed</label><br>
            <form:input type="number" path="cruiseSpeed" id="cruiseSpeed"/><br>
            <label for="maxSpeed">Max Speed</label><br>
            <form:input type="number" path="maxSpeed" id="maxSpeed"/><br>
            <label for="currentPrice">Current Price</label><br>
            <form:input type="number" path="currentPrice" id="currentPrice"/><br>
            <label for="portsId">Port:</label>
            <form:select path="portsId">
                <form:options items="${ports}" itemLabel="portName" itemValue="id"/>
            </form:select><br>

            <form:button type="Submit">Register Boat</form:button>
        </form:form>
    </body>
</html>
