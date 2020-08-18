<%-- 
    Document   : boat-registration
    Created on : Aug 6, 2020, 12:21:19 PM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Boat Registration</title>

    </head>
    <body>
        <security:authorize access="isAuthenticated()">
            authenticated as <security:authentication property="principal.username" /> 
        </security:authorize>

        <jsp:include page="navbar.jsp"/>

        <div class="form container">
            <springform:form action="doinsertboat" method="POST" modelAttribute="newboat">
                <h1>Boat Registration</h1>

                <div class="row">
                    <div class="col-sm">
                        <div class="form-group">
                            <label for="manufacturer">Manufacturer</label>
                            <springform:input type="text" path="manufacturer" id="manufacturer" class="form-control" required="true" />
                        </div>
                        <div class="form-group">
                            <label for="model">Model</label>
                            <springform:input type="text" path="model" class="form-control" id="model" required="true" />
                        </div>
                        <div class="form-group">
                            <label for="constructionYear">Construction Year</label>
                            <springform:input type="text" path="constructionYear" class="form-control" id="constructionYear" required="true" />
                        </div>
                        <div class="form-group">
                            <label for="boatType">Boat Type</label>
                            <springform:input type="text" path="boatType" class="form-control" id="boatType" required="truwe" />
                        </div>
                        <div class="form-group">
                            <label for="boatLength">Length (ft)</label>
                            <springform:input type="number" path="boatLength" class="form-control" id="boatLength" required="true" />
                        </div>
                        <div class="form-group">
                            <label for="passengerCapacity">Passenger Capacity</label>
                            <springform:input type="number" path="passengerCapacity" class="form-control" id="passengerCapacity" required="true" />
                        </div>
                        <label for="portsId">Port:</label>
                        <springform:select path="portsId" required="true">
                            <springform:options items="${allports}" itemLabel="portName" itemValue="id" />
                        </springform:select>
                    </div>
                    <div class="col-sm">
                        <div class="form-group">
                            <label for="enginePower">Engine Power</label>
                            <springform:input type="text" path="enginePower" class="form-control" id="enginePower" required="true" />
                        </div>
                        <div class="form-group">
                            <label for="fuel">Fuel Type</label>
                            <springform:input type="text" path="fuel" class="form-control" id="fuel" required="true" />
                        </div>
                        <div class="form-group">
                            <label for="fuelTankCapacity">Fuel Tank Capacity</label>
                            <springform:input type="number" path="fuelTankCapacity" class="form-control" id="fuelTankCapacity" required="true" />
                        </div>
                        <div class="form-group">
                            <label for="cruiseSpeed">Cruise Speed (knots)</label>
                            <springform:input type="number" path="cruiseSpeed" class="form-control" id="cruiseSpeed" required="true" />
                        </div>
                        <div class="form-group">
                            <label for="maxSpeed">Max Speed (knots)</label>
                            <springform:input type="number" path="maxSpeed" class="form-control" id="maxSpeed" required="true" />
                        </div>
                        <div class="form-group">
                            <label for="currentPrice">Current Price (Euro)</label>
                            <springform:input type="number" path="currentPrice" class="form-control" id="currentPrice" required="true" />
                        </div>
                    </div>
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                    <label class="form-check-label" for="exampleCheck1">Terms & Conditions</label>
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
            </springform:form>
        </div>

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
