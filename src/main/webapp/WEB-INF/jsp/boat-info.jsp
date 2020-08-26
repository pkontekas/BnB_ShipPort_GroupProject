<%-- 
    Document   : boat-info
    Created on : Aug 8, 2020, 1:52:04 PM
    Author     : pkontekas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Ensures optimal rendering on mobile devices. -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge" /> <!-- Optimal Internet Explorer compatibility -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/main.css" />
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
            <li>Fuel Tank Capacity: ${boatdetails.fuelTankCapacity}</li>
            <li>Cruise Speed: ${boatdetails.cruiseSpeed}</li>
            <li id="boatPricePerDay" value="${boatdetails.currentPrice}">Price: ${boatdetails.currentPrice}</li>
            <li>Port: ${boatdetails.portsId.portName}</li>
            <img alt="portimage" src="data:image/jpeg;base64,${portimage}"/>
            <li>City: ${boatdetails.portsId.city}</li>
            <li>Pay Instantly:
                
                <div id="paypal-button-container"></div>
                
            </li>
        </ul>

        <ul>
            <li>Owner: ${boatdetails.accountsId.name} ${boatdetails.accountsId.surname}</li>
            <li>Email: ${boatdetails.accountsId.email}</li>
            <li>Cellphone: ${boatdetails.accountsId.cellphone}</li>
        </ul>
        <security:authorize access="isAuthenticated()">
        <div id="username-page">
            <div class="username-page-container">
                <h1 class="title">Logged in as</h1>
                <form id="usernameForm" name="usernameForm">
                    <div class="form-group">
                        <security:authorize access="isAuthenticated()">

                            <input type="text" id="name" value="<security:authentication property="principal.username" />" 
                                   autocomplete="off" class="form-control" disabled="true" />
                        </security:authorize>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="accent username-submit">Start Chatting</button>
                    </div>
                </form>
            </div>
        </div>
        </security:authorize>

        <div id="chat-page" class="hidden">
            <div class="chat-container">
                <div class="chat-header">
                    <h2>Q&A with the owner</h2>
                </div>
                <div class="connecting">
                    Connecting...
                </div>
                <ul id="messageArea">

                </ul>
                <form id="messageForm" name="messageForm" nameForm="messageForm">
                    <div class="form-group">
                        <div class="input-group clearfix">
                            <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                            <button type="submit" class="primary">Send</button>
                        </div>
                    </div>
                </form>
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script src="/js/chat.js"></script>
        <script src="https://www.paypal.com/sdk/js?client-id=AbER9XUd9t2fAyfQIqhlGTn9_ngBsoyaKoz7KGFUAwrz1eHuFahHGg4ONsX2CX7gv4msztOj_5y1JJ9i">
            // Required. Replace SB_CLIENT_ID with your sandbox client ID. </script>
        <script src="/js/paypal.js"></script>
    </body>
</html>
