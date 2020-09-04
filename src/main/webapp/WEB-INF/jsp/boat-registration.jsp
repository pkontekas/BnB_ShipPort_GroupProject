<%-- 
    Document   : boat-registration
    Created on : Aug 6, 2020, 12:21:19 PM
    Author     : mapan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Boat Registration</title>

        <style>
            h1{
                text-align: center;
                padding-bottom: 20px;
                padding-top: 10px;
            }
            .boatRegistration{
                padding-bottom: 40px;
            }
        </style>

    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="font-weight-bold text-center">
            ${boatsuccess}
        </div>

        <div class="boatRegistration">
            <div class="container">
                <springform:form cssClass="main-form needs-validation" novalidate="true"  action="doinsertboat" method="POST" modelAttribute="newboat">
                    <h1>Boat Registration</h1>
                    <div class="row">
                        <div class="col-sm">
                            <div class="form-group">
                                <label for="manufacturer">Manufacturer</label>
                                <springform:input path="manufacturer" id="manufacturer" cssClass="form-control" required="true"/> 
                                <div class="invalid-feedback"><medium class="text-muted"> Required field</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="model">Model</label>
                                <springform:input path="model" cssClass="form-control" id="model" required="true"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="constructionYear">Construction Year</label>
                                <springform:input type="number" path="constructionYear" cssClass="form-control" id="constructionYear" required="true" min="1900" max="2020"/>
                                <div class="invalid-feedback"><medium class="text-muted">Acceptable range: 1900-2020</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="boatType">Boat Type</label>
                                <springform:input path="boatType" cssClass="form-control" id="boatType" required="true"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="boatLength">Length (ft)</label>
                                <springform:input type="number" path="boatLength" cssClass="form-control" id="boatLength" required="true" min="5"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field. Minimum of 5 ft.</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="passengerCapacity">Passenger Capacity</label>
                                <springform:input type="number" path="passengerCapacity" cssClass="form-control" id="passengerCapacity" required="true" min="1" max="40"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field. Minimum of 1.</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="beds">Beds</label>
                                <springform:input type="number" path="beds" cssClass="form-control" id="beds" required="true" min="0" max="20"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field. Maximum of 20.</medium></div>
                            </div>
                            <label for="portsId">Port:</label>
                            <springform:select path="portsId" required="true">
                                <springform:options items="${allports}" itemLabel="portName" itemValue="id"/>
                            </springform:select>
                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label for="enginePower">Engine Power</label>
                                <springform:input path="enginePower" cssClass="form-control" id="enginePower" required="true"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="fuel">Fuel Type</label>
                                <select name="fuel" id="fuel" required="true" class="form-control">
                                    <option value="" selected disabled hidden>Choose one</option>
                                    <option value="Diesel">Diesel</option>
                                    <option value="Petrol">Petrol</option>
                                </select>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="fuelTankCapacity">Fuel Tank Capacity (gal)</label>
                                <springform:input type="number" path="fuelTankCapacity" cssClass="form-control" id="fuelTankCapacity" required="true" min="30"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field. Minimum of 30 gal.</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="cruiseSpeed">Cruise Speed (knots)</label>
                                <springform:input type="number" path="cruiseSpeed" cssClass="form-control" id="cruiseSpeed" required="true" min="2"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field. Minimum of 2 knots.</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="maxSpeed">Max Speed (knots)</label>
                                <springform:input type="number" path="maxSpeed" cssClass="form-control" id="maxSpeed" required="true" min="5"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field. Minimum of 5 knots.</medium></div>
                            </div>
                            <div class="form-group">
                                <label for="currentPrice">Current Price (Euro)</label>
                                <springform:input type="number" path="currentPrice" cssClass="form-control" id="currentPrice" required="true" min="50"/>
                                <div class="invalid-feedback"><medium class="text-muted"> Required field. Minimum of 50 EU.</medium></div>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Register</button>
                    <script>
                        var form = document.querySelector('.needs-validation');
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        });
                    </script>
                </springform:form>
            </div>
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
