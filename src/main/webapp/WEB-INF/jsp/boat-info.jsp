<%-- 
    Document   : boat-info
    Created on : Aug 8, 2020, 1:52:04 PM
    Author     : pkontekas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Show info per boat</title>
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <h1>Show Boat Info</h1>
        <ul>
            <li>Manufacturer: ${boatdetails.manufacturer}</li>
            <li>Model: ${boatdetails.model}</li>
            <li>Year: ${boatdetails.constructionYear}</li>
            <li>Type: ${boatdetails.boatType}</li>
            <li>Length: ${boatdetails.boatLength}</li>
            <li>Fuel Type: ${boatdetails.fuel}</li>
            <li>Cruise Speed: ${boatdetails.cruiseSpeed}</li>
            <li>Price: ${boatdetails.currentPrice}</li>
            <li>Port: ${boatdetails.portsId.portName}</li>
            <li>City: ${boatdetails.portsId.city}</li>
        </ul>
        <!--            <img alt="failport" src="data:image/jpeg;base64,$----{portimage}">-->

        <ul>
            <li>Owner: ${boatdetails.accountsId.name} ${boatdetails.accountsId.surname}</li>
            <li>Email: ${boatdetails.accountsId.email}</li>
            <li>Cellphone: ${boatdetails.accountsId.cellphone}</li>
        </ul>

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
