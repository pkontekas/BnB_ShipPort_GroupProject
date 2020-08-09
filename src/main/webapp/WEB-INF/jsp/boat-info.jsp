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
        <title>Show info per boat</title>
    </head>
    <body>
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
    </body>
</html>
