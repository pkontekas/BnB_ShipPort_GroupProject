<%-- 
    Document   : about-us
    Created on : Aug 29, 2020, 5:59:16 AM
    Author     : pkontekas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
        <style>
          
            .fontClass
            {
                font-style: italic;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-weight: 400;
            }
        </style>
    </head>
    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="container-fluid">
            <div class="row d-flex justify-content-center">
                <div class="col-2-offset col-8 col-2-offset">
                    <h1 class="fontClass text-center">About Boat BNB</h1>

                    <p class="fontClass text-center">Boat BNB is a new company located in Athens, Greece.
                        The goal of this company is to bring all Boat Owners together through our wonderful online platform!<br><br>
                        Find a yacht to charter at a very low price, or offer your yacht for charter and earn extra income.<br><br>
                        Boat BNB offers you the chance to charter yachts, sailboats, motorboats, RIBs, catamarans, jet skis and more.<br><br>
                        Choose your type of boat, duration of charter period and contact the owner directly through our platform or just check availability and pay with paypal to speed things up!<br><br>
                        Start your <a href="/showallboats">Search</a> what are you waiting for!
                    </p>
                </div>
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
